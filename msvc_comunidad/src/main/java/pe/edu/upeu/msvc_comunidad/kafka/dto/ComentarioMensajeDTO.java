package pe.edu.upeu.msvc_comunidad.kafka.dto;

public class ComentarioMensajeDTO extends MensajeKafkaDTO {

    private Long idUsuarioComentario;
    private Long idUsuarioPublicacion;

    public ComentarioMensajeDTO() {
        super();
    }

    public ComentarioMensajeDTO(String tipo, String mensaje, Long idUsuarioComentario, Long idUsuarioPublicacion) {
        super(tipo, mensaje);
        this.idUsuarioComentario = idUsuarioComentario;
        this.idUsuarioPublicacion = idUsuarioPublicacion;
    }

    public Long getIdUsuarioComentario() {
        return idUsuarioComentario;
    }

    public void setIdUsuarioComentario(Long idUsuarioComentario) {
        this.idUsuarioComentario = idUsuarioComentario;
    }

    public Long getIdUsuarioPublicacion() {
        return idUsuarioPublicacion;
    }

    public void setIdUsuarioPublicacion(Long idUsuarioPublicacion) {
        this.idUsuarioPublicacion = idUsuarioPublicacion;
    }
}
