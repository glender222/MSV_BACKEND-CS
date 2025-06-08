package practica.practias.service;

import org.springframework.stereotype.Service;

import lombok.RequiredArgsConstructor;
import lombok.extern.slf4j.Slf4j;
import practica.practias.Client.UsuarioClient;
import practica.practias.model.Enum.EstadoUsuario;
import practica.practias.model.Enum.TipoSuscripcion;
import practica.practias.model.dto.UsuarioResponseDTO;



@Slf4j
@Service
@RequiredArgsConstructor
public class PermisosService {
  private final UsuarioClient usuarioClient;
    
    /**
     * Verifica si el usuario tiene acceso premium activo
     */
    public boolean tieneAccesoPremium(String keycloakId) {
        try {
            log.info("Verificando acceso premium para usuario: {}", keycloakId);
            
            UsuarioResponseDTO usuario = obtenerUsuario(keycloakId);
            
            if (usuario == null) {
                log.warn("Usuario no encontrado: {}", keycloakId);
                return false;
            }
            
            // Verificar que el usuario esté activo
            if (!esUsuarioActivo(usuario)) {
                log.warn("Usuario {} no está activo, estado: {}", keycloakId, usuario.getEstado());
                return false;
            }
            
            boolean esPremium = TipoSuscripcion.PREMIUM.equals(usuario.getTipoSuscripcion());
            log.info("Usuario {} - Tipo: {}, Acceso Premium: {}", 
                keycloakId, usuario.getTipoSuscripcion(), esPremium);
            
            return esPremium;
            
        } catch (Exception e) {
            log.error("Error verificando permisos para usuario {}: {}", keycloakId, e.getMessage());
            return false; // En caso de error, denegar acceso por seguridad
        }
    }
    
    /**
     * Obtiene la información completa del usuario
     */
    public UsuarioResponseDTO obtenerUsuario(String keycloakId) {
        try {
            log.debug("Obteniendo información del usuario: {}", keycloakId);
            
            var response = usuarioClient.obtenerPorKeycloakId(keycloakId);
            
            if (response == null || !response.getStatusCode().is2xxSuccessful()) {
                log.warn("Respuesta inválida del usuario-service para: {}", keycloakId);
                return null;
            }
            
            return response.getBody();
            
        } catch (Exception e) {
            log.error("Error obteniendo usuario {}: {}", keycloakId, e.getMessage());
            return null;
        }
    }
    
    /**
     * Verifica si el usuario está en estado activo
     */
    public boolean esUsuarioActivo(String keycloakId) {
        UsuarioResponseDTO usuario = obtenerUsuario(keycloakId);
        return esUsuarioActivo(usuario);
    }
    
    /**
     * Verifica si el usuario está activo (sobrecarga del método)
     */
    private boolean esUsuarioActivo(UsuarioResponseDTO usuario) {
        return usuario != null 
            && usuario.getEstado() != null 
            && EstadoUsuario.ACTIVO.equals(usuario.getEstado());
    }
    
    /**
     * Actualiza el último login del usuario
     */
    public void actualizarUltimoLogin(String keycloakId) {
        try {
            log.debug("Actualizando último login para usuario: {}", keycloakId);
            usuarioClient.actualizarUltimoLogin(keycloakId);
        } catch (Exception e) {
            log.error("Error actualizando último login para {}: {}", keycloakId, e.getMessage());
            // No lanzar excepción, es una operación secundaria
        }
    }
    
    /**
     * Obtiene el tipo de suscripción del usuario
     */
    public TipoSuscripcion obtenerTipoSuscripcion(String keycloakId) {
        UsuarioResponseDTO usuario = obtenerUsuario(keycloakId);
        return usuario != null ? usuario.getTipoSuscripcion() : TipoSuscripcion.GRATUITO;
    }
}
