package pe.edu.upeu.msvc_comunidad.serviceImpl;

import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.stereotype.Service;
import pe.edu.upeu.msvc_comunidad.client.UsuarioClient;
import pe.edu.upeu.msvc_comunidad.entity.Comunidad;
import pe.edu.upeu.msvc_comunidad.repositories.ComunidadRepository;
import pe.edu.upeu.msvc_comunidad.service.ComunidadService;
import pe.edu.upeu.msvc_comunidad.serviceImpl.genericServiceImpl.GenericServiceImpl;

import java.util.List;

@Service
public class ComunidadServiceImpl extends GenericServiceImpl<Comunidad, Long> implements ComunidadService {

    private final ComunidadRepository comunidadRepository;


    public ComunidadServiceImpl( ComunidadRepository comunidadRepository) {
        this.comunidadRepository = comunidadRepository;
    }
    //Todos los metos del crud con jpa
    @Override
    protected JpaRepository<Comunidad, Long> getRepository() {
        return comunidadRepository;
    }

    @Override
    public List<Comunidad> listarPorEstado(Long estado) {
        return comunidadRepository.findByEstado(estado);
    }
}
