package practica.practias.service;

import practica.practias.model.UserProgress;
import practica.practias.model.Enum.EstadoEjercicio;

public interface ProgressService {
   
    /**
     * Registra un intento de solución para un ejercicio
     */
    void registrarIntento(String keycloakId, Long exerciseId);
    
    /**
     * Marca un ejercicio como completado exitosamente
     */
    void marcarEjercicioComoCompletado(String keycloakId, Long exerciseId, Integer tiempoEjecucionMs);
    
    /**
     * Obtiene o crea el progreso de un usuario para un ejercicio
     */
    UserProgress obtenerOCrearProgreso(String keycloakId, Long exerciseId);
    
    /**
     * Obtiene el estado actual de un ejercicio para un usuario
     */
    EstadoEjercicio obtenerEstadoEjercicio(String keycloakId, Long exerciseId);
    
    /**
     * Verifica si un usuario ha completado un ejercicio
     */
    boolean haCompletadoEjercicio(String keycloakId, Long exerciseId);
}
