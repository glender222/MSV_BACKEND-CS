package practica.practias.model.dto;

import java.time.LocalDateTime;

import lombok.Builder;
import lombok.Data;
import practica.practias.model.Enum.EstadoEjercicio;
import practica.practias.model.Enum.NivelDificultad;


@Data
@Builder
public class ExerciseProgressDTO {
   private Long id;
    private String nombre;
    private String descripcion;
    private NivelDificultad nivel;
    private EstadoEjercicio estado;
    private Boolean requierePremium;
    private Boolean desbloqueado;
    
    // Métricas de progreso
    private LocalDateTime fechaCompletado;
    private LocalDateTime fechaPrimerIntento;
    private LocalDateTime ultimoIntento;
    private Integer totalIntentos;
    private Integer intentosCorrectos;
    private Integer mejorTiempoEjecucionMs;
    private Double tasaExito;
    
    // Información adicional
    private Boolean esPrimeraVez;
    private String mensajeEstado;
    private LocalDateTime tiempoCreacion;
}
