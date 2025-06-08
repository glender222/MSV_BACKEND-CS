package pe.edu.upeu.msvc_comunidad.controller;

import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.web.bind.annotation.*;
import pe.edu.upeu.msvc_comunidad.client.UsuarioClient;
import pe.edu.upeu.msvc_comunidad.entity.UsuarioComunidad;
import pe.edu.upeu.msvc_comunidad.entity.dto.UsuarioComunidadDTO;
import pe.edu.upeu.msvc_comunidad.service.ComunidadService;
import pe.edu.upeu.msvc_comunidad.service.UsuarioComunidadService;

import java.util.List;
import java.util.Map;

@RestController
@RequestMapping("/api/usuario_comunidad")
public class UsuarioComunidadController {

    private final UsuarioComunidadService usuarioComunidadService;
    private final UsuarioClient usuarioClient;
    private final ComunidadService comunidadService;

    public UsuarioComunidadController(ComunidadService comunidadService,UsuarioClient usuarioClient,UsuarioComunidadService usuarioComunidadService) {
        this.usuarioComunidadService = usuarioComunidadService;
        this.comunidadService = comunidadService;
        this.usuarioClient = usuarioClient;

    }

    //Agregar usuario a una comunidad
    @PostMapping("/nuevo_usuario/{idComunidad}")
    public ResponseEntity<?> agregarUsuarioAComunidad(@PathVariable Long idComunidad,
            @RequestBody UsuarioComunidadDTO request) {
        try {
            UsuarioComunidad result = usuarioComunidadService.agregarUsuarioAComunidad(idComunidad, request);
            return ResponseEntity.ok(result);
        } catch (RuntimeException e) {
            return ResponseEntity.badRequest().body(e.getMessage());
        }
    }

    //Listar usuarios de una cominidad
    @GetMapping("usuarios_de_la_comunidad/{idComunidad}")
    public ResponseEntity<?> listarUsuariosPorComunidad(@PathVariable Long idComunidad) {
        if (comunidadService.buscarPorId(idComunidad).isEmpty()) {
            return ResponseEntity.status(404).body("La comunidad con ID " + idComunidad + " no existe");
        }

        List<UsuarioComunidad> usuarios = usuarioComunidadService.listarPorComunidad(idComunidad);
        return ResponseEntity.ok(usuarios);
    }

    //Eliminar usuario de una cominidad
    @DeleteMapping("/comunidad/{idComunidad}/usuario/{idUsuario}")
    public ResponseEntity<?> eliminarUsuarioDeComunidad(@PathVariable Long idComunidad,
                                                        @PathVariable Long idUsuario) {
        try {
            usuarioComunidadService.eliminarUsuarioDeComunidad(idUsuario, idComunidad);
            return ResponseEntity.noContent().build();
        } catch (RuntimeException e) {
            return ResponseEntity.badRequest().body(e.getMessage());
        }
    }


    //Comunidades del usuario
    @GetMapping("/comunidades_de_usuario/{idUsuario}")
    public ResponseEntity<List<UsuarioComunidad>> listarComunidadesPorUsuario(@PathVariable Long idUsuario) {
        List<UsuarioComunidad> comunidades = usuarioComunidadService.listarComunidadesPorUsuario(idUsuario);
        if (comunidades.isEmpty()) {
            return ResponseEntity.noContent().build();
        }
        return ResponseEntity.ok(comunidades);
    }
    // IDS DE LOS USUARIOS DE UNA COMUNIDAD -> Para notificaciones:
    @GetMapping("/{idComunidad}/miembros")
    public ResponseEntity<?> obtenerIdsDeMiembrosDeUnaComunidad(@PathVariable Long idComunidad) {

        // Validar si la comunida existe:
        if (comunidadService.buscarPorId(idComunidad).isEmpty()) {
            return ResponseEntity.status(404).body("La comunidad con ID " + idComunidad + " no existe");
        }

        List<UsuarioComunidad> lista = usuarioComunidadService.listarPorComunidad(idComunidad);
        Long[] ids = lista.stream()
                .map(uc -> uc.getUsuarioId())
                .toArray(Long[]::new);

        return ResponseEntity.ok(ids);
    }


    // PROBAR SI EL USUARIO EXISTE :
    @GetMapping("/probar-usuario/{idUsuario}")
    public ResponseEntity<?> probarUsuarioClient(@PathVariable Long idUsuario) {
        boolean existe = usuarioComunidadService.verificarExistenciaUsuario(idUsuario);
        return ResponseEntity.ok("¿Usuario existe?: " + existe);
    }

}
