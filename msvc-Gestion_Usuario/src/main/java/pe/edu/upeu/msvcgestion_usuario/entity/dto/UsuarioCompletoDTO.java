package pe.edu.upeu.msvcgestion_usuario.entity.dto;

import java.time.LocalDate;
import java.time.LocalDateTime;

import lombok.Builder;
import lombok.Data;
import pe.edu.upeu.msvcgestion_usuario.entity.Enum.EstadoUsuario;
import pe.edu.upeu.msvcgestion_usuario.entity.Enum.TipoSuscripcion;
@Data
@Builder
public class UsuarioCompletoDTO {
 // Datos de Keycloak
    private String username;
    private String email;
    private String nombre;
    private String apellido;
    private String pais;
    private LocalDate fechaNacimiento;
    
    // Datos de tu BD
    private Long id;
    private String keycloakId;
    private String idioma;
    private String fotoPerfil;
    private String biografia;
    private TipoSuscripcion tipoSuscripcion;
    private Boolean recibirNotificaciones;
    private LocalDateTime fechaCreacion;
    private EstadoUsuario estado;
}
