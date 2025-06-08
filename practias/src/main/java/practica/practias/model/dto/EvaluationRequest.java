package practica.practias.model.dto;

import lombok.Data;
import lombok.Getter;
import lombok.Setter;
@Data
@Getter
@Setter
public class EvaluationRequest {
 private Long exerciseId;
    private String usuarioId;  // String para mantener consistencia con usuarioId
    private String code;
    

}
