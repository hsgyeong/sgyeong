package day0622;

import java.util.Scanner;

public class QuizForWhile_08 {

	public static void quiz1()
	{
		/*
		 나이를 반복해서 입력받는다
		 0이되면 빠져나와서 출력한다
		 나이가 50이상일 경우 a변수 증가
		 나이가 30이상일 경우 b변수 증가
		 그 나머지는 c변수 증가
		 
		 ==========================
		 50세이상: 3명
		 30세이상: 2명
		 그이외: 1명
		 
		 
		 */
			
		Scanner sc=new Scanner(System.in);
		
		int age;
		int a=0;
		int b=0;
		int c=0;
		
		while(true)
		{
			
			System.out.println("나이를 입력하세요");
			age=sc.nextInt();
			
			
			if(age>=50)
				a++;
			else if(age>=30)
				b++;
			else 
				c++;
			
			if(age==0)
			break;
			
			
				
		}
		
		System.out.println("================");
		System.out.println("50세이상: "+a+"명");
		System.out.println("30세이상: "+b+"명");
		System.out.println("그이외: "+c+"명");
		
		
		
	
	}
	
	public static void quiz2()
	{
		
	
	}
	
	public static void main(String[] args) {
		// TODO Auto-generated method stub
quiz1();
		
	}

}
