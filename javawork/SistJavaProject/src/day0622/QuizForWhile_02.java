package day0622;

import java.util.Scanner;

public class QuizForWhile_02 {

	public static void quiz1()
	{
		//점수를 반복해서 입력하면 합계를 구하시오
		//1~100 이 아니면 제외(continue)
		//0을 입력시 프로그램 종료(break)

		Scanner sc=new Scanner(System.in);
		
		int score; //입력할 점수
		int sum=0; 
		
		while(true)
		{	
			System.out.println("점수를 입력하시오");
			score=sc.nextInt();
			
			//break문
			if(score==0)
				break;
			
			//점수 잘못쓰면 끝나는게 아니고 다시 반복 쓸 수 있게
			if(score<1||score>100)
				continue;
			
			//합계
			sum+=score;  //sum=sum+score
			
		}
				
		System.out.println("총합계: "+sum);
	}
	
	public static void quiz2()
	{
		//점수를 반복해서 입력하면 합계, 평균을 구하시오
		//끝이라고 입력시 프로그램 종료
		
		Scanner sc=new Scanner(System.in);
		
		String score;
		int sum=0;
		int cnt=0;
		double avg=0;
		
		while(true)
		{
			System.out.println("점수를 입력하시오(끝이면 종료)");
			score=sc.nextLine();
			
			if(score.equals("끝"))
				break;				
				
			sum+=Integer.parseInt(score);
			cnt++;		
		
		}
		
		avg=(double)sum/cnt;
		
		System.out.println("합계: "+sum);
		System.out.println("평균: "+avg);
		
	}
	
	public static void quiz3()
	{
		/*
		  총 5개의 점수를 입력받아 합계를 구하시오(Scanner, for)
		  만약 1~100 이 아닐 경우 다시 입력받아라(continue)
		
		  1번점수: 88
		  2번점수: 99
		  3번점수: 200
		  		잘못입력했어요
		  3번점수: 33
		  4번점수
		  
		  ==============
		  합계: **점
		 */
		
		Scanner sc=new Scanner(System.in);
		int score;
		int sum=0;
		
		for(int i=1;i<=5;i++)
		{	
			System.out.print(i+"번 점수: ");
			score=sc.nextInt();
			
			if(score<1||score>100)
			{
			System.out.println("\t잘못입력했어요");
			i--;
			continue;
			
			}
				sum+=score;
		}
		System.out.println("====================");
		System.out.print("총점: "+sum);
		
	}
	
	public static void main(String[] args) {
		// TODO Auto-generated method stub
quiz3();
	}

}
