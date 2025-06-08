package pe.edu.upeu.msvcnotificaciones.client.dto;

public class UsuarioDto {

    private Long id;
    private String nombre;
    private String keycloakId;

    public UsuarioDto(Long id, String nombre, String keycloakId) {
        this.id = id;
        this.nombre = nombre;
        this.keycloakId = keycloakId;
    }

    public UsuarioDto() {
    }

    public Long getId() {
        return id;
    }

    public void setId(Long id) {
        this.id = id;
    }

    public String getNombre() {
        return nombre;
    }

    public void setNombre(String nombre) {
        this.nombre = nombre;
    }

    public String getKeycloakId() {
        return keycloakId;
    }

    public void setKeycloakId(String keycloakId) {
        this.keycloakId = keycloakId;
    }
}
