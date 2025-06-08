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
import jakarta.persistence.Lob;
import jakarta.persistence.ManyToOne;
import lombok.Getter;
import lombok.Setter;


@Getter
@Setter
@Entity
public class Solution {

    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    private Long id;

    private String usuarioId; 

    @ManyToOne
    @JoinColumn(name = "exercise_id")
    private Exercises exercises;

    @Lob
    @Column(columnDefinition = "TEXT")
    private String codigo; 

    private String estado; 

    @ElementCollection
    private List<String> errores = new ArrayList<>(); 

    private LocalDateTime tiempoEnvio;

}
