package day0628;


class Score{
	
	/*
	 중간고사 시험결과
	 학생명: 김지윤
	 자바점수: 99
	 오라클점수: 88
	 HTML점수: 56
	 ==================
	 학생명: 김동현
	 자바점수: 79
	 오라클점수: 68
	 HTML점수: 76
	 */
	
	
	private String stuName;
	private int java;
	private int oracle;
	private int html;
	

	//자동 setter, getter
		
	static final String TITLE="중간고사 시험결과";

	public String getStuName() {
		return stuName;
	}

	public void setStuName(String stuName) {
		this.stuName = stuName;
	}

	public int getJava() {
		return java;
	}

	public void setJava(int java) {
		this.java = java;
	}

	public int getOracle() {
		return oracle;
	}

	public void setOracle(int oracle) {
		this.oracle = oracle;
	}

	public int getHtml() {
		return html;
	}

	public void setHtml(int html) {
		this.html = html;
	}
	
	
	public void setData(String stuName, int java, int oracle, int html)
	{
		this.stuName=stuName;
		this.java=java;
		this.oracle=oracle;
		this.html=html;
	}
	
	public void getData()
	{
		System.out.println("학생명: "+stuName);
		System.out.println("자바점수: "+java);
		System.out.println("오라클점수: "+oracle);
		System.out.println("HTML점수: "+html);
		
	}
	
	//합계 메서드
	public int getTot() 
	{
		int t=java+oracle+html;   //변수로 해서 리턴값은 짧게 하는 것이 좋음
		return t;
	}
	
	//평균 메서드
	public double getAvg()
	{
		 // return getTot()/3.0;
			double a=getTot()/3.0;
			return a;
	}
	
}

///////////////////////////////////
public class ExObject_07 {

	public static void main(String[] args) {
		// TODO Auto-generated method stub
		
		Score sc1=new Score();
		Score sc2=new Score();
		
		System.out.println("***"+Score.TITLE+"***");
		
		sc1.setStuName("김지윤");
		sc1.setJava(99);
		sc1.setOracle(88);
		sc1.setHtml(56);
		
		sc2.setStuName("김동현");
		sc2.setJava(79);
		sc2.setOracle(68);
		sc2.setHtml(76);
		
	/*	sc1.getData();
		sc2.getData();  */
		
		System.out.println("학생명: "+sc1.getStuName());
		System.out.println("자바점수: "+sc1.getJava());
		System.out.println("오라클점수: "+sc1.getOracle());
		System.out.println("HTML점수: "+sc1.getHtml());
		System.out.println("합계점수: "+sc1.getTot());
		System.out.println("평균점수: "+sc1.getAvg());
		System.out.println("==================");
		System.out.println("학생명: "+sc2.getStuName());
		System.out.println("자바점수: "+sc2.getJava());
		System.out.println("오라클점수: "+sc2.getOracle());
		System.out.println("HTML점수: "+sc2.getHtml());
		System.out.println("합계점수: "+sc2.getTot());
		System.out.println("평균점수: "+sc2.getAvg());
	}

}
