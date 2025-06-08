package pe.edu.upeu.msvc_comunidad.service;

import pe.edu.upeu.msvc_comunidad.entity.ReaccionComentario;
import pe.edu.upeu.msvc_comunidad.entity.penum.TipoReaccion;
import pe.edu.upeu.msvc_comunidad.service.genericService.GenericService;

import java.util.List;
import java.util.Map;

public interface ReaccionComentarioService extends GenericService<ReaccionComentario, Long> {


    List<ReaccionComentario> obtenerReacionesPorComentario(Long comentarioId);

    Long contartotalReacionesPorComentario(Long comentarioId);

    Map<TipoReaccion, Long> contarreacionPorTipo(Long comentarioId);
}
