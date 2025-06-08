package pe.edu.upeu.msvc_comunidad.service;

import pe.edu.upeu.msvc_comunidad.entity.Publicacion;
import pe.edu.upeu.msvc_comunidad.entity.dto.PublicacionDTO;
import pe.edu.upeu.msvc_comunidad.service.genericService.GenericService;

import java.util.List;

public interface PublicacionService extends GenericService<Publicacion, Long> {
    List<PublicacionDTO> listarPublicacionesConArchivosYComunidad();
    List<PublicacionDTO> listarPublicacionesPorComunidad(Long idComunidad);

    List<PublicacionDTO> listarPorUsuarioYComunidad(Long idUsuario, Long idComunidad);
    List<PublicacionDTO> listarPorUsuario(Long idUsuario);
}
