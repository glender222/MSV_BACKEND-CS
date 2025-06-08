package pe.edu.upeu.msvcgestion_usuario.controller;

import java.util.List;
import java.util.stream.Collectors;

import org.springframework.data.domain.Page;
import org.springframework.data.domain.Pageable;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.validation.annotation.Validated;
import org.springframework.web.bind.annotation.*;

import jakarta.validation.Valid;
import lombok.RequiredArgsConstructor;
import lombok.extern.slf4j.Slf4j;
import pe.edu.upeu.msvcgestion_usuario.entity.Usuario;
import pe.edu.upeu.msvcgestion_usuario.entity.dto.UsuarioCompletoDTO;
import pe.edu.upeu.msvcgestion_usuario.entity.dto.UsuarioRegistroDTO;
import pe.edu.upeu.msvcgestion_usuario.entity.dto.UsuarioResponseDTO;
import pe.edu.upeu.msvcgestion_usuario.service.UsuarioService;

@Slf4j
@RequiredArgsConstructor
@Validated
@RestController
@RequestMapping("api/v1/usuarios")
public class UsuarioController {

    private final UsuarioService usuarioService;
    
 //ID DE TODOS LOS USUARIOS - > Para notificaciones
    @GetMapping("obtener/ids")
    public ResponseEntity<List<Long>> obtenerTodosLosIds() {
        List<Long> ids = usuarioService.findAll()
                .stream()
                .map(Usuario::getId)
                .collect(Collectors.toList());
        return ResponseEntity.ok(ids);
    }


    // ===== ENDPOINTS PRINCIPALES =====
    
    @PostMapping("/register")
    public ResponseEntity<UsuarioResponseDTO> registrarUsuario(@Valid @RequestBody UsuarioRegistroDTO dto) {
        log.info("Registrando usuario: {}", dto.getUsername());
        
        try {
            UsuarioResponseDTO response = usuarioService.registrarUsuario(dto);
            return ResponseEntity.status(HttpStatus.CREATED).body(response);
            
        } catch (Exception e) {
            log.error("Error en registro: {}", e.getMessage());
            return ResponseEntity.status(HttpStatus.BAD_REQUEST).build();
        }
    }
    
    @GetMapping("/keycloak/{keycloakId}")
    public ResponseEntity<UsuarioResponseDTO> obtenerPorKeycloakId(@PathVariable String keycloakId) {
        log.info("Obteniendo usuario por keycloakId: {}", keycloakId);
        
        try {
            UsuarioResponseDTO response = usuarioService.findByKeycloakId(keycloakId);
            return ResponseEntity.ok(response);
            
        } catch (Exception e) {
            log.error("Usuario no encontrado: {}", e.getMessage());
            return ResponseEntity.notFound().build();
        }
    }
    
    @GetMapping("/perfil/{keycloakId}")
    public ResponseEntity<UsuarioCompletoDTO> obtenerPerfilCompleto(@PathVariable String keycloakId) {
        log.info("Obteniendo perfil completo: {}", keycloakId);
        
        try {
            UsuarioCompletoDTO response = usuarioService.obtenerUsuarioCompleto(keycloakId);
            return ResponseEntity.ok(response);
            
        } catch (Exception e) {
            log.error("Perfil no encontrado: {}", e.getMessage());
            return ResponseEntity.notFound().build();
        }
    }
    
    @PutMapping("/ultimo-login/{keycloakId}")
    public ResponseEntity<Void> actualizarUltimoLogin(@PathVariable String keycloakId) {
        log.info("Actualizando último login: {}", keycloakId);
        
        try {
            usuarioService.actualizarUltimoLogin(keycloakId);
            return ResponseEntity.ok().build();
            
        } catch (Exception e) {
            log.error("Error actualizando login: {}", e.getMessage());
            return ResponseEntity.notFound().build();
        }
    }
    
    // ===== CRUD GENÉRICO (heredado de GenericService) =====
    
    @GetMapping("/{id}")
    public ResponseEntity<Usuario> obtenerPorId(@PathVariable Long id) {
        return usuarioService.findById(id)
            .map(usuario -> ResponseEntity.ok(usuario))
            .orElse(ResponseEntity.notFound().build());
    }
    
    @GetMapping
    public ResponseEntity<List<Usuario>> obtenerTodos() {
        List<Usuario> usuarios = usuarioService.findAll();
        return ResponseEntity.ok(usuarios);
    }
    
    @GetMapping("/paginado")
    public ResponseEntity<Page<Usuario>> obtenerPaginado(Pageable pageable) {
        Page<Usuario> usuarios = usuarioService.findAll(pageable);
        return ResponseEntity.ok(usuarios);
    }
    
    @PutMapping("/{id}")
    public ResponseEntity<Usuario> actualizar(@PathVariable Long id, @Valid @RequestBody Usuario usuario) {
        try {
            Usuario updated = usuarioService.update(id, usuario);
            return ResponseEntity.ok(updated);
            
        } catch (Exception e) {
            return ResponseEntity.notFound().build();
        }
    }
    
    @DeleteMapping("/{id}")
    public ResponseEntity<Void> eliminar(@PathVariable Long id) {
        try {
            usuarioService.deleteById(id);
            return ResponseEntity.noContent().build();
            
        } catch (Exception e) {
            return ResponseEntity.notFound().build();
        }
    }
    
    // ===== ENDPOINTS ESTADÍSTICAS =====
    
    @GetMapping("/count")
    public ResponseEntity<Long> contarUsuarios() {
        long count = usuarioService.count();
        return ResponseEntity.ok(count);
    }
    
    @GetMapping("/count/activos")
    public ResponseEntity<Long> contarUsuariosActivos() {
        long count = usuarioService.countUsuariosActivos();
        return ResponseEntity.ok(count);
    }
    
    @GetMapping("/exists/{id}")
    public ResponseEntity<Boolean> existePorId(@PathVariable Long id) {
        boolean exists = usuarioService.existsById(id);
        return ResponseEntity.ok(exists);
    }


}
