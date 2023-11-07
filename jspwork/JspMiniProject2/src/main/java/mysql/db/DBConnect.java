package mysql.db;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;

public class DBConnect {

	//driver,url,�④쑴�젟,�뜮袁⑨옙甕곕뜇�깈

	static final String MYSQL_URL="jdbc:mysql://localhost:3306/coffee?serverTimezone=Asia/Seoul";

	//driver   //driver占쎈뮉 占쎈뎨 占쎈립甕곕뜄彛� 占쎈뼄占쎈뻬
	String driver="com.mysql.cj.jdbc.Driver";

	public DBConnect() {
		try {
			Class.forName(driver);
			System.out.println("MYSQL 占쎈굡占쎌뵬占쎌뵠甕곤옙 占쎄쉐�⑨옙");
		} catch (ClassNotFoundException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
			System.out.println("MYSQL 占쎈굡占쎌뵬占쎌뵠甕곤옙 占쎈뼄占쎈솭");
		}
	}

	//Connection
	public Connection getConnection()
	{
		Connection conn=null;

		try {
			conn=DriverManager.getConnection(MYSQL_URL,"sgyeong","1234");



		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
			System.out.println("MYSQL 占쎈염野껉퀣�뼄占쎈솭: url,�④쑴�젟,�뜮袁⑨옙甕곕뜇�깈 占쎌넇占쎌뵥占쎌뒄占쎈맙"+e.getMessage());
		}

		return conn;
	}

	//close筌롫뗄苑뚳옙諭�.. �룯占� 4揶쏉옙

	public void dbClose(ResultSet rs,Statement stmt,Connection conn)
	{
		try {
			if(rs!=null) rs.close();
			if(stmt!=null) stmt.close();
			if(conn!=null) conn.close();
		}catch(SQLException e) {

			e.printStackTrace();
		}
	}

	public void dbClose(Statement stmt,Connection conn)
	{
		try {
			if(stmt!=null) stmt.close();
			if(conn!=null) conn.close();
		}catch(SQLException e) {

			e.printStackTrace();
		}
	}

	public void dbClose(ResultSet rs,PreparedStatement pstmt,Connection conn)
	{
		try {
			if(rs!=null) rs.close();
			if(pstmt!=null) pstmt.close();
			if(conn!=null) conn.close();
		}catch(SQLException e) {

			e.printStackTrace();
		}
	}

	public void dbClose(PreparedStatement pstmt,Connection conn)
	{
		try {
			if(pstmt!=null) pstmt.close();
			if(conn!=null) conn.close();
		}catch(SQLException e) {

			e.printStackTrace();
			
			
		}
	}

}
