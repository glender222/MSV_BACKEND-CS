package practica.practias.exception;

public class UserInactiveException extends RuntimeException{
    private final String keycloakId;
    
    public UserInactiveException(String message, String keycloakId) {
        super(message);
        this.keycloakId = keycloakId;
    }
    
    public String getKeycloakId() {
        return keycloakId;
    }
}
