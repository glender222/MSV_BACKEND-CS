package pe.edu.upeu.msvc_comunidad.entity.dto;

import pe.edu.upeu.msvc_comunidad.entity.Publicacion;
import pe.edu.upeu.msvc_comunidad.entity.dto.apoyo.ApoyoPublicacionArchivo;

import java.util.List;

public class PublicacionConArchivosDTO {
    private Publicacion publicacion;
    private List<ApoyoPublicacionArchivo> archivos;

    public Publicacion getPublicacion() {
        return publicacion;
    }

    public void setPublicacion(Publicacion publicacion) {
        this.publicacion = publicacion;
    }

    public List<ApoyoPublicacionArchivo> getArchivos() {
        return archivos;
    }

    public void setArchivos(List<ApoyoPublicacionArchivo> archivos) {
        this.archivos = archivos;
    }
}
