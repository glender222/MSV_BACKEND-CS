package pe.edu.upeu.msvc_comunidad.entity;

import jakarta.persistence.*;
import pe.edu.upeu.msvc_comunidad.entity.penum.TipoPublicacion;

@Entity
@Table(name = "archivo_publicacion")
public class ArchivoPublicacion {
    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    private Long id;

    private String url_archivo;

    @Enumerated(EnumType.STRING)
    private TipoPublicacion tipo_publicacion;

    //Relacion de muchos a  uno : Archivo_publicacion -> Publicaciones
    @ManyToOne
    @JoinColumn(name = "id_publicacion", nullable = false)
    private Publicacion publicacion;

    public ArchivoPublicacion() {
    }

    public ArchivoPublicacion(Long id, String url_archivo, TipoPublicacion tipo_publicacion, Publicacion publicacion) {
        this.id = id;
        this.url_archivo = url_archivo;
        this.tipo_publicacion = tipo_publicacion;
        this.publicacion = publicacion;
    }

    public Long getId() {
        return id;
    }

    public void setId(Long id) {
        this.id = id;
    }

    public String getUrl_archivo() {
        return url_archivo;
    }

    public void setUrl_archivo(String url_archivo) {
        this.url_archivo = url_archivo;
    }

    public TipoPublicacion getTipo_publicacion() {
        return tipo_publicacion;
    }

    public void setTipo_publicacion(TipoPublicacion tipo_publicacion) {
        this.tipo_publicacion = tipo_publicacion;
    }

    public Publicacion getPublicacion() {
        return publicacion;
    }

    public void setPublicacion(Publicacion publicacion) {
        this.publicacion = publicacion;
    }
}
