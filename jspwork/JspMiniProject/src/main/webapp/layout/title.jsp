<%@page import="data.dao.ShopDao"%>
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
    <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.10.5/font/bootstrap-icons.css">
    <script src="https://code.jquery.com/jquery-3.7.0.js"></script>
    <style type="text/css">
    div.cart{
		float:right;
		cursor:pointer;
	}
	.count{
		width:30px;
		height:30px;
		float: right;
		background-color: red;
		border-radius: 100px;
		text-align: center;
		z-index:10;
		position: relative;
		left:-20px;
		top: 10px;
		line-height: 30px;
		color: white;
		font-size:0.4em;
	}
	
    </style>
    <script type="text/javascript">
	$(function(){
		
		$("div.cart").click(function(){
			
			location.href="index.jsp?main=shop/mycart.jsp";
		})
	})
	</script>
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
<img alt="" src="<%=root %>/image/title2.png " style="width:180px; height:150px;" >&nbsp;&nbsp;&nbsp;
Jsp & JQuery Mini Project</a>
<body>
<% 
if(loginok==null)
{%>
<button type="button" class="btn btn-outline-success" onclick="location.href='index.jsp?main=login/loginform.jsp'">로그인</button>
<%}else {%>
<button type="button" class="btn btn-outline-success" onclick="location.href='login/logoutaction.jsp'">로그아웃</button>
<img src="image/05.png" style="width:25px; margin-top: 5px;"><b style="font-size: 15px"><%=myid %>님이 로그인중입니다</b>
<%}
%>

<div class="cart">
<% 
ShopDao sdao=new ShopDao();

//카트갯수 구하기

int cartSize=sdao.getCartList(myid).size();

%>

<i class="bi bi-cart4" style="font-size:1.2em;"></i>

<div class="count"><%=cartSize %></div>
</div>
</body>
</html>