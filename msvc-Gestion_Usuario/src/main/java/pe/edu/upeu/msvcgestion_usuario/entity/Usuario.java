package pe.edu.upeu.msvcgestion_usuario.entity;

import jakarta.persistence.*;
import lombok.Getter;
import lombok.Setter;
import pe.edu.upeu.msvcgestion_usuario.entity.Enum.EstadoUsuario;
import pe.edu.upeu.msvcgestion_usuario.entity.Enum.TipoSuscripcion;


import java.time.LocalDateTime;
@Getter
@Setter
@Entity
@Table(name = "usuarios")
public class Usuario {
       
     
    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    private Long id;
    
    
    @Column(nullable = false, unique = true)
    private String keycloakId;
    
    
    private String idioma;
    private String fotoPerfil;
    

    // NUEVO CAMPO: solo el nombre (no username)
    @Column(nullable = false, length = 100)
    private String nombre;

    @Column(length = 500)
    private String biografia;
    
    @Enumerated(EnumType.STRING)
    @Column(nullable = false)
    private TipoSuscripcion tipoSuscripcion = TipoSuscripcion.GRATUITO;
    
    @Column(nullable = false)
    private Boolean recibirNotificaciones = true;
    
  
    @Column(nullable = false)
    private LocalDateTime fechaCreacion;
    
    private LocalDateTime ultimaActualizacion;
    private LocalDateTime ultimoLogin;
    
    @Enumerated(EnumType.STRING)
    @Column(nullable = false)
    private EstadoUsuario estado = EstadoUsuario.ACTIVO;
    

    @PrePersist
    protected void onCreate() {
        fechaCreacion = LocalDateTime.now();
    }
    
    @PreUpdate
    protected void onUpdate() {
        ultimaActualizacion = LocalDateTime.now();
    }
}
