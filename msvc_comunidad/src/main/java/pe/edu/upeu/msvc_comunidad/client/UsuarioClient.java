package pe.edu.upeu.msvc_comunidad.client;

import org.springframework.cloud.openfeign.FeignClient;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;


@FeignClient(name = "usuario-service")
public interface UsuarioClient {

    @GetMapping("api/v1/usuarios/exists/{id}")
    boolean existsById(@PathVariable("id") Long id);

}