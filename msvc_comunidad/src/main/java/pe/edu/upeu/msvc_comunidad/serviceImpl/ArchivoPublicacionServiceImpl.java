package pe.edu.upeu.msvc_comunidad.serviceImpl;

import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.stereotype.Service;
import pe.edu.upeu.msvc_comunidad.entity.ArchivoPublicacion;
import pe.edu.upeu.msvc_comunidad.repositories.ArchivoPublicacionRepository;
import pe.edu.upeu.msvc_comunidad.service.ArchivoPublicacionService;
import pe.edu.upeu.msvc_comunidad.serviceImpl.genericServiceImpl.GenericServiceImpl;

@Service
public class ArchivoPublicacionServiceImpl extends GenericServiceImpl<ArchivoPublicacion, Long> implements ArchivoPublicacionService {

    private final ArchivoPublicacionRepository archivoPublicacionRepository;

    public ArchivoPublicacionServiceImpl(ArchivoPublicacionRepository archivoPublicacionRepository) {
        this.archivoPublicacionRepository = archivoPublicacionRepository;
    }

    @Override
    protected JpaRepository<ArchivoPublicacion, Long> getRepository() {
        return archivoPublicacionRepository;
    }
}
