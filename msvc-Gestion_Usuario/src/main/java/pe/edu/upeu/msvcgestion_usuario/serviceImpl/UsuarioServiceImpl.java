package pe.edu.upeu.msvcgestion_usuario.serviceImpl;

import java.time.LocalDate;
import java.time.LocalDateTime;
import java.util.List;
import java.util.Map;

import org.keycloak.representations.idm.UserRepresentation;
//import org.springframework.security.crypto.password.PasswordEncoder;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import jakarta.persistence.EntityNotFoundException;
import lombok.extern.slf4j.Slf4j;
import pe.edu.upeu.msvcgestion_usuario.entity.Usuario;
import pe.edu.upeu.msvcgestion_usuario.entity.Enum.EstadoUsuario;
import pe.edu.upeu.msvcgestion_usuario.entity.Enum.TipoSuscripcion;
import pe.edu.upeu.msvcgestion_usuario.entity.dto.UsuarioCompletoDTO;
import pe.edu.upeu.msvcgestion_usuario.entity.dto.UsuarioRegistroDTO;
import pe.edu.upeu.msvcgestion_usuario.entity.dto.UsuarioResponseDTO;
import pe.edu.upeu.msvcgestion_usuario.repositories.UsuarioRepository;
import pe.edu.upeu.msvcgestion_usuario.service.KeycloakService;
import pe.edu.upeu.msvcgestion_usuario.service.UsuarioService;



@Slf4j
@Service
@Transactional
public class UsuarioServiceImpl  extends GenericServiceImpl<Usuario, Long> implements UsuarioService{
    
    
 private final UsuarioRepository usuarioRepository;
    private final KeycloakService keycloakService;
    
    public UsuarioServiceImpl(UsuarioRepository usuarioRepository, KeycloakService keycloakService) {
        super(usuarioRepository);
        this.usuarioRepository = usuarioRepository;
        this.keycloakService = keycloakService;
    }



@Override
    protected void validateEntity(Usuario entity) {
        if (entity.getKeycloakId() == null || entity.getKeycloakId().trim().isEmpty()) {
            throw new RuntimeException("KeycloakId es obligatorio");
        }
        // nuevo 
        if (entity.getNombre() == null || entity.getNombre().trim().isEmpty()) {
            
            throw new RuntimeException("Nombre es obligatorio");
        }

    }
    
    @Override
    public UsuarioResponseDTO registrarUsuario(UsuarioRegistroDTO dto) {
        log.info("Registrando nuevo usuario: {}", dto.getUsername());
          // NUEVO
          //  CORREGIDO: Validar ANTES de crear en Keycloak  realemnte esto creo yo poner usuario si alguien lo ve
          // cambielo no sea muy rata
        if (usuarioRepository.existsByNombre(dto.getNombre())) {
            throw new RuntimeException("Nombre ya existe en la bd local");
        }
        
        String keycloakId = null;
        try {
            // 1. Crear en Keycloak primero
            keycloakId = keycloakService.createUserInKeycloak(dto);
            
            // 2. Crear en BD local
            Usuario usuario = new Usuario();
            usuario.setKeycloakId(keycloakId);
            usuario.setNombre(dto.getNombre());
            usuario.setIdioma("español");
            usuario.setTipoSuscripcion(TipoSuscripcion.GRATUITO);
            usuario.setRecibirNotificaciones(true);
            usuario.setEstado(EstadoUsuario.ACTIVO);
            
            Usuario savedUsuario = save(usuario);

        // 3. NUEVO: Agregar el ID de BD como atributo en Keycloak
        keycloakService.agregarDatabaseIdComoAtributo(keycloakId, savedUsuario.getId());
            
            log.info("Usuario registrado exitosamente con ID: {}", savedUsuario.getId());
            return mapToResponseDTO(savedUsuario);
            
        } catch (Exception e) {
            log.error("Error registrando usuario: {}", e.getMessage());
            // NUEVO
            //  CORREGIDO: Rollback - eliminar de Keycloak si falló la BD
            if (keycloakId != null) {
                try {
                    keycloakService.deleteUserFromKeycloak(keycloakId);
                    log.info("Usuario eliminado de Keycloak por rollback: {}", keycloakId);
                } catch (Exception rollbackError) {
                    log.error("Error en rollback de Keycloak: {}", rollbackError.getMessage());
                }
            }
            
            throw new RuntimeException("Error al registrar usuario: " + e.getMessage());
        }
    }
    
