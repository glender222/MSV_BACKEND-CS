package practica.practias.Client;

import org.springframework.cloud.openfeign.FeignClient;
import org.springframework.http.ResponseEntity;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PutMapping;


import practica.practias.model.dto.UsuarioResponseDTO;


@FeignClient(
    name = "usuario-service",    // Nombre del servicio en Eureka
    path = "/api/v1/usuarios"    // Base path del controller
)
public interface UsuarioClient {
 
 @GetMapping("/keycloak/{keycloakId}")
    ResponseEntity<UsuarioResponseDTO> obtenerPorKeycloakId(@PathVariable String keycloakId);
    
    @PutMapping("/ultimo-login/{keycloakId}")
    ResponseEntity<Void> actualizarUltimoLogin(@PathVariable String keycloakId);
    
    // Para verificaciones adicionales
    @GetMapping("/exists/{id}")
    ResponseEntity<Boolean> existePorId(@PathVariable Long id);

}
