package practica.practias.model.dto;

import java.util.List;

import lombok.Builder;
import lombok.Data;

@Data
@Builder
public class ProgressResponseDTO {
   private Long totalEjercicios;
    private Long ejerciciosCompletados;
    private Long ejerciciosDisponibles;
    private Long ejerciciosBloqueados;
    private Double porcentajeCompletado;
    private List<ExerciseProgressDTO> ejercicios;
    private UserStatsDTO estadisticas;
    private String tipoSuscripcion;
    private Boolean puedeAccederPremium;
}
