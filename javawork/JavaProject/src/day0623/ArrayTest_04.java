package day0623;

public class ArrayTest_04 {
	
	public static void main(String[] args) {
		// 기본형배열은 객체로 인식
		
		int [] arr1, arr2; //배열로 선언
		arr1=new int[3]; //메모리할당
		arr2=new int[5]; //할당만 되도 값은 0으로 초기화
		
		//int [] arr1=new int[3];
		//int arr2 []=new int[5];
		
		//arr1 배열에 값을 넣는다
		arr1[0]=10;
		arr1[1]=5;
		arr1[2]=20;
		
		//배열의 갯수
		System.out.println(arr1.length); //3(0~2)
		System.out.println(arr2.length); //5(0~4)
		
		//arr1 출력
		System.out.println("arr1 출력");
		System.out.println(arr1[0]);
		System.out.println(arr1[1]);
		System.out.println(arr1[2]);
		
		
		System.out.println();
		
		System.out.println("for문으로 arr1출력_범위를 변수화");
		for(int i=0;i<arr1.length;i++)
		{
			System.out.println(arr1[i]);
		}
		System.out.println();
	
		// arr2를 출력해보는데 범위를 변수화한 for문으로 출력해보세요
		System.out.println("for문으로 arr2_범위를 변수화");
		
		for(int i=0;i<arr2.length;i++) //어떤 배열이든 시작은 0
		{							   //i는 변수준것보다 작아야함
			System.out.println(i+"==>"+arr2[i]);
		}
		
		System.out.println();
		
		System.out.println("for~each_arr1");
		//foreach(배열변수자료형 임의의 이름: 변수명)
		
		for(int a1:arr1) //arr1을 a1에 대입하는 것
		{
			System.out.println(a1);
		}
		
		System.out.println();
		
		System.out.println("for~each_arr2");
		
		for(int a2:arr2) //arr2을 a2에 대입하는 것
		{
			System.out.println(a2);
		}
	}
	
	

}
