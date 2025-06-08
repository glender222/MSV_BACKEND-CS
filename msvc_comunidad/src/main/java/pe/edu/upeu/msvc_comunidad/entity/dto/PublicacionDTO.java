package pe.edu.upeu.msvc_comunidad.entity.dto;

import java.time.LocalDate;
import java.time.LocalDateTime;
import java.util.List;

public class PublicacionDTO {

    private Long id;
    private Long id_usuario_publica;
    private String contenido;
    private LocalDateTime fecha_creacion;
    private ComunidadDTO comunidad;
    private List<ArchivoPublicacionDTO> archivos;

    public PublicacionDTO() {
    }

    public PublicacionDTO(Long id, Long id_usuario_publica, String contenido, LocalDateTime fecha_creacion, ComunidadDTO comunidad, List<ArchivoPublicacionDTO> archivos) {
        this.id = id;
        this.id_usuario_publica = id_usuario_publica;
        this.contenido = contenido;
        this.fecha_creacion = fecha_creacion;
        this.comunidad = comunidad;
        this.archivos = archivos;
    }

    public Long getId() {
        return id;
    }

    public void setId(Long id) {
        this.id = id;
    }

    public Long getId_usuario_publica() {
        return id_usuario_publica;
    }

    public void setId_usuario_publica(Long id_usuario_publica) {
        this.id_usuario_publica = id_usuario_publica;
    }

    public String getContenido() {
        return contenido;
    }

    public void setContenido(String contenido) {
        this.contenido = contenido;
    }

    public LocalDateTime getFecha_creacion() {
        return fecha_creacion;
    }

    public void setFecha_creacion(LocalDateTime fecha_creacion) {
        this.fecha_creacion = fecha_creacion;
    }

    public ComunidadDTO getComunidad() {
        return comunidad;
    }

    public void setComunidad(ComunidadDTO comunidad) {
        this.comunidad = comunidad;
    }

    public List<ArchivoPublicacionDTO> getArchivos() {
        return archivos;
    }

    public void setArchivos(List<ArchivoPublicacionDTO> archivos) {
        this.archivos = archivos;
    }
}
