package pe.edu.upeu.msvc_comunidad.serviceImpl;

import jakarta.transaction.Transactional;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.stereotype.Service;

import pe.edu.upeu.msvc_comunidad.client.UsuarioClient;
import pe.edu.upeu.msvc_comunidad.entity.Comunidad;
import pe.edu.upeu.msvc_comunidad.entity.UsuarioComunidad;
import pe.edu.upeu.msvc_comunidad.entity.dto.UsuarioComunidadDTO;
import pe.edu.upeu.msvc_comunidad.entity.dto.apoyo.ApoyoUsuarioComunidadId;
import pe.edu.upeu.msvc_comunidad.repositories.ComunidadRepository;
import pe.edu.upeu.msvc_comunidad.repositories.UsuarioComunidadRepository;
import pe.edu.upeu.msvc_comunidad.service.UsuarioComunidadService;
import pe.edu.upeu.msvc_comunidad.serviceImpl.genericServiceImpl.GenericServiceImpl;

import java.time.LocalDateTime;
import java.util.List;

@Service
public class UsuarioComunidadServiceImpl extends GenericServiceImpl<UsuarioComunidad, ApoyoUsuarioComunidadId>
        implements UsuarioComunidadService {

    private final UsuarioComunidadRepository usuarioComunidadRepository;
    private final ComunidadRepository comunidadRepository;
    private final UsuarioClient usuarioClient;

    public UsuarioComunidadServiceImpl(UsuarioComunidadRepository usuarioComunidadRepository,
            ComunidadRepository comunidadRepository,
            UsuarioClient usuarioClient) {
        this.usuarioComunidadRepository = usuarioComunidadRepository;
        this.comunidadRepository = comunidadRepository;
        this.usuarioClient = usuarioClient;
    }

    @Override
    protected JpaRepository<UsuarioComunidad, ApoyoUsuarioComunidadId> getRepository() {
        return usuarioComunidadRepository;
    }

    @Override
    public UsuarioComunidad agregarUsuarioAComunidad(Long idComunidad, UsuarioComunidadDTO dto) {

        // Validar si el usuario existe usando Feign
        boolean existe = usuarioClient.existsById(dto.getId_usuario());
        if (!existe) {
            throw new RuntimeException("El usuario con ID " + dto.getId_usuario() + " no existe");
        }

        Comunidad comunidad = comunidadRepository.findById(idComunidad)
                .orElseThrow(() -> new RuntimeException("Comunidad no encontrada"));

        ApoyoUsuarioComunidadId id = new ApoyoUsuarioComunidadId(dto.getId_usuario(), idComunidad);

        if (usuarioComunidadRepository.existsById(id)) {
            throw new RuntimeException("Usuario ya pertenece a la comunidad");
        }

        UsuarioComunidad usuarioComunidad = new UsuarioComunidad();
        usuarioComunidad.setId(id);
        usuarioComunidad.setComunidad(comunidad);
        usuarioComunidad.setFechaUnion(dto.getFecha_union() != null ? dto.getFecha_union() : LocalDateTime.now());

        return usuarioComunidadRepository.save(usuarioComunidad);
    }

    @Override
    public List<UsuarioComunidad> listarPorComunidad(Long idComunidad) {

        return usuarioComunidadRepository.findByIdIdComunidad(idComunidad);
    }

    @Override
    @Transactional
    public void eliminarUsuarioDeComunidad(Long idUsuario, Long idComunidad) {

        ApoyoUsuarioComunidadId id = new ApoyoUsuarioComunidadId(idUsuario, idComunidad);

        if(!usuarioComunidadRepository.existsById(id)){
            throw new RuntimeException("Usuario no encontrado en la comunidad " + idComunidad);
        }
        usuarioComunidadRepository.deleteByIdIdUsuarioAndIdIdComunidad(idUsuario, idComunidad);
    }

    @Override
    public List<UsuarioComunidad> listarComunidadesPorUsuario(Long idUsuario) {
        return usuarioComunidadRepository.findByIdIdUsuario(idUsuario);
    }

    @Override
    public boolean verificarExistenciaUsuario(Long idUsuario) {
        return usuarioClient.existsById(idUsuario);
    }

}
