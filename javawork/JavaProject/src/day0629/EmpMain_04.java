package day0629;

public class EmpMain_04 {

	public static void main(String[] args) {
		// 최지우, 2500000, 기획경영부라고 출력하려면
		
		Manager_04 man=new Manager_04("최지우", 2500000, "기획경영부");
		
		System.out.println(man.getEmp());  //재정의된 메서드 호출 > 오버라이딩 
		//오버라이딩 받는 이유? 메서드를 재정의하기 위해서 변수화 해서 출력
		

	}

}
