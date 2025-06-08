package practica.practias.controller;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;
import java.util.stream.Collectors;

import org.springframework.http.ResponseEntity;
import org.springframework.transaction.annotation.Transactional;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestHeader;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.RestController;

import lombok.RequiredArgsConstructor;
import lombok.extern.slf4j.Slf4j;
import practica.practias.model.Exercises;
import practica.practias.model.Solution;
import practica.practias.model.UserProgress;
import practica.practias.model.Enum.EstadoEjercicio;
import practica.practias.model.Enum.NivelDificultad;
import practica.practias.model.Enum.TipoSuscripcion;
import practica.practias.model.dto.ExerciseProgressDTO;
import practica.practias.model.dto.ProgressResponseDTO;
import practica.practias.model.dto.SolutionHistoryDTO;
import practica.practias.model.dto.UserStatsDTO;
import practica.practias.repository.RepositoryUserProgress;
import practica.practias.service.ExercisesService;
import practica.practias.service.ProgressService;
import practica.practias.service.SecurityService;
import practica.practias.service.SolutionService;
import practica.practias.service.serviceImpl.ProgressServiceImpl;
import practica.practias.service.serviceImpl.ProgressServiceImpl.UserProgressStats;
import practica.practias.utils.JwtUtils;

@Slf4j
@RestController
@RequestMapping("/api/v1/progreso")
@RequiredArgsConstructor
public class ProgressController {
    
    private final SecurityService securityService;
    private final ProgressService progressService;
    private final ExercisesService exercisesService;
    private final SolutionService solutionService;
    private final RepositoryUserProgress repositoryUserProgress;
    private final JwtUtils jwtUtils;
    
    /**
     * Obtiene el progreso completo del usuario autenticado
     */
    @GetMapping("/mi-progreso")
    @Transactional(readOnly = true)
    public ResponseEntity<ProgressResponseDTO> getMyProgress(
            @RequestHeader("Authorization") String authHeader) {
        
        String keycloakId = securityService.validateTokenAndGetKeycloakId(authHeader);
        String username = jwtUtils.extraerUsername(authHeader);
        
        log.info("Usuario {} consultando su progreso completo", username);
        
        // Obtener todos los ejercicios disponibles
        List<Exercises> todosEjercicios = exercisesService.getAllExercises();
        
        // Obtener progreso del usuario
        List<UserProgress> progresoUsuario = repositoryUserProgress.findByKeycloakIdOrderByExerciseIdAsc(keycloakId);
        Map<Long, UserProgress> progresoMap = progresoUsuario.stream()
            .collect(Collectors.toMap(UserProgress::getExerciseId, p -> p));
        
        // Verificar tipo de suscripción
        TipoSuscripcion tipoSuscripcion = securityService.getUserSubscriptionType(keycloakId);
        boolean esPremium = TipoSuscripcion.PREMIUM.equals(tipoSuscripcion);
        
        // Construir progreso por ejercicio
        List<ExerciseProgressDTO> ejerciciosProgress = new ArrayList<>();
        
        for (Exercises ejercicio : todosEjercicios) {
            UserProgress progreso = progresoMap.get(ejercicio.getId());
            
            // Determinar si está disponible
            boolean requierePremium = ejercicio.getId() > 3;
            boolean desbloqueado = !requierePremium || esPremium;
            
            EstadoEjercicio estado;
            if (!desbloqueado) {
                estado = EstadoEjercicio.BLOQUEADO;
            } else if (progreso != null) {
                estado = progreso.getEstado();
            } else {
                estado = EstadoEjercicio.DISPONIBLE;
            }
            
            ExerciseProgressDTO ejercicioDTO = ExerciseProgressDTO.builder()
                .id(ejercicio.getId())
                .nombre(ejercicio.getNombre())
                .descripcion(ejercicio.getDescripcion())
                .nivel(determinarNivelDificultad(ejercicio.getId()))
                .estado(estado)
                .requierePremium(requierePremium)
                .desbloqueado(desbloqueado)
                .tiempoCreacion(ejercicio.getTiempoCreacion())
                .build();
            
            // Agregar métricas si existe progreso
            if (progreso != null) {
                ejercicioDTO.setFechaCompletado(progreso.getFechaCompletado());
                ejercicioDTO.setFechaPrimerIntento(progreso.getFechaPrimerIntento());
                ejercicioDTO.setUltimoIntento(progreso.getUltimoIntento());
                ejercicioDTO.setTotalIntentos(progreso.getTotalIntentos());
                ejercicioDTO.setIntentosCorrectos(progreso.getIntentosCorrectos());
                ejercicioDTO.setMejorTiempoEjecucionMs(progreso.getMejorTiempoEjecucion());
                ejercicioDTO.setTasaExito(progreso.calcularTasaExito());
                ejercicioDTO.setEsPrimeraVez(progreso.getEsPrimeraVez());
            }
            
            // Mensaje de estado
            ejercicioDTO.setMensajeEstado(generarMensajeEstado(estado, requierePremium, esPremium));
            
            ejerciciosProgress.add(ejercicioDTO);
        }
        
        // Calcular estadísticas generales
        UserStatsDTO stats = calcularEstadisticas(keycloakId, esPremium);
        
        // Contar totales
        long ejerciciosCompletados = ejerciciosProgress.stream()
            .filter(e -> EstadoEjercicio.COMPLETADO.equals(e.getEstado()))
            .count();
        
        long ejerciciosDisponibles = ejerciciosProgress.stream()
            .filter(e -> e.getDesbloqueado())
            .count();
        
        long ejerciciosBloqueados = ejerciciosProgress.stream()
            .filter(e -> EstadoEjercicio.BLOQUEADO.equals(e.getEstado()))
            .count();
        
        double porcentajeCompletado = ejerciciosDisponibles > 0 ? 
            (double) ejerciciosCompletados / ejerciciosDisponibles * 100 : 0.0;
        
        ProgressResponseDTO response = ProgressResponseDTO.builder()
            .totalEjercicios((long) todosEjercicios.size())
            .ejerciciosCompletados(ejerciciosCompletados)
            .ejerciciosDisponibles(ejerciciosDisponibles)
            .ejerciciosBloqueados(ejerciciosBloqueados)
            .porcentajeCompletado(Math.round(porcentajeCompletado * 100.0) / 100.0)
            .ejercicios(ejerciciosProgress)
            .estadisticas(stats)
            .tipoSuscripcion(tipoSuscripcion.toString())
            .puedeAccederPremium(esPremium)
            .build();
        
        return ResponseEntity.ok(response);
    }
    
