package pe.edu.upeu.msvcgestion_usuario.entity.dto;

import java.time.LocalDate;

import jakarta.validation.constraints.Email;
import jakarta.validation.constraints.NotBlank;
import jakarta.validation.constraints.Size;
import lombok.Data;

@Data

public class UsuarioRegistroDTO {
    @NotBlank(message = "Username es obligatorio")
    @Size(min = 3, max = 50, message = "Username debe tener entre 3 y 50 caracteres")
    private String username;


    @NotBlank(message = "Email es obligatorio")
    @Email(message = "Email debe ser válido")
    private String email;
    
    @NotBlank(message = "Password es obligatorio")
    @Size(min = 8, message = "Password debe tener al menos 8 caracteres")
    private String password;
    
    @NotBlank(message = "Nombre es obligatorio")
    private String nombre;
    
    @NotBlank(message = "Apellido es obligatorio")
    private String apellido;
    
    private String pais;
    private LocalDate fechaNacimiento;
}
