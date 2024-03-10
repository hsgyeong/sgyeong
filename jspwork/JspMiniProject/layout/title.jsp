<%@page import="data.dao.MemberDao"%>
<%@page import="data.dto.MemberDto"%>
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

<% 
//절대경로잡기
String root=request.getContextPath();
//로그인세션
String loginok=(String)session.getAttribute("loginok");
//아이디얻기
String myid=(String)session.getAttribute("myid");
//dao에서 이름 얻기
MemberDao dao = new MemberDao();
String name=dao.getName(myid);
%>

<a href="<%=root %>" style="color:black; font-size:20px; text-decoration: none; font-size: 15px;">
<img alt="" src="<%=root %>/image/title2.png " style="width:150px; height:100px;" hscape="5px">&nbsp;&nbsp;&nbsp;
Jsp & JQuery Mini Project</a>
<body>
<% 
if(loginok==null)
{%>
<button type="button" class="btn btn-outline-success" onclick="location.href='index.jsp?main=login/loginform.jsp'">로그인</button>
<%}else {%>
<button type="button" class="btn btn-outline-success" onclick="location.href='login/logoutaction.jsp'">로그아웃</button>
<img src="image/05.png" style="width:25px"><b style="font-size: 15px"><%=myid %>님이 로그인중입니다</b>
<%}
%>
</body>
</html>