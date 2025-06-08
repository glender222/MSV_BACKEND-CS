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
import org.springframework.web.bind.annotation.RequestHeader;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.RestController;

import lombok.RequiredArgsConstructor;
import practica.practias.exception.InvalidSolutionException;
import practica.practias.exception.UnauthorizedAccessException;
import practica.practias.model.Exercises;
import practica.practias.model.Result;
import practica.practias.model.Solution;
import practica.practias.model.dto.EvaluationRequest;
import practica.practias.model.dto.EvaluationResponse;
import practica.practias.service.ExercisesService;
import practica.practias.service.ResultService;
import practica.practias.service.SecurityService;
import practica.practias.service.SolutionService;

import practica.practias.utils.JwtUtils;


@RestController
@RequestMapping("api/v1/soluciones") // recordar cambiar las apis a  /api/   y tambien manejar las excepciones
@RequiredArgsConstructor
public class SolutionController {

    private static final Logger logger = LoggerFactory.getLogger(SolutionController.class);
    
    private final SolutionService solutionService;
    private final ExercisesService exercisesService;
    private final ResultService resultService;
    private final SecurityService securityService;
    private final JwtUtils jwtUtils;

    /**
     * Obtiene todas las soluciones con filtros y validación de seguridad
     */
    @GetMapping
    public ResponseEntity<List<Map<String, Object>>> getAllSolutions(
            @RequestParam(required = false) Long exerciseId,
            @RequestParam(required = false) String usuarioId,
            @RequestHeader("Authorization") String authHeader) {
        
        // Validar token y obtener keycloakId del usuario autenticado
        String authenticatedKeycloakId = securityService.validateTokenAndGetKeycloakId(authHeader);
        String username = jwtUtils.extraerUsername(authHeader);
        
        List<Solution> solutions;
        
        if (exerciseId != null && usuarioId != null) {
            // Verificar que el usuario solo pueda ver sus propias soluciones
            securityService.validateUserAccess(authHeader, usuarioId, "user_solutions");
            
            // Verificar acceso al ejercicio
            securityService.validateExerciseAccess(authenticatedKeycloakId, exerciseId);
            
            solutions = solutionService.findByUsuarioIdAndExercisesId(usuarioId, exerciseId);
            logger.info("Usuario {} consultó sus soluciones para ejercicio {}", username, exerciseId);
            
        } else if (exerciseId != null) {
            // Solo puede ver sus propias soluciones para este ejercicio
            securityService.validateExerciseAccess(authenticatedKeycloakId, exerciseId);
            
            Optional<Exercises> exercise = exercisesService.getExerciseById(exerciseId);
            if (exercise.isEmpty()) {
                return ResponseEntity.notFound().build();
            }
            
            solutions = solutionService.findByUsuarioIdAndExercisesId(authenticatedKeycloakId, exerciseId);
            logger.info("Usuario {} consultó sus soluciones para ejercicio {}", username, exerciseId);
            
        } else if (usuarioId != null) {
            // Verificar que solo pueda ver sus propias soluciones
            securityService.validateUserAccess(authHeader, usuarioId, "user_solutions");
            
            solutions = solutionService.findByUsuarioId(usuarioId);
            logger.info("Usuario {} consultó todo su historial de soluciones", username);
            
        } else {
            // Solo puede ver todas sus propias soluciones
            solutions = solutionService.findByUsuarioId(authenticatedKeycloakId);
            logger.info("Usuario {} consultó todo su historial de soluciones", username);
        }
        
        // Construir respuesta
        List<Map<String, Object>> response = buildSolutionsResponse(solutions);
        
        return ResponseEntity.ok(response);
    }
    
