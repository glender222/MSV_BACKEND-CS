package pe.edu.upeu.msvc_comunidad.serviceImpl;

import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.stereotype.Service;
import pe.edu.upeu.msvc_comunidad.entity.ReaccionPublicacion;
import pe.edu.upeu.msvc_comunidad.entity.penum.TipoReaccion;
import pe.edu.upeu.msvc_comunidad.repositories.ReaccionPublicacionRepository;
import pe.edu.upeu.msvc_comunidad.service.ReaccionPublicacionService;
import pe.edu.upeu.msvc_comunidad.serviceImpl.genericServiceImpl.GenericServiceImpl;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

@Service
public class ReaccionPublicacionServiceImpl extends GenericServiceImpl<ReaccionPublicacion, Long> implements ReaccionPublicacionService {
    private final ReaccionPublicacionRepository reaccionPublicacionRepository;

    public ReaccionPublicacionServiceImpl(ReaccionPublicacionRepository reaccionPublicacionRepository) {
        this.reaccionPublicacionRepository = reaccionPublicacionRepository;
    }

    @Override
    protected JpaRepository<ReaccionPublicacion, Long> getRepository() {
        return reaccionPublicacionRepository;
    }

    //Metos
    @Override
    public List<ReaccionPublicacion> obtenerReaccionesPorPublicacion(Long publicacionId) {
        return reaccionPublicacionRepository.findByPublicacionId(publicacionId);
    }

    @Override
    public Long contarTotalReaccionesPorPublicacion(Long publicacionId) {
        return reaccionPublicacionRepository.countByPublicacionId(publicacionId);
    }

    @Override
    public Map<TipoReaccion, Long> contarReaccionesPorTipo(Long publicacionId) {
        List<Object[]> resultados = reaccionPublicacionRepository.countReaccionesPorTipo(publicacionId);
        Map<TipoReaccion, Long> mapa = new HashMap<>();
        for (Object[] fila : resultados) {
            TipoReaccion tipo = (TipoReaccion) fila[0];
            Long conteo = (Long) fila[1];
            mapa.put(tipo, conteo);
        }
        return mapa;
    }
}
