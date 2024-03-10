package spring.anno.ex5;

import javax.annotation.Resource;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Component;

@Component
public class MyFruit {
	
	//@Autowired
	//��Ȯ�ϰ� bean�� �̸����� ����
	@Resource(name="kfruit")   // > �������ָ� ��¹� �ٲ�
	Fruit fruit;
	
	public void writeFruit(){
		
		System.out.println("���� �����ϴ� ������ **");
		fruit.writeFruitName();
	}
}

