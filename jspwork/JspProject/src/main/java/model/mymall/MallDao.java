package model.mymall;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;

import oracle.db.DBConnect;

public class MallDao {

	DBConnect db=new DBConnect();

	public void insertMyMall(MallDto dto)
	{

		Connection conn=null;

		PreparedStatement pstmt=null;

		String sql="insert into mymall values(seq1.nextval,?,?,?,?,sysdate)";

		conn=db.getConnection();

		try {
			pstmt=conn.prepareStatement(sql);

			pstmt.setString(1, dto.getSangpum());
			pstmt.setString(2, dto.getPhoto());
			pstmt.setString(3, dto.getPrice());
			pstmt.setString(4, dto.getIpgoday());

			pstmt.execute();

		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}finally {
			db.dbClose(pstmt, conn);
		}

	}

	public ArrayList<MallDto> getAllMymall()
	{
		ArrayList<MallDto> list=new ArrayList<MallDto>();

		Connection conn=db.getConnection();
		PreparedStatement pstmt=null;
		ResultSet rs=null;

		String sql="select * from mymall order by num";

		try {
			pstmt=conn.prepareStatement(sql);
			rs=pstmt.executeQuery();

			while(rs.next())
			{
				MallDto dto=new MallDto();

				dto.setNum(rs.getString("num"));
				dto.setSangpum(rs.getString("sangpum"));
				dto.setPhoto(rs.getString("photo"));
				dto.setPrice(rs.getString("price"));
				dto.setIpgoday(rs.getString("ipgoday"));
				dto.setWriteday(rs.getTimestamp("writeday"));

				list.add(dto);
			}
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}finally {
			db.dbClose(rs, pstmt, conn);
		}

		return list;
	}
	
	public void deleteMymall(String num)
	{
		Connection conn=db.getConnection();
		PreparedStatement pstmt=null;
		
		String sql="delete from Mymall where num=?";
		
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

	//하나의 dto 얻기
	public MallDto getData(String num) {

		MallDto dto=new MallDto();

		Connection conn=db.getConnection();
		PreparedStatement pstmt=null;
		ResultSet rs=null;

		String sql="select * from mymall where num=?";

		try {
			pstmt=conn.prepareStatement(sql);
			pstmt.setString(1, num);
			rs=pstmt.executeQuery();

			if(rs.next())
			{
				dto.setNum(rs.getString("num"));
				dto.setSangpum(rs.getString("sangpum"));
				dto.setPhoto(rs.getString("photo"));
				dto.setPrice(rs.getString("price"));
				dto.setIpgoday(rs.getString("ipgoday"));
			}

		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}finally {
			db.dbClose(rs, pstmt, conn);
		}

		return dto;
	}
	
	public void updateMall(MallDto dto)
	{
		Connection conn=db.getConnection();
		
		PreparedStatement pstmt=null;
		
		String sql="update mymall set sangpum=?, photo=?, price=?, ipgoday=? where num=?";
		
		try {
			
			pstmt=conn.prepareStatement(sql);
			
			pstmt.setString(1, dto.getSangpum());
			pstmt.setString(2, dto.getPhoto());
			pstmt.setString(3, dto.getPrice());
			pstmt.setString(4, dto.getIpgoday());
			pstmt.setString(5, dto.getNum());
			//num을 안줬네 <=민규형
			
			pstmt.execute();
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}finally {
			db.dbClose(pstmt, conn);
		}
	}
}
