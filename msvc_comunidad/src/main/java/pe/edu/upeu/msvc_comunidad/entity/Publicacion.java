package pe.edu.upeu.msvc_comunidad.entity;

import com.fasterxml.jackson.annotation.JsonIgnore;
import jakarta.persistence.*;

import java.time.LocalDate;
import java.time.LocalDateTime;
import java.util.Set;

@Entity
@Table(name = "publicaciones")
public class Publicacion {

    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    private Long id;

    private Long id_usuario_publica;

    private String contenido;

    private LocalDateTime fecha_creacion;

    //Relacion de muchos a uno: Publicacion -> comunidad
    @ManyToOne
    @JoinColumn(name = "id_comunidad", nullable = false)
    private Comunidad comunidad;

    //Relacion de uno a muchos: Publicacion -> Archivo_publicacion
    @OneToMany(mappedBy = "publicacion")
    @JsonIgnore
    private Set<ArchivoPublicacion> archivoPublicacion;

    //Relacion de uno a muchos Publicacion -> Comentarios
    @OneToMany(mappedBy = "publicacion")
    @JsonIgnore
    private Set<Comentario> comentario;

    //Relacion de uno a muchos Publicacion -> ReaccionPublicacion
    @OneToMany(mappedBy = "publicacion")
    @JsonIgnore
    private Set<ReaccionPublicacion> reaccionPublicacion;

    public Publicacion() {
    }

    public Publicacion(Long id, Long id_usuario_publica, String contenido, LocalDateTime fecha_creacion, Comunidad comunidad, Set<ArchivoPublicacion> archivoPublicacion, Set<Comentario> comentario, Set<ReaccionPublicacion> reaccionPublicacion) {
        this.id = id;
        this.id_usuario_publica = id_usuario_publica;
        this.contenido = contenido;
        this.fecha_creacion = fecha_creacion;
        this.comunidad = comunidad;
        this.archivoPublicacion = archivoPublicacion;
        this.comentario = comentario;
        this.reaccionPublicacion = reaccionPublicacion;
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

    public Comunidad getComunidad() {
        return comunidad;
    }

    public void setComunidad(Comunidad comunidad) {
        this.comunidad = comunidad;
    }

    public Set<ArchivoPublicacion> getArchivoPublicacion() {
        return archivoPublicacion;
    }

    public void setArchivoPublicacion(Set<ArchivoPublicacion> archivoPublicacion) {
        this.archivoPublicacion = archivoPublicacion;
    }

    public Set<Comentario> getComentario() {
        return comentario;
    }

    public void setComentario(Set<Comentario> comentario) {
        this.comentario = comentario;
    }

    public Set<ReaccionPublicacion> getReaccionPublicacion() {
        return reaccionPublicacion;
    }

    public void setReaccionPublicacion(Set<ReaccionPublicacion> reaccionPublicacion) {
        this.reaccionPublicacion = reaccionPublicacion;
    }
}
