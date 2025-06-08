package pe.edu.upeu.msvc_comunidad.entity;

import com.fasterxml.jackson.annotation.JsonIgnore;
import jakarta.persistence.*;

import java.time.LocalDate;
import java.time.LocalDateTime;
import java.util.Set;

@Entity
@Table(name = "comentarios")
public class Comentario {

    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    private Long id;

    private Long id_usuario_comenta;

    private String comentario;

    private LocalDateTime fecha_creacion;

    //Relacion de muchos a uno Comentario -> Publicacion
    @ManyToOne
    @JoinColumn(name = "id_publicacion", nullable = false)
    private Publicacion publicacion;

    // Relacion de uno a muchos Comentario -> ReaccionComentario
    @OneToMany(mappedBy = "comentario")
    @JsonIgnore
    private Set<ReaccionComentario> reaccionComentario;

    public Comentario() {
    }

    public Comentario(Long id, Long id_usuario_comenta, String comentario, LocalDateTime fecha_creacion, Publicacion publicacion, Set<ReaccionComentario> reaccionComentario) {
        this.id = id;
        this.id_usuario_comenta = id_usuario_comenta;
        this.comentario = comentario;
        this.fecha_creacion = fecha_creacion;
        this.publicacion = publicacion;
        this.reaccionComentario = reaccionComentario;
    }

    public Long getId() {
        return id;
    }

    public void setId(Long id) {
        this.id = id;
    }

    public Long getId_usuario_comenta() {
        return id_usuario_comenta;
    }

    public void setId_usuario_comenta(Long id_usuario_comenta) {
        this.id_usuario_comenta = id_usuario_comenta;
    }

    public String getComentario() {
        return comentario;
    }

    public void setComentario(String comentario) {
        this.comentario = comentario;
    }

    public LocalDateTime getFecha_creacion() {
        return fecha_creacion;
    }

    public void setFecha_creacion(LocalDateTime fecha_creacion) {
        this.fecha_creacion = fecha_creacion;
    }

    public Publicacion getPublicacion() {
        return publicacion;
    }

    public void setPublicacion(Publicacion publicacion) {
        this.publicacion = publicacion;
    }

    public Set<ReaccionComentario> getReaccionComentario() {
        return reaccionComentario;
    }

    public void setReaccionComentario(Set<ReaccionComentario> reaccionComentario) {
        this.reaccionComentario = reaccionComentario;
    }
}