    /**
     * Obtiene estadísticas detalladas del usuario
     */
    @GetMapping("/estadisticas")
    @Transactional(readOnly = true)
    public ResponseEntity<UserStatsDTO> getMyStats(
            @RequestHeader("Authorization") String authHeader) {
        
        String keycloakId = securityService.validateTokenAndGetKeycloakId(authHeader);
        String username = jwtUtils.extraerUsername(authHeader);
        
        TipoSuscripcion tipoSuscripcion = securityService.getUserSubscriptionType(keycloakId);
        boolean esPremium = TipoSuscripcion.PREMIUM.equals(tipoSuscripcion);
        
        UserStatsDTO stats = calcularEstadisticas(keycloakId, esPremium);
        
        log.info("Usuario {} consultó sus estadísticas", username);
        return ResponseEntity.ok(stats);
    }
    
    /**
     * Obtiene historial de soluciones del usuario
     */
    @GetMapping("/historial")
    @Transactional(readOnly = true)
    public ResponseEntity<List<SolutionHistoryDTO>> getMyHistory(
            @RequestHeader("Authorization") String authHeader,
            @RequestParam(required = false) Long exerciseId,
            @RequestParam(defaultValue = "50") int limit) {
        
        String keycloakId = securityService.validateTokenAndGetKeycloakId(authHeader);
        String username = jwtUtils.extraerUsername(authHeader);
        
        List<Solution> solutions;
        if (exerciseId != null) {
            securityService.validateExerciseAccess(keycloakId, exerciseId);
            solutions = solutionService.findByUsuarioIdAndExercisesId(keycloakId, exerciseId);
        } else {
            solutions = solutionService.findByUsuarioId(keycloakId);
        }
        
        // Limitar resultados y ordenar por fecha descendente
        List<SolutionHistoryDTO> historial = solutions.stream()
            .sorted((s1, s2) -> s2.getTiempoEnvio().compareTo(s1.getTiempoEnvio()))
            .limit(limit)
            .map(this::mapearSolutionAHistoryDTO)
            .collect(Collectors.toList());
        
        log.info("Usuario {} consultó historial: {} soluciones", username, historial.size());
        return ResponseEntity.ok(historial);
    }
    
    /**
     * Obtiene el estado de un ejercicio específico
     */
    @GetMapping("/ejercicio/{exerciseId}")
    @Transactional(readOnly = true)
    public ResponseEntity<Map<String, Object>> getExerciseProgress(
            @PathVariable Long exerciseId,
            @RequestHeader("Authorization") String authHeader) {
        
        String keycloakId = securityService.validateTokenAndGetKeycloakId(authHeader);
        
        // Verificar que el ejercicio existe
        if (exercisesService.getExerciseById(exerciseId).isEmpty()) {
            return ResponseEntity.notFound().build();
        }
        
        // Verificar acceso (sin lanzar excepción para mostrar estado)
        boolean puedeAcceder = securityService.canAccessExercise(keycloakId, exerciseId);
        EstadoEjercicio estado = progressService.obtenerEstadoEjercicio(keycloakId, exerciseId);
        
        if (!puedeAcceder) {
            estado = EstadoEjercicio.BLOQUEADO;
        }
        
        Map<String, Object> response = new HashMap<>();
        response.put("exerciseId", exerciseId);
        response.put("estado", estado);
        response.put("puedeAcceder", puedeAcceder);
        response.put("completado", progressService.haCompletadoEjercicio(keycloakId, exerciseId));
        
        return ResponseEntity.ok(response);
    }
    
