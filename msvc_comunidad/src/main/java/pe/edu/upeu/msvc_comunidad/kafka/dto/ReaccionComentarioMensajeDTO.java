package pe.edu.upeu.msvc_comunidad.kafka.dto;

public class ReaccionComentarioMensajeDTO extends  MensajeKafkaDTO{
    private Long idUsuarioReacion;
    private Long idUsuarioComentario;

    public ReaccionComentarioMensajeDTO() {
        super();
    }

    public ReaccionComentarioMensajeDTO(String tipo, String mensaje, Long idUsuarioReacion, Long idUsuarioComentario) {
        super(tipo, mensaje);
        this.idUsuarioReacion = idUsuarioReacion;
        this.idUsuarioComentario = idUsuarioComentario;
    }

    public Long getIdUsuarioReacion() {
        return idUsuarioReacion;
    }

    public void setIdUsuarioReacion(Long idUsuarioReacion) {
        this.idUsuarioReacion = idUsuarioReacion;
    }

    public Long getIdUsuarioComentario() {
        return idUsuarioComentario;
    }

    public void setIdUsuarioComentario(Long idUsuarioComentario) {
        this.idUsuarioComentario = idUsuarioComentario;
    }
}
