package day0629;


class MyTv{
	
	/* **tv시청목록**

	ebs 채널을 시청합니다
	볼륨은 15데시벨 입니다
	---------------
	tvn 채널을 시청합니다
	볼륨은 22데시벨 입니다
	*/
	
	private String che; //채널
	private String vol; //볼륨
	
	
	//setter, getter 만드는 이유? private때문. 메서드로 접근하기 위함
	public String getChe() {
		return che;
	}					
	public void setChe(String che) {  //멤버값을 보내서 그 값을 넘겨줌
 		this.che = che;
	}
	public String getVol() {
		return vol;
	}
	public void setVol(String vol) {
		this.vol = vol;
	}
	
	
	
/////////////////////////////////////
public class ReviewObject_01 {

	public static void main(String[] args) {
		// TODO Auto-generated method stub

		MyTv tv=new MyTv(); //모든 객체는 new라는 연산자를 이용해서 생성을 해줘야 기능하고 가져다 쓸 수 있음
		
		tv.setChe("ebs");
		tv.setVol("15");
		
		String c=tv.getChe();
		String v=tv.getVol();
		
		
		System.out.println(c+"채널을 시청합니다");
		System.out.println("볼륨은 "+v+"데시벨입니다");
		System.out.println("----------------------------");
		//////////////////////////////////////////
		MyTv tv1=new MyTv();
		
		tv.setChe("tvn");
		tv.setVol("18");
		
		String c1=tv.getChe();
		String v1=tv.getVol();
		
		
		System.out.println(c1+"채널을 시청합니다");
		System.out.println("볼륨은 "+v1+"데시벨입니다");
	}

}
}
