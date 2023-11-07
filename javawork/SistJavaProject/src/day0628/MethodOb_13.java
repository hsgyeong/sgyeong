package day0628;

public class MethodOb_13 {
                                    //전달값
	
	
	public static void hello(int age, double height) {
		                           
		System.out.println("안녕");
		System.out.println("제 나이는 "+age+"세 입니다");
		System.out.println("저의 키는 "+height+"cm 입니다");
	}
	
	public static void main(String[] args) {
		// 클래스의 모든 시작은 메인
		// 바깥에서 메서드를 만들어도 메인에서 호출이 되지 않으면 출력되지 않음

		System.out.println("메서드 연습시작!!!");
		hello(33,173.8);
		
		goodbye();
		System.out.println("메서드 연습 끝!!!");
		
	}
	
	public static void goodbye()
	{
		System.out.println("담에 봬요~");
	}

}
