package practica.practias.service.serviceImpl;

import java.time.LocalDateTime;
import java.util.Optional;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import lombok.extern.slf4j.Slf4j;
import practica.practias.model.UserProgress;
import practica.practias.model.Enum.EstadoEjercicio;
import practica.practias.repository.RepositoryUserProgress;
import practica.practias.service.ProgressService;


@Slf4j
@Service
public class ProgressServiceImpl implements ProgressService{
  @Autowired
    private RepositoryUserProgress repositoryUserProgress;
    
    @Override
    @Transactional
    public void registrarIntento(String keycloakId, Long exerciseId) {
        log.debug("Registrando intento para usuario {} en ejercicio {}", keycloakId, exerciseId);
        
        UserProgress progreso = obtenerOCrearProgreso(keycloakId, exerciseId);
        
        // Incrementar contador de intentos
        progreso.incrementarIntentos();
        
        // Si es el primer intento, establecer fecha
        if (progreso.getEsPrimeraVez() && progreso.getFechaPrimerIntento() == null) {
            progreso.setFechaPrimerIntento(LocalDateTime.now());
        }
        
        repositoryUserProgress.save(progreso);
        
        log.info("Intento #{} registrado para usuario {} en ejercicio {}", 
            progreso.getTotalIntentos(), keycloakId, exerciseId);
    }
    
    @Override
    @Transactional
    public void marcarEjercicioComoCompletado(String keycloakId, Long exerciseId, Integer tiempoEjecucionMs) {
        log.debug("Marcando ejercicio {} como completado para usuario {} con tiempo {}ms", 
            exerciseId, keycloakId, tiempoEjecucionMs);
        
        UserProgress progreso = obtenerOCrearProgreso(keycloakId, exerciseId);
        
        // Marcar como completado (solo la primera vez)
        boolean esPrimeraCompletion = !progreso.estaCompletado();
        progreso.marcarComoCompletado();
        
        // Actualizar mejor tiempo si aplica
        progreso.actualizarMejorTiempo(tiempoEjecucionMs);
        
        repositoryUserProgress.save(progreso);
        
        if (esPrimeraCompletion) {
            log.info("🎉 Usuario {} completó por PRIMERA VEZ el ejercicio {} en {}ms", 
                keycloakId, exerciseId, tiempoEjecucionMs);
        } else {
            log.info("Usuario {} resolvió nuevamente el ejercicio {} en {}ms (mejor tiempo: {}ms)", 
                keycloakId, exerciseId, tiempoEjecucionMs, progreso.getMejorTiempoEjecucion());
        }
    }
    
    @Override
    @Transactional
    public UserProgress obtenerOCrearProgreso(String keycloakId, Long exerciseId) {
        Optional<UserProgress> existente = repositoryUserProgress.findByKeycloakIdAndExerciseId(keycloakId, exerciseId);
        
        if (existente.isPresent()) {
            return existente.get();
        }
        
        // Crear nuevo progreso
        UserProgress nuevoProgreso = new UserProgress();
        nuevoProgreso.setKeycloakId(keycloakId);
        nuevoProgreso.setExerciseId(exerciseId);
        
        // Determinar estado inicial del ejercicio
        EstadoEjercicio estadoInicial = determinarEstadoInicial(exerciseId);
        nuevoProgreso.setEstado(estadoInicial);
        
        UserProgress saved = repositoryUserProgress.save(nuevoProgreso);
        
        log.debug("Progreso creado para usuario {} en ejercicio {} con estado {}", 
            keycloakId, exerciseId, estadoInicial);
        
        return saved;
    }
    
    @Override
    public EstadoEjercicio obtenerEstadoEjercicio(String keycloakId, Long exerciseId) {
        Optional<UserProgress> progreso = repositoryUserProgress.findByKeycloakIdAndExerciseId(keycloakId, exerciseId);
        
        if (progreso.isPresent()) {
            return progreso.get().getEstado();
        }
        
        // Si no existe progreso, determinar estado inicial
        return determinarEstadoInicial(exerciseId);
    }
    
    @Override
    public boolean haCompletadoEjercicio(String keycloakId, Long exerciseId) {
        Optional<UserProgress> progreso = repositoryUserProgress.findByKeycloakIdAndExerciseId(keycloakId, exerciseId);
        
        return progreso.map(UserProgress::estaCompletado).orElse(false);
    }
    
    /**
     * Determina el estado inicial de un ejercicio basado en sus características
     */
    private EstadoEjercicio determinarEstadoInicial(Long exerciseId) {
        // Ejercicios 1-3 son básicos (siempre disponibles)
        if (exerciseId <= 3) {
            return EstadoEjercicio.DISPONIBLE;
        }
        
        // Ejercicios 4+ requieren premium (se validará en SecurityService)
        // Aquí solo retornamos DISPONIBLE, la validación de premium se hace en otra capa
        return EstadoEjercicio.DISPONIBLE;
    }
    
    // ===== MÉTODOS ADICIONALES PARA ESTADÍSTICAS =====
    
    /**
     * Obtiene estadísticas básicas de un usuario
     */
    public UserProgressStats obtenerEstadisticasUsuario(String keycloakId) {
        Long totalEjercicios = repositoryUserProgress.countTotalExercisesByUser(keycloakId);
        Long ejerciciosCompletados = repositoryUserProgress.countByKeycloakIdAndEstado(keycloakId, EstadoEjercicio.COMPLETADO);
        Long totalIntentos = repositoryUserProgress.sumTotalAttemptsByUser(keycloakId);
        Long intentosCorrectos = repositoryUserProgress.sumCorrectAttemptsByUser(keycloakId);
        
        // Manejar valores nulos
        totalEjercicios = totalEjercicios != null ? totalEjercicios : 0L;
        ejerciciosCompletados = ejerciciosCompletados != null ? ejerciciosCompletados : 0L;
        totalIntentos = totalIntentos != null ? totalIntentos : 0L;
        intentosCorrectos = intentosCorrectos != null ? intentosCorrectos : 0L;
        
        // Calcular tasa de éxito
        double tasaExito = totalIntentos > 0 ? (double) intentosCorrectos / totalIntentos * 100 : 0.0;
        
        return new UserProgressStats(
            totalEjercicios,
            ejerciciosCompletados,
            totalIntentos,
            intentosCorrectos,
            Math.round(tasaExito * 100.0) / 100.0
        );
    }
    
    /**
     * DTO interno para estadísticas
     */
    public static class UserProgressStats {
        public final Long totalEjercicios;
        public final Long ejerciciosCompletados;
        public final Long totalIntentos;
        public final Long intentosCorrectos;
        public final Double tasaExito;
        
        public UserProgressStats(Long totalEjercicios, Long ejerciciosCompletados, 
                               Long totalIntentos, Long intentosCorrectos, Double tasaExito) {
            this.totalEjercicios = totalEjercicios;
            this.ejerciciosCompletados = ejerciciosCompletados;
            this.totalIntentos = totalIntentos;
            this.intentosCorrectos = intentosCorrectos;
            this.tasaExito = tasaExito;
        }
    }
}
