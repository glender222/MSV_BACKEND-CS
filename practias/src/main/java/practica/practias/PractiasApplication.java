package practica.practias;

import org.springframework.boot.SpringApplication;
import org.springframework.boot.autoconfigure.SpringBootApplication;
import org.springframework.cloud.openfeign.EnableFeignClients;


@SpringBootApplication
@EnableFeignClients
public class PractiasApplication {

	public static void main(String[] args) {
		SpringApplication.run(PractiasApplication.class, args);
	}

}
