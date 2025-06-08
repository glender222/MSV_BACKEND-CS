package pe.edu.upeu.msvcnotificaciones.controller;

import org.springframework.http.ResponseEntity;
import org.springframework.web.bind.annotation.*;
import pe.edu.upeu.msvcnotificaciones.client.ComunidadClient;
import pe.edu.upeu.msvcnotificaciones.client.UsuarioClient;
import pe.edu.upeu.msvcnotificaciones.entity.Notificacion;
import pe.edu.upeu.msvcnotificaciones.repositories.NotificacionRepository;
import pe.edu.upeu.msvcnotificaciones.service.NotificacionService;

import java.util.List;
import java.util.Optional;

@RestController
@RequestMapping("/api/notificaciones")

public class NotificacionController {

    private final NotificacionService notificacionService;

    //Pra probar:
    private final UsuarioClient usuarioClient;
    private final ComunidadClient comunidadClient;

    public NotificacionController(ComunidadClient comunidadClient,UsuarioClient usuarioClient,NotificacionService notificacionService) {
        this.notificacionService = notificacionService;
        this.usuarioClient = usuarioClient;
        this.comunidadClient = comunidadClient;
    }


     // Todos los id de los usuarios:
    @GetMapping("/usuarios/ids")
    public ResponseEntity<Long[]> obtenerIdsUsuarios() {
        Long[] ids = usuarioClient.obtenerTodosLosIds();
        return ResponseEntity.ok(ids);
    }

    @GetMapping("/comunidades/{id}/miembros")
    public ResponseEntity<Long[]> obtenerMiembrosDeComunidad(@PathVariable("id") Long idComunidad) {
        Long[] idsMiembros = comunidadClient.obtenerIdsDeMiembros(idComunidad);
        return ResponseEntity.ok(idsMiembros);
    }



    //Listar
    @GetMapping
    public List<Notificacion> listar() {
        return notificacionService.listar();
    }

    //Crear
    @PostMapping
    public ResponseEntity<Notificacion> guardar(@RequestBody Notificacion notificacion) {
        Notificacion notificacionAux = notificacionService.guardar(notificacion);
        return ResponseEntity.ok(notificacionAux);
    }

    //BuscarPorID
    @GetMapping("/{id}")
    public ResponseEntity<Notificacion> obtenerpoId(@PathVariable Long id) {
        return notificacionService.buscarPorId(id)
                .map(ResponseEntity::ok)
                .orElse(ResponseEntity.notFound().build());

    }

    //Eliminar
    @DeleteMapping("/{id}")
    public ResponseEntity<Notificacion> eliminar(@PathVariable Long id) {
        notificacionService.eliminar(id);
        return ResponseEntity.noContent().build();
    }

    //Editar
    @PutMapping("/{id}")
    public ResponseEntity<Notificacion> editar(@PathVariable Long id, @RequestBody Notificacion notificacion) {
        return notificacionService.buscarPorId(id).map( existe -> {

            existe.setTitulo(notificacion.getTitulo());
            existe.setContenido(notificacion.getContenido());
            existe.setFechaCreacion(notificacion.getFechaCreacion());
            existe.setPrioridad(notificacion.getPrioridad());
            existe.setTipoNotificacion(notificacion.getTipoNotificacion());

            Notificacion nueva = notificacionService.guardar(existe);

            return ResponseEntity.ok(nueva);
        }).orElse(ResponseEntity.notFound().build());
    }



}
