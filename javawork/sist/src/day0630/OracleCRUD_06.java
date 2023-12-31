package day0630;

import java.util.Scanner;

abstract class Command{
	
	abstract public void write();
}
////////////////////////////////////
class Insert1 extends Command{
	
	@Override
	public void write() {
		// TODO Auto-generated method stub
		System.out.println("게시판에 게시물을 추가합니다");
	}
	
}
/////////////////////////////////////
class List extends Command{
	
	@Override
	public void write() {
		// TODO Auto-generated method stub
		System.out.println("게시판에 게시물을 조회합니다");
	}
}
/////////////////////////////////////
class Modify extends Command{
	
	@Override
	public void write() {
		// TODO Auto-generated method stub
		System.out.println("게시판에 게시물을 수정합니다");
	}
}
/////////////////////////////////////
class Delete1 extends Command{
	
	@Override
	public void write() {
		// TODO Auto-generated method stub
		System.out.println("게시판에 게시물을 삭제합니다");
	}
}

//////////////////////////////////////
public class OracleCRUD_06 {

	public static void main(String[] args) {
		// TODO Auto-generated method stub
		
		Scanner sc=new Scanner(System.in);
		
		Command command=null;
		int n;
		
		exit: while(true)
		{
			System.out.println("1.추가  2.조회  3.수정  4.삭제  9.종료");
			System.out.println("====================================");
			
			n=Integer.parseInt(sc.nextLine());
			
			switch(n)
			{
			case 1:
				command=new Insert1();
				break;
			case 2:
				command=new List();
				break;
			case 3:
				command=new Modify();
				break;
			case 4:
				command=new Delete1();
				break;
			case 9:
				System.out.println("시스템을 종료합니다");
				break exit;
			default:
				System.out.println("잘못입력했습니다");
				break;
			}
			
			if(n<=4)
				command.write();
		}
	}

}
