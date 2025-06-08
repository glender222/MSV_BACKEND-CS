package pe.edu.upeu.msvc_comunidad.controller;

import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.web.bind.annotation.*;
import pe.edu.upeu.msvc_comunidad.client.UsuarioClient;
import pe.edu.upeu.msvc_comunidad.entity.Publicacion;
import pe.edu.upeu.msvc_comunidad.entity.ReaccionPublicacion;
import pe.edu.upeu.msvc_comunidad.entity.penum.TipoReaccion;
import pe.edu.upeu.msvc_comunidad.kafka.KafkaProducerService;
import pe.edu.upeu.msvc_comunidad.kafka.dto.PublicacionMensajeDTO;
import pe.edu.upeu.msvc_comunidad.kafka.dto.ReaccionPublicacionMensajeDTO;
import pe.edu.upeu.msvc_comunidad.service.PublicacionService;
import pe.edu.upeu.msvc_comunidad.service.ReaccionComentarioService;
import pe.edu.upeu.msvc_comunidad.service.ReaccionPublicacionService;

import java.util.Arrays;
import java.util.List;
import java.util.Map;
import java.util.Optional;


@RestController
@RequestMapping("/api/reaccion_publicacion")
public class ReaccionPublicacionController {

    private final ReaccionPublicacionService reaccionPublicacionService;
    private final UsuarioClient usuarioClient;
    private final PublicacionService publicacionService;
    private final KafkaProducerService kafkaProducerService;

    public ReaccionPublicacionController(KafkaProducerService  kafkaProducerService, PublicacionService publicacionService, UsuarioClient usuarioClient, ReaccionPublicacionService reaccionPublicacionService) {
        this.reaccionPublicacionService = reaccionPublicacionService;
        this.usuarioClient = usuarioClient;
        this.kafkaProducerService = kafkaProducerService;
        this.publicacionService = publicacionService;
    }

    //listar:
    @GetMapping
    public List<ReaccionPublicacion> listar() {
        return reaccionPublicacionService.listar();
    }

    //Crear
    @PostMapping
    public ResponseEntity<?> crear(@RequestBody ReaccionPublicacion reaccionPublicacion) {

        //Varibles  a usar:
        Long id_usuario_reaccion = reaccionPublicacion.getId_usuario_reaccion();
        TipoReaccion tipoReaccion = reaccionPublicacion.getTipo_reaccion();
        Long idpublicacion = reaccionPublicacion.getPublicacion().getId();

        //Validar si el usuario que  reacion existe
        boolean existeusuario = usuarioClient.existsById(id_usuario_reaccion);
        if (!existeusuario) {
            return ResponseEntity.status(HttpStatus.BAD_REQUEST)
                    .body("El usuario que intenta reacionar con ID " + id_usuario_reaccion + " no existe");
        }

        // Validar el tipo de reacción = Este no pasa :(
        boolean tipoValido = Arrays.asList(TipoReaccion.values()).contains(tipoReaccion);
        if (!tipoValido) {
            return ResponseEntity.status(HttpStatus.BAD_REQUEST)
                    .body("El tipo de reacción " + tipoReaccion + " no es válido");
        }

        // Validar si la publicación existe
        if (publicacionService.buscarPorId(idpublicacion).isEmpty()) {
            return ResponseEntity.status(HttpStatus.BAD_REQUEST)
                    .body("La publicación con ID " + idpublicacion + " no existe");
        }

        //Si pas guardar la reacion
        ReaccionPublicacion rea = reaccionPublicacionService.guardar(reaccionPublicacion);

         //===================Logica KAFKA==========================

        //ID USUARIO PUBLICACION
        Optional<Publicacion> optionalPublicacion = publicacionService.buscarPorId(idpublicacion);
        Publicacion publicacioncondatoscompletos = optionalPublicacion.get();

        Long  id_usuario_publica = publicacioncondatoscompletos.getId_usuario_publica();

        // Mensaje para kafka
        ReaccionPublicacionMensajeDTO kafkaMensaje = new ReaccionPublicacionMensajeDTO (
                "REACION_PUBLICACION",
                " reaciono a tu publicacion" ,
                id_usuario_reaccion,
                id_usuario_publica
        );

        kafkaProducerService.enviarMensaje("notificaciones-reaccion-publicacion", kafkaMensaje);



        return new ResponseEntity<>(rea, HttpStatus.CREATED);
    }


    //ListarId:
    @GetMapping("/{id}")
    public ResponseEntity<ReaccionPublicacion> listarid(@PathVariable Long id) {
        return reaccionPublicacionService.buscarPorId(id)
                .map(ResponseEntity::ok)
                .orElse(ResponseEntity.notFound().build());
    }

    //Eliminar
    @DeleteMapping("/{id}")
    public ResponseEntity<ReaccionPublicacion> eliminar(@PathVariable Long id) {
        reaccionPublicacionService.eliminar(id);
        return new ResponseEntity<>(HttpStatus.NO_CONTENT);
    }

    @PutMapping("/{id}")
    public ResponseEntity<ReaccionPublicacion> actualizar(@PathVariable Long id, @RequestBody ReaccionPublicacion reaccionPublicacion) {
        return reaccionPublicacionService.buscarPorId(id).map(existe -> {
            existe.setId_usuario_reaccion(reaccionPublicacion.getId_usuario_reaccion());
            existe.setTipo_reaccion(reaccionPublicacion.getTipo_reaccion());
            existe.setPublicacion(reaccionPublicacion.getPublicacion());

            ReaccionPublicacion nuevareac = reaccionPublicacionService.guardar(existe);
            return ResponseEntity.ok(nuevareac);

        }).orElse(ResponseEntity.notFound().build());
    }

    //Totas las reaciones de una publicicacion:
    @GetMapping("/publicacion/lista_total/{id}")
    public ResponseEntity<?> listarPublicacionTotal(@PathVariable Long id) {

        // Validar si la publicación existe
        if (publicacionService.buscarPorId(id).isEmpty()) {
            return ResponseEntity.status(HttpStatus.BAD_REQUEST)
                    .body("La publicación con ID " + id + " no existe");
        }

        // Si existe,debolver la lista
        List<ReaccionPublicacion> reacciones = reaccionPublicacionService.obtenerReaccionesPorPublicacion(id);

        return ResponseEntity.ok(reacciones);
    }


    //Total en numero de reaciones por publicacion:
    @GetMapping("/publicacion/numero_total/{id}")
    public ResponseEntity<?> totalReacciones(@PathVariable Long id) {
        // Verifica si la publicación existe
        if (publicacionService.buscarPorId(id).isEmpty()) {
            return ResponseEntity.status(HttpStatus.BAD_REQUEST)
                    .body("La publicación con ID " + id + " no existe");
        }

        // Si existe, devuelve el total de reacciones
        Long total = reaccionPublicacionService.contarTotalReaccionesPorPublicacion(id);
        return ResponseEntity.ok(total);
    }

    // Total de reaciones de acuerdo al tipo
    @GetMapping("/publicacion/por_tipo/{id}")
    public ResponseEntity<?> totalPorTipo(@PathVariable Long id) {
        // Validar si la publicación existe
        if (publicacionService.buscarPorId(id).isEmpty()) {
            return ResponseEntity.status(HttpStatus.BAD_REQUEST)
                    .body("La publicación con ID " + id + " no existe");
        }

        // Obtener el total de reacciones agrupadas por tipo
        Map<TipoReaccion, Long> conteoPorTipo = reaccionPublicacionService.contarReaccionesPorTipo(id);
        return ResponseEntity.ok(conteoPorTipo);
    }


}
