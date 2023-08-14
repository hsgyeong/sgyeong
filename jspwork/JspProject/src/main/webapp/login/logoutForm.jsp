<%@page import="idx.model.IdxDao"%>
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
</head>
<body>
<% 
	//세션으로부터 idok
	String id=(String)session.getAttribute("idok");
	
	//아이디에 해당하는 이름을 dao로부터 얻는다
	IdxDao db=new IdxDao();
	String name=db.getName(id);
%>

<br><br>
<b style="color: green;"><%=name %></b>님이 로그인중 입니다&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
<br><br>
<img alt="" src="../image/profile-picture.png">
<br><br><input type="button" value="로그아웃" class="btn btn-danger"
onclick="location.href='logoutAction.jsp'" style="margin-left:65px">
</body>
</html>