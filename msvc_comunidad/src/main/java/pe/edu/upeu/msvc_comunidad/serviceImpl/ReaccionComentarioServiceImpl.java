package pe.edu.upeu.msvc_comunidad.serviceImpl;

import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.stereotype.Service;
import pe.edu.upeu.msvc_comunidad.entity.ReaccionComentario;
import pe.edu.upeu.msvc_comunidad.entity.penum.TipoReaccion;
import pe.edu.upeu.msvc_comunidad.repositories.ReaccionComentarioRepository;
import pe.edu.upeu.msvc_comunidad.service.ReaccionComentarioService;
import pe.edu.upeu.msvc_comunidad.serviceImpl.genericServiceImpl.GenericServiceImpl;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

@Service
public class ReaccionComentarioServiceImpl extends GenericServiceImpl<ReaccionComentario, Long> implements ReaccionComentarioService {
    private final ReaccionComentarioRepository reaccionComentarioRepository;

    public ReaccionComentarioServiceImpl(ReaccionComentarioRepository reaccionComentarioRepository) {
        this.reaccionComentarioRepository = reaccionComentarioRepository;
    }

    @Override
    protected JpaRepository<ReaccionComentario, Long> getRepository() {
        return reaccionComentarioRepository;
    }

    @Override
    public List<ReaccionComentario> obtenerReacionesPorComentario(Long comentarioId) {
        return reaccionComentarioRepository.findByComentarioId(comentarioId);
    }

    @Override
    public Long contartotalReacionesPorComentario(Long comentarioId) {
        return reaccionComentarioRepository.countByComentarioId(comentarioId);
    }

    @Override
    public Map<TipoReaccion, Long> contarreacionPorTipo(Long comentarioId) {
        List<Object[]> resultados = reaccionComentarioRepository.countReaccionesPorTipo(comentarioId);
        Map<TipoReaccion, Long> mapa = new HashMap<>();
        for (Object[] fila : resultados) {
            TipoReaccion tipo = (TipoReaccion)  fila[0];
            Long conteo = (Long) fila[1];
            mapa.put(tipo, conteo);
        }
        return mapa;
    }
}
