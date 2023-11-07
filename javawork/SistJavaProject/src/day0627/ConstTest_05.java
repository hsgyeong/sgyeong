package day0627;

class ConstA{
	
	int num=0;
	
	//디폴트 생성자... 명시적인 생성자를 만들면 디폴트 생성자는 자동생성 되지 않는다
	//필요하면 만들어준다
	public ConstA() {
		num=10;
		System.out.println("디폴트 생성자");
	}
	
	//인자있는 생성자
	public ConstA(int num) {
		this.num=num;  //같은 이름일때 가리키는 레퍼런스가 무엇인지 this로 나타내주어야함
	
		System.out.println("생성자 호출");
	}
	
	//메서드
	public int getNumber() {
		 //void가 아니라면 무조건 return해주어야 함
		num=50;
		
		return num;
	}
		
}


////////////////////////////////
public class ConstTest_05 {

	public static void main(String[] args) {
		// TODO Auto-generated method stub

		//명시적생성자(인자값으로 num을 보낸 생성자)
		ConstA ca1=new ConstA(30);          //생성과 동시에 인자값을 보내 출력, 생성과 동시에 바로 수정 가능
		System.out.println(ca1.num);
	
		//디폴트생성자
		ConstA ca2=new ConstA();
		System.out.println(ca2.num);
		
		//메서드 호출
		ConstA ca3=new ConstA();               //생성을 하고 메서드 호출
		// ca3.num=10000;
		System.out.println(ca3.getNumber());

	
	}

}
