package pe.edu.upeu.msvc_comunidad.controller;

import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.web.bind.annotation.*;
import pe.edu.upeu.msvc_comunidad.client.UsuarioClient;
import pe.edu.upeu.msvc_comunidad.entity.Comentario;
import pe.edu.upeu.msvc_comunidad.entity.Publicacion;
import pe.edu.upeu.msvc_comunidad.kafka.KafkaProducerService;
import pe.edu.upeu.msvc_comunidad.kafka.dto.ComentarioMensajeDTO;
import pe.edu.upeu.msvc_comunidad.service.ComentarioService;
import pe.edu.upeu.msvc_comunidad.service.PublicacionService;

import java.time.LocalDate;
import java.time.LocalDateTime;
import java.util.List;
import java.util.Optional;

@RestController
@RequestMapping("/api/comentarios")
public class ComentarioController {

    private final ComentarioService comentarioService;
    private final UsuarioClient usuarioClient;
    private final PublicacionService publicacionService;
    private final KafkaProducerService kafkaProducerService;

    public ComentarioController(KafkaProducerService kafkaProducerService, PublicacionService publicacionService, UsuarioClient usuarioClient, ComentarioService comentarioService) {
        this.comentarioService = comentarioService;
        this.usuarioClient = usuarioClient;
        this.publicacionService = publicacionService;
        this.kafkaProducerService = kafkaProducerService;
    }

    //listar:
    @GetMapping
    public List<Comentario> listar() {
        return comentarioService.listar();
    }

    //Crear:
    @PostMapping
    public ResponseEntity<?> crear(@RequestBody Comentario comentario) {

        // Validar el id del usuario que comenta
        if (!usuarioClient.existsById(comentario.getId_usuario_comenta())) {
            return ResponseEntity.status(HttpStatus.BAD_REQUEST)
                    .body("El usuario con ID " + comentario.getId_usuario_comenta() + " no existe.");
        }

        // Validar si existe la publicación
        if (publicacionService.buscarPorId(comentario.getPublicacion().getId()).isEmpty()) {
            return ResponseEntity.status(HttpStatus.BAD_REQUEST)
                    .body("La publicación con ID " + comentario.getPublicacion().getId() + " no existe.");
        }
        // Asignar la fecha
        comentario.setFecha_creacion(LocalDateTime.now());
        Comentario come = comentarioService.guardar(comentario);

        //ID USUARIO PUBLICACION
        Long idpublicacion = comentario.getPublicacion().getId();
        Optional<Publicacion> optionalPublicacion = publicacionService.buscarPorId(idpublicacion);
        Publicacion publicacioncondatoscompletos = optionalPublicacion.get();
        Long  id_usuario_publica = publicacioncondatoscompletos.getId_usuario_publica();



        // ===============Envair mensaje a kafka:
        ComentarioMensajeDTO mensajeDTO = new ComentarioMensajeDTO(
                "COMENTARIO",
                " comento tu publicacion",
                comentario.getId_usuario_comenta(),
                id_usuario_publica
        );

        kafkaProducerService.enviarMensaje("notificaciones-comentario", mensajeDTO);



        return new ResponseEntity<>(come, HttpStatus.CREATED);
    }


    //Buscar por id :
    @GetMapping("/{id}")
    public ResponseEntity<Comentario> buscarPorId(@PathVariable Long id) {
        return comentarioService.buscarPorId(id)
                .map(ResponseEntity::ok)
                .orElse(ResponseEntity.notFound().build());

    }

    // Comentarios de una sola publiciacion
    @GetMapping("/publicacion/{publicacionId}")
    public ResponseEntity<?> listarPorPublicacion(@PathVariable Long publicacionId) {


        // Validar si la publicación existe
        if (publicacionService.buscarPorId(publicacionId).isEmpty()) {
            return ResponseEntity.status(HttpStatus.BAD_REQUEST)
                    .body("La publicación con ID " + publicacionId + " no existe");
        }


        List<Comentario> comentarios = comentarioService.listarPorPublicacion(publicacionId);
        return ResponseEntity.ok(comentarios);
    }


    //Eliminar:

    @DeleteMapping("/{id}")
    public ResponseEntity<Comentario> eliminar(@PathVariable Long id) {
        comentarioService.eliminar(id);
        return ResponseEntity.noContent().build();
    }

    //editar:
    @PutMapping("/{id}")
    public ResponseEntity<Comentario> actualizar(@PathVariable Long id, @RequestBody Comentario comentario) {
        return comentarioService.buscarPorId(id).map(comententarioExiste -> {

            comententarioExiste.setId_usuario_comenta(comentario.getId_usuario_comenta());
            comententarioExiste.setComentario(comentario.getComentario());
            comententarioExiste.setFecha_creacion(comentario.getFecha_creacion());
            comententarioExiste.setPublicacion(comentario.getPublicacion());

            Comentario comentarioActualizado = comentarioService.guardar(comententarioExiste);
            return ResponseEntity.ok(comentarioActualizado);
        }).orElse(ResponseEntity.notFound().build());
    }
}
