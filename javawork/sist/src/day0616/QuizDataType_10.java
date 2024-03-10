package day0616;

public class QuizDataType_10 {

	public static void main(String[] args) {
		/* 매개변수를(args)를 이용하여 출력해보세요
		 * [시험결과]
		 * Java=88, Jsp=77, Spring=99
		 * 총점: 264점
		 * 평균: 88.00점
		 */
		
		//1.변수선언&계산
		int Java=Integer.parseInt(args[0]);
		int Jsp=Integer.parseInt(args[1]);
		int Spring=Integer.parseInt(args[2]);
		int count=3;
		int total=Java+Jsp+Spring;
		
		double avg1=total/count; //결과가 무조건 int
		double avg2=(double)total/count; //결과가 double
		
		System.out.println("[시험결과]");
		System.out.printf("Java=%d, Jsp=%d, Spring=%d\n", Java, Jsp, Spring);
		System.out.println("총점: "+total+"점");
		System.out.printf("평균:%.2f",avg1);
		
	}

}
