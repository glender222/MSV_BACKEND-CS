package pe.edu.upeu.msvcnotificaciones.entity;

import com.fasterxml.jackson.annotation.JsonIgnore;
import jakarta.persistence.*;
import pe.edu.upeu.msvcnotificaciones.entity.dto.EstadoNotificacion;

import java.time.LocalDateTime;
import java.util.Set;

@Entity
@Table(name = "usuario_notificacion")

public class UsuarioNotificacion {
    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    private Long id;

    private Long idusuario;

    @Enumerated(EnumType.STRING)
    private EstadoNotificacion estadoNotificacion;

    private LocalDateTime fechaLectura;

    // relacion de muchos a  uno
    @ManyToOne
    @JoinColumn(name = "id_notificacion", nullable = false)
    @JsonIgnore
    private Notificacion notificacion;

    public UsuarioNotificacion() {
    }

    public UsuarioNotificacion(Long id, Long idusuario, EstadoNotificacion estadoNotificacion, LocalDateTime fechaLectura, Notificacion notificacion) {
        this.id = id;
        this.idusuario = idusuario;
        this.estadoNotificacion = estadoNotificacion;
        this.fechaLectura = fechaLectura;
        this.notificacion = notificacion;
    }

    public Long getId() {
        return id;
    }

    public void setId(Long id) {
        this.id = id;
    }

    public Long getIdusuario() {
        return idusuario;
    }

    public void setIdusuario(Long idusuario) {
        this.idusuario = idusuario;
    }

    public EstadoNotificacion getEstadoNotificacion() {
        return estadoNotificacion;
    }

    public void setEstadoNotificacion(EstadoNotificacion estadoNotificacion) {
        this.estadoNotificacion = estadoNotificacion;
    }

    public LocalDateTime getFechaLectura() {
        return fechaLectura;
    }

    public void setFechaLectura(LocalDateTime fechaLectura) {
        this.fechaLectura = fechaLectura;
    }

    public Notificacion getNotificacion() {
        return notificacion;
    }

    public void setNotificacion(Notificacion notificacion) {
        this.notificacion = notificacion;
    }
}
