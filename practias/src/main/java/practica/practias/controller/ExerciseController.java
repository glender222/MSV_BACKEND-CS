package practica.practias.controller;

import java.util.HashMap;
import java.util.List;
import java.util.Map;
import java.util.Optional;
import java.util.stream.Collectors;

import org.springframework.http.ResponseEntity;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestHeader;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;

import lombok.extern.slf4j.Slf4j;
import practica.practias.exception.AuthenticationRequiredException;
import practica.practias.exception.ExerciseNotFoundException;
import practica.practias.exception.PremiumRequiredException;
import practica.practias.exception.UserInactiveException;
import practica.practias.model.Exercises;
import practica.practias.service.ExercisesService;
import practica.practias.service.PermisosService;
import practica.practias.utils.JwtUtils;


@Slf4j
@RestController
@RequestMapping("/api/v1/ejercicios")
public class ExerciseController {


 private final ExercisesService exercisesService;
    private final PermisosService permisosService;
    private final JwtUtils jwtUtils;
    
    public ExerciseController(ExercisesService exercisesService, 
                            PermisosService permisosService,
                            JwtUtils jwtUtils) {
        this.exercisesService = exercisesService;
        this.permisosService = permisosService;
        this.jwtUtils = jwtUtils;
    }
  

    
    @GetMapping("/ALL")
    public ResponseEntity<List<Map<String, Object>>> getAllEjercicios() {
        List<Map<String, Object>> ejercicios = exercisesService.getAllExercises()
            .stream()
            .map(e -> {
                Map<String, Object> map = new HashMap<>();
                map.put("id", e.getId());
                map.put("nombre", e.getNombre());
                map.put("descripcion", e.getDescripcion());
                return map;
            })
            .collect(Collectors.toList());
        
        log.info("Devolviendo {} ejercicios totales (sin filtros)", ejercicios.size());
        return ResponseEntity.ok(ejercicios);
    }
    
  

    @GetMapping
    public ResponseEntity<List<Map<String, Object>>> obtenerEjercicios(
            @RequestHeader(value = "Authorization", required = false) String authHeader) {
        
        // Si no hay token, devolver solo ejercicios básicos (primeros 3)
        if (authHeader == null || !jwtUtils.esTokenValido(authHeader)) {
            log.info("Usuario sin autenticación, devolviendo ejercicios básicos");
            return ResponseEntity.ok(obtenerEjerciciosBasicos());
        }
        
        String keycloakId = jwtUtils.extraerKeycloakId(authHeader);
        String username = jwtUtils.extraerUsername(authHeader);
        
        // Verificar que el usuario esté activo
        if (!permisosService.esUsuarioActivo(keycloakId)) {
            throw new UserInactiveException("Usuario inactivo o suspendido", keycloakId);
        }
        
        // Verificar tipo de usuario
        boolean esPremium = permisosService.tieneAccesoPremium(keycloakId);
        
        List<Map<String, Object>> ejercicios;
        if (esPremium) {
            ejercicios = obtenerTodosLosEjercicios();
            log.info("Usuario premium {} ({}): acceso a {} ejercicios", 
                username, keycloakId, ejercicios.size());
        } else {
            ejercicios = obtenerEjerciciosParaGratuito();
            log.info("Usuario gratuito {} ({}): acceso a {} ejercicios básicos", 
                username, keycloakId, ejercicios.size());
        }
        
        // Actualizar último login de forma asíncrona
        permisosService.actualizarUltimoLogin(keycloakId);
        
        return ResponseEntity.ok(ejercicios);
    }
    
