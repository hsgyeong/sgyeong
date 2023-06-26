package day0621;

public class QuizFor_09 {

	public static void main(String[] args) {
		// TODO Auto-generated method stub

<<<<<<< HEAD
		//Q.1 2 4 5 7 8 10 _continue 이용해서 출력해보세요
		
		
		
=======
		//Q 1.1 2 4 5 7 8 10 _continue이용해서 출력해보세요
>>>>>>> sgyeong
		for(int i=1;i<=10;i++)
		{
			if(i%3==0)
				continue;
			System.out.print(i+" ");
<<<<<<< HEAD
		
		}
		System.out.println();
		
		
		/*Q2 continue 이용할것
		 * 홀수값: 1
		 * 홀수값: 3
		 * 홀수값: 5
		 * 홀수값: 7 
		 * 홀수값: 9 
		 */
		
		
=======
			
		}
		System.out.println();
		
		/*Q2. continue이용할것!!!
		 홀수값: 1
		 홀수값: 3
		 홀수값: 5
		 홀수값: 7
		 홀수값: 9 */
>>>>>>> sgyeong
		for(int i=1;i<=10;i++)
		{
			if(i%2==0) //짝수
				continue;
			System.out.println("홀수값: "+i);
		}
		
		//1~100까지중에서 홀수의 합을 구하시오
		int osum=0; //홀수합계구할변수
<<<<<<< HEAD
		int esum=0;
=======
		int esum=0; //짝수
		
>>>>>>> sgyeong
		for(int i=1;i<=100;i++)
		{
			if(i%2==1)
				osum+=i;
			else
				esum+=i;
<<<<<<< HEAD
			
		}
		System.out.println("홀수의 합: "+osum);
		System.out.println("짝수의 합: "+esum);

	
	//While(true)문을 이용해서 1~100사이의 짝수합 구하기
	
		/* int a=0;
		int sum=0;
	
		while(true)
	{ 
			a++;
			
			if(a%2==1)
				continue;
			sum+=a; 
		
			if(a==100)
				break;
		
	}
		System.out.println("1~100까지의 합은 "+sum);
													*/
		
=======
		}
		System.out.println("홀수의 합: "+osum);
		System.out.println("짝수의 합: "+esum);
		
		//while(true)문을 이용해서 1~100사이의 짝수합 구하기
>>>>>>> sgyeong
		int a=1;
		int sum=0;
		
		while(true)
		{
			
			if(a%2==0)
<<<<<<< HEAD
				sum+=a;
=======
			sum+=a; 
>>>>>>> sgyeong
			a++;
			
			if(a>100)
				break;
		}
<<<<<<< HEAD
		System.out.println("1~100까지의 합은 "+sum);

}
}
=======
		
		System.out.println("1~100까지의 합은"+sum);
	}

}
>>>>>>> sgyeong
