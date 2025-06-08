package pe.edu.upeu.msvc_comunidad.kafka.dto;


public class ReaccionPublicacionMensajeDTO  extends MensajeKafkaDTO {

    private Long idUsuarioReacion;
    private Long idUsuarioPublicacion;

    public ReaccionPublicacionMensajeDTO() {
        super();
    }


    public ReaccionPublicacionMensajeDTO(String tipo, String mensaje, Long idUsuarioReacion, Long idUsuarioPublicacion) {
        super(tipo, mensaje);
        this.idUsuarioReacion = idUsuarioReacion;
        this.idUsuarioPublicacion = idUsuarioPublicacion;
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
}
