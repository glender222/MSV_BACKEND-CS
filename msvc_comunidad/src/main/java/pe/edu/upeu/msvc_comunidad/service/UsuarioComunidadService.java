package pe.edu.upeu.msvc_comunidad.service;


import pe.edu.upeu.msvc_comunidad.entity.UsuarioComunidad;
import pe.edu.upeu.msvc_comunidad.entity.dto.UsuarioComunidadDTO;
import pe.edu.upeu.msvc_comunidad.entity.dto.apoyo.ApoyoUsuarioComunidadId;
import pe.edu.upeu.msvc_comunidad.service.genericService.GenericService;

import java.util.List;

public interface UsuarioComunidadService extends GenericService<UsuarioComunidad, ApoyoUsuarioComunidadId> {

    UsuarioComunidad agregarUsuarioAComunidad(Long idComunidad, UsuarioComunidadDTO dto);

    List<UsuarioComunidad> listarPorComunidad(Long idComunidad);

    void eliminarUsuarioDeComunidad(Long idUsuario, Long idComunidad);

    List<UsuarioComunidad> listarComunidadesPorUsuario(Long idUsuario);

    boolean verificarExistenciaUsuario(Long idUsuario);

}