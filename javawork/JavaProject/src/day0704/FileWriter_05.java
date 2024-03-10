package day0704;

import java.io.FileWriter;
import java.io.IOException;
import java.util.Date;

public class FileWriter_05 { //클래스 안에서는 초기값 안줘도 자동으로 인지함
	
	public static void fileWrite() {  //메서드
		
		FileWriter fw=null;   //메서드 안에서는 무조건 초기값 줘야함
		String fileName="C:\\sist0615\\file\\filetest1.txt";
		
		try {
			fw=new FileWriter(fileName);  //파일 새로 생성(같은 이름이 있어도 새로 생성)
		
		//파일에 내용 추가
			fw.write("Have a Nice Day!!!\n");  //메모장 줄넘김
			fw.write(new Date().toString());
			System.out.println("***파일 저장 성공!!***");
			
		} catch (IOException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}finally {
			try {
				fw.close();
			}catch (IOException e) {
				e.printStackTrace();
			}
		}
		
		
	}
	
	public static void fileWrite2() {
		
		FileWriter fw=null;
		String fileName="C:\\sist0615\\file\\filetest2.txt";
		
		try {
			fw=new FileWriter(fileName,true);//추가모드
			
			fw.write("내 이름은 성경\n");
			fw.write("===========================\n");
			
		}catch (IOException e) {
			e.printStackTrace();
		}try {
			fw.close();
		}catch(IOException e) {
			e.printStackTrace();
		}
				
	}

	public static void main(String[] args) {
		// TODO Auto-generated method stub
		fileWrite();
		fileWrite2();
	}

}
