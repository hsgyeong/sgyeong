package day0710;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.util.Date;

public class QuizConnectNewBoard {

	static final String URL="jdbc:oracle:thin:@localhost:1521:XE";

	public void connectBoard()
	{

		Connection conn=null;
		Statement stmt=null;
		ResultSet rs=null;

		String sql="select * from snsboard";

		try {
			conn=DriverManager.getConnection(URL, "Sgyeong", "a1234");
			System.out.println("서버 연결 성공");

			stmt=conn.createStatement();
			rs=stmt.executeQuery(sql);
			System.out.println("번호\t닉네임\t제목\t내용\t날짜");

			while(rs.next())
			{
				int b_num=rs.getInt("b_num");
				String nick=rs.getString("nick");
				String subject=rs.getString("subject");
				String content=rs.getString("content");
				Date wday=rs.getDate("wday");

				System.out.println(b_num+"\t"+nick+"\t"+subject+"\t"+content+"\t"+wday);

			}

		}catch(SQLException e) {

			e.printStackTrace();
			System.out.println("서버 연결 실패"+e.getMessage());

		}finally {

			try {

				if(rs!=null) rs.close();
				if(stmt!=null) stmt.close();
				if(conn!=null) conn.close();

			}catch(SQLException e) {
				e.printStackTrace();
			}

		}

	}


	public static void main(String[] args) {
		// TODO Auto-generated method stubs

		QuizConnectNewBoard QCNB = new QuizConnectNewBoard();
		QCNB.connectBoard();
	}

}