    /**
     * Obtiene una solución específica por su ID (solo si es propietario)
     */
    @GetMapping("/{id}")
    public ResponseEntity<Map<String, Object>> getSolutionById(
            @PathVariable Long id,
            @RequestHeader("Authorization") String authHeader) {
        
        // Validar token
        String authenticatedKeycloakId = securityService.validateTokenAndGetKeycloakId(authHeader);
        String username = jwtUtils.extraerUsername(authHeader);
        
        // Validar ownership de la solución
        securityService.validateSolutionOwnership(authenticatedKeycloakId, id);
        
        Optional<Solution> solution = solutionService.findById(id);
        
        if (solution.isEmpty()) {
            return ResponseEntity.notFound().build();
        }
        
        Map<String, Object> response = buildSolutionDetailResponse(solution.get());
        
        logger.info("Usuario {} consultó detalle de solución {}", username, id);
        return ResponseEntity.ok(response);
    }
    
    /**
     * Crea una nueva solución con validaciones de seguridad completas
     */
    @PostMapping
    public ResponseEntity<EvaluationResponse> createSolution(
            @RequestBody EvaluationRequest request,
            @RequestHeader("Authorization") String authHeader) {
        
        // Validar token y obtener keycloakId
        String authenticatedKeycloakId = securityService.validateTokenAndGetKeycloakId(authHeader);
        String username = jwtUtils.extraerUsername(authHeader);
        
        // Validar que el usuarioId en el request coincida con el usuario autenticado
        if (request.getUsuarioId() != null && !request.getUsuarioId().equals(authenticatedKeycloakId)) {
            throw new UnauthorizedAccessException(
                "No puedes crear soluciones en nombre de otro usuario",
                authenticatedKeycloakId,
                "solution_creation"
            );
        }
        
        // Si no se especificó usuarioId, usar el del usuario autenticado
        if (request.getUsuarioId() == null) {
            request.setUsuarioId(authenticatedKeycloakId);
        }
        
        // Validar estructura básica de la solución
        securityService.validateSolutionStructure(request.getCode(), request.getExerciseId());
        
        // Validar acceso al ejercicio (incluyendo permisos premium)
        securityService.validateExerciseAccess(authenticatedKeycloakId, request.getExerciseId());
        
        // Verificar que el ejercicio existe
        Optional<Exercises> exercise = exercisesService.getExerciseById(request.getExerciseId());
        if (exercise.isEmpty()) {
            throw new InvalidSolutionException("El ejercicio especificado no existe");
        }
        
        // Crear la solución
        Solution solution = new Solution();
        solution.setExercises(exercise.get());
        solution.setUsuarioId(authenticatedKeycloakId); // Usar siempre el usuario autenticado
        solution.setCodigo(request.getCode());
        solution.setEstado("PENDIENTE");
        
        try {
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
            
            logger.info("Usuario {} envió solución para ejercicio {} - Resultado: {}", 
                username, request.getExerciseId(), success ? "ÉXITO" : "FALLO");
            
            return ResponseEntity.status(HttpStatus.CREATED).body(response);
            
        } catch (Exception e) {
            logger.error("Error evaluando solución de usuario {} para ejercicio {}: {}", 
                username, request.getExerciseId(), e.getMessage());
            
            EvaluationResponse errorResponse = new EvaluationResponse(
                false,
                "Error interno durante la evaluación: " + e.getMessage(),
                solution.getId(),
                List.of("Error interno del sistema")
            );
            
            return ResponseEntity.status(HttpStatus.INTERNAL_SERVER_ERROR).body(errorResponse);
        }
    }
    
    /**
     * Obtiene el historial de soluciones del usuario autenticado para un ejercicio específico
     */
    @GetMapping("/mi-historial")
    public ResponseEntity<List<Map<String, Object>>> getMyHistory(
            @RequestParam(required = false) Long exerciseId,
            @RequestHeader("Authorization") String authHeader) {
        
        // Validar token
        String authenticatedKeycloakId = securityService.validateTokenAndGetKeycloakId(authHeader);
        String username = jwtUtils.extraerUsername(authHeader);
        
        List<Solution> solutions;
        
        if (exerciseId != null) {
            // Validar acceso al ejercicio
            securityService.validateExerciseAccess(authenticatedKeycloakId, exerciseId);
            solutions = solutionService.findByUsuarioIdAndExercisesId(authenticatedKeycloakId, exerciseId);
            logger.info("Usuario {} consultó su historial para ejercicio {}", username, exerciseId);
        } else {
            solutions = solutionService.findByUsuarioId(authenticatedKeycloakId);
            logger.info("Usuario {} consultó todo su historial de soluciones", username);
        }
        
        List<Map<String, Object>> response = buildSolutionsResponse(solutions);
        
        return ResponseEntity.ok(response);
    }
    
