package practica.practias.exception;

public class PremiumRequiredException extends RuntimeException{
private final String exerciseName;
    private final Long exerciseId;
    
    public PremiumRequiredException(String message, String exerciseName, Long exerciseId) {
        super(message);
        this.exerciseName = exerciseName;
        this.exerciseId = exerciseId;
    }
    
    public String getExerciseName() {
        return exerciseName;
    }
    
    public Long getExerciseId() {
        return exerciseId;
    }
}
