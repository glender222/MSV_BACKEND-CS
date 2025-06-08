package pe.edu.upeu.msvcgestion_usuario.repositories;

import java.util.List;
import java.util.Optional;

import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.stereotype.Repository;

import pe.edu.upeu.msvcgestion_usuario.entity.Usuario;
import pe.edu.upeu.msvcgestion_usuario.entity.Enum.EstadoUsuario;

@Repository
public interface UsuarioRepository extends JpaRepository<Usuario, Long> {
Optional<Usuario> findByKeycloakId(String keycloakId);
    
    boolean existsByKeycloakId(String keycloakId);
    
    List<Usuario> findByEstado(EstadoUsuario estado);
    
    long countByEstado(EstadoUsuario estado);

    // Nuevo glender
    Optional<Usuario> findByNombre(String nombre);
    Boolean existsByNombre(String nombre);

}
