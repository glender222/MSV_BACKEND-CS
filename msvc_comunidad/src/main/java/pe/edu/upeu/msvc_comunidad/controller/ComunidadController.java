package pe.edu.upeu.msvc_comunidad.controller;

import com.fasterxml.jackson.databind.ObjectMapper;
import org.springframework.http.HttpStatus;
import org.springframework.http.MediaType;
import org.springframework.http.ResponseEntity;
import org.springframework.web.bind.annotation.*;
import org.springframework.web.multipart.MultipartFile;
import pe.edu.upeu.msvc_comunidad.azure.AzureStorageService;
import pe.edu.upeu.msvc_comunidad.client.UsuarioClient;
import pe.edu.upeu.msvc_comunidad.entity.Comunidad;
import pe.edu.upeu.msvc_comunidad.kafka.KafkaProducerService;
import pe.edu.upeu.msvc_comunidad.kafka.dto.ComunidadMensajeDTO;
import pe.edu.upeu.msvc_comunidad.kafka.dto.MensajeKafkaDTO;
import pe.edu.upeu.msvc_comunidad.service.ComunidadService;

import java.time.LocalDate;
import java.util.List;

@RestController
@RequestMapping("/api/comunidades")
public class ComunidadController {

    private final ComunidadService comunidadService;
    private final KafkaProducerService kafkaProducerService;
    private final AzureStorageService azureStorageService;
    private final ObjectMapper objectMapper;
    private final UsuarioClient usuarioClient;

    public ComunidadController(UsuarioClient usuarioClient, ObjectMapper objectMapper, AzureStorageService azureStorageService, ComunidadService comunidadService, KafkaProducerService kafkaProducerService) {
        this.azureStorageService = azureStorageService;
        this.comunidadService = comunidadService;
        this.kafkaProducerService = kafkaProducerService;
        this.objectMapper = objectMapper;
        this.usuarioClient = usuarioClient;
    }

    //Listar:
    @GetMapping
    public List<Comunidad> listar() {
        return comunidadService.listar();
    }

    //agregar
    @PostMapping(consumes = MediaType.MULTIPART_FORM_DATA_VALUE)
    public ResponseEntity<?> crear(
            @RequestPart("comunidad") String comunidadJson,
            @RequestPart("imagen") MultipartFile imagen) {

        try {
            Comunidad comunidad = objectMapper.readValue(comunidadJson, Comunidad.class);

            //Validar el id_creador, existe?

            boolean existe = usuarioClient.existsById(comunidad.getId_creador());
            if (!existe) {
                return ResponseEntity.status(HttpStatus.BAD_REQUEST)
                        .body("El usuario que intenta crear comunidad, con id " + comunidad.getId_creador() + " no existe");
            }

            // para que se pueda ingresar ya que esta mandando string y esta siendo convertido en jsn
            comunidad.setId(null);

            // Subir la imagen a Azure y obtener el URL
            String urlLogo = azureStorageService.subirArchivo(imagen);
            comunidad.setFecha_creacion(LocalDate.now());
            comunidad.setUrlLogo(urlLogo); // Asignar el URL del logo a la comunidad


            // Guardar comunidad
            Comunidad comunidadGuardado = comunidadService.guardar(comunidad);

            // Enviar mensaje a Kafka
            ComunidadMensajeDTO dto = new ComunidadMensajeDTO (
                    "COMUNIDAD",
                    "Únete a la nueva comunidad " + comunidadGuardado.getNombre(),
                    comunidadGuardado.getId()
            );
            kafkaProducerService.enviarMensaje("notificaciones-comunidad", dto);

            return ResponseEntity.ok(comunidadGuardado);
        } catch (Exception e) {
            e.printStackTrace();
            return ResponseEntity.status(HttpStatus.BAD_REQUEST)
                    .body("Error al procesar la solicitud: " + e.getMessage());
        }
    }

    //BuscarPorID:
    @GetMapping("/{id}")
    public ResponseEntity<Object> obtenerPorId(@PathVariable Long id) {
        return comunidadService.buscarPorId(id)
                .map(comunidad -> ResponseEntity.<Object>ok(comunidad))
                .orElseGet(() ->
                        ResponseEntity.status(HttpStatus.NOT_FOUND)
                                .body("La comunidad con id " + id + " no existe")
                );
    }


    //Eliminar
    @DeleteMapping("/{id}")
    public ResponseEntity<?> eliminar(@PathVariable Long id) {
        return comunidadService.buscarPorId(id)
                .map(comunidad -> {
                    comunidadService.eliminar(id);
                    return ResponseEntity.noContent().build(); // 204 sin cuerpo
                })
                .orElseGet(() ->
                        ResponseEntity.status(HttpStatus.NOT_FOUND)
                                .body("La comunidad con id " + id + " no existe") // 404 con mensaje
                );
    }


    //editar
    @PutMapping(value = "{id}", consumes = MediaType.MULTIPART_FORM_DATA_VALUE)
    public ResponseEntity<?> editar(
            @PathVariable Long id,
            @RequestPart("comunidad") String comunidadJson,
            @RequestPart(value = "imagen", required = false) MultipartFile imagen) {

        try {
            // Convertir el JSON a un objeto Comunidad
            Comunidad comunidadEditada = objectMapper.readValue(comunidadJson, Comunidad.class);


            return comunidadService.buscarPorId(id).map(comunidadExistente -> {

                boolean existeUsuario = usuarioClient.existsById(comunidadEditada.getId_creador());
                if (!existeUsuario) {
                    return ResponseEntity.status(HttpStatus.BAD_REQUEST)
                            .body("El usuario con id " + comunidadEditada.getId_creador() + " no existe");
                }

                // Actualizar los campos
                comunidadExistente.setNombre(comunidadEditada.getNombre());
                comunidadExistente.setDescripcion(comunidadEditada.getDescripcion());
                comunidadExistente.setEstado(comunidadEditada.getEstado());
                comunidadExistente.setId_creador(comunidadEditada.getId_creador());

                // Si se envió una nueva imagen, subirla y actualizar la URL
                if (imagen != null && !imagen.isEmpty()) {
                    String nuevaUrlLogo = azureStorageService.subirArchivo(imagen);
                    comunidadExistente.setUrlLogo(nuevaUrlLogo);
                }

                Comunidad actualizada = comunidadService.guardar(comunidadExistente);
                return ResponseEntity.ok(actualizada);

            }).orElseGet(() ->
                    ResponseEntity.status(HttpStatus.NOT_FOUND)
                            .body("La comunidad con id " + id + " no existe")
            );

        } catch (Exception e) {
            e.printStackTrace();
            return ResponseEntity.status(HttpStatus.BAD_REQUEST)
                    .body("Error al procesar la solicitud: " + e.getMessage());
        }
    }


}
