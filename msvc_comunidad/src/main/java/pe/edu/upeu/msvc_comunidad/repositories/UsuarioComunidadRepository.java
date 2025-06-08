package pe.edu.upeu.msvc_comunidad.repositories;

import org.springframework.data.jpa.repository.JpaRepository;
import pe.edu.upeu.msvc_comunidad.entity.UsuarioComunidad;
import pe.edu.upeu.msvc_comunidad.entity.dto.apoyo.ApoyoUsuarioComunidadId;

import java.util.List;

public interface UsuarioComunidadRepository extends JpaRepository<UsuarioComunidad, ApoyoUsuarioComunidadId> {

    List<UsuarioComunidad> findByIdIdComunidad(Long idComunidad);

    void deleteByIdIdUsuarioAndIdIdComunidad(Long idUsuario, Long idComunidad);

    boolean existsById(ApoyoUsuarioComunidadId id);

    List<UsuarioComunidad> findByIdIdUsuario(Long idUsuario);
}