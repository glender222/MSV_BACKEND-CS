package pe.edu.upeu.msvc_comunidad.entity;

import jakarta.persistence.*;
import pe.edu.upeu.msvc_comunidad.entity.penum.TipoReaccion;

@Entity
@Table(name = "reacion_publicacion")
public class ReaccionPublicacion {

    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    private Long id;

    private Long id_usuario_reaccion;

    @Enumerated(EnumType.STRING)
    private TipoReaccion tipo_reaccion;

    //Relacion muchos a uno : ReaccionPublicacion -> Publicacion
    @ManyToOne
    @JoinColumn(name = "id_publicacion", nullable = false)
    private Publicacion publicacion;

    public ReaccionPublicacion() {
    }

    public ReaccionPublicacion(Long id, Long id_usuario_reaccion, TipoReaccion tipo_reaccion, Publicacion publicacion) {
        this.id = id;
        this.id_usuario_reaccion = id_usuario_reaccion;
        this.tipo_reaccion = tipo_reaccion;
        this.publicacion = publicacion;
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

    public Publicacion getPublicacion() {
        return publicacion;
    }

    public void setPublicacion(Publicacion publicacion) {
        this.publicacion = publicacion;
    }
}