    /**
     * Obtiene estadísticas de soluciones del usuario autenticado
     */
    @GetMapping("/mis-estadisticas")
    public ResponseEntity<Map<String, Object>> getMyStats(
            @RequestHeader("Authorization") String authHeader) {
        
        // Validar token
        String authenticatedKeycloakId = securityService.validateTokenAndGetKeycloakId(authHeader);
        String username = jwtUtils.extraerUsername(authHeader);
        
        List<Solution> allSolutions = solutionService.findByUsuarioId(authenticatedKeycloakId);
        
        Map<String, Object> stats = new HashMap<>();
        stats.put("totalSoluciones", allSolutions.size());
        stats.put("solucionesCorrectas", allSolutions.stream()
            .filter(s -> "CORRECTO".equals(s.getEstado())).count());
        stats.put("solucionesIncorrectas", allSolutions.stream()
            .filter(s -> "FALLIDO".equals(s.getEstado())).count());
        stats.put("solucionesConError", allSolutions.stream()
            .filter(s -> "ERROR".equals(s.getEstado())).count());
        
        long correctas = (Long) stats.get("solucionesCorrectas");
        long total = (Long) stats.get("totalSoluciones");
        double tasaExito = total > 0 ? (double) correctas / total * 100 : 0.0;
        stats.put("tasaExito", Math.round(tasaExito * 100.0) / 100.0);
        
        // Ejercicios únicos intentados
        long ejerciciosUnicos = allSolutions.stream()
            .map(s -> s.getExercises().getId())
            .distinct()
            .count();
        stats.put("ejerciciosIntentos", ejerciciosUnicos);
        
        // Ejercicios completados (al menos una solución correcta)
        long ejerciciosCompletados = allSolutions.stream()
            .filter(s -> "CORRECTO".equals(s.getEstado()))
            .map(s -> s.getExercises().getId())
            .distinct()
            .count();
        stats.put("ejerciciosCompletados", ejerciciosCompletados);
        
        logger.info("Usuario {} consultó sus estadísticas", username);
        return ResponseEntity.ok(stats);
    }
    
    // ===== MÉTODOS AUXILIARES PRIVADOS =====
    
    private List<Map<String, Object>> buildSolutionsResponse(List<Solution> solutions) {
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
        
        return response;
    }
    
    private Map<String, Object> buildSolutionDetailResponse(Solution solution) {
        Map<String, Object> response = new HashMap<>();
        response.put("id", solution.getId());
        response.put("ejercicioId", solution.getExercises().getId());
        response.put("nombreEjercicio", solution.getExercises().getNombre());
        response.put("usuarioId", solution.getUsuarioId());
        response.put("codigo", solution.getCodigo());
        response.put("estado", solution.getEstado());
        response.put("fechaEnvio", solution.getTiempoEnvio());
        
        // Incluir resultado si existe
        Optional<Result> result = resultService.findBySolution(solution);
        if (result.isPresent()) {
            Map<String, Object> resultMap = new HashMap<>();
            resultMap.put("id", result.get().getId());
            resultMap.put("estado", result.get().getEstado());
            resultMap.put("fechaEvaluacion", result.get().getFechaEvaluacion());
            resultMap.put("tiempoEjecucion", result.get().getTiempoEjecucion());
            resultMap.put("errores", result.get().getErrores());
            response.put("resultado", resultMap);
        }
        
        return response;
    }
}
