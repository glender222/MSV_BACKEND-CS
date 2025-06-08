package practica.practias.exception;

import java.util.List;

public class CodeCompilationException extends RuntimeException{
 private final List<String> compilationErrors;
    private final String sourceCode;
    private final Long exerciseId;
    
    public CodeCompilationException(String message, List<String> compilationErrors, String sourceCode, Long exerciseId) {
        super(message);
        this.compilationErrors = compilationErrors;
        this.sourceCode = sourceCode;
        this.exerciseId = exerciseId;
    }
    
    public List<String> getCompilationErrors() {
        return compilationErrors;
    }
    
    public String getSourceCode() {
        return sourceCode;
    }
    
    public Long getExerciseId() {
        return exerciseId;
    }
}
