package practica.practias.exception;

public class AuthenticationRequiredException extends RuntimeException{
  public AuthenticationRequiredException(String message) {
        super(message);
    }
}
