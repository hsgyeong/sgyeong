package mystudent;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.util.Scanner;

public class mystudent {

	DBConnect db=new DBConnect();
	Scanner sc=new Scanner(System.in);
	
	public void insertMyStudent()
	{
		Connection conn=db.getConnection();
		PreparedStatement pstmt=null;
		
		System.out.println("학생명");
		String stu_name=sc.nextLine();
		System.out.println("학년");
		int stu_grade=Integer.parseInt(sc.nextLine());
		System.out.println("연락처");
		String hp=sc.nextLine();
		System.out.println("주소");
		String addr=sc.nextLine();
		System.out.println("나이");
		int age=Integer.parseInt(sc.nextLine());
		
		String sql="insert into mystudent values (seq1.nextval,?,?,?,?,?,sysdate)";
		
		try {
			pstmt=conn.prepareStatement(sql);
			
			pstmt.setString(1, stu_name);
			pstmt.setInt(2, stu_grade);
			pstmt.setString(3, hp);
			pstmt.setString(4, addr);
			pstmt.setInt(5, age);
			
			int a=pstmt.executeUpdate();
			
			if(a==1)
				System.out.println("인서트 성공");
			else
				System.out.println("인서트 실패");
		
		}catch (SQLException e) {
			// TODO: handle exception
			e.printStackTrace();
		}finally {
			db.dbClose(pstmt, conn);
		}
	}
		
		public void selectMyStudent()
		{
			System.out.println("시퀀스\t학생명\t학년\t연락처\t주소\t나이\t날짜");
			System.out.println("==================================================");
			
			String sql = "select * from mystudent order by stu_num";
			
			Connection conn=null;
			Statement stmt=null;
			ResultSet rs=null;
			
			conn=db.getConnection();
			
			try {
				stmt=conn.createStatement();
				rs=stmt.executeQuery(sql);
				
				while(rs.next())
				{
					System.out.println(rs.getInt("stu_num")+
							"\t"+rs.getString("stu_name")+
							"\t"+rs.getInt("stu_grade")+
							"\t"+rs.getString("hp")+
							"\t"+rs.getString("addr")+
							"\t"+rs.getInt("age")+
							"\t"+rs.getDate("sdate"));
				}
			}catch (Exception e) {
				// TODO: handle exception
				e.printStackTrace();
			}finally {
				db.dbClose(rs, stmt, conn);
			}
		
		}
		
		public void deleteMyStudent()
		{
			Connection conn=db.getConnection();
			PreparedStatement pstmt=null;
			
			System.out.println("삭제할 시퀀스");
			int num=Integer.parseInt(sc.nextLine());
			
			String sql="delete from mystudent where stu_num=?";
			
			try {
				pstmt=conn.prepareStatement(sql);
				pstmt.setInt(1, num);
				
				int a=pstmt.executeUpdate();
				
				if(a==1)
					System.out.println("**삭제성공**");
				else
					System.out.println("**삭제실패**");
					
				
			} catch (SQLException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}finally {
				db.dbClose(pstmt, conn);
			}
			
		}
		
		public boolean isData(String stu_num)
		{
			boolean b=false;
			
			Connection conn=db.getConnection();
			PreparedStatement pstmt=null;
			ResultSet rs=null;
			
			String sql = "select * from mystudent where stu_num=?";
			
			try {
				pstmt=conn.prepareStatement(sql);
				
				pstmt.setString(1, stu_num);
				rs=pstmt.executeQuery();
				
				if(rs.next())
					b=true;
				else
					b=false;
				
			} catch (SQLException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}finally {
				db.dbClose(rs, pstmt, conn);
			}
			
			return b;
		}
		
		public void updateMyStudent()
		{
			Connection conn=db.getConnection();
			PreparedStatement pstmt=null;
			
			System.out.println("수정할 시퀀스 번호");
			String num=sc.nextLine();
			
			if(!isData(num))
			{
				System.out.println("해당 번호는 존재하지 않습니다");
				return;
			}
			
			System.out.println("수정할 학생명");
			String stu_name=sc.nextLine();
			System.out.println("수정할 학년");
			int stu_grade=Integer.parseInt(sc.nextLine());
			System.out.println("수정할 연락처");
			String hp=sc.nextLine();
			System.out.println("수정할 주소");
			String addr=sc.nextLine();
			System.out.println("수정할 나이");
			int age=Integer.parseInt(sc.nextLine());
			
			String sql="update mystudent set stu_name=?,stu_grade=?,hp=?,addr=?,age=? where stu_num=?";
			
			try {
				pstmt=conn.prepareStatement(sql);
				
				pstmt.setString(1, stu_name);
				pstmt.setInt(2, stu_grade);
				pstmt.setString(3, hp);
				pstmt.setString(4, addr);
				pstmt.setInt(5, age);
				pstmt.setString(6, num);
				pstmt.execute();
				
				System.out.println("**수정성공**");
			
			}catch (SQLException e) {
				// TODO: handle exception
				e.printStackTrace();
			}finally {
				db.dbClose(pstmt, conn);
			}
		}
		
		public void searchStudent()
		{
			System.out.println("검색할 학생명(일부)");
			String stu_name=sc.nextLine();
			
			String sql="select * from mystudent where stu_name like ?";
			
			System.out.println(sql);
			
			System.out.println("시퀀스\t학생명\t학년\t핸드폰\t주소\t나이");
			System.out.println("-----------------------------------------");
			
			Connection conn=db.getConnection();
			PreparedStatement pstmt=null;
			ResultSet rs=null;
			
			try {
				pstmt=conn.prepareStatement(sql);
				
				pstmt.setString(1,"%"+stu_name+"%");
				rs=pstmt.executeQuery();
				
				while(rs.next())
				{
					System.out.println(rs.getInt("stu_num")
							+"\t"+rs.getString("stu_name")
							+"\t"+rs.getInt("stu_grade")
							+"\t"+rs.getString("hp")
							+"\t"+rs.getString("addr")
							+"\t"+rs.getString("age")
							+"\t"+rs.getDate("sdate"));
				}
				
			} catch (SQLException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}finally
			{
				db.dbClose(rs, pstmt, conn);
			}
		}
	
	
	public static void main(String[] args) {
		// TODO Auto-generated method stub

		mystudent stu=new mystudent();
		Scanner sc=new Scanner(System.in);
		int n;
		
		while(true)
		{
			System.out.println("***학생목록***");
			System.out.println("1.학생추가  2.학생출력  3.학생삭제  4.학생수정  5.학생검색  9.종료");
			n=Integer.parseInt(sc.nextLine());
			
			if(n==1)
				stu.insertMyStudent();
			else if(n==9)
			{
				System.out.println("종료합니다");
				break;
			}
			else if(n==2)
				stu.selectMyStudent();
			else if(n==3)
				stu.deleteMyStudent();
			else if(n==4)
				stu.updateMyStudent();
			else if(n==5)
				stu.searchStudent();
			
			System.out.println();
		}
		
	}

}
