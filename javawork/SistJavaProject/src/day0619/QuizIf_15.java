package day0619;

import java.util.Scanner;

public class QuizIf_15 {

	public static void main(String[] args) {
		// 
		/* 당신의 점수는? 88
		 * ================================
		 * 90점이상: 장학생    80점이상: 우수상    80점미만: 재시험
		 * ================================
		 * 당신은 88점이므로 평가는 우수상
		 */
		
		
		/* int score=88;
		String grade;
		
		if (score>=90)
		grade="장학생";
		else if (score>=80)
		grade="우수상";
		else
		grade="재시험";
		
		System.out.println("당신은 "+score+"점이므로 평가는 "+grade); */
		
		int score=88;
		String grade;
		
		grade = score>=90?"장학생":score>=80?"우수상":"재시험"; 
		
		System.out.println("당신은 "+score+"점이므로 평가는 "+grade);
	
		/* Scanner sc=new Scanner(System.in);
		int score;
		String msg;
		
		//입력
		System.out.println("당신의 점수는? ");
		score=sc.nextInt();
		
		//점수별평가
		msg=score>=90?"장학생":
				score>=80?"우수상":"재시험";
				
		//결과출력
				System.out.println("당신은 "+score+"점 이므로 평가는 "+msg); */
				
						
		
		
		
		
		
		
		
		

	}

}