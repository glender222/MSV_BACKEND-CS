package pe.edu.upeu.msvc_comunidad.entity.dto.apoyo;

import jakarta.persistence.Embeddable;
import java.io.Serializable;
import java.util.Objects;

@Embeddable
public class ApoyoUsuarioComunidadId implements Serializable {

    private Long idUsuario;
    private Long idComunidad;

    public ApoyoUsuarioComunidadId() {}

    public ApoyoUsuarioComunidadId(Long idUsuario, Long idComunidad) {
        this.idUsuario = idUsuario;
        this.idComunidad = idComunidad;
    }

    public Long getIdUsuario() {
        return idUsuario;
    }

    public void setIdUsuario(Long idUsuario) {
        this.idUsuario = idUsuario;
    }

    public Long getIdComunidad() {
        return idComunidad;
    }

    public void setIdComunidad(Long idComunidad) {
        this.idComunidad = idComunidad;
    }

    @Override
    public boolean equals(Object o) {
        if (this == o) return true;
        if (!(o instanceof ApoyoUsuarioComunidadId)) return false;
        ApoyoUsuarioComunidadId that = (ApoyoUsuarioComunidadId) o;
        return Objects.equals(idUsuario, that.idUsuario) &&
                Objects.equals(idComunidad, that.idComunidad);
    }

    @Override
    public int hashCode() {
        return Objects.hash(idUsuario, idComunidad);
    }
}