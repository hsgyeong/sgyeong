package day0621;

public class DoWhile_06 {

	public static void main(String[] args) {
		// TODO Auto-generated method stub

		int i=1;
		
		System.out.println("While문 결과");
		//선조건: 참일동안 반복. 조건 안맞으면 실행 안함
		while(i<5)  //while은 조건이 맞지 않으면 출력 안됨
		{
			//출력후 증가
			System.out.println(i++);
			
			//System.out.println(i);
			//i++;
			
		}
		
		System.out.println("do~while문 결과");
		//후조건: 조건 나중에 온다. 조건 안맞아도 한번 실행
		
		i=1;
		
		do {
			//출력후 증가
			System.out.println(i++);
		}while(i<5);  //do~while은 조건이 맞지 않아도 적어도 한번은 출력됨
		}
				
	}

