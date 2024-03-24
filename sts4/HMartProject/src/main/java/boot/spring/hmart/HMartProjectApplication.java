package boot.spring.hmart;

import org.springframework.boot.SpringApplication;
import org.springframework.boot.autoconfigure.SpringBootApplication;
import org.springframework.boot.autoconfigure.domain.EntityScan;
import org.springframework.context.annotation.ComponentScan;
import org.springframework.data.jpa.repository.config.EnableJpaRepositories;

@SpringBootApplication
@ComponentScan({"hmart.data.*"})
@ComponentScan("boot.spring.hmart")
@EntityScan("hmart.data.dto")
@EnableJpaRepositories("hmart.data.dao")
public class HMartProjectApplication {

	public static void main(String[] args) {
		SpringApplication.run(HMartProjectApplication.class, args);
	}

}
