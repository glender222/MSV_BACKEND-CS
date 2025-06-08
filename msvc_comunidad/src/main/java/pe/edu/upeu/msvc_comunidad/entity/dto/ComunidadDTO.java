package pe.edu.upeu.msvc_comunidad.entity.dto;

import java.time.LocalDate;

public class ComunidadDTO {
    private Long id;
    private String nombre;
    private String descripcion;
    private String urlLogo;
    private Long id_creador;
    private LocalDate fecha_creacion;
    private Long estado;

    public ComunidadDTO(Long id, String nombre, String descripcion, String urlLogo, Long id_creador, LocalDate fecha_creacion, Long estado) {
        this.id = id;
        this.nombre = nombre;
        this.descripcion = descripcion;
        this.urlLogo = urlLogo;
        this.id_creador = id_creador;
        this.fecha_creacion = fecha_creacion;
        this.estado = estado;
    }

    public ComunidadDTO() {
    }

    public Long getId() {
        return id;
    }

    public void setId(Long id) {
        this.id = id;
    }

    public String getNombre() {
        return nombre;
    }

    public void setNombre(String nombre) {
        this.nombre = nombre;
    }

    public String getDescripcion() {
        return descripcion;
    }

    public void setDescripcion(String descripcion) {
        this.descripcion = descripcion;
    }

    public String getUrlLogo() {
        return urlLogo;
    }

    public void setUrlLogo(String urlLogo) {
        this.urlLogo = urlLogo;
    }

    public Long getId_creador() {
        return id_creador;
    }

    public void setId_creador(Long id_creador) {
        this.id_creador = id_creador;
    }

    public LocalDate getFecha_creacion() {
        return fecha_creacion;
    }

    public void setFecha_creacion(LocalDate fecha_creacion) {
        this.fecha_creacion = fecha_creacion;
    }

    public Long getEstado() {
        return estado;
    }

    public void setEstado(Long estado) {
        this.estado = estado;
    }
}
