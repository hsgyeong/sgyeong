package day0703;

import java.io.BufferedReader;
import java.io.FileNotFoundException;
import java.io.FileReader;
import java.io.IOException;

public class FileException_04 {
	
	public static void read()
	{					//경로표시할땐 슬래시(/) 한번 또는 역슬래시(//)두번
		String fileName="C:\\sist0615\\file\\monday.txt";
		BufferedReader br=null;
		FileReader fr=null;
		
		try {
			fr=new FileReader(fileName);  //파일 열기
			
			System.out.println("파일을 열었어요!!");
			
			br=new BufferedReader(fr);  //파일을 읽기 위해 bufferedReader에 담기
			
			//여러줄 읽어야 하므로 while문
			while(true)
			{
				//메모장에서 내용을 한줄씩 읽어온다
				String s=br.readLine();
				
				//마지막 줄일경우 null값을 읽어서 null값일 경우 빠져나가기
				if(s==null)
					break;
				
				System.out.println(s);
			}
		}catch (FileNotFoundException e) {
			//e.printStackTrace();
			System.out.println("파일이 없어요: "+e.getMessage());
		}catch(IOException e) {
			
		}finally {
			//finally에서 자원을 반납할때 자원은 항상 반대로 반납
			try {
				br.close();
				fr.close();
			}catch (IOException e) {
				// TODO: handle exception
				e.printStackTrace();
			}
		}
	}


	public static void main(String[] args) {
		// TODO Auto-generated method stub
		read();
		System.out.println("**메모 정상종료**");
	}

}
