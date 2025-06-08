package pe.edu.upeu.msvcnotificaciones.client;

import org.springframework.cloud.openfeign.FeignClient;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import pe.edu.upeu.msvcnotificaciones.client.dto.UsuarioDto;
import pe.edu.upeu.msvcnotificaciones.client.dto.UsuarioPerfilDTO;

@FeignClient(name = "usuario-service")
public interface UsuarioClient {

    // Lista todos los id los usuarios
    @GetMapping("api/v1/usuarios/obtener/ids")
    Long[] obtenerTodosLosIds();

    //Usuario por id:
    @GetMapping("api/v1/usuarios/{id}")
    UsuarioDto obtenerusuario(@PathVariable Long id);

    //Perfil de keycloak
    @GetMapping("api/v1/usuarios/perfil/{keycloakId}")
    UsuarioPerfilDTO obtenerPerfilPorKeycloakId(@PathVariable String keycloakId);
}