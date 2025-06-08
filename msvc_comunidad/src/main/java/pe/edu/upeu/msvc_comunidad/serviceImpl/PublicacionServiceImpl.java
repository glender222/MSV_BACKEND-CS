package pe.edu.upeu.msvc_comunidad.serviceImpl;

import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.stereotype.Service;
import pe.edu.upeu.msvc_comunidad.entity.Comunidad;
import pe.edu.upeu.msvc_comunidad.entity.Publicacion;
import pe.edu.upeu.msvc_comunidad.entity.dto.ArchivoPublicacionDTO;
import pe.edu.upeu.msvc_comunidad.entity.dto.ComunidadDTO;
import pe.edu.upeu.msvc_comunidad.entity.dto.PublicacionDTO;
import pe.edu.upeu.msvc_comunidad.repositories.PublicacionRepository;
import pe.edu.upeu.msvc_comunidad.service.PublicacionService;
import pe.edu.upeu.msvc_comunidad.serviceImpl.genericServiceImpl.GenericServiceImpl;

import java.util.List;
import java.util.stream.Collectors;

@Service
public class PublicacionServiceImpl extends GenericServiceImpl<Publicacion, Long> implements PublicacionService {

    private final PublicacionRepository publicacionRepository;

    public PublicacionServiceImpl(PublicacionRepository publicacionRepository) {
        this.publicacionRepository = publicacionRepository;
    }

    @Override
    protected JpaRepository<Publicacion, Long> getRepository() {
        return publicacionRepository;
    }

    @Override
    public List<PublicacionDTO> listarPublicacionesConArchivosYComunidad() {
        return publicacionRepository.findAll().stream()
                .map(this::convertirADTO)
                .collect(Collectors.toList());
    }

    @Override
    public List<PublicacionDTO> listarPublicacionesPorComunidad(Long idComunidad) {
        return publicacionRepository.findByComunidadId(idComunidad).stream()
                .map(this::convertirADTO)
                .collect(Collectors.toList());
    }

    @Override
    public List<PublicacionDTO> listarPorUsuarioYComunidad(Long idUsuario, Long idComunidad) {
        return publicacionRepository.findByUsuarioYComunidad(idUsuario, idComunidad).stream()
                .map(this::convertirADTO)
                .collect(Collectors.toList());
    }

    @Override
    public List<PublicacionDTO> listarPorUsuario(Long idUsuario) {
        return publicacionRepository.findByUsuario(idUsuario).stream()
                .map(this::convertirADTO)
                .collect(Collectors.toList());
    }



    private PublicacionDTO convertirADTO(Publicacion publicacion) {
        Comunidad comunidad = publicacion.getComunidad();
        ComunidadDTO comunidadDTO = new ComunidadDTO(
                comunidad.getId(),
                comunidad.getNombre(),
                comunidad.getDescripcion(),
                comunidad.getUrlLogo(),
                comunidad.getId_creador(),
                comunidad.getFecha_creacion(),
                comunidad.getEstado()
        );

        List<ArchivoPublicacionDTO> archivosDTO = publicacion.getArchivoPublicacion().stream()
                .map(archivo -> new ArchivoPublicacionDTO(
                        archivo.getId(),
                        archivo.getUrl_archivo(),
                        archivo.getTipo_publicacion()
                ))
                .collect(Collectors.toList());

        PublicacionDTO dto = new PublicacionDTO();
        dto.setId(publicacion.getId());
        dto.setId_usuario_publica(publicacion.getId_usuario_publica());
        dto.setContenido(publicacion.getContenido());
        dto.setFecha_creacion(publicacion.getFecha_creacion());
        dto.setComunidad(comunidadDTO);
        dto.setArchivos(archivosDTO);

        return dto;
    }

}
