package pe.edu.upeu.msvcnotificaciones.entity;

import com.fasterxml.jackson.annotation.JsonIgnore;
import jakarta.persistence.*;
import org.hibernate.annotations.CreationTimestamp;
import pe.edu.upeu.msvcnotificaciones.entity.dto.EstadoNotificacion;
import pe.edu.upeu.msvcnotificaciones.entity.dto.PrioridadNotificacion;
import pe.edu.upeu.msvcnotificaciones.entity.dto.TipoNotificacion;

import java.time.LocalDateTime;
import java.util.Set;

@Entity
@Table (name = "notificaciones")

public class Notificacion {

    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    private Long id;

    private String titulo;

    private String contenido;

    @CreationTimestamp
    private LocalDateTime fechaCreacion;

    @Enumerated(EnumType.STRING)
    private PrioridadNotificacion prioridad;


    @Enumerated(EnumType.STRING)
    private TipoNotificacion tipoNotificacion;

    //Relacion de uno a muchos
    @OneToMany(mappedBy = "notificacion")
    @JsonIgnore
    private Set<UsuarioNotificacion> usuarioNotificaciones;


    public Notificacion() {
    }

    public Notificacion(Long id, String titulo, String contenido, LocalDateTime fechaCreacion, PrioridadNotificacion prioridad, TipoNotificacion tipoNotificacion, Set<UsuarioNotificacion> usuarioNotificaciones) {
        this.id = id;
        this.titulo = titulo;
        this.contenido = contenido;
        this.fechaCreacion = fechaCreacion;
        this.prioridad = prioridad;
        this.tipoNotificacion = tipoNotificacion;
        this.usuarioNotificaciones = usuarioNotificaciones;
    }

    public Long getId() {
        return id;
    }

    public void setId(Long id) {
        this.id = id;
    }

    public String getTitulo() {
        return titulo;
    }

    public void setTitulo(String titulo) {
        this.titulo = titulo;
    }

    public String getContenido() {
        return contenido;
    }

    public void setContenido(String contenido) {
        this.contenido = contenido;
    }

    public LocalDateTime getFechaCreacion() {
        return fechaCreacion;
    }

    public void setFechaCreacion(LocalDateTime fechaCreacion) {
        this.fechaCreacion = fechaCreacion;
    }

    public PrioridadNotificacion getPrioridad() {
        return prioridad;
    }

    public void setPrioridad(PrioridadNotificacion prioridad) {
        this.prioridad = prioridad;
    }

    public TipoNotificacion getTipoNotificacion() {
        return tipoNotificacion;
    }

    public void setTipoNotificacion(TipoNotificacion tipoNotificacion) {
        this.tipoNotificacion = tipoNotificacion;
    }

    public Set<UsuarioNotificacion> getUsuarioNotificaciones() {
        return usuarioNotificaciones;
    }

    public void setUsuarioNotificaciones(Set<UsuarioNotificacion> usuarioNotificaciones) {
        this.usuarioNotificaciones = usuarioNotificaciones;
    }
}