    // ===== MÉTODOS AUXILIARES =====
    
    private NivelDificultad determinarNivelDificultad(Long exerciseId) {
        if (exerciseId <= 3) return NivelDificultad.BASICO;
        if (exerciseId <= 6) return NivelDificultad.INTERMEDIO;
        return NivelDificultad.AVANZADO;
    }
    
    private String generarMensajeEstado(EstadoEjercicio estado, boolean requierePremium, boolean esPremium) {
        switch (estado) {
            case DISPONIBLE:
                return "Disponible para resolver";
            case COMPLETADO:
                return "Completado - puedes intentarlo nuevamente";
            case BLOQUEADO:
                if (requierePremium && !esPremium) {
                    return "Requiere suscripción Premium";
                }
                return "Bloqueado";
            default:
                return "Estado desconocido";
        }
    }
    
    private UserStatsDTO calcularEstadisticas(String keycloakId, boolean esPremium) {
        // Obtener estadísticas de progreso
        UserProgressStats progressStats = ((ProgressServiceImpl) progressService).obtenerEstadisticasUsuario(keycloakId);
        
        // Obtener todas las soluciones para estadísticas adicionales
        List<Solution> allSolutions = solutionService.findByUsuarioId(keycloakId);
        
        // Calcular estadísticas por dificultad
        Map<NivelDificultad, Long> completadosPorNivel = new HashMap<>();
        Map<NivelDificultad, Long> disponiblesPorNivel = new HashMap<>();
        
        // Inicializar contadores
        for (NivelDificultad nivel : NivelDificultad.values()) {
            completadosPorNivel.put(nivel, 0L);
            disponiblesPorNivel.put(nivel, 0L);
        }
        
        // Contar ejercicios por nivel
        List<UserProgress> progreso = repositoryUserProgress.findByKeycloakIdOrderByExerciseIdAsc(keycloakId);
        
        for (UserProgress p : progreso) {
            NivelDificultad nivel = determinarNivelDificultad(p.getExerciseId());
            
            // Solo contar disponibles si tiene acceso
            boolean tieneAcceso = p.getExerciseId() <= 3 || esPremium;
            if (tieneAcceso) {
                disponiblesPorNivel.put(nivel, disponiblesPorNivel.get(nivel) + 1);
                
                if (p.estaCompletado()) {
                    completadosPorNivel.put(nivel, completadosPorNivel.get(nivel) + 1);
                }
            }
        }
        
        return UserStatsDTO.builder()
            .totalIntentos(progressStats.totalIntentos)
            .solucionesCorrectas(progressStats.intentosCorrectos)
            .solucionesIncorrectas(progressStats.totalIntentos - progressStats.intentosCorrectos)
            .tasaExito(progressStats.tasaExito)
            .ejerciciosBasicosCompletados(completadosPorNivel.get(NivelDificultad.BASICO))
            .ejerciciosIntermediosCompletados(completadosPorNivel.get(NivelDificultad.INTERMEDIO))
            .ejerciciosAvanzadosCompletados(completadosPorNivel.get(NivelDificultad.AVANZADO))
            .ejerciciosBasicosDisponibles(disponiblesPorNivel.get(NivelDificultad.BASICO))
            .ejerciciosIntermediosDisponibles(disponiblesPorNivel.get(NivelDificultad.INTERMEDIO))
            .ejerciciosAvanzadosDisponibles(disponiblesPorNivel.get(NivelDificultad.AVANZADO))
            .ejerciciosCompletados(progressStats.ejerciciosCompletados)
            .porcentajeCompletado(progressStats.totalEjercicios > 0 ? 
                (double) progressStats.ejerciciosCompletados / progressStats.totalEjercicios * 100 : 0.0)
            .build();
    }
    
    private SolutionHistoryDTO mapearSolutionAHistoryDTO(Solution solution) {
        return SolutionHistoryDTO.builder()
            .solutionId(solution.getId())
            .exerciseId(solution.getExercises().getId())
            .exerciseName(solution.getExercises().getNombre())
            .nivelEjercicio(determinarNivelDificultad(solution.getExercises().getId()))
            .fechaEnvio(solution.getTiempoEnvio())
            .esCorrecta("CORRECTO".equals(solution.getEstado()))
            /* .codigoEnviado(solution.getCodigo()) // Solo para el propietario */
            .build();
    }
}