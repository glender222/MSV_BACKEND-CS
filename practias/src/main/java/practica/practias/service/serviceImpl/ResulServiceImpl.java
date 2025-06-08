package practica.practias.service.serviceImpl;

import java.time.LocalDateTime;
import java.util.List;
import java.util.Optional;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import practica.practias.model.Result;
import practica.practias.model.Solution;
import practica.practias.repository.RepositoryResult;
import practica.practias.service.ResultService;

@Service
public class ResulServiceImpl implements ResultService{
 private static final Logger logger = LoggerFactory.getLogger(ResulServiceImpl.class);
    
    @Autowired
    private RepositoryResult repositoryResult;

     @Override
    public Result saveResult(Result result) {
        logger.info("Guardando resultado para solución ID: {}", 
                result.getSolution() != null ? result.getSolution().getId() : "null");
        return repositoryResult.save(result);
    }

    @Override
    public Optional<Result> findById(Long id) {
        return repositoryResult.findById(id);
    }

    @Override
    public Optional<Result> findBySolution(Solution solution) {
        return repositoryResult.findBySolution(solution);
    }

    @Override
    public Result updateResultStatus(Result result, String estado, List<String> errores, Float tiempoEjecucion) {
        result.setEstado(estado);
        
        // Limpiar errores existentes y añadir los nuevos
        result.getErrores().clear();
        if (errores != null && !errores.isEmpty()) {
            result.getErrores().addAll(errores);
        }
        
        // Actualizar tiempo de ejecución si se proporciona
        if (tiempoEjecucion != null) {
            result.setTiempoEjecucion(tiempoEjecucion);
        }
        
        logger.info("Actualizando resultado ID: {}. Estado: {}, Errores: {}", 
                result.getId(), estado, errores != null ? errores.size() : 0);
                
        return saveResult(result);
    }
    
    @Override
    public Result createResultForSolution(Solution solution) {
        Result result = new Result();
        result.setSolution(solution);
        result.setFechaEvaluacion(LocalDateTime.now());
        result.setEstado("PENDIENTE");
        return saveResult(result);
    }

}
