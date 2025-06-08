package pe.edu.upeu.msvc_comunidad.controller;

import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.web.bind.annotation.*;
import pe.edu.upeu.msvc_comunidad.client.UsuarioClient;
import pe.edu.upeu.msvc_comunidad.entity.Comentario;
import pe.edu.upeu.msvc_comunidad.entity.Publicacion;
import pe.edu.upeu.msvc_comunidad.entity.ReaccionComentario;
import pe.edu.upeu.msvc_comunidad.entity.penum.TipoReaccion;
import pe.edu.upeu.msvc_comunidad.kafka.KafkaProducerService;
import pe.edu.upeu.msvc_comunidad.kafka.dto.ReaccionComentarioMensajeDTO;
import pe.edu.upeu.msvc_comunidad.service.ComentarioService;
import pe.edu.upeu.msvc_comunidad.service.ReaccionComentarioService;

import java.util.List;
import java.util.Map;
import java.util.Optional;
import java.util.Timer;

@RestController
@RequestMapping("/api/reaccion_comentario")
public class ReaccionComentarioController {

    private ReaccionComentarioService reaccionComentarioService;
    private UsuarioClient usuarioClient;
    private ComentarioService comentarioService;
    private KafkaProducerService kafkaProducerService;

    public ReaccionComentarioController(KafkaProducerService kafkaProducerService,ComentarioService comentarioService, UsuarioClient usuarioClient, ReaccionComentarioService reaccionComentarioService) {
        this.reaccionComentarioService = reaccionComentarioService;
        this.usuarioClient = usuarioClient;
        this.comentarioService = comentarioService;
        this.kafkaProducerService = kafkaProducerService;
    }

    //Listar:
    @GetMapping
    public List<ReaccionComentario> listar() {
        return reaccionComentarioService.listar();
    }

    //Crear
    @PostMapping
    public ResponseEntity<?> guardar(@RequestBody ReaccionComentario reaccionComentario) {

        //Validar si el usuario que reacion existe:
        Long id_usaurio_reacion = reaccionComentario.getId_usuario_reaccion();
        boolean existeusaurio = usuarioClient.existsById(id_usaurio_reacion);
        if (!existeusaurio) {
            return ResponseEntity.status(HttpStatus.BAD_REQUEST)
                    .body("El usuario que intenta reacionar con ID " + id_usaurio_reacion + " no existe");
        }

        // Validar si el comentario existe:
        Long idcomentario = reaccionComentario.getComentario().getId();
        if (comentarioService.buscarPorId(idcomentario).isEmpty()) {
            return ResponseEntity.status(HttpStatus.BAD_REQUEST)
                    .body("La publicacion con ID " + idcomentario + " no existe");
        }
        // Si pasa gaurdar la reacion del comentario
        ReaccionComentario reacioncome = reaccionComentarioService.guardar(reaccionComentario);

        // =========== Mensaje para kafka ===============

        Optional<Comentario> optionalComentario = comentarioService.buscarPorId(idcomentario);
        Comentario publicacioncondatoscompletos = optionalComentario.get();

        Long  id_usuario_comenta = publicacioncondatoscompletos.getId_usuario_comenta();

        ReaccionComentarioMensajeDTO nuevomensaje = new ReaccionComentarioMensajeDTO(
                "REACION_COMENTARIO",
                " reacion a tu comentario",
                id_usaurio_reacion,
                id_usuario_comenta
        );

        kafkaProducerService.enviarMensaje("notificaciones-reaccion-comentario", nuevomensaje);
        return ResponseEntity.ok(reacioncome);
    }

    //Listarid
    @GetMapping("/{id}")
    public ResponseEntity<ReaccionComentario> obtenerPorId(@PathVariable Long id) {
        return reaccionComentarioService.buscarPorId(id)
                .map(ResponseEntity::ok)
                .orElse(ResponseEntity.notFound().build());
    }

    //Eliminar:
    @DeleteMapping("/{id}")
    public ResponseEntity<ReaccionComentario> eliminar(@PathVariable Long id) {
        reaccionComentarioService.eliminar(id);
        return ResponseEntity.ok().build();
    }

    //Editar:
    @PutMapping("/{id}")
    public ResponseEntity<ReaccionComentario> editar(@PathVariable Long id, @RequestBody ReaccionComentario reaccionComentario) {
        return reaccionComentarioService.buscarPorId(id).map(existe -> {
            existe.setTipo_reaccion(reaccionComentario.getTipo_reaccion());
            existe.setId_usuario_reaccion(reaccionComentario.getId_usuario_reaccion());
            existe.setComentario(reaccionComentario.getComentario());

            ReaccionComentario reacionco = reaccionComentarioService.guardar(existe);

            return ResponseEntity.ok(reacionco);
        }).orElse(ResponseEntity.notFound().build());
    }

    //Total de reaciones por comentario:
    @GetMapping("/comentario/lista_total/{id}")
    public ResponseEntity<?> obtenerListaTotalDeReaciones(@PathVariable Long id) {
        //validar si el comentario existe:
        if (comentarioService.buscarPorId(id).isEmpty()){
            return ResponseEntity.status(HttpStatus.BAD_REQUEST)
                    .body("El comentario con ID " + id + " no existe");
        }
        // SI existe devolver la lista:
        List<ReaccionComentario> reaciones = reaccionComentarioService.obtenerReacionesPorComentario(id);

        return  ResponseEntity.ok(reaciones);
    }

    //TOTAL en numero de raciones por publicacion:
    @GetMapping("/comentario/numero_total/{id}")
    public ResponseEntity<?> obtenerNumeroTotalDeReaciones(@PathVariable Long id) {
        //Validar si la el comentario existe:
        if (comentarioService.buscarPorId(id).isEmpty()){
            return ResponseEntity.status(HttpStatus.BAD_REQUEST)
                    .body("El comentario con ID " + id + " no existe");
        }
        Long total = reaccionComentarioService.contartotalReacionesPorComentario(id);

        return  ResponseEntity.ok(total);
    }

    //Total de reaciones por tipo en un comentario
    @GetMapping("/comentario/por_tipo/{id}")
    public ResponseEntity<?> obtenerTotalPorTipo(@PathVariable Long id) {
        //Validar si la el comentario existe:
        if (comentarioService.buscarPorId(id).isEmpty()){
            return ResponseEntity.status(HttpStatus.BAD_REQUEST)
                    .body("El comentario con ID " + id + " no existe");
        }

        Map<TipoReaccion, Long> contar = reaccionComentarioService.contarreacionPorTipo(id);

        return  ResponseEntity.ok(contar);
    }


}
