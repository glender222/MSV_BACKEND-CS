package pe.edu.upeu.msvc_comunidad.entity;

import jakarta.persistence.Entity;
import jakarta.persistence.JoinColumn;
import jakarta.persistence.ManyToOne;
import jakarta.persistence.Table;
import jakarta.persistence.*;
import pe.edu.upeu.msvc_comunidad.entity.dto.apoyo.ApoyoUsuarioComunidadId;

import java.time.LocalDateTime;

@Entity
@Table(name = "usuario_comunidad")
public class UsuarioComunidad {

    @EmbeddedId
    private ApoyoUsuarioComunidadId id;

    private LocalDateTime fechaUnion;

    @ManyToOne
    @MapsId("idComunidad")
    @JoinColumn(name = "id_comunidad", nullable = false)
    private Comunidad comunidad;

    // Constructor vacío
    public UsuarioComunidad() {}

    public UsuarioComunidad(ApoyoUsuarioComunidadId id, LocalDateTime fechaUnion, Comunidad comunidad) {
        this.id = id;
        this.fechaUnion = fechaUnion;
        this.comunidad = comunidad;
    }

    public ApoyoUsuarioComunidadId getId() {
        return id;
    }

    public void setId(ApoyoUsuarioComunidadId id) {
        this.id = id;
    }

    public LocalDateTime getFechaUnion() {
        return fechaUnion;
    }

    public void setFechaUnion(LocalDateTime fechaUnion) {
        this.fechaUnion = fechaUnion;
    }

    public Comunidad getComunidad() {
        return comunidad;
    }

    public void setComunidad(Comunidad comunidad) {
        this.comunidad = comunidad;
    }

    // no borrar agregado
    public Long getUsuarioId() {
        return id != null ? id.getIdUsuario() : null;
    }

}