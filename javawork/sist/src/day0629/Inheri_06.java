package day0629;

/* Shop클래스
 * 
 * sangpum 상품명
 * su 개수
 * 
 * 인자있는 생성자 만들어서 전달
 * 출력메서드 만들기 writeShop()
 * -상품과 개수를 출력
 * ===============================
 * MyCart
 * 
 * price 가격
 * 
 * Shop을 상속받아 생성자 완성
 * writeShop() 메서드 오버라이드해서 가격 추가하기
 * ================================
 * 메인에서
 * 상품,개수,가격 모두 있는 메서드 출력
 */

class Shop{
	
	String sangpum;
	int su;
	
	public Shop(String sangpum,int su)
	{
		this.sangpum=sangpum;
		this.su=su;
	}
	
	public void writeShop()
	{
		System.out.println("상품명: "+sangpum);
		System.out.println("수량: "+su);
	}
}
//////////////////////////////////////
class MyCart extends Shop{
	int price;
	
	public MyCart(String sang,int su,int price)
	{
		super(sang, su);
		this.price=price;
	}
	
	@Override
	public void writeShop() {
		// TODO Auto-generated method stub
		super.writeShop();
		System.out.println("가격: "+price);
		System.out.println();
	}
}

////////////////////////////
public class Inheri_06 {

	public static void main(String[] args) {
		// TODO Auto-generated method stub
		
		MyCart mc=new MyCart("아이폰14",2,1200000);
		mc.writeShop();

	}

}
