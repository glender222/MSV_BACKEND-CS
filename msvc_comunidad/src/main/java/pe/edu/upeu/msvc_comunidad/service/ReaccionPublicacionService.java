package pe.edu.upeu.msvc_comunidad.service;

import pe.edu.upeu.msvc_comunidad.entity.ReaccionPublicacion;
import pe.edu.upeu.msvc_comunidad.entity.penum.TipoPublicacion;
import pe.edu.upeu.msvc_comunidad.entity.penum.TipoReaccion;
import pe.edu.upeu.msvc_comunidad.service.genericService.GenericService;

import java.util.List;
import java.util.Map;

public interface ReaccionPublicacionService extends GenericService<ReaccionPublicacion, Long> {
    List<ReaccionPublicacion> obtenerReaccionesPorPublicacion(Long publicacionId);

    Long contarTotalReaccionesPorPublicacion(Long publicacionId);

    Map<TipoReaccion, Long>  contarReaccionesPorTipo(Long publicacionId);


}
