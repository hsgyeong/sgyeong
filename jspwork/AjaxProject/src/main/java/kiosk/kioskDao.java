package kiosk;


import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;

import oracle_db.DBConnect;



public class kioskDao {
	
	DBConnect db=new DBConnect();
	
	public void insertMenu(kioskDto dto)
	{
		Connection conn=db.getConnection();
		
		PreparedStatement pstmt=null;
		
		String sql="insert into menu values(seq1.nextval,?,?,?,?)";
		
		try {
			pstmt=conn.prepareStatement(sql);
			
			pstmt.setString(1, dto.getName());
			pstmt.setString(2, dto.getImage());
			pstmt.setString(3, dto.getPrice());
			pstmt.setString(4, dto.getStock());
			
			pstmt.execute();
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		
	}
	
	public ArrayList<kioskDto> getAllMenus()
	{
		ArrayList<kioskDto> list=new ArrayList<kioskDto>();
		
		Connection conn=db.getConnection();
		PreparedStatement pstmt=null;
		ResultSet rs=null;
		
		String sql="select * from kiosk order by num";
		
		try {
			pstmt=conn.prepareStatement(sql);
			rs=pstmt.executeQuery();
			
			while(rs.next())
			{
				kioskDto dto=new kioskDto();
				
				dto.setNum(rs.getString("num"));
				dto.setName(rs.getString("name"));
				dto.setImage(rs.getString("image"));
				dto.setPrice(rs.getString("price"));
				dto.setStock(rs.getString("stock"));
				
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
	
	public void deleteKiosk(String num)
	{
		Connection conn=db.getConnection();
		PreparedStatement pstmt=null;
		
		String sql="delete from kiosk where num=?";
		
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
	
	public void uadateKiosk(kioskDto dto)
	{
		Connection conn=db.getConnection();
		PreparedStatement pstmt=null;
		String sql="update kiosk set price=?, stock=? where num=?";
				
		try {
			pstmt=conn.prepareStatement(sql);
			pstmt.setString(1, dto.getPrice());
			pstmt.setString(2, dto.getStock());
			pstmt.setString(3, dto.getNum());
			
			pstmt.execute();
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}finally {
			db.dbClose(pstmt, conn);
		}
		
	}
}
