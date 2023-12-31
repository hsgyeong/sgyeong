package day0615;

public class SpecialChar_05 {

	public static void main(String[] args) {
		// TODO Auto-generated method stub
		//문자열 내에서 특별한 의미로 해석되는 문자를 이스케이프 시퀀스(Escape Sequence)라고 함
		//이스케이프 시퀀스(Escape Sequence)는 모두 \로 시작함
		/*
		 * \t - 다음 탭 위치로 이동(tab하는 것만큼 띄어쓰기가 됨)
		 * \n - 다음 줄로 이동(엔터 기능 / println 기능)
		 * \" - 쌍따옴표
		 * \' - 소따옴표
		 * \\ - 백슬래시 기능
		 * :(콜론)은 특수문자 xx -> 문자열과 같이 작성하면 됨
		 * \(백슬래시)를 입력하는 건 특수문자를 입력하겠다는 것
		 * 여기서 특수문자는 "(쌍따옴표) 뿐임!
		 */
	

		System.out.println("Apple\tMellon");
		System.out.println("Orange\tKiwi\tBanana");
		System.out.println("Apple\\");
		System.out.println("Apple\"");
		System.out.println("Apple\'");
		//"Hello"
		System.out.println("\"Hello\"");
		//c:\
		System.out.println("c:\\");
		//Q. "red","green","blue" -> 출력해보기
		System.out.println("\"red\""+","+"\"green\""+","+"\"blue\"");
		System.out.println("\"red\",\"green\",\"blue\"");
	}

}
