package pe.edu.upeu.msvc_comunidad.entity.dto;

import pe.edu.upeu.msvc_comunidad.entity.penum.TipoPublicacion;

public class ArchivoPublicacionDTO {
    private Long id;
    private String url_archivo;
    private TipoPublicacion tipo_publicacion;

    public ArchivoPublicacionDTO(Long id, String url_archivo, TipoPublicacion tipo_publicacion) {
        this.id = id;
        this.url_archivo = url_archivo;
        this.tipo_publicacion = tipo_publicacion;
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
}
