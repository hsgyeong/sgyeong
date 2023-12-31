package day0628;

class Student{
	
	private String sname;
	private String hp;
	private int grade;
	
	//명시적 생성자
	public Student(String name,String hp,int grade) {
		this.sname=name;
		this.hp=hp;
		this.grade=grade;
				
	}
	
	//멤버값 출력데이터
	public void getData()
	{
		System.out.println("이름: "+sname);
		System.out.println("연락처: "+hp);
		System.out.println("학년: "+grade+"학년");
	}
}

///////////////////////////////////
public class ArrObject_09 {

	public static void main(String[] args) {
		// TODO Auto-generated method stub
		
	/*	Student [] stu=new Student[3];
		
		stu[0]=new Student("이민규", "010-2314-1231",2);
		stu[1]=new Student("최진평", "010-2235-2343",3);
		stu[2]=new Student("진현규", "010-2223-1234",4);
	*/
		
		//생성하면서 바로 초기화
		Student[] stu= {
				new Student("이민규", "010-2314-1231",2),
				new Student("최진평", "010-2235-2343",3),
				new Student("진현규", "010-2223-1234",4),
		};
	
		//출력
		for(int i=0;i<stu.length;i++)
		{
			Student s=stu[i];
			s.getData();
			//stu[i].getData();
			System.out.println("----------------------");
		}
		
		//출력#2
		//for-each문 for(자료형(클래스명) 참조변수명:stu)
		for(Student s:stu)
		{
			s.getData();
			System.out.println("====================");
		}
	}

}
