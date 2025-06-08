package pe.edu.upeu.msvc_comunidad.repositories;

import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Query;
import org.springframework.data.repository.query.Param;
import pe.edu.upeu.msvc_comunidad.entity.Publicacion;
import pe.edu.upeu.msvc_comunidad.entity.dto.PublicacionDTO;

import java.util.List;

public interface PublicacionRepository extends JpaRepository<Publicacion, Long> {

    List<Publicacion> findByComunidadId(Long idComunidad);


    // 1. Publicaciones de un usuario en una comunidad específica
    @Query("SELECT p FROM Publicacion p WHERE p.id_usuario_publica = :userId AND p.comunidad.id = :comunidadId")
    List<Publicacion> findByUsuarioYComunidad(@Param("userId") Long idUsuario, @Param("comunidadId") Long idComunidad);

    // 2. Todas las publicaciones de un usuario en todas las comunidades
    @Query("SELECT p FROM Publicacion p WHERE p.id_usuario_publica = :userId")
    List<Publicacion> findByUsuario(@Param("userId") Long idUsuario);
}
