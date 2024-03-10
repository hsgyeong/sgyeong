package day0630;

abstract class Game{
	/* 성현이가 게임을 합니다
	 * 순영이가 게임을 합니다
	 * 선범이가 게임을 합니다
	 * ----------------
	 * 선범이가 게임을 종료합니다
	 * 순영이가 게임을 종료합니다
	 * 성현이가 게임을 종료합니다
	 */

	abstract void play();
	abstract void stop();

}
///////////////////////////
class SungHyeon extends Game{

	@Override
	void play() {
		// TODO Auto-generated method stub
		System.out.println("성현이가 게임을 합니다");
	}

	@Override
	void stop() {
		// TODO Auto-generated method stub
		System.err.println("성현이가 게임을 종료합니다");
	}
}
////////////////////////////
class SoonYeong extends Game{

	@Override
	void play() {
		// TODO Auto-generated method stub
		System.out.println("순영이가 게임을 합니다");

	}

	@Override
	void stop() {
		// TODO Auto-generated method stub
		System.out.println("순영이가 게임을 종료합니다");	
	}
}
////////////////////////////////////
class SunBum extends Game{
	
	@Override
	void play() {
		// TODO Auto-generated method stub
		System.out.println("선범이가 게임을 합니다");
	}
	
	@Override
	void stop() {
		// TODO Auto-generated method stub
		System.out.println("선범이가 게임을 종료합니다");
	}
}

////////////////////////////////////
public class ArrConst_04 {

	public static void main(String[] args) {
		// TODO Auto-generated method stub
		
		//배열선언
		Game [] game=new Game[3];
		//각각의 sub로 생성
		
		game[0]=new SungHyeon();
		game[1]=new SoonYeong();
		game[2]=new SunBum();

		//for(증가)
		for(int i=0;i<game.length;i++)
		{
			game[i].play();
		}
		
		System.out.println("====================");
		
		//for(감소)		  2		  0을 포함하기 위함	
		for(int i=game.length-1;i>=0;i--)
		{
			game[i].stop();
		}
		
	}

}
