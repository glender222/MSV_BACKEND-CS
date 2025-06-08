package practica.practias.model.dto;

import java.time.LocalDateTime;

import lombok.Data;
import practica.practias.model.Enum.EstadoUsuario;
import practica.practias.model.Enum.TipoSuscripcion;

@Data
public class UsuarioResponseDTO {
    private Long id;
    private String keycloakId;
    private String nombre;
    private String idioma;
    private String fotoPerfil;
    private String biografia;
    private TipoSuscripcion tipoSuscripcion;  // ← Campo clave para verificar permisos
    private Boolean recibirNotificaciones;
    private LocalDateTime fechaCreacion;
    private EstadoUsuario estado;
}
