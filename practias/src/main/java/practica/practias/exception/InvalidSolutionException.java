package practica.practias.exception;

import java.util.List;

public class InvalidSolutionException extends RuntimeException{
   private final List<String> validationErrors;
    private final String solutionCode;
    
    public InvalidSolutionException(String message, List<String> validationErrors, String solutionCode) {
        super(message);
        this.validationErrors = validationErrors;
        this.solutionCode = solutionCode;
    }
    
    public InvalidSolutionException(String message) {
        super(message);
        this.validationErrors = null;
        this.solutionCode = null;
    }
    
    public List<String> getValidationErrors() {
        return validationErrors;
    }
    
    public String getSolutionCode() {
        return solutionCode;
    }
}
