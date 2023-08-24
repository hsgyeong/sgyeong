<%@page import="java.text.SimpleDateFormat"%>
<%@page import="data.dto.MemberDto"%>
<%@page import="java.util.List"%>
<%@page import="data.dao.MemberDao"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
 <link  href="https://fonts.googleapis.com/css2?family=Cute+Font&family=Dongle:wght@300&family=Gamja+Flower&family=Gowun+Batang&family=Gowun+Dodum&family=Hi+Melody&family=Nanum+Gothic&family=Nanum+Gothic+Coding&family=Nanum+Pen+Script&family=Poor+Story&family=Sunflower:wght@300&display=swap"
 		rel="stylesheet">
 <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/css/bootstrap.min.css" rel="stylesheet">
    <script src="https://code.jquery.com/jquery-3.7.0.js"></script>
<title>Insert title here</title>
<%
MemberDao dao = new MemberDao();
List<MemberDto> list = dao.getAllMembers();
SimpleDateFormat sdf=new SimpleDateFormat("yyyy-MM-dd");
%>
</head>
<body>
<table class="table" style="width:800px;">
<% 
for(MemberDto dto:list)
	{%>
	<div>
	<tr style="width:200px;" align="center";  rowspan="5" >
	
	</tr>
	<tr>
	<td>이름: <%=dto.getName() %><img alt="" src="image/11.png" style="width:150px; border-radius:20px; width:50px;"></td>
	</tr>
	<tr>
	<td>아이디: <%=dto.getId() %></td>
	</tr>
	<tr>
	<td>핸드폰: <%=dto.getHp() %></td>
	</tr>
	<tr>
	<td>주소: <%=dto.getAddr() %></td>
	</tr>
	<tr>
	<td>이메일: <%=dto.getEmail() %></td>
	</tr>
	</tr>
	<tr><td>
	<button type="button" class="btn btn-outline-success" 
	onclick="location.href='index.jsp?main=member/updateform.jsp?num=<%=dto.getNum() %>'">수정</button>
	<button type="button" class="btn btn-outline-danger" 
	onclick="location.href=''">삭제</button>
	</td></tr>
	<tr></tr>
	</div>
	<%}
%>
</table>
</body>
</html>