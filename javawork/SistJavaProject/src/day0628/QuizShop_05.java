package day0628;

class MyShop{
	
	/* ***상품입고***
	 * 상품명: 키보드
	 * 입고일: 2023-06-01
	 * 출고일: 2023-06-20
	*/
	
	private String sangpumName;
	private String ipgoday;
	private String chulgoday;
	
	//3개의 데이터를 한번에 수정할 수 있는 메서드
	// public void setData(String sangpumName, String ipgoday, String chulgoday)
	public void setData(String name, String ipgo, String chulgo)
	{
		/*  this.sangpumName=sangpumName;
			this.ipgoday=ipgoday;
			this.chulgoday=chulgoday; */
		
		sangpumName=name;
		ipgoday=ipgo;
		chulgoday=chulgo;
	}
	
	//3개의 데이터를 한번에 출력할 수 있게 메서드
	/* public void getData()
	{
		
	System.out.println("***상품입고***");
	System.out.println("상품명: "+sangpumName);
	System.out.println("입고일: "+ipgoday);
	System.out.println("출고일: "+chulgoday);
	
	} */
	public String getData()
	{
		String s="상품명: "+sangpumName+"\n입고날짜: "+ipgoday+"\n출고일자: "+chulgoday;
		
		return s;
	}
	
}

public class QuizShop_05 {

	public static void main(String[] args) {
		// TODO Auto-generated method stub
		// 참조변수 sang => 메서드를 호출하기 위한 역할
		MyShop sang=new MyShop();
		
		sang.setData("키보드", "2023-06-01", "2023-06-20");
		// sang.getData();
		System.out.println(sang.getData());
		
		

	}

}
