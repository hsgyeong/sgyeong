package day0621;

public class Ex_00 {

	public static void main(String[] args) {
		// TODO Auto-generated method stub

		int i=0;
		
		while(i<10)
		{
			i++;
			System.out.printf("%4d",i);
		}
		System.out.println();

		
		i=0;
		
		while(i<10)
		{
			System.out.printf("%4d",++i);
		}
		System.out.println();
		
		
		i=0;
		
		while(i<10)
		{
			System.out.printf("%4d",i++);
		}
		System.out.println();
		
		
		i=0;
		
		while(++i<10)
		{
			System.out.printf("%4d",i++);	
		}
		System.out.println();	
		
		
	}

}
