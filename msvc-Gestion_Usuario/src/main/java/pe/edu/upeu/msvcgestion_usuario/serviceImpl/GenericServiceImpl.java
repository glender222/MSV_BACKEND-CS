package pe.edu.upeu.msvcgestion_usuario.serviceImpl;

import java.util.List;
import java.util.Optional;

import org.springframework.data.domain.Page;
import org.springframework.data.domain.Pageable;
import org.springframework.data.jpa.repository.JpaRepository;

import jakarta.persistence.EntityNotFoundException;
import lombok.RequiredArgsConstructor;
import pe.edu.upeu.msvcgestion_usuario.service.GenericService;

@RequiredArgsConstructor
public abstract class GenericServiceImpl <T, ID> implements GenericService<T, ID>{

protected final JpaRepository<T, ID> repository;

@Override
    public T save(T entity) {
        validateEntity(entity);
        return repository.save(entity);
    }
    
    @Override
    public T update(ID id, T entity) {
        if (!repository.existsById(id)) {
            throw new EntityNotFoundException("Entity not found with id: " + id);
        }
        validateEntity(entity);
        return repository.save(entity);
    }
    
    @Override
    public Optional<T> findById(ID id) {
        return repository.findById(id);
    }
    
    @Override
    public List<T> findAll() {
        return repository.findAll();
    }
    
    @Override
    public Page<T> findAll(Pageable pageable) {
        return repository.findAll(pageable);
    }
    
    @Override
    public void deleteById(ID id) {
        if (!repository.existsById(id)) {
            throw new EntityNotFoundException("Entity not found with id: " + id);
        }
        repository.deleteById(id);
    }
    
    @Override
    public boolean existsById(ID id) {
        return repository.existsById(id);
    }
    
    @Override
    public long count() {
        return repository.count();
    }
    
    @Override
    public List<T> saveAll(List<T> entities) {
        entities.forEach(this::validateEntity);
        return repository.saveAll(entities);
    }
    
    @Override
    public void deleteAll(List<T> entities) {
        repository.deleteAll(entities);
    }
    
    // Método abstracto para validaciones específicas
    protected abstract void validateEntity(T entity);
    
    // Método para obtener entidad por ID con excepción
    protected T getEntityById(ID id) {
        return repository.findById(id)
            .orElseThrow(() -> new EntityNotFoundException("Entity not found with id: " + id));
    }


}
