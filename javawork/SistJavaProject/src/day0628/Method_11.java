package day0628;

//메서드를 static으로 만들면 생성을 안해도 가져올 수 있음

/*
 메서드 작성요령
 접근제한자(public)+지정예약어(static)+결과리턴형(void or int or String)+메서드명(){};
 1.반복적인 코드를 줄여서 코드의 관리가 용이
 2.하나의 메서드는 한가지 기능만을 수행하도록 작성
 */
public class Method_11 {

	public static boolean aaa() {
		return false;
	}
	
	public static int bbb() {
		return 33;
	}
	
	public static int ccc(int x, int y) {
		
		int z=x+y;
		return z;
	}

	public static void main(String[] args) {
		// TODO Auto-generated method stub
		
		boolean a=aaa();
		System.out.println("a="+a);

		int b=bbb();
		System.out.println("b="+b);
		
		int c=ccc(10,20);
		System.out.println("c="+c);
	}

}
