package pe.edu.upeu.msvc_comunidad.service;

import pe.edu.upeu.msvc_comunidad.entity.Comunidad;
import pe.edu.upeu.msvc_comunidad.service.genericService.GenericService;

import java.util.List;

public interface ComunidadService extends GenericService<Comunidad, Long> {
    List<Comunidad> listarPorEstado(Long estado);
}
