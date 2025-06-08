package pe.edu.upeu.msvcgestion_usuario.service;

import java.util.List;
import java.util.Optional;

import org.springframework.data.domain.Page;
import org.springframework.data.domain.Pageable;

public interface GenericService<T, ID>{
 // CRUD básico
    T save(T entity);
    
    T update(ID id, T entity);
    
    Optional<T> findById(ID id);
    
    List<T> findAll();
    
    Page<T> findAll(Pageable pageable);
    
    void deleteById(ID id);
    
    boolean existsById(ID id);
    
    long count();
    
    // Métodos utilitarios
    List<T> saveAll(List<T> entities);
    
    void deleteAll(List<T> entities);


}
