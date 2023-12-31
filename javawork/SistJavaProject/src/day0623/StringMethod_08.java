package day0623;

public class StringMethod_08 {

	public static void main(String[] args) {
		// TODO Auto-generated method stub

		String str1="Have a Nice Day";
		String str2="    Happy day    ";

		System.out.println("str2의 길이: "+str2.length());
		System.out.println("str2의 앞뒤 공백제거후 길이: "+str2.trim().length());
		System.out.println("*"+str2+"*");
		System.out.println("*"+str2.trim()+"*");

		//indexof > index값 구하기
		System.out.println("str1에서 H의 인덱스: "+str1.indexOf('H')); 
		System.out.println("str1에서 D의 인덱스: "+str1.indexOf('D')); 


		System.out.println("str1에서 Nice추출: "+str1.substring(7, 11));

		//replace
		System.out.println("문자열 일부를 변경: ");
		System.out.println(str1.replace("a","*"));
		System.out.println(str1.replace("Nice","Good"));

		//숫자를 문자
		String b1=12.5+" ";
		System.out.println(b1);

		String b2=100+"";
		System.out.println(b2);

		String b3=String.valueOf(100); //int ==> String
		String b4=String.valueOf(12.6); //double ==> String

		System.out.println(b3);
		System.out.println(b4);

		//문자열을 분리하는 메서드 split
		String str3="red,blue,green,gray,white";
		System.out.println(str3);
		
		System.out.println(",로 분리하여 출력하기");
		
		String[] arr=str3.split(",");
		System.out.println("분리된 색상 갯수: "+arr.length);
		
		//출력
		for(String color:arr)
		System.out.println(color);
	}

}
