package pe.edu.upeu.msvcgestion_usuario.entity.dto;

import java.time.LocalDateTime;

import lombok.Builder;
import lombok.Data;
import pe.edu.upeu.msvcgestion_usuario.entity.Enum.EstadoUsuario;
import pe.edu.upeu.msvcgestion_usuario.entity.Enum.TipoSuscripcion;
@Data
@Builder
public class UsuarioResponseDTO {
private Long id;
    private String keycloakId;
    private String idioma;
    private String nombre; // SOLO NOMBRE, no username
    private String fotoPerfil;
    private String biografia;
    private TipoSuscripcion tipoSuscripcion;
    private Boolean recibirNotificaciones;
    private LocalDateTime fechaCreacion;
    private EstadoUsuario estado;

}
