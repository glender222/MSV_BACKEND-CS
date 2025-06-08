package practica.practias.exception;

import java.time.LocalDateTime;

public class ExerciseAlreadyCompletedException extends RuntimeException{
  private final Long exerciseId;
    private final String exerciseName;
    private final LocalDateTime completionDate;
    
    public ExerciseAlreadyCompletedException(String message, Long exerciseId, String exerciseName, LocalDateTime completionDate) {
        super(message);
        this.exerciseId = exerciseId;
        this.exerciseName = exerciseName;
        this.completionDate = completionDate;
    }
    
    public Long getExerciseId() {
        return exerciseId;
    }
    
    public String getExerciseName() {
        return exerciseName;
    }
    
    public LocalDateTime getCompletionDate() {
        return completionDate;
    }
}
