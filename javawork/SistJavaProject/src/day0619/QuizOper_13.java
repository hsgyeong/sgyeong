package day0619;

import java.util.Scanner;

public class QuizOper_13 {

	public static void main(String[] args) {
		// TODO Auto-generated method stub

		/*
		 * 이름입력
		 * 강호동
		 * 키 
		 * 177.5
		 * 체중 
		 * 88
		 * 
		 *  **학생 신체 정보**
		 *  이름: 강호동
		 *  키: 177.5cm
		 *  체중: 88kg
		 * 
		 *  (표준몸무게: (키-100)*0.9
		 *  권장 표준 몸무게는 69.75kg 입니다*/
		
		Scanner sc=new Scanner(System.in);
		
		String name;
		double height;
		double weight;
		double st_weight;
		
		System.out.print("이름입력: ");
		name=sc.nextLine();
		System.out.print("키입력: ");
		height=sc.nextDouble();
		System.out.print("체중입력: ");
		weight=sc.nextDouble();
				
		
	    st_weight=(height-100*0.9);
		
		
		System.out.println("**학생 신체 정보**");
		System.out.println("이름: "+name);
		System.out.println("키: "+height+"cm");
		System.out.println("체중: "+weight+"kg");
		System.out.printf("권장 표준 몸무게:%.2f KG ",st_weight);
		
		
		
		
		
	}

}
