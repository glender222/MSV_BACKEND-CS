package pe.edu.upeu.msvc_comunidad.controller;

import org.springframework.http.ResponseEntity;
import org.springframework.web.bind.annotation.*;
import pe.edu.upeu.msvc_comunidad.entity.ArchivoPublicacion;
import pe.edu.upeu.msvc_comunidad.entity.Publicacion;
import pe.edu.upeu.msvc_comunidad.service.ArchivoPublicacionService;

import java.util.List;

@RestController
@RequestMapping("/api/archivo_publicaciones")
public class ArchivoPublicacionController {

    private ArchivoPublicacionService archivoPublicacionService;

    public ArchivoPublicacionController(ArchivoPublicacionService archivoPublicacionService) {
        this.archivoPublicacionService = archivoPublicacionService;
    }

    //Listar:
    @GetMapping
    public List<ArchivoPublicacion> listar() {
        return archivoPublicacionService.listar();
    }

    //Crear:
    @PostMapping
    public ResponseEntity<ArchivoPublicacion> crear(@RequestBody ArchivoPublicacion archivoPublicacion) {
       ArchivoPublicacion arch = archivoPublicacionService.guardar(archivoPublicacion);

       return ResponseEntity.ok().body(arch);
    }

    //Buscar por id:
    @GetMapping("/{id}")
    public ResponseEntity<ArchivoPublicacion> obtenerid(@PathVariable Long id) {
        return archivoPublicacionService.buscarPorId(id)
                .map(ResponseEntity::ok)
                .orElse(ResponseEntity.notFound().build());
    }

    //Eliminar
    @DeleteMapping("/{id}")
    public ResponseEntity<ArchivoPublicacion> eliminar(@PathVariable Long id) {
        archivoPublicacionService.eliminar(id);
        return ResponseEntity.noContent().build();
    }

    //Editar:
    @PutMapping("/{id}")
    public ResponseEntity<ArchivoPublicacion> actualizar(@PathVariable Long id, @RequestBody ArchivoPublicacion archivoPublicacion) {
        return archivoPublicacionService.buscarPorId(id).map(publicacionExiste ->{

            publicacionExiste.setUrl_archivo(archivoPublicacion.getUrl_archivo());
            publicacionExiste.setTipo_publicacion(archivoPublicacion.getTipo_publicacion());
            publicacionExiste.setPublicacion(archivoPublicacion.getPublicacion());

            ArchivoPublicacion archivopublicionActual = archivoPublicacionService.guardar(publicacionExiste);

            return ResponseEntity.ok(archivopublicionActual);
        }).orElse(ResponseEntity.notFound().build());
    }


}
