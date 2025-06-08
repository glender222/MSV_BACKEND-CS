package pe.edu.upeu.msvc_comunidad.controller;

import com.fasterxml.jackson.databind.ObjectMapper;
import org.apache.juli.logging.Log;
import org.springframework.http.HttpStatus;
import org.springframework.http.MediaType;
import org.springframework.http.ResponseEntity;
import org.springframework.web.bind.annotation.*;
import org.springframework.web.multipart.MultipartFile;
import pe.edu.upeu.msvc_comunidad.azure.AzureStorageService;
import pe.edu.upeu.msvc_comunidad.client.UsuarioClient;
import pe.edu.upeu.msvc_comunidad.entity.ArchivoPublicacion;
import pe.edu.upeu.msvc_comunidad.entity.Comunidad;
import pe.edu.upeu.msvc_comunidad.entity.Publicacion;
import pe.edu.upeu.msvc_comunidad.entity.dto.PublicacionDTO;
import pe.edu.upeu.msvc_comunidad.entity.dto.apoyo.ApoyoPublicacionArchivo;
import pe.edu.upeu.msvc_comunidad.entity.dto.PublicacionConArchivosDTO;
import pe.edu.upeu.msvc_comunidad.entity.penum.TipoPublicacion;
import pe.edu.upeu.msvc_comunidad.kafka.KafkaProducerService;
import pe.edu.upeu.msvc_comunidad.kafka.dto.MensajeKafkaDTO;
import pe.edu.upeu.msvc_comunidad.kafka.dto.PublicacionMensajeDTO;
import pe.edu.upeu.msvc_comunidad.service.ArchivoPublicacionService;
import pe.edu.upeu.msvc_comunidad.service.ComunidadService;
import pe.edu.upeu.msvc_comunidad.service.PublicacionService;

import java.time.LocalDate;
import java.time.LocalDateTime;
import java.util.List;
import java.util.Optional;

@RestController
@RequestMapping("/api/publicaciones")
public class PublicacionController {

    private final PublicacionService publicacionService;
    private final KafkaProducerService kafkaProducerService;
    private final ComunidadService comunidadService;
    private final ArchivoPublicacionService archivoPublicacionService;
    private final AzureStorageService azureStorageService;
    private final ObjectMapper objectMapper;
    private final UsuarioClient usuarioClient;


    public PublicacionController(UsuarioClient usuarioClient,ObjectMapper objectMapper, AzureStorageService azureStorageService, PublicacionService publicacionService, KafkaProducerService kafkaProducerService, ComunidadService comunidadService, ArchivoPublicacionService archivoPublicacionService) {
        this.publicacionService = publicacionService;
        this.usuarioClient = usuarioClient;
        this.kafkaProducerService = kafkaProducerService;
        this.comunidadService = comunidadService;
        this.archivoPublicacionService =  archivoPublicacionService;
        this.azureStorageService = azureStorageService;
        this.objectMapper = objectMapper;
    }

    //Listar:
    @GetMapping
    public List<Publicacion> listar() {
        return publicacionService.listar();
    }

    // Un listar con el uso de DTOS PARA QUE SALGA TODO COMPLETO
    @GetMapping("/con-detalles")
    public List<PublicacionDTO> listarPublicacionesConDetalles() {
        return publicacionService.listarPublicacionesConArchivosYComunidad();
    }

    //Listar las publicaciones de una comunidad
    @GetMapping("/comunidad/{idComunidad}")
    public ResponseEntity<List<PublicacionDTO>> listarPublicacionesPorComunidad(@PathVariable Long idComunidad) {
        List<PublicacionDTO> publicaciones = publicacionService.listarPublicacionesPorComunidad(idComunidad);
        return ResponseEntity.ok(publicaciones);
    }

    // Listar publicaciones por usuario y comunidad
    @GetMapping("/usuario/{idUsuario}/comunidad/{idComunidad}")
    public ResponseEntity<List<PublicacionDTO>> listarPorUsuarioYComunidad(
            @PathVariable Long idUsuario, @PathVariable Long idComunidad) {
        List<PublicacionDTO> publicaciones = publicacionService.listarPorUsuarioYComunidad(idUsuario, idComunidad);
        return ResponseEntity.ok(publicaciones);
    }

    // Listar todas las publicaciones por usuario en todas las comunidades
    @GetMapping("/usuario/{idUsuario}")
    public ResponseEntity<List<PublicacionDTO>> listarPorUsuario(@PathVariable Long idUsuario) {
        List<PublicacionDTO> publicaciones = publicacionService.listarPorUsuario(idUsuario);
        return ResponseEntity.ok(publicaciones);
    }



