package practica.practias.exception;

public class ExerciseNotFoundException extends RuntimeException{
   private final Long exerciseId;
    
    public ExerciseNotFoundException(String message, Long exerciseId) {
        super(message);
        this.exerciseId = exerciseId;
    }
    
    public Long getExerciseId() {
        return exerciseId;
    }
}
