package day0620;

import java.util.Scanner;

public class QuizOper_06 {

	public static void main(String[] args) {
		/*
		 이름을 입력하세요
		 강민호
		 3과목의 점수를 입력하세요
		 39
		 88
		 99
		 ========================
		 3과목점수: 39,88,99
		 평균: 75.333333333
		 -------------------------------------
		 ****합격조건: 평균이 70점 이상이고, 각과목이 40점이상이면 합격****
		 -------------------------------------
		 강민호님은 불합격입니다 
		 */
		
		Scanner sc=new Scanner(System.in);
		
		String name,msg;
		int a,b,c;
		double avg;
		
		System.out.println("이름을 입력하세요");
		name=sc.nextLine();
		System.out.println("3과목의 점수를 입력하세요");
		a=sc.nextInt();
		b=sc.nextInt();
		c=sc.nextInt();
		
		avg=(a+b+c)/3;
		
		if(avg>=70&&a>=40&&b>=40&&c>=40)
		msg="합격";
		else
		msg="불합격";
			
		System.out.println("======================");
		System.out.println("3과목점수: "+a+","+b+","+c);
		System.out.println("평균: "+avg);
		System.out.println("----------------------");
		System.out.println(name+"님은 "+msg+"입니다");   
			
		
		

	}

}
