package pe.edu.upeu.msvcnotificaciones.kafka;


public class MensajeKafkaDTO {
    private String tipo;
    private String mensaje;
    private Long idComunidad;
    private Long idUsuarioReacion;
    private Long idUsuarioPublicacion;
    private Long idUsuarioComentario;

    public MensajeKafkaDTO() {
    }

    public MensajeKafkaDTO(Long idUsuarioComentario,Long idUsuarioReacion, Long idUsuarioPublicacion , Long idComunidad, String tipo, String mensaje) {
        this.tipo = tipo;
        this.idComunidad = idComunidad;
        this.mensaje = mensaje;
        this.idUsuarioReacion = idUsuarioReacion;
        this.idUsuarioPublicacion = idUsuarioPublicacion;
        this.idUsuarioComentario = idUsuarioComentario;
    }

    public Long getIdComunidad() {
        return idComunidad;
    }

    public void setIdComunidad(Long idComunidad) {
        this.idComunidad = idComunidad;
    }

    public String getTipo() {
        return tipo;
    }

    public void setTipo(String tipo) {
        this.tipo = tipo;
    }

    public String getMensaje() {
        return mensaje;
    }

    public void setMensaje(String mensaje) {
        this.mensaje = mensaje;
    }

    public Long getIdUsuarioReacion() {
        return idUsuarioReacion;
    }

    public void setIdUsuarioReacion(Long idUsuarioReacion) {
        this.idUsuarioReacion = idUsuarioReacion;
    }

    public Long getIdUsuarioPublicacion() {
        return idUsuarioPublicacion;
    }

    public void setIdUsuarioPublicacion(Long idUsuarioPublicacion) {
        this.idUsuarioPublicacion = idUsuarioPublicacion;
    }

    public Long getIdUsuarioComentario() {
        return idUsuarioComentario;
    }

    public void setIdUsuarioComentario(Long idUsuarioComentario) {
        this.idUsuarioComentario = idUsuarioComentario;
    }
}