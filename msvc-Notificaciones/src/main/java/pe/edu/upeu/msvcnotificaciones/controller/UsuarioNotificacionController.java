package pe.edu.upeu.msvcnotificaciones.controller;

import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.web.bind.annotation.*;
import pe.edu.upeu.msvcnotificaciones.entity.Notificacion;
import pe.edu.upeu.msvcnotificaciones.entity.UsuarioNotificacion;
import pe.edu.upeu.msvcnotificaciones.entity.dto.UsuarioNotificacionDetalleDTO;
import pe.edu.upeu.msvcnotificaciones.service.UsuarioNotificacionService;

import java.time.LocalDateTime;
import java.util.List;

@RestController
@RequestMapping("/api/usuario_notificaciones")
public class UsuarioNotificacionController {

    private final UsuarioNotificacionService usuarioNotificacionService;

    public UsuarioNotificacionController(UsuarioNotificacionService usuarioNotificacionService) {
        this.usuarioNotificacionService = usuarioNotificacionService;
    }

    // Listar: 

    @GetMapping
    public List<UsuarioNotificacion> listar() {
        return usuarioNotificacionService.listar();
    }

    @PostMapping
    public ResponseEntity<UsuarioNotificacion> guardar(@RequestBody UsuarioNotificacion notificacion) {
        UsuarioNotificacion nuevo = usuarioNotificacionService.guardar(notificacion);
        return ResponseEntity.ok(nuevo);
    }

    @GetMapping("/{id}")
    public ResponseEntity<UsuarioNotificacion> buscarPorId(@PathVariable Long id) {
        return usuarioNotificacionService.buscarPorId(id)
                .map(ResponseEntity::ok)
                .orElse(ResponseEntity.notFound().build());
    }

    @DeleteMapping("/{id}")
    public ResponseEntity<UsuarioNotificacion> eliminar(@PathVariable Long id) {
        usuarioNotificacionService.eliminar(id);
        return ResponseEntity.ok().build();
    }

    // EDITAR, ESTE HACER PARA QUE EL USUARIO PASE DE SIN LEER A LEIDO
    @PutMapping("/{id}")
    public ResponseEntity<?> editar(@PathVariable Long id, @RequestBody UsuarioNotificacion notificacion) {
        return usuarioNotificacionService.buscarPorId(id).map(existe -> {

            // Verificar si el estado ha cambiado
            if (!existe.getEstadoNotificacion().equals(notificacion.getEstadoNotificacion())) {
                // Actualizar estado y fecha de lectura
                existe.setEstadoNotificacion(notificacion.getEstadoNotificacion());
                existe.setFechaLectura(LocalDateTime.now());

                UsuarioNotificacion actualizado = usuarioNotificacionService.guardar(existe);
                return ResponseEntity.ok(actualizado);
            }

            // Si no cambió el estado, no modificar nada
            return ResponseEntity.status(HttpStatus.NOT_MODIFIED).build();

        }).orElse(ResponseEntity.notFound().build());
    }

    // Listar notificaciones de un usuario:
    @GetMapping("/usuario/{id}")
    public ResponseEntity<List<UsuarioNotificacionDetalleDTO>> obtenerNotificacionesPorUsuario(@PathVariable("id") Long idUsuario) {
        List<UsuarioNotificacionDetalleDTO> detalles = usuarioNotificacionService.obtenerDetalleNotificacionesPorUsuario(idUsuario);
        return ResponseEntity.ok(detalles);
    }



}

