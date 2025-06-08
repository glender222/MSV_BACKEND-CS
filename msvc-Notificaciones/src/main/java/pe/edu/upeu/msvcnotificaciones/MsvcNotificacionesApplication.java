package pe.edu.upeu.msvcnotificaciones;

import org.springframework.boot.SpringApplication;
import org.springframework.boot.autoconfigure.SpringBootApplication;
import org.springframework.cloud.openfeign.EnableFeignClients;

@SpringBootApplication
@EnableFeignClients(basePackages = "pe.edu.upeu.msvcnotificaciones.client")
public class MsvcNotificacionesApplication {

    public static void main(String[] args) {
        SpringApplication.run(MsvcNotificacionesApplication.class, args);
    }

}
