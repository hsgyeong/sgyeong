package day0621;

public class ExFor_07 {

	public static void main(String[] args) {
		// TODO Auto-generated method stub
		
		//초기값이 조건 안맞으면 한번도 반복안됨
		for(int i=5;i<=1;i++)
		{
			System.out.println(i);
		}

		int i;
		for(i=1;i<=10;i++)
			System.out.print(i+" ");
		System.out.println("\n빠져나온후의 i값: "+i);
		
		int a=10;
		for(;a<=50;a+=5) //초기값을 반복문 바깥에서 주었을 경우 생략가능(;은 써야한다)
			System.out.print(a+" ");
		System.out.println("\n빠져나온후의 a값: "+a);
		
		//Hello를 가로로 5번 반복하시오
		/* for(int n=1;n<=5;n++)
			System.out.print("Hello "); */
		
		for(int n=5;n>=1;n--)
			System.out.print("Hello ");
		System.out.println();
		
		//1부터 10까지의 숫자중 짝수만 가로로 출력하기
		
		for(int n=1;n<=10;n++)
		{
			if(n%2==0)
			System.out.print(n+" ");
			}
			System.out.println();
	}
	

}
