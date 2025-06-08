package practica.practias.service;

import java.util.List;
import java.util.Optional;

import practica.practias.model.Result;
import practica.practias.model.Solution;

public interface ResultService {
/**
     * Guarda un resultado.
     * @param result El resultado a guardar
     * @return El resultado guardado con su ID asignado
     */
    Result saveResult(Result result);
    
    /**
     * Encuentra un resultado por su ID.
     * @param id El ID del resultado
     * @return Optional conteniendo el resultado o vacío si no existe
     */
    Optional<Result> findById(Long id);
    
    /**
     * Encuentra el resultado asociado a una solución específica.
     * @param solution La solución
     * @return Optional conteniendo el resultado o vacío si no existe
     */
    Optional<Result> findBySolution(Solution solution);
    
    /**
     * Actualiza el estado de un resultado después de la evaluación.
     * @param result El resultado a actualizar
     * @param estado Estado de la evaluación ("CORRECTO" o "FALLIDO")
     * @param errores Lista de errores encontrados
     * @param tiempoEjecucion Tiempo que tomó la ejecución en segundos
     * @return El resultado actualizado
     */
    Result updateResultStatus(Result result, String estado, List<String> errores, Float tiempoEjecucion);
    
    /**
     * Crea un nuevo resultado para una solución.
     * @param solution La solución
     * @return El nuevo resultado
     */
    Result createResultForSolution(Solution solution);
}
