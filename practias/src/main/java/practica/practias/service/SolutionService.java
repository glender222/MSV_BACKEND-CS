package practica.practias.service;

import java.util.List;
import java.util.Optional;

import practica.practias.model.Exercises;
import practica.practias.model.Solution;

public interface SolutionService {
       
   /**
     * Guarda una solución para un ejercicio específico.
     * @param solution La solución a guardar
     * @return La solución guardada con su ID asignado
     */
    Solution saveSolution(Solution solution);
    
    /**
     * Encuentra una solución por su ID.
     * @param id El ID de la solución
     * @return Optional conteniendo la solución o vacío si no existe
     */
    Optional<Solution> findById(Long id);
    
    /**
     * Lista todas las soluciones para un ejercicio específico.
     * @param exercise El ejercicio
     * @return Lista de soluciones para el ejercicio
     */
    List<Solution> findByExercises(Exercises exercise);
    
    /**
     * Evalúa una solución y crea/actualiza su resultado.
     * @param solution La solución a evaluar
     * @return La solución evaluada
     */
    Solution evaluateSolution(Solution solution);
    
    /**
     * Encuentra todas las soluciones.
     * @return Una lista con todas las soluciones
     */
    List<Solution> findAll();
    
    /**
     * Encuentra todas las soluciones de un usuario.
     * @param usuarioId ID del usuario
     * @return Lista de soluciones del usuario
     */
    List<Solution> findByUsuarioId(String usuarioId);



    /**
     * Encuentra todas las soluciones de un usuario para un ejercicio específico.
     * @param usuarioId ID del usuario
     * @param exerciseId ID del ejercicio
     * @return Lista de soluciones que coinciden con ambos criterios
     */
    List<Solution> findByUsuarioIdAndExercisesId(String usuarioId, Long exerciseId);
}