    @Override
    public UsuarioResponseDTO findByKeycloakId(String keycloakId) {
        Usuario usuario = usuarioRepository.findByKeycloakId(keycloakId)
            .orElseThrow(() -> new EntityNotFoundException("Usuario no encontrado"));
        return mapToResponseDTO(usuario);
    }
    

    // NUEVO CORREGIDO verificar luego me olvido :()
    @Override
    public UsuarioCompletoDTO obtenerUsuarioCompleto(String keycloakId) {
       log.info("Obteniendo perfil completo para keycloakId: {}", keycloakId);
        
        try {
            // 1. Obtener datos de BD local
            Usuario usuario = usuarioRepository.findByKeycloakId(keycloakId)
                .orElseThrow(() -> new EntityNotFoundException("Usuario no encontrado en BD local"));
            
            // 2. Obtener datos de Keycloak
            UserRepresentation keycloakUser = keycloakService.getUserFromKeycloak(keycloakId);
            
            // 3. Extraer atributos personalizados de Keycloak
            Map<String, List<String>> attributes = keycloakUser.getAttributes();
            
            return UsuarioCompletoDTO.builder()
                // Datos de Keycloak
                .username(keycloakUser.getUsername())
                .email(keycloakUser.getEmail())
                .apellido(getAttributeValue(attributes, "apellido"))
                .pais(getAttributeValue(attributes, "pais"))
                .fechaNacimiento(parseDate(getAttributeValue(attributes, "fechaNacimiento")))
                
                // Datos de BD local
                .id(usuario.getId())
                .keycloakId(usuario.getKeycloakId())
                .nombre(usuario.getNombre())
                .idioma(usuario.getIdioma())
                .fotoPerfil(usuario.getFotoPerfil())
                .biografia(usuario.getBiografia())
                .tipoSuscripcion(usuario.getTipoSuscripcion())
                .recibirNotificaciones(usuario.getRecibirNotificaciones())
                .fechaCreacion(usuario.getFechaCreacion())
                .estado(usuario.getEstado())
                .build();
                
        } catch (Exception e) {
            log.error("Error obteniendo perfil completo: {}", e.getMessage());
            throw new RuntimeException("Error obteniendo perfil completo: " + e.getMessage());
        }
    }
    
    @Override
    public void actualizarUltimoLogin(String keycloakId) {
        Usuario usuario = usuarioRepository.findByKeycloakId(keycloakId)
            .orElseThrow(() -> new EntityNotFoundException("Usuario no encontrado"));
        usuario.setUltimoLogin(LocalDateTime.now());
        save(usuario);
    }
    
    @Override
    public long countUsuariosActivos() {
        return usuarioRepository.countByEstado(EstadoUsuario.ACTIVO);
    }
    
    // ===== MÉTODOS DE MAPEO =====
    
    private UsuarioResponseDTO mapToResponseDTO(Usuario usuario) {
        return UsuarioResponseDTO.builder()
            .id(usuario.getId())
            .keycloakId(usuario.getKeycloakId())
            .nombre(usuario.getNombre())  
            .idioma(usuario.getIdioma())
            .fotoPerfil(usuario.getFotoPerfil())
            .biografia(usuario.getBiografia())
            .tipoSuscripcion(usuario.getTipoSuscripcion())
            .recibirNotificaciones(usuario.getRecibirNotificaciones())
            .fechaCreacion(usuario.getFechaCreacion())
            .estado(usuario.getEstado())
            .build();
    }
    

// DE AQUI PARA ABAJO NUEVO juan me la mama

  
    private String getAttributeValue(Map<String, List<String>> attributes, String key) {
        if (attributes != null && attributes.containsKey(key)) {
            List<String> values = attributes.get(key);
            return values != null && !values.isEmpty() ? values.get(0) : null;
        }
        return null;
    }
    
    private LocalDate parseDate(String dateStr) {
        if (dateStr == null || dateStr.trim().isEmpty()) {
            return null;
        }
        try {
            return LocalDate.parse(dateStr);
        } catch (Exception e) {
            log.warn("Error parsing date: {}", dateStr);
            return null;
        }
    }

    
}
