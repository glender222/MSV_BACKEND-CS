package pe.edu.upeu.msvc_comunidad;

import org.springframework.boot.SpringApplication;
import org.springframework.boot.autoconfigure.SpringBootApplication;
import org.springframework.cloud.openfeign.EnableFeignClients;

@SpringBootApplication
@EnableFeignClients(basePackages = "pe.edu.upeu.msvc_comunidad.client")
public class MsvcComunidadApplication {

    public static void main(String[] args) {
        SpringApplication.run(MsvcComunidadApplication.class, args);
    }

}
