package day0703;

import java.util.List;
import java.util.Vector;

//가장 많이 사용하는 인터페이스 List
//List 인터페이스를 구현한 Vector,ArrayList
//순차적으로 데이터 들어감, 중복데이터 허용
//처음생성시 일정한 개수로 생성 그이상의 데이터를 넣으면 공간이 자동 증가

public class List_12 {
	
	public static void main(String[] args) {
		// TODO Auto-generated method stub

			//List<String> list=new Vector<String>();
			Vector<String> list=new Vector<String>();
			// >> 제네릭
			
			System.out.println("초기할당크기: "+list.capacity());
			System.out.println("초기 데이터 크기: "+list.size());
			
			list.add("칙촉");
			list.add("미쯔");
			list.add("새우깡");
			list.add("칙촉"); //중복가능
			list.add("포카칩");
			list.add("스윙칩");
			
			System.out.println("초기할당크기: "+list.capacity());
			System.out.println("초기 데이터 크기: "+list.size());
			
			System.out.println("출력#1");
			
			for(int i=0;i<list.size();i++)
			{
				String s=list.get(i);
				System.out.println(s);
			}
			
			System.out.println();
			
			System.out.println("출력#2");
			for(String s:list)
				System.out.println(s);
			
			System.out.println();
			
			System.out.println("출력#3");
			
			Object []ob=list.toArray();
			
			for(int i=0;i<ob.length;i++)
			{
				System.out.println(ob[i]);
			}
	}

}
