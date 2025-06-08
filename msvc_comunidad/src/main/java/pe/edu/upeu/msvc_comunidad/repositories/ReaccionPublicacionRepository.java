package pe.edu.upeu.msvc_comunidad.repositories;

import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Query;
import pe.edu.upeu.msvc_comunidad.entity.Publicacion;
import pe.edu.upeu.msvc_comunidad.entity.ReaccionPublicacion;

import java.util.List;

public interface ReaccionPublicacionRepository extends JpaRepository<ReaccionPublicacion, Long> {

    // Las reaciones de una publicicacion:
    List<ReaccionPublicacion> findByPublicacionId(Long publicacionId);

    // contar cuatas reaciones tiene una publicacion:
    Long countByPublicacionId(Long publicacionId);

    // COntar de acuerdoa al tipo de reacion:
    @Query("SELECT r.tipo_reaccion, COUNT(r) FROM ReaccionPublicacion r WHERE r.publicacion.id = :publicacionId GROUP BY r.tipo_reaccion")
    List<Object[]> countReaccionesPorTipo(Long publicacionId);
}


