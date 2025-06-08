package pe.edu.upeu.msvcnotificaciones.repositories;

import org.springframework.data.jpa.repository.JpaRepository;
import pe.edu.upeu.msvcnotificaciones.entity.UsuarioNotificacion;

import java.util.List;

public interface UsuarioNotificacionRepository extends JpaRepository<UsuarioNotificacion, Long> {
    List<UsuarioNotificacion> findByIdusuario(Long idusuario);
}
