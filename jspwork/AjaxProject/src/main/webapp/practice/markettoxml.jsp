<?xml version="1.0" encoding="UTF-8"?>
<%@page import="java.sql.SQLException"%>
<%@page import="java.text.SimpleDateFormat"%>
<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.PreparedStatement"%>
<%@page import="java.sql.Connection"%>
<%@page import="oracle_db.DBConnect"%>
<%@ page language="java" contentType="text/xml; charset=UTF-8"
    pageEncoding="UTF-8"%>  <!--이걸 넣어줘야 하는 이유?-->
<data>
<%
DBConnect db=new DBConnect();
Connection conn=db.getConnection();
PreparedStatement pstmt=null;
ResultSet rs=null;
String sql="select * from market order by num";
SimpleDateFormat sdf=new SimpleDateFormat("yyyy-MM-dd");

try{
pstmt=conn.prepareStatement(sql);
rs=pstmt.executeQuery();

while(rs.next())
{
	String num=rs.getString("num");
	String mname=rs.getString("mname");
	String mphoto=rs.getString("mphoto");
	int mprice=rs.getInt("mprice");
	int cnt=rs.getInt("cnt");
	%>
	
	<market num="<%=num %>">
	<mname><%=mname %></mname>
	<mphoto><%=mphoto %></mphoto>
	<mprice><%=mprice %></mprice>
	<cnt><%=cnt %></cnt>
	</market>
				
<%}

}catch(SQLException e){
	
}finally{
	db.dbClose(rs, pstmt, conn);
}
%>
</data>