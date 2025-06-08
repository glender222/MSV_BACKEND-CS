package practica.practias.exception;

import java.time.LocalDateTime;

import org.springframework.http.ResponseEntity;
import org.springframework.web.bind.annotation.ExceptionHandler;




import lombok.extern.slf4j.Slf4j;
import org.springframework.http.HttpStatus;


import org.springframework.web.bind.annotation.RestControllerAdvice;


import java.util.Map;
import java.util.HashMap;

@Slf4j
@RestControllerAdvice
public class GlobalExceptionHandler {
       // ========== EXCEPCIONES EXISTENTES (mantener) ==========
    
    @ExceptionHandler(PremiumRequiredException.class)
    public ResponseEntity<Map<String, Object>> handlePremiumRequired(PremiumRequiredException ex) {
        log.warn("Acceso premium requerido: {}", ex.getMessage());
        
        Map<String, Object> error = new HashMap<>();
        error.put("error", "PREMIUM_REQUIRED");
        error.put("message", ex.getMessage());
        error.put("exerciseName", ex.getExerciseName());
        error.put("exerciseId", ex.getExerciseId());
        error.put("upgradeUrl", "/upgrade-premium");
        error.put("precio", "10.00 PEN/mes");
        error.put("timestamp", LocalDateTime.now());
        
        return ResponseEntity.status(HttpStatus.FORBIDDEN).body(error);
    }
    
    @ExceptionHandler(AuthenticationRequiredException.class)
    public ResponseEntity<Map<String, Object>> handleAuthenticationRequired(AuthenticationRequiredException ex) {
        log.warn("Autenticación requerida: {}", ex.getMessage());
        
        Map<String, Object> error = new HashMap<>();
        error.put("error", "AUTHENTICATION_REQUIRED");
        error.put("message", ex.getMessage());
        error.put("loginUrl", "/auth/login");
        error.put("timestamp", LocalDateTime.now());
        
        return ResponseEntity.status(HttpStatus.UNAUTHORIZED).body(error);
    }
    
    @ExceptionHandler(UserInactiveException.class)
    public ResponseEntity<Map<String, Object>> handleUserInactive(UserInactiveException ex) {
        log.warn("Usuario inactivo: {}", ex.getMessage());
        
        Map<String, Object> error = new HashMap<>();
        error.put("error", "USER_INACTIVE");
        error.put("message", ex.getMessage());
        error.put("keycloakId", ex.getKeycloakId());
        error.put("timestamp", LocalDateTime.now());
        
        return ResponseEntity.status(HttpStatus.FORBIDDEN).body(error);
    }
    
    @ExceptionHandler(ExerciseNotFoundException.class)
    public ResponseEntity<Map<String, Object>> handleExerciseNotFound(ExerciseNotFoundException ex) {
        log.warn("Ejercicio no encontrado: {}", ex.getMessage());
        
        Map<String, Object> error = new HashMap<>();
        error.put("error", "EXERCISE_NOT_FOUND");
        error.put("message", ex.getMessage());
        error.put("timestamp", LocalDateTime.now());
        
        return ResponseEntity.status(HttpStatus.NOT_FOUND).body(error);
    }
    
    // ========== NUEVAS EXCEPCIONES DE SEGURIDAD ==========
    
    @ExceptionHandler(UnauthorizedAccessException.class)
    public ResponseEntity<Map<String, Object>> handleUnauthorizedAccess(UnauthorizedAccessException ex) {
        log.warn("Acceso no autorizado: {} - Usuario: {} - Recurso: {}", 
            ex.getMessage(), ex.getKeycloakId(), ex.getResource());
        
        Map<String, Object> error = new HashMap<>();
        error.put("error", "UNAUTHORIZED_ACCESS");
        error.put("message", ex.getMessage());
        error.put("resource", ex.getResource());
        error.put("timestamp", LocalDateTime.now());
        error.put("loginUrl", "/auth/login");
        
        return ResponseEntity.status(HttpStatus.FORBIDDEN).body(error);
    }
    
    @ExceptionHandler(InvalidTokenException.class)
    public ResponseEntity<Map<String, Object>> handleInvalidToken(InvalidTokenException ex) {
        log.warn("Token inválido: {}", ex.getMessage());
        
        Map<String, Object> error = new HashMap<>();
        error.put("error", "INVALID_TOKEN");
        error.put("message", ex.getMessage());
        error.put("timestamp", LocalDateTime.now());
        error.put("loginUrl", "/auth/login");
        error.put("tokenInfo", ex.getTokenInfo());
        
        return ResponseEntity.status(HttpStatus.UNAUTHORIZED).body(error);
    }
    
