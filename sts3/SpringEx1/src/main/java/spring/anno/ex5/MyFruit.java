package spring.anno.ex5;

import javax.annotation.Resource;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Component;

@Component
public class MyFruit {
	
	//@Autowired
	//정확하게 bean의 이름으로 주입
	@Resource(name="kfruit")   // > 변경해주면 출력문 바뀜
	Fruit fruit;
	
	public void writeFruit(){
		
		System.out.println("내가 좋아하는 과일은 **");
		fruit.writeFruitName();
	}
}

