package pe.edu.upeu.msvc_comunidad.entity.dto;

import java.time.LocalDateTime;

public class UsuarioComunidadDTO {

    private Long id_usuario;
    private LocalDateTime fecha_union;

    // Constructor vacío
    public UsuarioComunidadDTO() {
    }

    // Getters y setters
    public Long getId_usuario() {
        return id_usuario;
    }

    public void setId_usuario(Long id_usuario) {
        this.id_usuario = id_usuario;
    }

    public LocalDateTime getFecha_union() {
        return fecha_union;
    }

    public void setFecha_union(LocalDateTime fecha_union) {
        this.fecha_union = fecha_union;
    }

}