    @ExceptionHandler(InsufficientPrivilegesException.class)
    public ResponseEntity<Map<String, Object>> handleInsufficientPrivileges(InsufficientPrivilegesException ex) {
        log.warn("Privilegios insuficientes: {} - Requerido: {} - Usuario tipo: {}", 
            ex.getMessage(), ex.getRequiredPrivilege(), ex.getUserType());
        
        Map<String, Object> error = new HashMap<>();
        error.put("error", "INSUFFICIENT_PRIVILEGES");
        error.put("message", ex.getMessage());
        error.put("requiredPrivilege", ex.getRequiredPrivilege());
        error.put("userType", ex.getUserType());
        error.put("resourceId", ex.getResourceId());
        error.put("upgradeUrl", "/upgrade-premium");
        error.put("timestamp", LocalDateTime.now());
        
        return ResponseEntity.status(HttpStatus.FORBIDDEN).body(error);
    }
    
    // ========== EXCEPCIONES DE NEGOCIO ==========
    
    @ExceptionHandler(ExerciseAlreadyCompletedException.class)
    public ResponseEntity<Map<String, Object>> handleExerciseAlreadyCompleted(ExerciseAlreadyCompletedException ex) {
        log.info("Intento de completar ejercicio ya completado: {}", ex.getMessage());
        
        Map<String, Object> error = new HashMap<>();
        error.put("error", "EXERCISE_ALREADY_COMPLETED");
        error.put("message", ex.getMessage());
        error.put("exerciseId", ex.getExerciseId());
        error.put("exerciseName", ex.getExerciseName());
        error.put("completionDate", ex.getCompletionDate());
        error.put("canRetry", true);
        error.put("timestamp", LocalDateTime.now());
        
        return ResponseEntity.status(HttpStatus.CONFLICT).body(error);
    }
    
    @ExceptionHandler(SolutionLimitExceededException.class)
    public ResponseEntity<Map<String, Object>> handleSolutionLimitExceeded(SolutionLimitExceededException ex) {
        log.warn("Límite de soluciones excedido: {}", ex.getMessage());
        
        Map<String, Object> error = new HashMap<>();
        error.put("error", "SOLUTION_LIMIT_EXCEEDED");
        error.put("message", ex.getMessage());
        error.put("currentAttempts", ex.getCurrentAttempts());
        error.put("maxAttempts", ex.getMaxAttempts());
        error.put("exerciseId", ex.getExerciseId());
        error.put("timestamp", LocalDateTime.now());
        
        return ResponseEntity.status(HttpStatus.TOO_MANY_REQUESTS).body(error);
    }
    
    // ========== EXCEPCIONES DE VALIDACIÓN ==========
    
    @ExceptionHandler(InvalidSolutionException.class)
    public ResponseEntity<Map<String, Object>> handleInvalidSolution(InvalidSolutionException ex) {
        log.warn("Solución inválida: {}", ex.getMessage());
        
        Map<String, Object> error = new HashMap<>();
        error.put("error", "INVALID_SOLUTION");
        error.put("message", ex.getMessage());
        error.put("validationErrors", ex.getValidationErrors());
        error.put("timestamp", LocalDateTime.now());
        
        return ResponseEntity.status(HttpStatus.BAD_REQUEST).body(error);
    }
    
    @ExceptionHandler(CodeCompilationException.class)
    public ResponseEntity<Map<String, Object>> handleCodeCompilation(CodeCompilationException ex) {
        log.warn("Error de compilación: {}", ex.getMessage());
        
        Map<String, Object> error = new HashMap<>();
        error.put("error", "CODE_COMPILATION_ERROR");
        error.put("message", ex.getMessage());
        error.put("compilationErrors", ex.getCompilationErrors());
        error.put("exerciseId", ex.getExerciseId());
        error.put("timestamp", LocalDateTime.now());
        
        return ResponseEntity.status(HttpStatus.BAD_REQUEST).body(error);
    }
    
    // ========== EXCEPCIONES GENÉRICAS (mantener) ==========
    
    @ExceptionHandler(Exception.class)
    public ResponseEntity<Map<String, Object>> handleGenericException(Exception ex) {
        log.error("Error interno del servidor: {}", ex.getMessage(), ex);
        
        Map<String, Object> error = new HashMap<>();
        error.put("error", "INTERNAL_SERVER_ERROR");
        error.put("message", "Error interno del servidor");
        error.put("timestamp", LocalDateTime.now());
        
        return ResponseEntity.status(HttpStatus.INTERNAL_SERVER_ERROR).body(error);
    }
    
    @ExceptionHandler(RuntimeException.class)
    public ResponseEntity<Map<String, Object>> handleRuntimeException(RuntimeException ex) {
        log.error("Error de tiempo de ejecución: {}", ex.getMessage());
        
        Map<String, Object> error = new HashMap<>();
        error.put("error", "RUNTIME_ERROR");
        error.put("message", ex.getMessage());
        error.put("timestamp", LocalDateTime.now());
        
        return ResponseEntity.status(HttpStatus.BAD_REQUEST).body(error);
    }
}
