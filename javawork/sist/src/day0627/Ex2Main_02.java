package day0627;

public class Ex2Main_02 {

	public static void main(String[] args) {
		// TODO Auto-generated method stub

		System.out.println(Ex2Object_02.width);
		System.out.println(Ex2Object_02.height);
		
		//클래스변수
		Ex2Object_02.width=10;
		Ex2Object_02.height=20;
		
		System.out.println(Ex2Object_02.width);
		System.out.println(Ex2Object_02.height);
		
		//인스턴스 생성후 변수 호출가능
		Ex2Object_02 card1=new Ex2Object_02();
		
		System.out.println(card1.kind);//null
		System.out.println(card1.number);//0
		
		card1.kind="Heart";
		card1.number=4;
		
		System.out.println(card1.kind);
		System.out.println(card1.number);
		
		//인스턴스 변수 생성후 멤버값 변경후 출력
		
		Ex2Object_02 card2=new Ex2Object_02();
		
		card2.kind="Diamond";
		card2.number=2;
		
		System.out.println(card2.kind);
		System.out.println(card2.number);
		
	}

}
