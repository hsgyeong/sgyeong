package day0623;

public class ArrInt_06 {

	public static void main(String[] args) {
		// 선언하면서 초기값들을 동시에 저장할 수 있다

		int [] arr= {5,7,8,9,12,23,56,47};
		//   0 1 2 3 4  5  6  7      length >> 8
		System.out.println("개수: "+arr.length);

		System.out.println();

		System.out.println("출력_1 ex) 1 ==> 5");

		for(int i=0;i<arr.length;i++)
		{
			System.out.println((i+1)+"==>"+arr[i]);
		}

		System.out.println();

		System.out.println("출력_2");

		for(int a:arr)
		{
			System.out.println(a);
		}
	}

}
