package pe.edu.upeu.msvc_comunidad.repositories;

import org.springframework.data.jpa.repository.JpaRepository;
import pe.edu.upeu.msvc_comunidad.entity.Comunidad;

import java.util.List;

public interface ComunidadRepository extends JpaRepository<Comunidad, Long> {
    List<Comunidad> findByEstado(Long estado); // 1 = activo, 0 = desactivo
}
