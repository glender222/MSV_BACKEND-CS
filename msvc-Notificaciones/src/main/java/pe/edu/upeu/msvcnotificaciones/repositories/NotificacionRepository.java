package pe.edu.upeu.msvcnotificaciones.repositories;

import org.springframework.data.jpa.repository.JpaRepository;
import pe.edu.upeu.msvcnotificaciones.entity.Notificacion;

public interface NotificacionRepository extends JpaRepository<Notificacion, Long> {
}
