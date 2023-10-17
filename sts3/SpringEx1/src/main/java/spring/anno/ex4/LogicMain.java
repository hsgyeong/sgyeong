package spring.anno.ex4;

import org.springframework.context.ApplicationContext;
import org.springframework.context.support.ClassPathXmlApplicationContext;

public class LogicMain {

	public static void main(String[] args) {
		// TODO Auto-generated method stub
		
		ApplicationContext anno1=new ClassPathXmlApplicationContext("annoContext4.xml");
		
		LogicController logic1=(LogicController)anno1.getBean("logic");
													//LogicController에서 @Component 옆에 ("logic")을 지우면
													//getBean("LogicController")로 바꿔준다
		
		logic1.insert("어노테이션 연습");
		logic1.delete("1");
	}

}
