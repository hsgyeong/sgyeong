package day0630;

import java.util.Scanner;

//반복문 안에서 추가, 수정, 삭제 등을 해줄때 하나의 변수로 처리할 수 있음

interface Board{	//process를 처리하는 부모로 간주
	
	public void process();
	
}
//////////////////////////////////
class Insert implements Board{
	
	@Override
	public void process() {
		// TODO Auto-generated method stub
		System.out.println("게시판에 게시물을 추가합니다");
	}
}
//////////////////////////////////
class Select implements Board{
	
	@Override
	public void process() {
		// TODO Auto-generated method stub
		System.out.println("게시판에 게시물을 조회합니다");
	}
}
//////////////////////////////////
class Update implements Board{
	
	@Override
	public void process() {
		// TODO Auto-generated method stub
		System.out.println("게시판에 게시물을 수정합니다");
	}
}
//////////////////////////////////
class Delete implements Board{
	
	@Override
	public void process() {
		// TODO Auto-generated method stub
		System.out.println("게시판에 게시물을 삭제합니다");
	}
}

//////////////////////////////////

public class BordCRUD_05 {

	public static void main(String[] args) {
		// TODO Auto-generated method stub
		
		Scanner sc=new Scanner(System.in);
		
		Board board=null;
		int n; //입력할 숫자
		
		exit: while(true)
		{
			System.out.println("1.추가  2.조회  3.수정  4.삭제  9.종료");
			System.out.println("=================================");
			//n=sc.nextInt();
			n=Integer.parseInt(sc.nextLine());
			
			switch(n)
			{
			case 1:
				board=new Insert();
				break;  //case빠져나가는 break
			case 2:
				board=new Select();
				break;
			case 3:
				board=new Update();
				break;
			case 4:
				board=new Delete();
				break;
			case 9:
				System.out.println("종료합니다");
				//break exit;	//while문 빠져나가는 break
				System.exit(0);
			default:
				System.out.println("**잘못입력했습니다**");
				break;
		
			}
		
			if(n<=4)
				board.process();
		}
		
		
	}

}
