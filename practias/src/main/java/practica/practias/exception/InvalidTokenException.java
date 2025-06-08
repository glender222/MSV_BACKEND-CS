package practica.practias.exception;

public class InvalidTokenException extends RuntimeException{
private final String tokenInfo;
    
    public InvalidTokenException(String message, String tokenInfo) {
        super(message);
        this.tokenInfo = tokenInfo;
    }
    
    public InvalidTokenException(String message) {
        super(message);
        this.tokenInfo = null;
    }
    
    public String getTokenInfo() {
        return tokenInfo;
    }
}
