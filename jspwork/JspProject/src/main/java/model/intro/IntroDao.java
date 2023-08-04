
package model.intro;

import java.sql.Connection; import java.sql.PreparedStatement; import
java.sql.ResultSet; import java.sql.SQLException; import java.util.ArrayList;

import model.mymall.MallDto; import oracle.db.DBConnect;

public class IntroDao {

	DBConnect db = new DBConnect();

	public void insertMyintro(IntroDto dto) {

		Connection conn=null;

		PreparedStatement pstmt=null;

		String sql="insert into myintro values(seq1.nextval,?,?,?,?,sysdate)";

		conn=db.getConnection();

		try {

			pstmt=conn.prepareStatement(sql);

			pstmt.setString(1, dto.getIntro_name()); 
			pstmt.setString(2, dto.getIntro_blood()); 
			pstmt.setString(3, dto.getIntro_hp());
			pstmt.setString(4, dto.getIntro_city());

			pstmt.execute(); 
		} catch (SQLException e) 
		{ // TODO Auto-generated catch
			e.printStackTrace(); 
		}finally { db.dbClose(pstmt, conn); 
		}

	}

	public ArrayList<IntroDto> getAllMyintro() 
	{ ArrayList<IntroDto> list=new ArrayList<IntroDto>();

	Connection conn=db.getConnection(); 
	PreparedStatement pstmt=null;
	ResultSet rs=null;

	String sql="select * from myintro order by num";

	try { pstmt=conn.prepareStatement(sql); rs=pstmt.executeQuery();

	while(rs.next()) { IntroDto dto=new IntroDto();

	dto.setIntro_num(rs.getString("Intro_num"));
	dto.setIntro_name(rs.getString("Intro_name"));
	dto.setIntro_blood(rs.getString("Intro_blood"));
	dto.setIntro_hp(rs.getString("Intro_hp"));
	dto.setIntro_city(rs.getString("Intro_city"));
	dto.setGaipday(rs.getTimestamp("Gaipday"));

	list.add(dto); 
	} 
	} catch (SQLException e) 
	{ // TODO Auto-generated catch
		e.printStackTrace(); 
	}finally { db.dbClose(rs, pstmt, conn); 
	}

	return list; 
	}

	public void deleteMyintro(String intro_num) { Connection
		conn=db.getConnection(); PreparedStatement pstmt=null;

		String sql="delete from Myintro where intro_num=?";


		try { 
			pstmt=conn.prepareStatement(sql);
			pstmt.setString(1, intro_num);
			pstmt.executeUpdate(); 
		} catch (SQLException e) 
		{ // TODO Auto-generated
			e.printStackTrace(); 
		}finally { 
			db.dbClose(pstmt, conn); 
		}

	}

	public IntroDto getData(String intro_num) {

		IntroDto dto=new IntroDto();

		Connection conn=db.getConnection(); 
		PreparedStatement pstmt=null; 
		ResultSet rs=null;

		String sql="select * from myintro where intro_num=?";

		try { 
			pstmt=conn.prepareStatement(sql); 
			pstmt.setString(1, intro_num);
			rs=pstmt.executeQuery();

			if(rs.next()) 
			{ 
				dto.setIntro_num(rs.getString("intro_num"));
				dto.setIntro_name(rs.getString("intro_name"));
				dto.setIntro_blood(rs.getString("intro_blood"));
				dto.setIntro_hp(rs.getString("intro_hp"));
				dto.setIntro_city(rs.getString("intro_city")); 
			} 
		}catch(SQLException e) {
			e.printStackTrace(); 
		}finally { 
			db.dbClose(rs, pstmt, conn); 
		} return dto; 
	}

	public void updateMyintro(IntroDto dto) 
	{ 
		Connection conn=db.getConnection();

		PreparedStatement pstmt=null;

		String sql="update myintro set intro_name=?, intro_blood=?, intro_hp=? intro_city=? where intro_num=?"
				;

		try { 
			pstmt=conn.prepareStatement(sql);

			pstmt.setString(1, dto.getIntro_name()); 
			pstmt.setString(2, dto.getIntro_blood()); 
			pstmt.setString(3, dto.getIntro_hp());
			pstmt.setString(4, dto.getIntro_city()); 
			pstmt.setString(5, dto.getIntro_num()); 
		} catch (SQLException e) { // TODO Auto-generated catch
			e.printStackTrace(); 
		}finally {
			db.dbClose(pstmt, conn);
		}

	}

}
