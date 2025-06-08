package pe.edu.upeu.msvcnotificaciones.serviceImpl;

import org.springframework.stereotype.Service;
import pe.edu.upeu.msvcnotificaciones.entity.Notificacion;
import pe.edu.upeu.msvcnotificaciones.entity.UsuarioNotificacion;
import pe.edu.upeu.msvcnotificaciones.entity.dto.EstadoNotificacion;
import pe.edu.upeu.msvcnotificaciones.repositories.NotificacionRepository;
import pe.edu.upeu.msvcnotificaciones.repositories.UsuarioNotificacionRepository;
import pe.edu.upeu.msvcnotificaciones.service.NotificacionService;

import java.util.List;
import java.util.Optional;

@Service
public class NotificacionServiceImpl implements NotificacionService {

    private final NotificacionRepository notificacionRepository;
    private final UsuarioNotificacionRepository usuarioNotificacionRepository;

    public NotificacionServiceImpl(UsuarioNotificacionRepository usuarioNotificacionRepository , NotificacionRepository notificacionRepository) {
        this.notificacionRepository = notificacionRepository;
        this.usuarioNotificacionRepository = usuarioNotificacionRepository;
    }


    @Override
    public Notificacion guardar(Notificacion notificacion) {

        return notificacionRepository.save(notificacion);
    }

    @Override
    public Optional<Notificacion> buscarPorId(Long id) {
        return notificacionRepository.findById(id);
    }

    @Override
    public List<Notificacion> listar() {
        return notificacionRepository.findAll();
    }

    @Override
    public void eliminar(Long id) {
        notificacionRepository.deleteById(id);
    }

    @Override
    public void vincularConUsuario(Notificacion notificacion, Long idUsuario) {
        UsuarioNotificacion usuarioNotificacion = new UsuarioNotificacion();
        usuarioNotificacion.setNotificacion(notificacion);
        usuarioNotificacion.setIdusuario(idUsuario);
        usuarioNotificacion.setEstadoNotificacion(EstadoNotificacion.NO_LEIDA);
        usuarioNotificacionRepository.save(usuarioNotificacion);
    }
}
