package pe.edu.upeu.msvcnotificaciones.client;

import org.springframework.cloud.openfeign.FeignClient;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;

@FeignClient(name = "msvc-comunidad")
public interface ComunidadClient {

    @GetMapping("/api/usuario_comunidad/{id}/miembros")
    Long[] obtenerIdsDeMiembros(@PathVariable("id") Long idComunidad);

}