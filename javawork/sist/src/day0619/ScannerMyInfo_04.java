package day0619;

import java.util.Scanner;

public class ScannerMyInfo_04 {

	public static void main(String[] args) {
		/* Scanner 이용할것
		 * 이름을 입력하세요: 홍길동
		 * 핸드폰번호: 010-1234-5678
		 * 주소: 서울시 강남구
		 * ========================
		 * [개인정보]
		 * 이름: 홍길동
		 * 연락처: 010-1234-5678
		 * 주소: 서울시 강남구
		 */
		
		Scanner sc=new Scanner(System.in);
		
		String name, hp, addr;
		
		System.out.println("이름을 입력하세요: ");
		name=sc.nextLine();
		
		System.out.println("핸드폰번호: ");
		hp=sc.nextLine();
		
		System.out.println("주소: ");
		addr=sc.nextLine();
		
		System.out.println("==============");
		System.out.println("[개인정보]");
		System.out.println("이름: "+name);
		System.out.println("연락처: "+hp);
		System.out.println("주소: "+addr);
		
		

	}

}
