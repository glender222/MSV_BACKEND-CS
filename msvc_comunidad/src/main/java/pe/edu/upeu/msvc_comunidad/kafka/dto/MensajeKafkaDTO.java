package pe.edu.upeu.msvc_comunidad.kafka.dto;

public class MensajeKafkaDTO {
    private String tipo;
    private String mensaje;

    public MensajeKafkaDTO() {}

    public MensajeKafkaDTO(String tipo, String mensaje) {
        this.tipo = tipo;
        this.mensaje = mensaje;
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
}