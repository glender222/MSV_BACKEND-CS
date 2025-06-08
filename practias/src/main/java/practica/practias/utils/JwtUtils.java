package practica.practias.utils;

import java.util.Base64;
import java.util.Map;

import org.springframework.stereotype.Component;

import com.fasterxml.jackson.core.type.TypeReference;
import com.fasterxml.jackson.databind.ObjectMapper;

import lombok.extern.slf4j.Slf4j;

@Slf4j
@Component
public class JwtUtils {
  
    private final ObjectMapper objectMapper = new ObjectMapper();
    
    // TypeReference para type safety completo
    private static final TypeReference<Map<String, Object>> MAP_TYPE_REF = new TypeReference<Map<String, Object>>() {};
    
    /**
     * Extrae el keycloakId (sub claim) del token JWT
     */
    public String extraerKeycloakId(String authorizationHeader) {
        try {
            if (authorizationHeader == null || !authorizationHeader.startsWith("Bearer ")) {
                throw new RuntimeException("Token JWT no válido o faltante");
            }
            
            String token = authorizationHeader.substring(7); // Remover "Bearer "
            
            // Decodificar payload del JWT (segunda parte)
            String[] chunks = token.split("\\.");
            if (chunks.length != 3) {
                throw new RuntimeException("Formato de token JWT inválido");
            }
            
            Base64.Decoder decoder = Base64.getUrlDecoder();
            String payload = new String(decoder.decode(chunks[1]));
            
            // Parsear JSON del payload con TypeReference para type safety
            Map<String, Object> claims = objectMapper.readValue(payload, MAP_TYPE_REF);
            
            // Extraer 'sub' que contiene el keycloakId
            String keycloakId = (String) claims.get("sub");
            
            if (keycloakId == null || keycloakId.trim().isEmpty()) {
                throw new RuntimeException("KeycloakId no encontrado en token");
            }
            
            log.debug("KeycloakId extraído exitosamente: {}", keycloakId);
            return keycloakId;
            
        } catch (Exception e) {
            log.error("Error extrayendo keycloakId del token: {}", e.getMessage());
            throw new RuntimeException("Error procesando token JWT: " + e.getMessage());
        }
    }
    
    /**
     * Valida si el header de autorización tiene formato correcto
     */
    public boolean esTokenValido(String authorizationHeader) {
        try {
            extraerKeycloakId(authorizationHeader);
            return true;
        } catch (Exception e) {
            return false;
        }
    }
    
    /**
     * Extrae el username del token JWT (opcional, para logs)
     */
    public String extraerUsername(String authorizationHeader) {
        try {
            if (authorizationHeader == null || !authorizationHeader.startsWith("Bearer ")) {
                return "anonymous";
            }
            
            String token = authorizationHeader.substring(7);
            String[] chunks = token.split("\\.");
            if (chunks.length != 3) {
                return "invalid-token";
            }
            
            Base64.Decoder decoder = Base64.getUrlDecoder();
            String payload = new String(decoder.decode(chunks[1]));
            
            Map<String, Object> claims = objectMapper.readValue(payload, MAP_TYPE_REF);
            
            String username = (String) claims.get("preferred_username");
            return username != null ? username : "unknown";
            
        } catch (Exception e) {
            log.debug("Error extrayendo username: {}", e.getMessage());
            return "error-extracting";
        }
    }
}
