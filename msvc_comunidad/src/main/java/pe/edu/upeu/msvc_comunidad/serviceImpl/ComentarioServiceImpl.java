package pe.edu.upeu.msvc_comunidad.serviceImpl;

import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.stereotype.Service;
import pe.edu.upeu.msvc_comunidad.entity.Comentario;
import pe.edu.upeu.msvc_comunidad.repositories.ComentarioRepository;
import pe.edu.upeu.msvc_comunidad.service.ComentarioService;
import pe.edu.upeu.msvc_comunidad.serviceImpl.genericServiceImpl.GenericServiceImpl;

import java.util.List;

@Service
public class ComentarioServiceImpl extends GenericServiceImpl<Comentario, Long> implements ComentarioService {

    private final ComentarioRepository comentarioRepository;

    public ComentarioServiceImpl(ComentarioRepository comentarioRepository) {
        this.comentarioRepository = comentarioRepository;
    }

    @Override
    protected JpaRepository<Comentario, Long> getRepository() {
        return comentarioRepository;
    }

    @Override
    public List<Comentario> listarPorPublicacion(Long publicacionId) {
        return comentarioRepository.findByPublicacionId(publicacionId);
    }
}
