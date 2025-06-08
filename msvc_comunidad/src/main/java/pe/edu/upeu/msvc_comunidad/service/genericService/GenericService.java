package pe.edu.upeu.msvc_comunidad.service.genericService;

import java.util.List;
import java.util.Optional;

public interface GenericService <T, ID>{
    T guardar(T entidad);
    Optional<T> buscarPorId(ID id);
    List<T> listar();
    void eliminar(ID id);
}
