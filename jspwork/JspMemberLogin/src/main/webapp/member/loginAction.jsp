<%@page import="member.model.MemberDao"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link
	href="https://fonts.googleapis.com/css2?family=Cute+Font&family=Dongle:wght@300&family=Gamja+Flower&family=Gowun+Batang&family=Gowun+Dodum&family=Hi+Melody&family=Nanum+Gothic&family=Nanum+Gothic+Coding&family=Nanum+Pen+Script&family=Poor+Story&family=Sunflower:wght@300&display=swap"
	rel="stylesheet">
<link
	href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/css/bootstrap.min.css"
	rel="stylesheet">
<script src="https://code.jquery.com/jquery-3.7.0.js"></script>
</head>
<body>
	<%
	String id = request.getParameter("id");
	String pass = request.getParameter("pass");
	String save = request.getParameter("savechk");
	
	MemberDao ab = new MemberDao();
	
	boolean flag = ab.isLogin(id,pass);
	
	if(flag)
	{
		session.setAttribute("loginok", "yes");
		session.setAttribute("idok", id);
		session.setAttribute("saveok", save);
		session.setMaxInactiveInterval(60*60*6);
		
		response.sendRedirect("loginMain.jsp");
	}else{%>
	<script>
	alert("아이디 또는 비밀번호가 맞지 않습니다");
	history.back();
	</script>	
	<%}
	%>
	
</body>
</html>