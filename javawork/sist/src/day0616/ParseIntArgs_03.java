package day0616;

public class ParseIntArgs_03 {

	public static void main(String[] args) {
		/*[결과출력]
		 * 내이름은 홍성경
		 * 자바점수는 88
		 * 오라클점수는 77
		 * 두과목의 합계는 165점 입니다
		 */
		
		//변수선언
		
		String name=args[0];
		int java=Integer.parseInt(args[1]);
		int oracle=Integer.parseInt(args[2]);
		
		System.out.println("[결과출력]");
		System.out.println("내 이름은 "+name);
		System.out.println("자바 점수는 "+java);
		System.out.println("오라클 점수는 "+oracle);
		System.out.println("두 과목의 합계는 "+(java+oracle)+"입니다");

	}

}
