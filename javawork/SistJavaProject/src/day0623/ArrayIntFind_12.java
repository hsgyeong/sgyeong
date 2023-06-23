package day0623;

import java.util.Scanner;

public class ArrayIntFind_12 {

	public static void main(String[] args) {
		// 숫자를 입력해서 그숫자가 있는지 찾기
		// 없으면 없다고, 있으면 그 숫자가 몇번째 있는지 찾기
		// 0입력시 종료: while(true)

		Scanner sc=new Scanner(System.in);
		int su; //입력할수
		int [] data= {5,12,46,99,88,77,32,65,54,110,85,11};
		boolean flag;


		while(true)
		{
			System.out.println("검색할 숫자 입력하세요");
			su=sc.nextInt();

			//break..0입력시 종료
			if(su==0)
			{
				System.out.println("종료합니다");
				break;
			}

			//있다 없다 초기값
			flag=false;  //false를 flag에 대입하는 것 /찾으면 true로 변경

			//값찾기
			for(int i=0;i<data.length;i++)
			{
				if(su==data[i])
				{
					flag=true;
					System.out.println((i+1)+"번째에서 검색");
				}
			}
			
			if(!flag) //flag==false
				System.out.println(su+"는 데이타에 없습니다");
		}
	}

}
