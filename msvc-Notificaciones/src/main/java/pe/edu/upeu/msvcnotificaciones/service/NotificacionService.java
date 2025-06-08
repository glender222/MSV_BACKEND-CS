package pe.edu.upeu.msvcnotificaciones.service;

import pe.edu.upeu.msvcnotificaciones.entity.Notificacion;

import java.util.List;
import java.util.Optional;

public interface NotificacionService {

    Notificacion guardar(Notificacion notificacion);
    Optional<Notificacion> buscarPorId(Long id);
    List<Notificacion> listar();
    void eliminar(Long id);

    void vincularConUsuario(Notificacion notificacion, Long idUsuario);


}
