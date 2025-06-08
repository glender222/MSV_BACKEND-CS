package practica.practias.exception;

public class UnauthorizedAccessException extends RuntimeException{
    private final String keycloakId;
    private final String resource;
    
    public UnauthorizedAccessException(String message, String keycloakId, String resource) {
        super(message);
        this.keycloakId = keycloakId;
        this.resource = resource;
    }
    
    public UnauthorizedAccessException(String message) {
        super(message);
        this.keycloakId = null;
        this.resource = null;
    }
    
    public String getKeycloakId() {
        return keycloakId;
    }
    
    public String getResource() {
        return resource;
    }
}
