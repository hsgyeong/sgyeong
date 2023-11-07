package day0622;

public class ForStar_07 {

	public static void main(String[] args) {
		// 중첩(다중)for문으로 별모양 찍기
		System.out.println("중첩(다중)for문으로 별모양 찍기");
		
		for(int n=1;n<=3;n++) //행갯수
		{
			for(int k=1;k<=n;k++) //열갯수(i값만큼만 반복)
			{
				System.out.print("*");
			}
			System.out.println();
		}
		
		System.out.println();
		
		//3번
		
		for(int n=1;n<=6;n++) //행갯수
		{
			for(int k=6;k>=n;k--) // 열갯수(i값만큼만 반복)
			{
				System.out.print("*");
			}
			System.out.println();
		}
		
	}

}
