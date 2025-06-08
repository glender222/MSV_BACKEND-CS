package practica.practias.model;

import java.time.LocalDateTime;

import lombok.Data;

@Data
public class Usuario {
  private Long id;
    private LocalDateTime fechaRegistro;
    private String correo;
    private String usuario;
    private String password;  // Solo para mapeo, no debería utilizarse en las respuestas
    private String estado;
    private Integer idRol;
}
