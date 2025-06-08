package practica.practias.model;

import java.time.LocalDateTime;

import jakarta.persistence.Column;
import jakarta.persistence.Entity;
import jakarta.persistence.EnumType;
import jakarta.persistence.Enumerated;
import jakarta.persistence.GeneratedValue;
import jakarta.persistence.GenerationType;
import jakarta.persistence.Id;
import jakarta.persistence.PrePersist;
import jakarta.persistence.PreUpdate;
import jakarta.persistence.Table;
import lombok.Getter;
import lombok.Setter;
import practica.practias.model.Enum.EstadoEjercicio;
import jakarta.persistence.Index;  

@Getter
@Setter
@Entity
@Table(name = "user_progress", indexes = {
    @Index(name = "idx_user_exercise", columnList = "keycloakId, exerciseId", unique = true),
    @Index(name = "idx_keycloak_id", columnList = "keycloakId"),
    @Index(name = "idx_exercise_id", columnList = "exerciseId"),
    @Index(name = "idx_estado", columnList = "estado")
})
public class UserProgress {
    
    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    private Long id;
    
    @Column(nullable = false, length = 100)
    private String keycloakId;
    
    @Column(nullable = false)
    private Long exerciseId;
    
    @Enumerated(EnumType.STRING)
    @Column(nullable = false, length = 20)
    private EstadoEjercicio estado = EstadoEjercicio.DISPONIBLE;
    
    @Column
    private LocalDateTime fechaCompletado;
    
    @Column(nullable = false)
    private Integer totalIntentos = 0;
    
    @Column
    private LocalDateTime ultimoIntento;
    
    @Column(nullable = false)
    private Boolean esPrimeraVez = true;
    
    @Column(nullable = false)
    private LocalDateTime fechaCreacion;
    
    @Column
    private LocalDateTime ultimaActualizacion;
    
    // Métricas adicionales
    @Column
    private Integer intentosCorrectos = 0;
    
    @Column
    private Integer mejorTiempoEjecucion; // en milisegundos
    
    @Column
    private LocalDateTime fechaPrimerIntento;
    
    @PrePersist
    protected void onCreate() {
        fechaCreacion = LocalDateTime.now();
        if (fechaPrimerIntento == null) {
            fechaPrimerIntento = LocalDateTime.now();
        }
    }
    
    @PreUpdate
    protected void onUpdate() {
        ultimaActualizacion = LocalDateTime.now();
    }
    
    // Métodos de utilidad
    public void incrementarIntentos() {
        this.totalIntentos++;
        this.ultimoIntento = LocalDateTime.now();
        this.esPrimeraVez = false;
    }
    
    public void marcarComoCompletado() {
        if (this.estado != EstadoEjercicio.COMPLETADO) {
            this.estado = EstadoEjercicio.COMPLETADO;
            this.fechaCompletado = LocalDateTime.now();
            this.intentosCorrectos++;
        }
    }
    
    public void actualizarMejorTiempo(Integer tiempoEjecucion) {
        if (tiempoEjecucion != null && 
            (this.mejorTiempoEjecucion == null || tiempoEjecucion < this.mejorTiempoEjecucion)) {
            this.mejorTiempoEjecucion = tiempoEjecucion;
        }
    }
    
    public boolean estaCompletado() {
        return EstadoEjercicio.COMPLETADO.equals(this.estado);
    }
    
    public boolean estaBloqueado() {
        return EstadoEjercicio.BLOQUEADO.equals(this.estado);
    }
    
    public Double calcularTasaExito() {
        if (totalIntentos == 0) return 0.0;
        return (double) intentosCorrectos / totalIntentos * 100;
    }
}