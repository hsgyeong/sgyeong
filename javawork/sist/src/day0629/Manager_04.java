package day0629;

public class Manager_04 extends Employee_04{

	String buseo;
	
	public Manager_04(String name,int sal,String b) {
		super(name,sal);  //부모생성자 호출
		buseo=b;  //초기화
	}
	
	//public string getEmp() > 추상메서드. 구현부가 없음
	
	//하위클래스에서 부모클래스의 메서드를 수정해서 사용하는것: 오버라이딩
	//1.상속이 전제 2.메서드 이름 동일 3.리턴타입도 동일
	@Override //부모의 메서드를 오버라이딩함. 미완의 메서드를 가지고와서 완성해주는 것
	public String getEmp() {
		// TODO Auto-generated method stub
		return super.getEmp()+","+buseo;
	}
	
	
}
