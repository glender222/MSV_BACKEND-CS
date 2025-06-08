package practica.practias.model;

import java.time.LocalDateTime;
import java.util.ArrayList;
import java.util.List;

import jakarta.persistence.Column;
import jakarta.persistence.ElementCollection;
import jakarta.persistence.Entity;
import jakarta.persistence.GeneratedValue;
import jakarta.persistence.GenerationType;
import jakarta.persistence.Id;
import jakarta.persistence.JoinColumn;
import jakarta.persistence.OneToOne;
import lombok.Getter;
import lombok.Setter;

@Getter
@Setter
@Entity
public class Result {
 
    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    private Long id;

    @OneToOne
    @JoinColumn(name = "solution_id")
    private Solution solution;

    private String estado; // Correcto o Fallido

    @Column(columnDefinition = "TEXT")
    @ElementCollection
    private List<String> errores = new ArrayList<>(); // Errores específicos

    private Float tiempoEjecucion; // Tiempo en segundos

    private LocalDateTime fechaEvaluacion;


 
}
