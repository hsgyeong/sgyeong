package day0627;

public class QuizMain_10 {

	public static void main(String[] args) {
		// TODO Auto-generated method stub
		
		/*
		 *  **상품입고**
		 *  ----------------------
		 *  입고된 상점: 롯데마트
		 *  ----------------------
		 *  상품명: 딸기
		 *  가격: 10000원
		 *  수량: 5팩
		 *  ----------------------
		 *  상품명: 초코파이
		 *  가격: 5000원
		 *  수량: 10상자
		 *  ----------------------
		 *  상품명: 요거트
		 *  가격: 2500원
		 *  수량: 100팩
		 *  ----------------------
		 */
		
		Quiz_10 a1=new Quiz_10();
		
		a1.setSangpum("딸기");
		a1.setSu(5);
		a1.setDan(10000);
		
		Quiz_10 a2=new Quiz_10();
		
		a2.setSangpum("초코파이");
		a2.setSu(10);
		a2.setDan(5000);
		
		Quiz_10 a3=new Quiz_10();
		
		a3.setSangpum("요거트");
		a3.setSu(100);
		a3.setDan(2500);
		
		String sang1=a1.getSangpum();
		int su1=a1.getSu();
		int dan1=a1.getDan();
		
		String sang2=a2.getSangpum();
		int su2=a2.getSu();
		int dan2=a2.getDan();
		
		String sang3=a3.getSangpum();
		int su3=a3.getSu();
		int dan3=a3.getDan();
		
		System.out.println("**상품입고**");
		System.out.println("--------------------");
		System.out.println("입고된 상점: "+Quiz_10.SHOPNAME);
		System.out.println("--------------------");
		System.out.println("상품명: "+sang1);
		System.out.println("가격: "+dan1+"원");
		System.out.println("수량: "+su1+"팩");
		System.out.println("--------------------");
		System.out.println("상품명: "+sang2);
		System.out.println("가격: "+dan2+"원");
		System.out.println("수량: "+su2+"팩");
		System.out.println("--------------------");
		System.out.println("상품명: "+sang3);
		System.out.println("가격: "+dan3+"원");
		System.out.println("수량: "+su3+"팩");
		
		System.out.println("=====================");
		
		Quiz_10 q1=new Quiz_10();
		a1.setSangpum("딸기");
		a1.su=5;
		a1.dan=10000;
		System.out.println("상품명: "+a1.getSangpum());
		System.out.println("가격: "+a1.getDan()+"원");
		System.out.println("수량: "+a1.getSu());
	}

}
