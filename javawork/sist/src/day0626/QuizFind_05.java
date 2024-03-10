package day0626;

import java.util.Scanner;

public class QuizFind_05 {

	public static void main(String[] args) {
		// TODO Auto-generated method stub
		/* 숫자를 입력 받아서 배열의 몇번째에 있는지 출력하고 없을 경우 없습니다 라고 출력하세요
		 * (0이면 종료)
		 * 입력값: 11
		 * 		11은 2번째에 있어요!
		 * 입력값: 100
		 * 		100은 없습니다
		 * 입력값: 0
		 * 		종료합니다(프로그램 종료)
		 */
		
		Scanner sc=new Scanner(System.in);
		
		int []arrNums= {23,11,55,88,99,77,54,21,32,2,6};
		int num;
		boolean find;
		
		while(true)
		{
			System.out.print("입력값: ");
			num=sc.nextInt();
			
			//break
			if(num==0) 
			{
				System.out.println("종료합니다");
				break;  //while문을 빠져나가면서 종료
			}
			
			find=false; //반복문 안에서 찾았을 경우 true로 변경해줄 것
			
			//배열갯수만큼 반복해서 입력한 숫자 찾기
			for(int i=0;i<arrNums.length;i++)
			{
				if(num==arrNums[i])
				{
					find=true;
					System.out.println("\t"+(i+1)+"번째에서 검색");
				}
			}
			
			//배열에 없는 경우 find는 여전히 false
			if(!find)
			{
				System.out.println("\t"+num+"는 배열에 없습니다");
			}	
				
			}
			}

}


