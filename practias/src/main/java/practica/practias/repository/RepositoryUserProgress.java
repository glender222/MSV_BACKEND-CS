package practica.practias.repository;

import java.util.List;
import java.util.Optional;

import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Query;
import org.springframework.data.repository.query.Param;
import org.springframework.stereotype.Repository;

import practica.practias.model.UserProgress;
import practica.practias.model.Enum.EstadoEjercicio;
@Repository
public interface RepositoryUserProgress extends JpaRepository<UserProgress, Long>{
 // Buscar progreso específico de usuario para un ejercicio
    Optional<UserProgress> findByKeycloakIdAndExerciseId(String keycloakId, Long exerciseId);
    
    // Obtener todo el progreso de un usuario
    List<UserProgress> findByKeycloakIdOrderByExerciseIdAsc(String keycloakId);
    
    // Obtener progreso por estado
    List<UserProgress> findByKeycloakIdAndEstado(String keycloakId, EstadoEjercicio estado);
    
    // Contar ejercicios por estado
    Long countByKeycloakIdAndEstado(String keycloakId, EstadoEjercicio estado);
    
    // Obtener estadísticas generales
    @Query("SELECT COUNT(up) FROM UserProgress up WHERE up.keycloakId = :keycloakId")
    Long countTotalExercisesByUser(@Param("keycloakId") String keycloakId);
    
    @Query("SELECT SUM(up.totalIntentos) FROM UserProgress up WHERE up.keycloakId = :keycloakId")
    Long sumTotalAttemptsByUser(@Param("keycloakId") String keycloakId);
    
    @Query("SELECT SUM(up.intentosCorrectos) FROM UserProgress up WHERE up.keycloakId = :keycloakId")
    Long sumCorrectAttemptsByUser(@Param("keycloakId") String keycloakId);
    
    // Verificar si existe progreso
    boolean existsByKeycloakIdAndExerciseId(String keycloakId, Long exerciseId);
    
    // Obtener usuarios con progreso en un ejercicio específico
    List<UserProgress> findByExerciseIdOrderByFechaCompletadoAsc(Long exerciseId);
    
    // Obtener mejores tiempos de un usuario
    @Query("SELECT up FROM UserProgress up WHERE up.keycloakId = :keycloakId AND up.mejorTiempoEjecucion IS NOT NULL ORDER BY up.mejorTiempoEjecucion ASC")
    List<UserProgress> findBestTimesByUser(@Param("keycloakId") String keycloakId);
    
    // Buscar ejercicios completados recientemente
    @Query("SELECT up FROM UserProgress up WHERE up.keycloakId = :keycloakId AND up.estado = 'COMPLETADO' ORDER BY up.fechaCompletado DESC")
    List<UserProgress> findRecentlyCompletedByUser(@Param("keycloakId") String keycloakId);
}
