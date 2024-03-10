package day0627;

public class QuizMain_09 {

	public static void main(String[] args) {
		// TODO Auto-generated method stub
		/* 멤버는 pruvate, 디폴트생성자
		 * 
		 * [쇼핑 목록]
		 * 
		 * 쇼핑장소: 이마트
		 * 
		 * 목록1 
		 * 상품명: 손선풍기
		 * 가격: 25000원
		 * 
		 * 목록2
		 * 상품명: 핸드폰충전기
		 * 가격: 30000원
		 * 
		 * 목록3
		 * 상품명: 이어폰
		 * 가격: 70000원
		 */
		
		System.out.println("\t[쇼핑목록]");
		
		System.out.println("쇼핑장소: "+Quiz_09.SHOPNAME);
		
		Quiz_09 q1=new Quiz_09();
		
		q1.setSangName("손선풍기");
		q1.setPrice(25000);
		
		String sang1=q1.getSangName();
		int pri1=q1.getPrice();
		
		System.out.println("상품명: "+sang1);
		System.out.println("가격: "+pri1+"원");
		
		System.out.println("===========================");
		System.out.println("쇼핑장소: "+Quiz_09.SHOPNAME);
		
		Quiz_09 q2=new Quiz_09();
		q2.setSangName("핸드폰충전기");
		q2.setPrice(35000);
		
		String sang2=q2.getSangName();
		int pri2=q2.getPrice();
		
		System.out.println("상품명: "+sang2);
		System.out.println("가격: "+pri2+"원");
		
		System.out.println("============================");
		System.out.println("쇼핑장소: "+Quiz_09.SHOPNAME);
		
		Quiz_09 q3=new Quiz_09();
		q3.setSangName("이어폰");
		q3.setPrice(70000);
		
		String sang3=q3.getSangName();
		int pri3=q3.getPrice();
		
		System.out.println("상품명: "+sang3);
		System.out.println("가격: "+pri3+"원");
		
	}

}
