package practica.practias.model.dto;

import java.time.LocalDateTime;
import java.util.List;

import lombok.Builder;
import lombok.Data;
import practica.practias.model.Enum.EstadoSolucion;
import practica.practias.model.Enum.NivelDificultad;

@Data
@Builder
public class SolutionHistoryDTO {
    private Long solutionId;
    private Long exerciseId;
    private String exerciseName;
    private NivelDificultad nivelEjercicio;
    private EstadoSolucion estado;
    private LocalDateTime fechaEnvio;
    private LocalDateTime fechaEvaluacion;
    private Integer tiempoEjecucionMs;
    private Float tiempoEjecucionSegundos;
    private Boolean esCorrecta;
    private Boolean esPrimeraVezCorrecta;
    private Integer numeroIntento;
    private List<String> errores;
    
}