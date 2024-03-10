package day0623;

import java.util.Scanner;

public class ArrayIntFind_12 {

	public static void main(String[] args) {
		// 숫자를 입력해서 그숫자가 있는지 찾기
		// 없으면 없다고, 있으면 그 숫자가 몇번째 있는지 찾기
		// 0입력시 종료: while(true)
		
		Scanner sc=new Scanner(System.in);
		int su; //입력할수
		int [] data= {5,12,46,99,88,77,32,65,54,110,85,11}; //배열선언을 한것과 초기값을 동시에 준것과 마찬가지
		boolean flag=false; //>변수선언
		
		while(true) //class에서의 기본값: 0,null,false
		{
			System.out.println("검색할 숫자를 입력하세요");
			su=sc.nextInt();
			
			//break.. 0입력시 종료
			if(su==0)
			{
				System.out.println("종료합니다");
				break;
			}
			
			//있다 없다 초기값
			flag=false;  //false를 flag에 대입하는 것 /찾으면 true로 변경
			
			//값찾기
			for(int i=0;i<data.length;i++) //i는 0부터 시작, i는 변수보다 무조건 작아야 함
			{
				if(data[i]==su) {
				flag=true;
				System.out.println((i+1)+"번째에서 검색");
				break;
				}
			}
				
				
		}
		
		if(!flag) //flag=false
			System.out.println(su+"는 데이타에 없습니다");
		
		flag=false;
	}

}
