package pe.edu.upeu.msvc_comunidad.kafka;

import com.fasterxml.jackson.core.JsonProcessingException;
import com.fasterxml.jackson.databind.ObjectMapper;
import org.springframework.kafka.core.KafkaTemplate;
import org.springframework.stereotype.Service;
import pe.edu.upeu.msvc_comunidad.kafka.dto.MensajeKafkaDTO;


@Service
public class KafkaProducerService {

    private final KafkaTemplate<String, String> kafkaTemplate;
    private final ObjectMapper objectMapper = new ObjectMapper();

    public KafkaProducerService(KafkaTemplate<String, String> kafkaTemplate) {
        this.kafkaTemplate = kafkaTemplate;
    }

    // Ahora recibe el topic como parámetro
    public void enviarMensaje(String topic, MensajeKafkaDTO dto) {
        try {
            String mensajeJson = objectMapper.writeValueAsString(dto);
            kafkaTemplate.send(topic, mensajeJson);
            System.out.println("📤 Mensaje enviado a Kafka al topic " + topic + ": " + mensajeJson);
        } catch (JsonProcessingException e) {
            throw new RuntimeException("Error al convertir mensaje a JSON", e);
        }
    }
}
