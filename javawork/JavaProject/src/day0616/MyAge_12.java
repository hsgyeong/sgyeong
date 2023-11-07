package day0616;

import java.util.Calendar;

public class MyAge_12 {

	public static void main(String[] args) {
		// 매개변수 args에서 실행시 이름과 태어난 연도를 보낸후 출력하세요(name, myBirth)
		// 이름: 이민규
		// 태어난 연도: 1997년도
		// 나이: 27세
		
		// 현재년도는 Calendar import하여 구할 수 있다
		// 1.import
		// 2.변수
		// 3.계산
		// 4.출력
		
		Calendar cal=Calendar.getInstance();
		
		String name=args[0];
		int myBirth=Integer.parseInt(args[1]);
		
		int curYear=cal.get(cal.YEAR); //현재년도
		int myAge=curYear-myBirth;
		
		System.out.println("이름: "+name);
		System.out.println("태어난 연도: "+myBirth+"년");
		System.out.println("나이: "+myAge+"세");
		

	}

}
