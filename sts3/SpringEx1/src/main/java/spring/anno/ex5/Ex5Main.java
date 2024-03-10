package spring.anno.ex5;

import org.springframework.context.ApplicationContext;
import org.springframework.context.support.ClassPathXmlApplicationContext;

public class Ex5Main {

	public static void main(String[] args) {
		// TODO Auto-generated method stub
		
		ApplicationContext app=
				new ClassPathXmlApplicationContext("annoContext4.xml");
	
		Fruit fruit=(KoreaFruit)app.getBean("kfruit");
		fruit.writeFruitName();
		
		MyFruit myfruit=(MyFruit)app.getBean("myFruit"); //아무것도 등록 안 했을때는 앞글자만 소문자로 해서 자동 등록
		myfruit.writeFruit();
	}

}
