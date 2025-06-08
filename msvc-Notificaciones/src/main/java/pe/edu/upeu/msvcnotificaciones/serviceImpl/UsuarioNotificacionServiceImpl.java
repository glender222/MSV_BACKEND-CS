package pe.edu.upeu.msvcnotificaciones.serviceImpl;

import org.springframework.stereotype.Service;
import pe.edu.upeu.msvcnotificaciones.entity.Notificacion;
import pe.edu.upeu.msvcnotificaciones.entity.UsuarioNotificacion;
import pe.edu.upeu.msvcnotificaciones.entity.dto.UsuarioNotificacionDetalleDTO;
import pe.edu.upeu.msvcnotificaciones.repositories.UsuarioNotificacionRepository;
import pe.edu.upeu.msvcnotificaciones.service.UsuarioNotificacionService;

import java.util.List;
import java.util.Optional;

@Service
public class UsuarioNotificacionServiceImpl implements UsuarioNotificacionService {

    private UsuarioNotificacionRepository usuarioNotificacionRepository;

    public UsuarioNotificacionServiceImpl(UsuarioNotificacionRepository usuarioNotificacionRepository) {
        this.usuarioNotificacionRepository = usuarioNotificacionRepository;
    }


    @Override
    public UsuarioNotificacion guardar(UsuarioNotificacion notificacion) {
        return usuarioNotificacionRepository.save(notificacion);
    }

    @Override
    public Optional<UsuarioNotificacion> buscarPorId(Long id) {
        return usuarioNotificacionRepository.findById(id);
    }

    @Override
    public List<UsuarioNotificacion> listar() {
        return usuarioNotificacionRepository.findAll();
    }

    @Override
    public void eliminar(Long id) {
        usuarioNotificacionRepository.deleteById(id);
    }


    @Override
    public List<UsuarioNotificacionDetalleDTO> obtenerDetalleNotificacionesPorUsuario(Long idusuario) {
        List<UsuarioNotificacion> lista = usuarioNotificacionRepository.findByIdusuario(idusuario);

        return lista.stream().map(un -> {
            UsuarioNotificacionDetalleDTO dto = new UsuarioNotificacionDetalleDTO();
            dto.setId(un.getId());
            dto.setIdusuario(un.getIdusuario());
            dto.setEstadoNotificacion(un.getEstadoNotificacion());
            dto.setFechaLectura(un.getFechaLectura());
            dto.setNotificacion(un.getNotificacion());
            return dto;
        }).toList();
    }

}
