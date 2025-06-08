package practica.practias.service;

import java.util.Optional;

import org.springframework.stereotype.Service;

import lombok.RequiredArgsConstructor;
import lombok.extern.slf4j.Slf4j;
import practica.practias.exception.InsufficientPrivilegesException;
import practica.practias.exception.InvalidSolutionException;
import practica.practias.exception.InvalidTokenException;
import practica.practias.exception.UnauthorizedAccessException;
import practica.practias.model.Exercises;
import practica.practias.model.Solution;
import practica.practias.model.Enum.TipoSuscripcion;
import practica.practias.model.dto.UsuarioResponseDTO;
import practica.practias.utils.JwtUtils;

@Slf4j
@Service
@RequiredArgsConstructor
public class SecurityService {
   private final JwtUtils jwtUtils;
    private final PermisosService permisosService;
    private final ExercisesService exercisesService;
    private final SolutionService solutionService;
    
    /**
     * Valida que el token sea válido y extrae el keycloakId
     */
    public String validateTokenAndGetKeycloakId(String authHeader) {
        if (authHeader == null || authHeader.trim().isEmpty()) {
            throw new InvalidTokenException("Token de autorización requerido");
        }
        
        try {
            if (!jwtUtils.esTokenValido(authHeader)) {
                throw new InvalidTokenException("Token JWT inválido o expirado");
            }
            
            String keycloakId = jwtUtils.extraerKeycloakId(authHeader);
            log.debug("Token validado exitosamente para usuario: {}", keycloakId);
            return keycloakId;
            
        } catch (Exception e) {
            log.warn("Error validando token: {}", e.getMessage());
            throw new InvalidTokenException("Error procesando token de autorización", authHeader);
        }
    }
    
    /**
     * Valida que el usuario tenga acceso al recurso especificado
     */
    public void validateUserAccess(String authHeader, String targetUserId, String resourceType) {
        String keycloakId = validateTokenAndGetKeycloakId(authHeader);
        
        // Verificar que el usuario esté intentando acceder a sus propios recursos
        if (!keycloakId.equals(targetUserId)) {
            log.warn("Usuario {} intentó acceder a recursos de usuario {}", keycloakId, targetUserId);
            throw new UnauthorizedAccessException(
                "No tienes permisos para acceder a este recurso", 
                keycloakId, 
                resourceType);
        }
        
        // Verificar que el usuario esté activo
        if (!permisosService.esUsuarioActivo(keycloakId)) {
            throw new UnauthorizedAccessException(
                "Usuario inactivo o suspendido", 
                keycloakId, 
                "user_account");
        }
        
        log.debug("Acceso autorizado para usuario {} al recurso {}", keycloakId, resourceType);
    }
    
    /**
     * Valida que el usuario tenga acceso a un ejercicio específico
     */
    public void validateExerciseAccess(String keycloakId, Long exerciseId) {
        Optional<Exercises> exerciseOpt = exercisesService.getExerciseById(exerciseId);
        
        if (exerciseOpt.isEmpty()) {
            throw new UnauthorizedAccessException(
                "Ejercicio no encontrado", 
                keycloakId, 
                "exercise:" + exerciseId);
        }
        
        Exercises exercise = exerciseOpt.get();
        
        // Verificar si el ejercicio requiere premium (ejercicios con ID > 3)
        boolean requierePremium = exerciseId > 3;
        
        if (requierePremium) {
            boolean esPremium = permisosService.tieneAccesoPremium(keycloakId);
            
            if (!esPremium) {
                UsuarioResponseDTO usuario = permisosService.obtenerUsuario(keycloakId);
                String tipoUsuario = usuario != null ? usuario.getTipoSuscripcion().toString() : "UNKNOWN";
                
                throw new InsufficientPrivilegesException(
                    "Este ejercicio requiere suscripción Premium", 
                    "PREMIUM", 
                    tipoUsuario, 
                    exerciseId);
            }
        }
        
        log.debug("Acceso autorizado al ejercicio {} para usuario {}", exerciseId, keycloakId);
    }
    
    /**
     * Valida que el usuario sea propietario de una solución
     */
    public void validateSolutionOwnership(String keycloakId, Long solutionId) {
        Optional<Solution> solutionOpt = solutionService.findById(solutionId);
        
        if (solutionOpt.isEmpty()) {
            throw new UnauthorizedAccessException(
                "Solución no encontrada", 
                keycloakId, 
                "solution:" + solutionId);
        }
        
        Solution solution = solutionOpt.get();
        
        if (!keycloakId.equals(solution.getUsuarioId())) {
            log.warn("Usuario {} intentó acceder a solución {} de usuario {}", 
                keycloakId, solutionId, solution.getUsuarioId());
            throw new UnauthorizedAccessException(
                "No tienes permisos para acceder a esta solución", 
                keycloakId, 
                "solution:" + solutionId);
        }
        
        log.debug("Ownership validado para solución {} y usuario {}", solutionId, keycloakId);
    }
    
    /**
     * Verifica si el usuario puede acceder a un ejercicio (sin lanzar excepción)
     */
    public boolean canAccessExercise(String keycloakId, Long exerciseId) {
        try {
            validateExerciseAccess(keycloakId, exerciseId);
            return true;
        } catch (Exception e) {
            log.debug("Usuario {} no puede acceder al ejercicio {}: {}", 
                keycloakId, exerciseId, e.getMessage());
            return false;
        }
    }
    
    /**
     * Obtiene el tipo de suscripción del usuario autenticado
     */
    public TipoSuscripcion getUserSubscriptionType(String keycloakId) {
        return permisosService.obtenerTipoSuscripcion(keycloakId);
    }
    
    /**
     * Valida la estructura básica de una solución
     */
    public void validateSolutionStructure(String code, Long exerciseId) {
        if (code == null || code.trim().isEmpty()) {
            throw new InvalidSolutionException("El código de la solución no puede estar vacío");
        }
        
        if (code.length() > 10000) { // Límite de 10KB
            throw new InvalidSolutionException("El código de la solución es demasiado largo (máximo 10,000 caracteres)");
        }
        
        // Validaciones básicas de seguridad
        if (code.contains("System.exit") || 
            code.contains("Runtime.getRuntime") || 
            code.contains("ProcessBuilder")) {
            throw new InvalidSolutionException("Código contiene operaciones no permitidas");
        }
        
        log.debug("Estructura de solución validada para ejercicio {}", exerciseId);
    }
}
