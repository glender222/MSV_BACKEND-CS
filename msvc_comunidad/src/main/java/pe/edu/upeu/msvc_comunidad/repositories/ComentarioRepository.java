package pe.edu.upeu.msvc_comunidad.repositories;

import org.springframework.data.jpa.repository.JpaRepository;
import pe.edu.upeu.msvc_comunidad.entity.Comentario;

import java.util.List;

public interface ComentarioRepository extends JpaRepository<Comentario, Long> {
    List<Comentario> findByPublicacionId(Long publicacionId);
}
