package pe.edu.upeu.msvcnotificaciones.kafka;

import com.fasterxml.jackson.databind.ObjectMapper;
import org.springframework.kafka.annotation.KafkaListener;
import org.springframework.stereotype.Service;
import pe.edu.upeu.msvcnotificaciones.client.ComunidadClient;
import pe.edu.upeu.msvcnotificaciones.client.UsuarioClient;
import pe.edu.upeu.msvcnotificaciones.client.dto.UsuarioDto;
import pe.edu.upeu.msvcnotificaciones.client.dto.UsuarioPerfilDTO;
import pe.edu.upeu.msvcnotificaciones.email.EmailService;
import pe.edu.upeu.msvcnotificaciones.entity.Notificacion;
import pe.edu.upeu.msvcnotificaciones.entity.dto.PrioridadNotificacion;
import pe.edu.upeu.msvcnotificaciones.entity.dto.TipoNotificacion;
import pe.edu.upeu.msvcnotificaciones.service.NotificacionService;

import java.time.LocalDateTime;

@Service
public class KafkaConsumerService {

    private final ObjectMapper objectMapper = new ObjectMapper();


    private final NotificacionService notificacionService;
    private final UsuarioClient usuarioClient;
    private final ComunidadClient comunidadClient;
    private final EmailService emailService;

    public KafkaConsumerService(EmailService emailService, UsuarioClient usuarioClient, ComunidadClient comunidadClient, NotificacionService notificacionService) {
        this.notificacionService = notificacionService;
        this.comunidadClient = comunidadClient;
        this.usuarioClient = usuarioClient;
        this.emailService = emailService;
    }

    /// Metodo para acceder a la data del usuario a partir de su id:
    public UsuarioPerfilDTO obtenerPerfilPorIdUsuario(Long idUsuario) {
        UsuarioDto usuarioDto = usuarioClient.obtenerusuario(idUsuario);
        String keycloakId = usuarioDto.getKeycloakId();
        return usuarioClient.obtenerPerfilPorKeycloakId(keycloakId);
    }


    // Para comunidad
    @KafkaListener(topics = "notificaciones-comunidad", groupId = "notificaciones-group")
    public void manejarComunidad(String mensajeJson) {
        try {
            MensajeKafkaDTO dto = objectMapper.readValue(mensajeJson, MensajeKafkaDTO.class);

            System.out.println("📨 Mensaje recibido desde Kafka (JSON): " + dto);


            Notificacion noti = new Notificacion();
            noti.setTitulo("Nueva comunidad creada");
            noti.setTipoNotificacion(TipoNotificacion.SISTEMA);
            noti.setContenido(dto.getMensaje());
            noti.setFechaCreacion(LocalDateTime.now());
            noti.setPrioridad(PrioridadNotificacion.MEDIA);

            Notificacion notificacionGuardada = notificacionService.guardar(noti);

            // Notificación para todos los usuarios
            Long[] idsUsuarios = usuarioClient.obtenerTodosLosIds();

            for (Long idUsuario : idsUsuarios) {
                notificacionService.vincularConUsuario(notificacionGuardada, idUsuario);
            }

        } catch (Exception e) {
            System.err.println("❌ Error al procesar mensaje comunidad: " + e.getMessage());
        }
    }

    // Para publicacion
    @KafkaListener(topics = "notificaciones-publicacion", groupId = "notificaciones-group")
    public void manejarPublicacion(String mensajeJson) {
        try {
            MensajeKafkaDTO dto = objectMapper.readValue(mensajeJson, MensajeKafkaDTO.class);

            System.out.println("📨 Mensaje recibido desde Kafka (JSON): " + dto);


            // Aquí asumes que siempre es tipo PUBLICACION
            if (dto.getIdComunidad() == null) {
                System.err.println("⚠️ Falta idComunidad para la publicación.");
                return;
            }

            Notificacion noti = new Notificacion();
            noti.setTitulo("Nueva publicación en tu comunidad");
            noti.setTipoNotificacion(TipoNotificacion.SISTEMA);
            noti.setContenido(dto.getMensaje());
            noti.setFechaCreacion(LocalDateTime.now());
            noti.setPrioridad(PrioridadNotificacion.MEDIA);

            Notificacion notificacionGuardada = notificacionService.guardar(noti);

            // Notificación solo para miembros de la comunidad
            Long[] idsUsuarios = comunidadClient.obtenerIdsDeMiembros(dto.getIdComunidad());

            for (Long idUsuario : idsUsuarios) {
                notificacionService.vincularConUsuario(notificacionGuardada, idUsuario);
            }

        } catch (Exception e) {
            System.err.println("❌ Error al procesar mensaje publicación: " + e.getMessage());
        }
    }


