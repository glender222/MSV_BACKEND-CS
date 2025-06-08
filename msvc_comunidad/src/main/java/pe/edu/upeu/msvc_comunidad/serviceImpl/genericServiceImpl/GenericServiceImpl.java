package pe.edu.upeu.msvc_comunidad.serviceImpl.genericServiceImpl;

import org.springframework.data.jpa.repository.JpaRepository;
import pe.edu.upeu.msvc_comunidad.service.genericService.GenericService;

import java.util.List;
import java.util.Optional;

public abstract class GenericServiceImpl <T, ID> implements GenericService<T, ID> {

    protected abstract JpaRepository<T, ID> getRepository();

    @Override
    public T guardar(T entidad) {
        return getRepository().save(entidad);
    }

    @Override
    public Optional<T> buscarPorId(ID id) {
        return getRepository().findById(id);
    }

    @Override
    public List<T> listar() {
        return getRepository().findAll();
    }

    @Override
    public void eliminar(ID id) {
        getRepository().deleteById(id);
    }
}
