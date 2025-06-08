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
