package day0630;
//익명 내부클래스란? 이름없는 클래스로서 이벤트 발생시 생성되었다가 끝나면 메모리에서 제거
//메모리의 효율적 관리때문에 주로 모바일에서 이벤트 방식으로 많이 쓴다

abstract class AbstEx{
	abstract public void show();
}

/////////////////////////////////
class OuterEx{
	
	AbstEx ab=new AbstEx() {
		
		@Override
		public void show() {
			System.out.println("익명내부 클래스");
		}
	};
}

////////////////////////////////
public class Annonymous_13 {

	public static void main(String[] args) {
		// TODO Auto-generated method stub

		OuterEx ex=new OuterEx();
		ex.ab.show();
	}

}
