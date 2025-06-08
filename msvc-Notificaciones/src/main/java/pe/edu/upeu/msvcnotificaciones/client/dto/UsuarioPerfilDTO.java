package pe.edu.upeu.msvcnotificaciones.client.dto;

public class UsuarioPerfilDTO {

    private String nombre;
    private String apellido;
    private String email;
    private String keycloakId;
    private boolean recibirNotificaciones;


    public UsuarioPerfilDTO(String nombre, String apellido, String email, String keycloakId, boolean recibirNotificaciones) {
        this.nombre = nombre;
        this.apellido = apellido;
        this.email = email;
        this.keycloakId = keycloakId;
        this.recibirNotificaciones = recibirNotificaciones;
    }

    public UsuarioPerfilDTO() {
    }

    public String getNombre() {
        return nombre;
    }

    public void setNombre(String nombre) {
        this.nombre = nombre;
    }

    public String getApellido() {
        return apellido;
    }

    public void setApellido(String apellido) {
        this.apellido = apellido;
    }

    public String getEmail() {
        return email;
    }

    public void setEmail(String email) {
        this.email = email;
    }

    public String getKeycloakId() {
        return keycloakId;
    }

    public void setKeycloakId(String keycloakId) {
        this.keycloakId = keycloakId;
    }

    public boolean isRecibirNotificaciones() {
        return recibirNotificaciones;
    }

    public void setRecibirNotificaciones(boolean recibirNotificaciones) {
        this.recibirNotificaciones = recibirNotificaciones;
    }
}
