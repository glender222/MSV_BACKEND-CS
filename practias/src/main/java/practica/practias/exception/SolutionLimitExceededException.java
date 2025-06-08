package practica.practias.exception;

public class SolutionLimitExceededException extends RuntimeException{
  private final Integer currentAttempts;
    private final Integer maxAttempts;
    private final Long exerciseId;
    
    public SolutionLimitExceededException(String message, Integer currentAttempts, Integer maxAttempts, Long exerciseId) {
        super(message);
        this.currentAttempts = currentAttempts;
        this.maxAttempts = maxAttempts;
        this.exerciseId = exerciseId;
    }
    
    public Integer getCurrentAttempts() {
        return currentAttempts;
    }
    
    public Integer getMaxAttempts() {
        return maxAttempts;
    }
    
    public Long getExerciseId() {
        return exerciseId;
    }
}
