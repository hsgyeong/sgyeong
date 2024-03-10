package day0629_01; 
/* 부모클래스가 다른패키지에 있을 경우 protected, public 변수는 접근이 가능하다 
 * 같은 패키지인 경우에는 private만 빼고 모두 접근 가능하다*/


public class SuperObj {  //부모클래스

	protected String name;
	protected int age;
	
	public SuperObj(String name, int age) {  //생성자 만들기
		
		this.name=name;
		this.age=age;
		
	}

}
