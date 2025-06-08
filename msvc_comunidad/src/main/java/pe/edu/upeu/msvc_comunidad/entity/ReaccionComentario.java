package pe.edu.upeu.msvc_comunidad.entity;

import jakarta.persistence.*;
import pe.edu.upeu.msvc_comunidad.entity.penum.TipoReaccion;

@Entity
@Table(name = "reacion_comentario")
public class ReaccionComentario {

    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    private Long id;

    private Long id_usuario_reaccion;

    @Enumerated(EnumType.STRING)
    private TipoReaccion tipo_reaccion;

    //Relacion muchos a uno : ReaccionComentario -> Comentario
    @ManyToOne
    @JoinColumn(name = "id_comentario", nullable = false)
    private Comentario comentario;

    public ReaccionComentario() {
    }

    public ReaccionComentario(Comentario comentario, TipoReaccion tipo_reaccion, Long id_usuario_reaccion, Long id) {
        this.comentario = comentario;
        this.tipo_reaccion = tipo_reaccion;
        this.id_usuario_reaccion = id_usuario_reaccion;
        this.id = id;
    }

    public Long getId() {
        return id;
    }

    public void setId(Long id) {
        this.id = id;
    }

    public Long getId_usuario_reaccion() {
        return id_usuario_reaccion;
    }

    public void setId_usuario_reaccion(Long id_usuario_reaccion) {
        this.id_usuario_reaccion = id_usuario_reaccion;
    }

    public TipoReaccion getTipo_reaccion() {
        return tipo_reaccion;
    }

    public void setTipo_reaccion(TipoReaccion tipo_reaccion) {
        this.tipo_reaccion = tipo_reaccion;
    }

    public Comentario getComentario() {
        return comentario;
    }

    public void setComentario(Comentario comentario) {
        this.comentario = comentario;
    }
}
