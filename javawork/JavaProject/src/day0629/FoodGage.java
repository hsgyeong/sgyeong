package day0629;

public interface FoodGage {

		//인터페이스는 상수와 추상메서드만 선언이 가능하다
		String SHOPNAME="보슬보슬"; //상수 //상수가 오려면 원래 앞에 final이 와야하지만  
		   							//인터페이스에선 오로지 상수밖에 오지 않기 때문에 final 생략가능
		public void order();
		public void baedal();
}
