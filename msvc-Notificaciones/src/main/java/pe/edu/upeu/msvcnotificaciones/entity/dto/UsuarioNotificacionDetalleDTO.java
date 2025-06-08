package pe.edu.upeu.msvcnotificaciones.entity.dto;

import pe.edu.upeu.msvcnotificaciones.entity.Notificacion;

import java.time.LocalDateTime;

public class UsuarioNotificacionDetalleDTO {

    private Long id;
    private Long idusuario;
    private EstadoNotificacion estadoNotificacion;
    private LocalDateTime fechaLectura;
    private Notificacion notificacion;

    public UsuarioNotificacionDetalleDTO() {
    }

    public UsuarioNotificacionDetalleDTO(Long id,Long idusuario, EstadoNotificacion estadoNotificacion, LocalDateTime fechaLectura, Notificacion notificacion) {
        this.idusuario = idusuario;
        this.estadoNotificacion = estadoNotificacion;
        this.fechaLectura = fechaLectura;
        this.notificacion = notificacion;
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

    public Long getId() {
        return id;
    }

    public void setId(Long id) {
        this.id = id;
    }
}
