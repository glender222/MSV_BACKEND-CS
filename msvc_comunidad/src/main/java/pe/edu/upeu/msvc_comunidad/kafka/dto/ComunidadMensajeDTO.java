package pe.edu.upeu.msvc_comunidad.kafka.dto;

public class ComunidadMensajeDTO extends MensajeKafkaDTO {

    private Long idComunidad;

    public ComunidadMensajeDTO() {
        super();
    }

    public ComunidadMensajeDTO(String tipo, String mensaje, Long idComunidad) {
        super(tipo, mensaje);
        this.idComunidad = idComunidad;
    }

    public Long getIdComunidad() {
        return idComunidad;
    }

    public void setIdComunidad(Long idComunidad) {
        this.idComunidad = idComunidad;
    }
}
