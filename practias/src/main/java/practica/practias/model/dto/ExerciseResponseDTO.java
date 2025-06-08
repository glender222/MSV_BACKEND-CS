package practica.practias.model.dto;

import java.time.LocalDateTime;

import lombok.Builder;
import lombok.Data;

@Data
@Builder
public class ExerciseResponseDTO {
 private Long id;
    private String nombre;
    private String descripcion;
    private String plantilla;
    private LocalDateTime tiempoCreacion;
    
    // Campos para control de acceso
    private boolean requierePremium;
    private String nivelDificultad;  // BASICO, INTERMEDIO, AVANZADO
    private boolean desbloqueado;    // Para usuarios gratuitos
    
    // Para usuarios premium: incluir pruebas
    private String pruebas;  // Solo si es premium
}
