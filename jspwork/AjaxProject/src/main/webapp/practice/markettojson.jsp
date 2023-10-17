<%@page import="java.sql.Statement"%>
<%@page import="java.sql.PreparedStatement"%>
<%@page import="org.json.simple.JSONObject"%>
<%@page import="java.sql.SQLException"%>
<%@page import="org.json.simple.JSONArray"%>
<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.Connection"%>
<%@page import="oracle_db.DBConnect"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%

	DBConnect db = new DBConnect();
	Connection conn = db.getConnection();
	Statement stmt = null; /* Statement java.beans와 java.sql의 차이? */
	ResultSet rs=null;
	
	String sql="select * from market order by num";
	/* preparestatement는 구문이 완성되지 않았어도 ?를 setString을 하면서 미완성구문을 완성시켜줌
		statement는 명령어가 완전 완성되어 있어야함 문자열 변수를 완성시켜줘야함 */
	try{
	stmt=conn.createStatement();
	rs=stmt.executeQuery(sql);  /*pstmt와 stmt의 차이?  */
	
	JSONArray arr=new JSONArray();
	
	while(rs.next())
	{
		String num=rs.getString("num");
		String mname=rs.getString("mname");
		String mphoto=rs.getString("mphoto");
		int mprice=rs.getInt("mprice");
		int cnt=rs.getInt("cnt");
		
		JSONObject ob=new JSONObject();
		
		ob.put("num",num);
		ob.put("mname",mname);
		ob.put("mphoto",mphoto);
		ob.put("mprice",mprice);
		ob.put("cnt",cnt);
		
		arr.add(ob);
		
	}%>

<%=arr.toString() %>
<% }catch(SQLException e){
	
}
%>