    // Para reacion publicacion:
    @KafkaListener(topics = "notificaciones-reaccion-publicacion", groupId = "notificaciones-group")
    public void mensajePublicacionReacion(String mensajeJson) {

        try {
            MensajeKafkaDTO dto = objectMapper.readValue(mensajeJson, MensajeKafkaDTO.class);

            System.out.println("📨 Mensaje recibido desde Kafka (JSON): " + dto);

            // ============ USUARIO REACION ============
            UsuarioPerfilDTO usuarioReaccionPerfil = obtenerPerfilPorIdUsuario(dto.getIdUsuarioReacion());
            String nombreReaccion = usuarioReaccionPerfil.getNombre();


            // ============ USUARIO PUBLICACION ============
            UsuarioPerfilDTO usuarioPublicacionPerfil = obtenerPerfilPorIdUsuario(dto.getIdUsuarioPublicacion());
            String nombrePublicacion = usuarioPublicacionPerfil.getNombre();
            String emailPublicacion = usuarioPublicacionPerfil.getEmail();
            boolean permitirEmailPublicacion = usuarioPublicacionPerfil.isRecibirNotificaciones();


            //Crear la notificacion:
            Notificacion noti = new Notificacion();
            noti.setTitulo("Reacion a tu publicacion");
            noti.setTipoNotificacion(TipoNotificacion.SISTEMA);
            noti.setContenido("El usuario " + nombreReaccion + dto.getMensaje());
            noti.setFechaCreacion(LocalDateTime.now());
            noti.setPrioridad(PrioridadNotificacion.BAJA);

            Notificacion notificacionGuardada = notificacionService.guardar(noti);


            //Crear usuario_notificacion:
            Long idUsuario = dto.getIdUsuarioPublicacion();
            notificacionService.vincularConUsuario(notificacionGuardada, idUsuario);

            //Enviar el gmail. //Aun nos e va a mandar nada  hasta que pasen un email, bobosss

           // emailService.enviarCorreo(emailPublicacion, "Nueva reacion a tu publicacion", "Hola " + nombrePublicacion + " !. El usuario " + nombreReaccion + dto.getMensaje());

        } catch (Exception e) {
            System.err.println("❌ Error al procesar mensaje publicación: " + e.getMessage());
        }
    }


    @KafkaListener(topics = "notificaciones-comentario", groupId = "notificaciones-group")
    public void mensajeComentario(String mensajeJson) {
        try {
            MensajeKafkaDTO dto = objectMapper.readValue(mensajeJson, MensajeKafkaDTO.class);
            System.out.println("📨 Mensaje recibido desde Kafka (JSON): " + dto);

            //Datos del usuario que comento :
            UsuarioPerfilDTO usuarioComentoPerfil = obtenerPerfilPorIdUsuario(dto.getIdUsuarioComentario());
            String nombrecomento = usuarioComentoPerfil.getNombre();


            //Crear la notificacion:
            Notificacion noti = new Notificacion();
            noti.setTitulo("Nuevo comentario");
            noti.setTipoNotificacion(TipoNotificacion.SISTEMA);
            noti.setContenido("El usuario " + nombrecomento + dto.getMensaje());
            noti.setFechaCreacion(LocalDateTime.now());
            noti.setPrioridad(PrioridadNotificacion.BAJA);

            Notificacion notificacionGuardada = notificacionService.guardar(noti);

            Long idUsuario = dto.getIdUsuarioPublicacion();
            notificacionService.vincularConUsuario(notificacionGuardada, idUsuario);

        } catch (Exception e){
            System.err.println("❌ Error al procesar mensaje publicación: " + e.getMessage());
        }
    }


    @KafkaListener(topics = "notificaciones-reaccion-comentario", groupId = "notificaciones-group")
    public void mensajeComentarioReacion(String mensajeJson) {

        try{

            MensajeKafkaDTO dto = objectMapper.readValue(mensajeJson, MensajeKafkaDTO.class);
            System.out.println("📨 Mensaje recibido desde Kafka (JSON): " + dto);

            // ============ USUARIO REACION ============
            UsuarioPerfilDTO usuarioReaccionPerfil = obtenerPerfilPorIdUsuario(dto.getIdUsuarioReacion());
            String nombreReaccion = usuarioReaccionPerfil.getNombre();


            // ============ USUARIO QUE COMENTA ============
            UsuarioPerfilDTO usuariocomentarioPerfil = obtenerPerfilPorIdUsuario(dto.getIdUsuarioComentario());
            String nombreComentario = usuariocomentarioPerfil.getNombre();
            String emailComentario = usuariocomentarioPerfil.getEmail();
            boolean permitirEmailComentario = usuariocomentarioPerfil.isRecibirNotificaciones();


            //Crear la notificacion:
            Notificacion noti = new Notificacion();
            noti.setTitulo("Reacion a tu comentario");
            noti.setTipoNotificacion(TipoNotificacion.SISTEMA);
            noti.setContenido("El usuario " + nombreReaccion + dto.getMensaje());
            noti.setFechaCreacion(LocalDateTime.now());
            noti.setPrioridad(PrioridadNotificacion.BAJA);
            Notificacion notificacionGuardada = notificacionService.guardar(noti);

            //Crear usuario_notificacion:
            Long idUsuario = dto.getIdUsuarioComentario();
            notificacionService.vincularConUsuario(notificacionGuardada, idUsuario);

        }catch (Exception e){
            System.err.println("❌ Error al procesar mensaje publicación: " + e.getMessage());
        }
    }



}