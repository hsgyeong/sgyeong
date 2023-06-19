package day0619;

import java.util.Calendar;
import java.util.Scanner;

public class ScannerMyAge_05 {

	public static void main(String[] args) {
		/* 당신의 이름은? 김민희
		 * 당신의 출생년도는? 1997년
		 * =========================
		 * 이름: 김민희
		 * 현재년도: 2023년
		 * 나이: 26세
		 */
		
		
		Scanner sc=new Scanner (System.in);
		
		String name;
		int year;
		
		System.out.print("당신의 이름은?: ");
		name=sc.nextLine();
		
		System.out.print("당신의 출생년도는? ");
		year=sc.nextInt();
		
		Calendar cal=Calendar.getInstance();
		
		int curYear=cal.get(cal.YEAR);
		int age=curYear-year;
		
		
		System.out.println("===================");
		
		System.out.println("이름: "+name);
		System.out.println("현재년도: "+year+"년");
		System.out.println("나이: "+age+"세");
		

	}

}
