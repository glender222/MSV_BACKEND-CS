package practica.practias.service;

import java.util.List;
import java.util.Optional;

import practica.practias.model.Exercises;

public interface ExercisesService {
  /**
     * Obtiene todos los ejercicios disponibles
     * @return Lista de ejercicios
     */
    List<Exercises> getAllExercises();
    
    /**
     * Busca un ejercicio por su ID
     * @param id Identificador del ejercicio
     * @return Ejercicio encontrado o empty si no existe
     */
    Optional<Exercises> getExerciseById(Long id);
}
