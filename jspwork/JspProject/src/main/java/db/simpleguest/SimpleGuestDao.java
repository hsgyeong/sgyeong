package db.simpleguest;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;

import mysql.db.DBConnect;

public class SimpleGuestDao {

	DBConnect db=new DBConnect();
	
	//insert
	public void insertSimpleGuest(SimpleGuestDto dto)
	{
		Connection conn=db.getConnection();
		PreparedStatement pstmt=null;
		String sql="insert into simpleguest values(null,?,?,?,?,now())";
	
		
		try {
			pstmt=conn.prepareStatement(sql);
			
			pstmt.setString(2, dto.getNick());
			pstmt.setString(3, dto.getPass());
			pstmt.setString(1, dto.getImage());
			pstmt.setString(4, dto.getStory());
			
			pstmt.execute();
			
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}finally {
			db.dbClose(pstmt, conn);
		}		
		
	}
	
	public ArrayList<SimpleGuestDto> getAllSimpleGuest()
	{
		ArrayList<SimpleGuestDto> list=new ArrayList<SimpleGuestDto>();
		
		Connection conn=db.getConnection();
		PreparedStatement pstmt=null;
		ResultSet rs=null;
		
		String sql="select * from simpleguest order by num desc";
		
		try {
			pstmt=conn.prepareStatement(sql);
			rs=pstmt.executeQuery();
			
			while(rs.next()) {
				
			SimpleGuestDto dto=new SimpleGuestDto();
			
			dto.setNum(rs.getString("num"));
			dto.setNick(rs.getString("nick"));
			dto.setPass(rs.getString("pass"));
			dto.setImage(rs.getString("image"));
			dto.setStory(rs.getString("story"));
			dto.setWriteday(rs.getTimestamp("writeday"));
			
			list.add(dto);
			}
			pstmt.execute();
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}finally {
			db.dbClose(rs, pstmt, conn);
		}
		return list;		
		
	}
	
	//비밀번호 비교
	//비밀번호 맞으면 true, 틀리면 false
	public boolean isEqualPass(String num, String pass)
	{
		boolean flag=false;
		
		Connection conn=db.getConnection();
		PreparedStatement pstmt=null;
		ResultSet rs=null;
		
		String sql="select * from simpleguest where num=? and pass=?";
		
		try {
			pstmt=conn.prepareStatement(sql);
			pstmt.setString(1, num);
			pstmt.setString(2, pass);
			
			rs=pstmt.executeQuery();
			
			if(rs.next())  //일치하면 true
			{
			 flag=true;	
			}	
			} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}finally {
			db.dbClose(rs, pstmt, conn);
		}
		return flag;
	}
	
	//수정폼 하나의 dto
	public SimpleGuestDto getData(String num)
	{
		SimpleGuestDto dto=new SimpleGuestDto();
		
		Connection conn=db.getConnection();
		PreparedStatement pstmt=null;
		ResultSet rs=null;
		
		String sql="select * from simpleguest where num=?";
		
		try {
			pstmt=conn.prepareStatement(sql);
			pstmt.setString(1, num);
			rs=pstmt.executeQuery();
			
			if(rs.next())
			{
				dto.setNum(rs.getString("num"));
				dto.setNick(rs.getString("nick"));
				dto.setImage(rs.getString("image"));
				dto.setStory(rs.getString("story"));
				dto.setWriteday(rs.getTimestamp("writeday"));
			}
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}finally {
			db.dbClose(rs, pstmt, conn);	
		}
		return dto;
	}
	
	
	//데이터수정.. 비번이 맞을 경우에만 호출할 것이므로
	//비번은 조건에 안 넣을 예정
	//수정: 닉네임, 이미지, 스토리
	public void updateGuest(SimpleGuestDto dto)
	{
		Connection conn=db.getConnection();
		PreparedStatement pstmt=null;
		
		String sql="update simpleguest set nick=?, image=?, story=? where num=?";
		
		try {
			pstmt=conn.prepareStatement(sql);
			pstmt.setString(1, dto.getNick());
			pstmt.setString(2, dto.getImage());
			pstmt.setString(3, dto.getStory());
			pstmt.setString(4, dto.getNum());
			
			pstmt.execute();
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}finally {
			db.dbClose(pstmt, conn);
		}
	
	}
	
	public void deleteGuest(String num)
	{
		Connection conn=db.getConnection();
		PreparedStatement pstmt=null;
		
		String sql="delete from simpleguest where num=?";
		
		try {
			pstmt=conn.prepareStatement(sql);
			pstmt.setString(1, num);
			pstmt.executeUpdate();
			
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}finally {
			db.dbClose(pstmt, conn);
		}
	
		
	}
}