    /**
     * Obtener ejercicio específico por ID con verificaciones de permisos
     */
    @GetMapping("/{id}")
    public ResponseEntity<Map<String, Object>> getEjercicioById(
            @PathVariable Long id,
            @RequestHeader(value = "Authorization", required = false) String authHeader) {
        
        Optional<Exercises> ejercicioOpt = exercisesService.getExerciseById(id);
        
        if (ejercicioOpt.isEmpty()) {
            throw new ExerciseNotFoundException("Ejercicio no encontrado con ID: " + id, id);
        }
        
        Exercises ejercicio = ejercicioOpt.get();
        
        // Verificar si el ejercicio requiere premium (ejercicios con ID > 3)
        boolean requierePremium = id > 3;
        
        if (requierePremium) {
            // Si requiere premium, verificar autenticación
            if (authHeader == null || !jwtUtils.esTokenValido(authHeader)) {
                throw new AuthenticationRequiredException(
                    "Necesitas iniciar sesión para acceder a este ejercicio avanzado");
            }
            
            String keycloakId = jwtUtils.extraerKeycloakId(authHeader);
            String username = jwtUtils.extraerUsername(authHeader);
            
            // Verificar que el usuario esté activo
            if (!permisosService.esUsuarioActivo(keycloakId)) {
                throw new UserInactiveException("Usuario inactivo o suspendido", keycloakId);
            }
            
            // Verificar si tiene acceso premium
            boolean esPremium = permisosService.tieneAccesoPremium(keycloakId);
            if (!esPremium) {
                throw new PremiumRequiredException(
                    "Este ejercicio requiere suscripción Premium", 
                    ejercicio.getNombre(), 
                    id);
            }
            
            log.info("Usuario premium {} accedió al ejercicio {} ({})", 
                username, id, ejercicio.getNombre());
        } else {
            log.info("Acceso a ejercicio básico {} ({})", id, ejercicio.getNombre());
        }
        
        // Construir respuesta
        Map<String, Object> response = new HashMap<>();
        response.put("id", ejercicio.getId());
        response.put("nombre", ejercicio.getNombre());
        response.put("descripcion", ejercicio.getDescripcion());
        response.put("plantilla", ejercicio.getPlantilla());
        response.put("requierePremium", requierePremium);
        response.put("nivel", id <= 3 ? "BASICO" : (id <= 6 ? "INTERMEDIO" : "AVANZADO"));
        
        // Solo incluir pruebas si es usuario autenticado (para evitar ver respuestas)
        if (authHeader != null && jwtUtils.esTokenValido(authHeader)) {
            response.put("pruebas", ejercicio.getPruebas());
        }
        
        return ResponseEntity.ok(response);
    }
    
    // ===== MÉTODOS AUXILIARES PRIVADOS =====
    
    private List<Map<String, Object>> obtenerEjerciciosBasicos() {
        return exercisesService.getAllExercises()
            .stream()
            .limit(3)  // Solo primeros 3 ejercicios
            .map(this::mapearEjercicioBasico)
            .collect(Collectors.toList());
    }
    
    private List<Map<String, Object>> obtenerEjerciciosParaGratuito() {
        return exercisesService.getAllExercises()
            .stream()
            .map(e -> {
                Map<String, Object> map = mapearEjercicioBasico(e);
                // Marcar ejercicios bloqueados
                boolean desbloqueado = e.getId() <= 3;
                map.put("desbloqueado", desbloqueado);
                map.put("requierePremium", !desbloqueado);
                if (!desbloqueado) {
                    map.put("mensaje", "Requiere suscripción Premium");
                }
                return map;
            })
            .collect(Collectors.toList());
    }
    
    private List<Map<String, Object>> obtenerTodosLosEjercicios() {
        return exercisesService.getAllExercises()
            .stream()
            .map(e -> {
                Map<String, Object> map = mapearEjercicioBasico(e);
                map.put("desbloqueado", true);
                map.put("requierePremium", false);
                map.put("nivel", e.getId() <= 3 ? "BASICO" : (e.getId() <= 6 ? "INTERMEDIO" : "AVANZADO"));
                return map;
            })
            .collect(Collectors.toList());
    }
    
    private Map<String, Object> mapearEjercicioBasico(Exercises e) {
        Map<String, Object> map = new HashMap<>();
        map.put("id", e.getId());
        map.put("nombre", e.getNombre());
        map.put("descripcion", e.getDescripcion());
        map.put("tiempoCreacion", e.getTiempoCreacion());
        return map;
    }
}
