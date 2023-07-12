package jdbc_sawon;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.util.Scanner;

public class SawonCRUD {

	DBConnect db=new DBConnect();
	Scanner sc=new Scanner(System.in);
	
	public void addSawon() {
		
		System.out.println("**사원추가하기**");
		
		System.out.println("사원명?");
		String name=sc.nextLine();
		
		System.out.println("부서명?");
		String buseo=sc.nextLine();
		
		System.out.println("성별(여자 or 남자)?");
		String gender=sc.nextLine();
		
		System.out.println("사원명?");
		int pay=Integer.parseInt(sc.nextLine());
		
		String sql="insert into sawon values (seq_sawon.nextval,'"+name+"','"+gender+"','"+buseo+"','"+pay+"')";
		System.out.println(sql);
		
		//오라클에 연결
		Connection conn=db.getConnection();
		
		Statement stmt=null;
		
		try {
			stmt=conn.createStatement();
			
			stmt.execute(sql);  //sql문실행

			System.out.println("DB에 추가되었습니다");
			
			
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}finally {
			db.dbClose(stmt, conn);
		}
	}
	
	public void writeSawon()
	{
		String sql="select num,name,gender,buseo,to_char(pay,'L999,999,999') pay from sawon";
		
		System.out.println("\t\t[전체사원명단]");
		System.out.println();
	
		System.out.println("시퀀스\t사원명\t성별\t부서명\t월급여");
		System.out.println("--------------------------------------------");
		
		//db연결
		Connection conn=db.getConnection();
		Statement stmt=null;
		ResultSet rs=null;
		
		try {
			stmt=conn.createStatement();
			rs=stmt.executeQuery(sql);
			
			while(rs.next())
			{
				System.out.println(rs.getInt("num")+"\t"
						+rs.getString("name")+"\t"
						+rs.getString("gender")+"\t"
						+rs.getString("buseo")+"\t"
						+rs.getString("pay"));
			}
		
		
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}finally {
			db.dbClose(rs, stmt, conn);
		}
	}
	
	
	//삭제... 사원명을 입력하면 삭제
	public void deleteSawon() {
		
		
		System.out.println("삭제할 사원명");
		String name=sc.nextLine();
		
		String sql="delete from sawon where name='"+name+"'";
		
		//db연결
		Connection conn=db.getConnection();
		Statement stmt=null;

		try {
			stmt=conn.createStatement();
			stmt.execute(sql);
			
			System.out.println(name+"님 삭제됨");
			
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}finally {
			db.dbClose(stmt, conn);
		}
		
	}
	
	//수정.. 시퀀스 입력후 부서,급여만 수정
	
	public void updateSawon(){
		
		System.out.println("수정할 시퀀스 번호");
		int num=Integer.parseInt(sc.nextLine());
		
		System.out.println("수정할 부서");
		String buseo = sc.nextLine();
		
		System.out.println("수정할 급여");
		int pay = Integer.parseInt(sc.nextLine());
		
		//sql
		String sql="update sawon set buseo='"+buseo+"',pay="+pay+" where num="+num;
		System.out.println(sql);
		
		Connection conn=db.getConnection();
		Statement stmt=null;
		
		try {
		stmt=conn.createStatement();
		stmt.execute(sql);
		System.out.println("사원번호 수정완료");
		
		}catch(SQLException e){
			e.printStackTrace();
		}finally {
			db.dbClose(stmt, conn);
		}
		
	}
	
	//검색
	public void searchSawon(){
		
		System.out.println("검색할 사원명(일부)");
		String name=sc.nextLine();
		
	/*	String sql="select num,name,gender,buseo,to_char(pay,'L999,999,999')pay from sawon "
					+"where name like '%"+name+"%'";  */
		String sql= "select * from sawon where name like ?";
		
		System.out.println(sql);
		
		System.out.println("\t\t[검색사원명단]");
		System.out.println();
		
		System.out.println("시퀀스\t사원명\t성별\t부서명\t월급여");
		System.out.println("--------------------------------------------");
		
		Connection conn=db.getConnection();
	//	Statement stmt=null;
		PreparedStatement pstmt=null;
		ResultSet rs=null;
		
	/*	try {
			stmt=conn.createStatement();
			rs=stmt.executeQuery(sql);
			
			while(rs.next())
			{
				System.out.println(rs.getInt("num")+"\t"
						+rs.getString("name")+"\t"
						+rs.getString("gender")+"\t"
						+rs.getString("buseo")+"\t"
						+rs.getString("pay"));
			}
			
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}finally {
			db.dbClose(rs, stmt, conn); 
		} */
		
		try {
			pstmt=conn.prepareStatement(sql);
			
			pstmt.setString(1, "%"+name+"%");
			rs=pstmt.executeQuery();
			
			while(rs.next())
			{
				System.out.println(rs.getInt("num")
						+"\t"+rs.getString("name")
						+"\t"+rs.getString("gender")
						+"\t"+rs.getString("buseo")
						+"\t"+rs.getInt("pay"));
				
				
			}
			
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}finally {
			db.dbClose(rs, pstmt, conn);
		}
		
		
		
	}
	
	
	public static void main(String[] args) {
		// TODO Auto-generated method stub

		//클래스에서 생성
		SawonCRUD sawon=new SawonCRUD();
		
		
		//scanner 생성
		Scanner sc=new Scanner(System.in);
		int n;
		
		while(true)
		{
			System.out.println("Oracle Db_Sawon 문제");
			System.out.println("1.insert  2.select  3.update  4.delete  5.사원검색  9.종료");
		
			n=Integer.parseInt(sc.nextLine());
			
			if(n==1)
				sawon.addSawon();
			else if(n==9)
			{
				System.out.println("종료합니다");
				break;
			}
			else if(n==2)
				sawon.writeSawon();
			else if(n==4)
				sawon.deleteSawon();
			else if(n==3)
				sawon.updateSawon();
			else if(n==5)
				sawon.searchSawon();
			
		
		}	
	}

}
