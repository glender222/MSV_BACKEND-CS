package practica.practias.controller;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;
import java.util.Optional;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.RestController;

import practica.practias.model.Exercises;
import practica.practias.model.Result;
import practica.practias.model.Solution;
import practica.practias.model.dto.EvaluationRequest;
import practica.practias.model.dto.EvaluationResponse;
import practica.practias.service.ExercisesService;
import practica.practias.service.ResultService;
import practica.practias.service.SolutionService;
import practica.practias.utils.CodeEvaluator;


@RestController
@RequestMapping("api/v1/soluciones") // recordar cambiar las apis a  /api/   y tambien manejar las excepciones
public class SolutionController {


    
    private static final Logger logger = LoggerFactory.getLogger(SolutionController.class);
    
    private final SolutionService solutionService;
    private final ExercisesService exercisesService;
    private final ResultService resultService;
    
    
    public SolutionController(
            SolutionService solutionService, 
            ExercisesService exercisesService,
            ResultService resultService,
            CodeEvaluator codeEvaluator) {
        this.solutionService = solutionService;
        this.exercisesService = exercisesService;
        this.resultService = resultService;
        
    }
    

    @GetMapping
    public ResponseEntity<List<Map<String, Object>>> getAllSolutions(
            @RequestParam(required = false) Long exerciseId,
            @RequestParam(required = false) String usuarioId) {
        
        List<Solution> solutions;
        
        if (exerciseId != null && usuarioId != null) {
           
            solutions = solutionService.findByUsuarioIdAndExercisesId(usuarioId, exerciseId);
        } else if (exerciseId != null) {
           
            Optional<Exercises> exercise = exercisesService.getExerciseById(exerciseId);
            if (exercise.isEmpty()) {
                return ResponseEntity.notFound().build();
            }
            solutions = solutionService.findByExercises(exercise.get());
        } else if (usuarioId != null) {
           
            solutions = solutionService.findByUsuarioId(usuarioId);
        } else {
           
            solutions = solutionService.findAll();
        }
        
        
        List<Map<String, Object>> response = new ArrayList<>();
        for (Solution solution : solutions) {
            Map<String, Object> solutionMap = new HashMap<>();
            solutionMap.put("id", solution.getId());
            solutionMap.put("ejercicioId", solution.getExercises().getId());
            solutionMap.put("nombreEjercicio", solution.getExercises().getNombre());
            solutionMap.put("usuarioId", solution.getUsuarioId());
            solutionMap.put("estado", solution.getEstado());
            solutionMap.put("fechaEnvio", solution.getTiempoEnvio());
            
            // Añadir resultado si existe
            Optional<Result> result = resultService.findBySolution(solution);
            if (result.isPresent()) {
                Map<String, Object> resultMap = new HashMap<>();
                resultMap.put("id", result.get().getId());
                resultMap.put("estado", result.get().getEstado());
                resultMap.put("fechaEvaluacion", result.get().getFechaEvaluacion());
                resultMap.put("tiempoEjecucion", result.get().getTiempoEjecucion());
                solutionMap.put("resultado", resultMap);
            }
            
            response.add(solutionMap);
        }
        
        return ResponseEntity.ok(response);
    }
    
    /**
     * Obtiene una solución específica por su ID
     */
    @GetMapping("/{id}")
    public ResponseEntity<Map<String, Object>> getSolutionById(@PathVariable Long id) {
        Optional<Solution> solution = solutionService.findById(id);
        
        if (solution.isEmpty()) {
            return ResponseEntity.notFound().build();
        }
        
        Map<String, Object> response = new HashMap<>();
        response.put("id", solution.get().getId());
        response.put("ejercicioId", solution.get().getExercises().getId());
        response.put("nombreEjercicio", solution.get().getExercises().getNombre());
        response.put("usuarioId", solution.get().getUsuarioId());
        response.put("codigo", solution.get().getCodigo());
        response.put("estado", solution.get().getEstado());
        response.put("fechaEnvio", solution.get().getTiempoEnvio());
        
        // Incluir resultado si existe
        Optional<Result> result = resultService.findBySolution(solution.get());
        if (result.isPresent()) {
            Map<String, Object> resultMap = new HashMap<>();
            resultMap.put("id", result.get().getId());
            resultMap.put("estado", result.get().getEstado());
            resultMap.put("fechaEvaluacion", result.get().getFechaEvaluacion());
            resultMap.put("tiempoEjecucion", result.get().getTiempoEjecucion());
            resultMap.put("errores", result.get().getErrores());
            response.put("resultado", resultMap);
        }
        
        return ResponseEntity.ok(response);
    }
    
    /**
     * Crea una nueva solución y la evalúa
     */
    @PostMapping
    public ResponseEntity<EvaluationResponse> createSolution(@RequestBody EvaluationRequest request) {
        // Validar datos de entrada
        if (request.getCode() == null || request.getCode().isEmpty()) {
            return ResponseEntity.badRequest().body(
                    new EvaluationResponse(false, "El código no puede estar vacío", null, null));
        }
        
        // Verificar que el ejercicio existe
        Optional<Exercises> exercise = exercisesService.getExerciseById(request.getExerciseId());
        if (exercise.isEmpty()) {
            return ResponseEntity.status(HttpStatus.NOT_FOUND).body(
                    new EvaluationResponse(false, "El ejercicio no existe", null, null));
        }
        
        // Crear la solución
        Solution solution = new Solution();
        solution.setExercises(exercise.get());
        solution.setUsuarioId(request.getUsuarioId());
        solution.setCodigo(request.getCode());
        solution.setEstado("PENDIENTE");
        // El setter de tiempoEnvio se hace en el servicio
        
        // Guardar y evaluar la solución
        solution = solutionService.saveSolution(solution);
        solution = solutionService.evaluateSolution(solution);
        
        // Obtener resultado de la evaluación
        Optional<Result> resultOpt = resultService.findBySolution(solution);
        List<String> errores = new ArrayList<>();
        boolean success = "CORRECTO".equals(solution.getEstado());
        
        if (resultOpt.isPresent()) {
            Result result = resultOpt.get();
            errores = result.getErrores();
        }
        
        // Preparar respuesta
        EvaluationResponse response = new EvaluationResponse(
                success,
                success ? "Solución correcta" : "La solución no pasa todas las pruebas",
                solution.getId(),
                errores
        );
        
        return ResponseEntity.status(HttpStatus.CREATED).body(response);
    }
}
