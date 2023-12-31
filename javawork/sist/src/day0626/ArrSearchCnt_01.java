package day0626;

import java.util.Scanner;

public class ArrSearchCnt_01 {

	public static void main(String[] args) {
		/* Q. 반복문 안에서 실행.. 성을 입력시 그 성씨를 가진 사람과 총 인원수를 출력
		 * "종료"라고 하면 프로그램 종료
		 */
		
		String [] names= {"김선호", "나나", "이효리", "엄정화", "김완선", "보아", "유재석", "하하", "김연진", "이진"};
		
		Scanner sc=new Scanner(System.in);
		int cnt;
		String search; //입력할 성
		
		boolean flag;
		
		while(true)
		{
			System.out.print("검색할 성을 입력해주세요");
			search=sc.nextLine();
			
			//종료
			if(search.equals("종료"))
			{
				System.out.println("종료합니다");
				break;
			}
			
			boolean find=false;
			
			cnt=0; //검색할때마다 0으로 초기화가 필요함
			
			for(int i=0;i<names.length;i++)
			{
				if(names[i].startsWith(search))
				{
					cnt++;
					System.out.println((i+1)+": "+names[i]);
					find=true;
				}
			}
			
			System.out.println();
			System.out.println("======================");
			
			if(find)//find==true
				System.out.println("\t총 "+cnt+"명 검색");
			else//!find
				System.out.println(search+"씨 성을 가진 사람은 없습니다");
		}
		

	}

}
