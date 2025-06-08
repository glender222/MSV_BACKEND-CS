package pe.edu.upeu.msvc_comunidad.entity;

import com.fasterxml.jackson.annotation.JsonIgnore;
import jakarta.persistence.*;

import java.time.LocalDate;
import java.util.Set;

@Entity
@Table(name = "comunidades")
public class Comunidad {

    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    private Long id;

    private String nombre;

    private String descripcion;

    private String urlLogo;

    private Long id_creador;

    private LocalDate fecha_creacion;

    private Long estado;

    //Relacion uno a muchos: Comunidad -> usuarios_comunidad
    @OneToMany(mappedBy = "comunidad")
    @JsonIgnore
    private Set<UsuarioComunidad> usuarioComunidad;


    //Relacion uno a muchos: Comunidad -> publicacion
    @OneToMany(mappedBy = "comunidad")
    @JsonIgnore
    private Set<Publicacion> publicaciones;

    public Comunidad() {
    }

    public Comunidad(String urlLogo, Long id, String nombre, String descripcion, Long id_creador, LocalDate fecha_creacion, Long estado, Set<UsuarioComunidad> usuarioComunidad, Set<Publicacion> publicaciones) {
        this.urlLogo = urlLogo;
        this.id = id;
        this.nombre = nombre;
        this.descripcion = descripcion;
        this.id_creador = id_creador;
        this.fecha_creacion = fecha_creacion;
        this.estado = estado;
        this.usuarioComunidad = usuarioComunidad;
        this.publicaciones = publicaciones;
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

    public Set<UsuarioComunidad> getUsuarioComunidad() {
        return usuarioComunidad;
    }

    public void setUsuarioComunidad(Set<UsuarioComunidad> usuarioComunidad) {
        this.usuarioComunidad = usuarioComunidad;
    }

    public Set<Publicacion> getPublicaciones() {
        return publicaciones;
    }

    public void setPublicaciones(Set<Publicacion> publicaciones) {
        this.publicaciones = publicaciones;
    }

    public String getUrlLogo() {
        return urlLogo;
    }

    public void setUrlLogo(String ulrLogo) {
        this.urlLogo = ulrLogo;
    }
}
