package practica.practias.model.dto;

import java.time.LocalDateTime;

import lombok.Builder;
import lombok.Data;

@Data
@Builder
public class UserStatsDTO {
    // Estadísticas generales
    private Long totalIntentos;
    private Long solucionesCorrectas;
    private Long solucionesIncorrectas;
    private Long solucionesConError;
    private Double tasaExito;
    
    // Progreso por dificultad
    private Long ejerciciosBasicosCompletados;
    private Long ejerciciosIntermediosCompletados;
    private Long ejerciciosAvanzadosCompletados;
    private Long ejerciciosBasicosDisponibles;
    private Long ejerciciosIntermediosDisponibles;
    private Long ejerciciosAvanzadosDisponibles;
    
    // Ejercicios únicos
    private Long ejerciciosUnicos;
    private Long ejerciciosCompletados;
    private Double porcentajeCompletado;
    
    // Actividad
    private LocalDateTime ultimaActividad;
    private LocalDateTime fechaPrimerEjercicio;
    private Integer diasActivo;
    
    // Tiempo promedio
    private Integer tiempoPromedioMs;
    private Integer mejorTiempoMs;
    private String ejercicioMejorTiempo;
    
    // Racha
    private Integer rachaActual;
    private Integer mejorRacha;
}