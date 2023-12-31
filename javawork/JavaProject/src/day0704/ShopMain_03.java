package day0704;

import java.util.Scanner;
import java.util.Vector;

public class ShopMain_03 {
		/*
		 * 1.상품입고  2.상품재고  9.종료
		 * 
		 * 1
		 * 상품명? 바나나
		 * 수량? 10
		 * 가격? 1000
		 * 2
		 * 번호  상품명  수량  가격  총가격
		 * 1   바나나  10  1000  10000
		 * 
		 */
		
		
		Vector<Shop> list=new Vector<Shop>();
		
		public void inputShop()
		{
			Scanner sc=new Scanner(System.in);
			String sangName;
			int ip,su,dan,total;
			
			System.out.println("상품명");
			sangName = sc.nextLine();
			
			System.out.println("수량");
			su = sc.nextInt();
			
			System.out.println("가격");
			dan = sc.nextInt();
			
			//shop data=new shop(sangName,su,dan);
			
			Shop data=new Shop();
			data.setSangName(sangName);
			data.setSu(su);
			data.setDan(dan);
			
			list.add(data);
			System.out.println("현재 데이터 갯수: "+list.size());
			
		}
		
			//출력
		public void showShop()
		{
			int total=0;
			System.out.println("**마트**");
			System.out.println("=====================");
			
			for(int i=0;i<list.size();i++)
			{
				Shop p=list.get(i);
				
				System.out.println("총가격");
				System.out.println("상품명"+"\t수"+"\t가격"+"\t총가격");
				System.out.println(p.getSangName()+"\t"+p.getSu()+"\t"+p.getDan()+"\t"+(p.getSu()*p.getDan()));
			}
		}
		
		public static void main(String[] args) {
			
			ShopMain_03 sb = new ShopMain_03();
			Scanner sc = new Scanner(System.in);
			int n;
			
			while(true) {
				
				System.out.println("1.상품입고  2.상품재고  9.종료");
				n=Integer.parseInt(sc.nextLine());
				
				if(n==1)
					sb.inputShop();
				else if(n==2)
					sb.showShop();
				else if(n==9)
				{
					System.out.println("프로그램 종료");
					break;
				}
				else
					System.out.println("잘못입력했어요");
				
			}
		
	}

}
