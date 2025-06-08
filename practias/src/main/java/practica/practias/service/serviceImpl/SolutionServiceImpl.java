package practica.practias.service.serviceImpl;

import java.time.LocalDateTime;
import java.util.ArrayList;
import java.util.List;
import java.util.Optional;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;


import practica.practias.model.Exercises;
import practica.practias.model.Result;
import practica.practias.model.Solution;

import practica.practias.repository.RepositorySolution;
import practica.practias.service.ProgressService;
import practica.practias.service.ResultService;
import practica.practias.service.SolutionService;

import practica.practias.utils.CodeEvaluator;

@Service
public class SolutionServiceImpl implements SolutionService{
  private static final Logger logger = LoggerFactory.getLogger(SolutionServiceImpl.class);
    
    @Autowired
    private RepositorySolution repositorySolution;
    
    @Autowired
    private ResultService resultService;
    
    @Autowired
    private CodeEvaluator codeEvaluator;
   
    @Autowired
    private ProgressService progressService;

  

    @Override
    public Solution saveSolution(Solution solution) {
         // Establecer la fecha de envío si es nueva solución
        if (solution.getId() == null) {
            solution.setTiempoEnvio(LocalDateTime.now());
        }
        
        logger.info("Guardando solución para ejercicio ID: {}", solution.getExercises().getId());
        return repositorySolution.save(solution);
    }

    @Override
    public Optional<Solution> findById(Long id) {
        return repositorySolution.findById(id);
    }

    @Override
    public List<Solution> findByExercises(Exercises exercise) {
        return repositorySolution.findByExercises(exercise);
    }

    @Override
    public Solution evaluateSolution(Solution solution) {
        logger.info("Evaluando solución ID: {}", solution.getId());
    
    // Actualizar estado inicial de la solución
    solution.setEstado("EN_PROCESO");
    Solution savedSolution = saveSolution(solution);  // Variable diferente


       // ===== NUEVO: REGISTRAR INTENTO =====
    progressService.registrarIntento(
        solution.getUsuarioId(), 
        solution.getExercises().getId()
    );
    
    // Crear o recuperar un resultado para esta solución
    Result result = resultService.findBySolution(solution)  // Usa la original
            .orElseGet(() -> resultService.createResultForSolution(solution));
    
    try {
        long startTime = System.nanoTime();
        List<String> errores = new ArrayList<>();
        
        // Evaluar el código
        boolean passed = false;
        if (codeEvaluator != null) {
            passed = codeEvaluator.evaluate(
                    solution.getCodigo(), 
                    solution.getExercises().getPruebas(), 
                    errores);
        } else {
            errores.add("CodeEvaluator no inicializado");
        }
        
        // Calcular tiempo de ejecución en segundos
        long endTime = System.nanoTime();
        float tiempoEjecucionSegundos = (endTime - startTime) / 1_000_000_000F;
        int tiempoEjecucionMs = Math.round(tiempoEjecucionSegundos * 1000);
        
        // Actualizar resultado
        String estado = passed ? "CORRECTO" : "FALLIDO";
        resultService.updateResultStatus(result, estado, errores, tiempoEjecucionSegundos);
        
        // Actualizar estado de la solución guardada
        savedSolution.setEstado(estado);
        savedSolution = saveSolution(savedSolution);
        
       // ===== NUEVO: ACTUALIZAR PROGRESO SI ES CORRECTO =====
        if (passed) {
            progressService.marcarEjercicioComoCompletado(
                solution.getUsuarioId(),
                solution.getExercises().getId(),
                tiempoEjecucionMs
            );
        }
        
        


        return savedSolution;  // Retorna la versión guardada
        
    } catch (Exception e) {
        logger.error("Error al evaluar la solución: {}", e.getMessage());
        
        // Actualizar resultado con el error
        List<String> errores = new ArrayList<>();
        errores.add("Error interno durante la evaluación: " + e.getMessage());
        resultService.updateResultStatus(result, "ERROR", errores, null);
        
        // Actualizar estado de la solución guardada
        savedSolution.setEstado("ERROR");
        savedSolution = saveSolution(savedSolution);
        
        return savedSolution;  // Retorna la versión guardada
    }
    }

    @Override
    public List<Solution> findAll() {
        return repositorySolution.findAll();
    }
    
    @Override
    public List<Solution> findByUsuarioId(String usuarioId) {
        return repositorySolution.findByUsuarioId(usuarioId);
    }

// Añadir este método a la clase SolutionServiceImpl existente
@Override
public List<Solution> findByUsuarioIdAndExercisesId(String usuarioId, Long exerciseId) {
    return repositorySolution.findByUsuarioIdAndExercisesId(usuarioId, exerciseId);
}



}
