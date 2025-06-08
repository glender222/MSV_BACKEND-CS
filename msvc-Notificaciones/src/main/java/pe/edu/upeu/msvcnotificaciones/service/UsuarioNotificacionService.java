package pe.edu.upeu.msvcnotificaciones.service;

import pe.edu.upeu.msvcnotificaciones.entity.Notificacion;
import pe.edu.upeu.msvcnotificaciones.entity.UsuarioNotificacion;
import pe.edu.upeu.msvcnotificaciones.entity.dto.UsuarioNotificacionDetalleDTO;

import java.util.List;
import java.util.Optional;

public interface UsuarioNotificacionService {

    UsuarioNotificacion guardar(UsuarioNotificacion notificacion);
    Optional<UsuarioNotificacion> buscarPorId(Long id);
    List<UsuarioNotificacion> listar();
    void eliminar(Long id);

    List<UsuarioNotificacionDetalleDTO> obtenerDetalleNotificacionesPorUsuario(Long idusuario);



}