    //Buscar por id
    @GetMapping("/{id}")
    public ResponseEntity<Publicacion> obtenerPorId(@PathVariable Long id) {
        return publicacionService.buscarPorId(id)
                .map(ResponseEntity::ok)
                .orElse(ResponseEntity.notFound().build());
    }

    //Eliminar
    @DeleteMapping("/{id}")
    public ResponseEntity<Publicacion> eliminar(@PathVariable Long id) {
        publicacionService.eliminar(id);
        return ResponseEntity.noContent().build();
    }


    //Editar:
    @PutMapping("/{id}")
    public ResponseEntity<Publicacion> actualizar(@PathVariable Long id, @RequestBody Publicacion publicacion) {
        return publicacionService.buscarPorId(id).map(publicacionExiste -> {

            publicacionExiste.setId_usuario_publica(publicacion.getId_usuario_publica());
            publicacionExiste.setContenido(publicacion.getContenido());
            publicacionExiste.setFecha_creacion(publicacion.getFecha_creacion());
            publicacionExiste.setComunidad(publicacion.getComunidad());

            Publicacion publicionActual = publicacionService.guardar(publicacionExiste);

            return ResponseEntity.ok(publicionActual);
        }).orElse(ResponseEntity.notFound().build());
    }


    //Crear
    @PostMapping(value = "/azure/con-archivos", consumes = MediaType.MULTIPART_FORM_DATA_VALUE)
    public ResponseEntity<?> crearConArchivosazure(
            @RequestPart("publicacion") String publicacionJson,
            @RequestPart("archivos") List<MultipartFile> archivos
    ) {
        try {
            // Usar el ObjectMapper inyectado que tiene JavaTimeModule
            PublicacionConArchivosDTO dto = objectMapper.readValue(publicacionJson, PublicacionConArchivosDTO.class);

            // Filro para el id del usuario_publica
            Long iduser = dto.getPublicacion().getId_usuario_publica();
            if (!usuarioClient.existsById(iduser)) {
                return ResponseEntity.status(HttpStatus.BAD_REQUEST)
                        .body("El usuario con ID " + iduser + " no existe.");
            }

            // Filtrar la comunidad:
            Long idcomunid = dto.getPublicacion().getComunidad().getId();

            Optional<Comunidad> comunidadOptional = comunidadService.buscarPorId(idcomunid);
            if (comunidadOptional.isEmpty()) {
                return ResponseEntity.status(HttpStatus.BAD_REQUEST)
                        .body("La comunidad con ID " + idcomunid + " no existe.");
            }


            // Asiganar la fecha y hora
            dto.getPublicacion().setFecha_creacion(LocalDateTime.now());


            // Guardar la publicacion
            Publicacion publicacionGuardada = publicacionService.guardar(dto.getPublicacion());

            List<ApoyoPublicacionArchivo> archivosDTO = dto.getArchivos();

            if (archivos.size() != archivosDTO.size()) {
                return ResponseEntity.badRequest().body("El número de archivos y metadatos no coincide");
            }

            for (int i = 0; i < archivos.size(); i++) {
                MultipartFile archivoFisico = archivos.get(i);
                ApoyoPublicacionArchivo archivoDto = archivosDTO.get(i);

                String url = azureStorageService.subirArchivo(archivoFisico);

                ArchivoPublicacion nuevoArchivo = new ArchivoPublicacion();
                nuevoArchivo.setTipo_publicacion(TipoPublicacion.valueOf(archivoDto.getTipo_publicacion().toUpperCase()));
                nuevoArchivo.setUrl_archivo(url);
                nuevoArchivo.setPublicacion(publicacionGuardada);

                archivoPublicacionService.guardar(nuevoArchivo);
            }

            Long idComunidad = publicacionGuardada.getComunidad().getId();
            Comunidad comunidadCompleta = comunidadService.buscarPorId(idComunidad)
                    .orElseThrow(() -> new RuntimeException("Comunidad no encontrada con ID: " + idComunidad));

            PublicacionMensajeDTO kafkaMensaje = new PublicacionMensajeDTO (
                    "PUBLICACION",
                    "Ingresa a ver la nueva publicación de tu comunidad " + comunidadCompleta.getNombre(),
                    idComunidad
            );

            kafkaProducerService.enviarMensaje("notificaciones-publicacion", kafkaMensaje);

            return ResponseEntity.ok(publicacionGuardada);
        } catch (Exception e) {
            e.printStackTrace();
            return ResponseEntity.status(HttpStatus.INTERNAL_SERVER_ERROR)
                    .body("Error: " + e.getMessage());
        }
    }

    // Prueba de subir archivos
    @PostMapping("/upload")
    public ResponseEntity<String> uploadFile(@RequestParam("file") MultipartFile file) {
        String url = azureStorageService.subirArchivo(file);
        return ResponseEntity.ok(url);
    }





}
