package practica.practias.model.dto;

import java.util.List;

import lombok.Data;
import lombok.NoArgsConstructor;

@Data
@NoArgsConstructor 
public class EvaluationResponse {
  private boolean success;      // ¿La solución pasó todas las pruebas?
    private String message;       // Mensaje descriptivo para el usuario
    private Long solutionId;      // ID de la solución guardada en BD
    private List<String> errors;  // Lista de errores encontrados
    

    // Constructor explícito que necesitas para tu controlador
    public EvaluationResponse(boolean success, String message, Long solutionId, List<String> errors) {
        this.success = success;
        this.message = message;
        this.solutionId = solutionId;
        this.errors = errors;
    }
}
