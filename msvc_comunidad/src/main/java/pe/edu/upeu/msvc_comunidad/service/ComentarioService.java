package pe.edu.upeu.msvc_comunidad.service;

import pe.edu.upeu.msvc_comunidad.entity.Comentario;
import pe.edu.upeu.msvc_comunidad.service.genericService.GenericService;

import java.util.List;

public interface ComentarioService extends GenericService<Comentario, Long> {
    List<Comentario> listarPorPublicacion(Long publicacionId);
}
