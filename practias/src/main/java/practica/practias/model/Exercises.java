package practica.practias.model;

import java.time.LocalDateTime;

import jakarta.persistence.Column;
import jakarta.persistence.Entity;
import jakarta.persistence.EnumType;
import jakarta.persistence.Enumerated;
import jakarta.persistence.GeneratedValue;
import jakarta.persistence.GenerationType;
import jakarta.persistence.Id;
import jakarta.persistence.Lob;
import lombok.Getter;
import lombok.Setter;
import practica.practias.model.Enum.NivelDificultad;

@Getter
@Setter
@Entity
public class Exercises {

    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    private Long id;

    private String nombre;

    @Column(columnDefinition = "TEXT")
    private String descripcion;

    @Lob
    @Column(columnDefinition = "TEXT")
    private String pruebas; // Código de las pruebas unitarias

    @Lob
    @Column(columnDefinition = "TEXT")
    private String plantilla;

    private LocalDateTime tiempoCreacion;

 // NUEVOS CAMPOS PARA CONTROL DE ACCESO
    @Enumerated(EnumType.STRING)
    @Column(nullable = false)
    private NivelDificultad nivelDificultad = NivelDificultad.BASICO;
    
    @Column(nullable = false)
    private Boolean requierePremium = false;
    
    @Column(nullable = false)
    private Integer ordenEjercicio = 1;  // Para secuencia de desbloqueio

}
