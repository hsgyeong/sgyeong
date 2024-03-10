package model.sinsang;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.Vector;

import oracle.db.DBConnect;

public class SinsangDao {

	DBConnect db=new DBConnect();  // 데이터베이스 연결을 담당하는 DBConnect 클래스의 인스턴스를 생성

	//insert
	public void insertSinsang(SinsangDto dto)
	{
		Connection conn=null;	//Connection 타입의 conn이라는 변수를 선언하고 null로 초기화. Connection은 데이터베이스 연결을 나타내는 객체를 저장하는 변수

		PreparedStatement pstmt = null; //PreparedStatement 타입의 pstmt라는 변수를 선언하고 null로 초기화. PreparedStatement는 미리 컴파일된 SQL 쿼리를 나타내는 객체를 저장하는 변수

		//conn 변수는 데이터베이스에 연결하기 위한 Connection 객체를 저장하고, pstmt 변수는 데이터베이스에 실행할 쿼리를 준비하는데 사용됨


		String sql="insert into sinsang values(seq1.nextval,?,?,sysdate)";

		//시퀀스 객체 seq1에서 값을 가져와 사용. 시퀀스는 일련번호를 생성하는데 사용되며, 새로운 레코드를 삽입할 때 자동으로 증가되는 값
		//?,?,sysdate: 플레이스홀더. 나중에 실제 값으로 대체. ?는 쿼리 실행 시 바인딩될 값이 올 자리를 나타냄.

		conn=db.getConnection();  //db객체에서 getConnection()메서드 호출. 
		try {
			pstmt=conn.prepareStatement(sql);

			pstmt.setString(1, dto.getName());
			pstmt.setString(2, dto.getAddr());
			pstmt.executeUpdate();

		} catch (SQLException e) {
			// TODO: handle exception
			e.printStackTrace();
		}finally {
			db.dbClose(pstmt, conn);
		}
	}

	//select
	public Vector<SinsangDto> getAllDatas()
	{
		Vector<SinsangDto> list=new Vector<SinsangDto>();

		Connection conn=db.getConnection();
		PreparedStatement pstmt=null;
		ResultSet rs=null;

		String sql="select * from sinsang order by num";

		try {
			pstmt = conn.prepareStatement(sql);
			rs=pstmt.executeQuery();

			//여러개 데이터 얻을 경우
			while(rs.next())
			{
				//dto선언. 반드시 while 안에서
				SinsangDto dto=new SinsangDto();

				dto.setNum(rs.getString("num"));
				dto.setName(rs.getString("name"));
				dto.setAddr(rs.getString("addr"));
				dto.setSdate(rs.getTimestamp("sdate"));

				//벡터에 추가
				list.add(dto);
			}

		}catch(SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}finally {
			db.dbClose(rs, pstmt, conn);
		}
		return list;
	}

	//삭제
	public void deleteSinsang(String num)
	{
		Connection conn=db.getConnection();
		PreparedStatement pstmt=null;

		String sql="delete from sinsang where num=?";

		try {
			pstmt=conn.prepareStatement(sql);
			pstmt.setString(1, num);
			pstmt.executeUpdate();

		}catch(SQLException e) {
			e.printStackTrace();
		}finally {
			db.dbClose(pstmt, conn);
		}
	}
	
	//하나의 데이터 조회
	public SinsangDto getData(String num)
	{
		SinsangDto dto=new SinsangDto();

		Connection conn=db.getConnection();
		PreparedStatement pstmt=null;
		ResultSet rs=null;

		String sql="select * from sinsang where num=?";

		try {
			pstmt=conn.prepareStatement(sql);
			pstmt.setString(1, num);
			rs=pstmt.executeQuery();
			
			//하나의 데이터 조회시 if
			if(rs.next())
			{
				dto.setNum(rs.getString("num"));
				dto.setName(rs.getString("name"));
				dto.setAddr(rs.getString("addr"));
				dto.setSdate(rs.getTimestamp("sdate"));

			}
		}catch(SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}finally {

			db.dbClose(rs, pstmt, conn);	

		}

		return dto;
	}

	//수정. 이름 주소 수정
	public void updateSinsang(SinsangDto dto) 
	{

		Connection conn=db.getConnection();
		PreparedStatement pstmt=null;

		String sql="update sinsang set name=?, addr=? where num=?";

		try {
			pstmt=conn.prepareStatement(sql);

			//?바인딩
			pstmt.setString(1, dto.getName());
			pstmt.setString(2, dto.getAddr());
			pstmt.setString(3, dto.getNum());

			//실행
			pstmt.execute();

		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}finally {
			db.dbClose(pstmt, conn);
		}

	}


}
