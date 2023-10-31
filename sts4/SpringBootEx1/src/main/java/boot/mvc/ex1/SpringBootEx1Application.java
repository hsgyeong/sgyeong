package boot.mvc.ex1;

import org.springframework.boot.SpringApplication;
import org.springframework.boot.autoconfigure.SpringBootApplication;
import org.springframework.context.annotation.ComponentScan;

@SpringBootApplication
@ComponentScan({"boot.test","hello.boot", "my.info"}) //package등록 복수로 했을 떄 
//@ComponentScan({"hello.boot"}) //package명을 써줘야 함
public class SpringBootEx1Application {

	public static void main(String[] args) {
		SpringApplication.run(SpringBootEx1Application.class, args);
	}

}
