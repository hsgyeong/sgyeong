package day0626;

public class ReviewArr_08 {

	public static void main(String[] args) {
		// 해당 배열을 for문으로 이용하여 출력하시오

		// 1.ex>0번지: 영환이
		String [] names={"영환이","수환이","동환이","성환이"};

		System.out.printf("이름: ");

		for(int i=0;i<names.length;i++)
		{
			System.out.print(names[i]+" ");
		}

		System.out.println();
		// 2.해당 배열을 가로로 출력하시오
		int [] nums= {2,4,5,7,8};

		for(int i=0;i<nums.length;i++)
		{
			System.out.print(nums[i]+" ");
		}
		System.out.println();

		//flowers

		String [] flowers= {"장미","해바라기","민들레","개나리"};

		System.out.printf("꽃: ");

		for(int i=0;i<flowers.length;i++)
		{
			System.out.print(flowers[i]+" ");
		}

		System.out.println();

		//colors
		String [] colors= {"red","blue","yellow","green"};

		System.out.printf("색: ");

		for(int i=0;i<colors.length;i++)
		{
			System.out.print(colors[i]+" ");
		}

		System.out.println();

	}

}
