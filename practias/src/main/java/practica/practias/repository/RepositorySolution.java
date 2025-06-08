package practica.practias.repository;

import java.util.List;

import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.stereotype.Repository;

import practica.practias.model.Exercises;
import practica.practias.model.Solution;

@Repository
public interface RepositorySolution extends JpaRepository<Solution, Long>{

 // Mantener solo métodos que usen usuarioId como String
    List<Solution> findByUsuarioIdAndExercisesId(String usuarioId, Long exerciseId);
    List<Solution> findByExercises(Exercises exercises);
    List<Solution> findByUsuarioId(String usuarioId);
    
    // Eliminar estos métodos problemáticos:
    // List<Solution> findByUserId(Long usuarioId);
    // List<Solution> findByExercisesAndUserId(Exercises exercises, Long usuarioId);
    
    // Si necesitas buscar por ejercicio y usuario, usa este método:
    List<Solution> findByExercisesAndUsuarioId(Exercises exercises, String usuarioId);




    /*   
    List<Solution> findByUsuarioIdAndExercisesId(String usuarioId, Long exerciseId);
      List<Solution> findByExercise(Exercises exercises);
   List<Solution> findByExercises(Exercises exercises);
    List<Solution> findByUsuarioId(String usuarioId);

    List<Solution> findByUserId(Long usuarioId);
List<Solution> findByExercisesAndUserId(Exercises exercises, Long usuarioId);*/

}
