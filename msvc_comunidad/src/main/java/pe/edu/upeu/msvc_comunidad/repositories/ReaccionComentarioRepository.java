package pe.edu.upeu.msvc_comunidad.repositories;

import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Query;
import pe.edu.upeu.msvc_comunidad.entity.ReaccionComentario;

import java.util.List;

public interface ReaccionComentarioRepository extends JpaRepository<ReaccionComentario, Long> {
    // Reaciones de un comentario:
    List<ReaccionComentario> findByComentarioId(Long id);

    // CONTAR CUATAS REACIONES TIENE UN COMENTARIO:
    Long countByComentarioId(Long id);

    //Contar de acuerdo al tipo de reacion:
    @Query("SELECT r.tipo_reaccion, COUNT(r) FROM ReaccionComentario r WHERE r.comentario.id = :comentarioId GROUP BY r.tipo_reaccion")
    List<Object[]> countReaccionesPorTipo(Long comentarioId);

}

