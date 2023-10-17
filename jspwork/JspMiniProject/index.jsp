<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<link
	href="https://fonts.googleapis.com/css2?family=Cute+Font&family=Dongle:wght@300&family=Gamja+Flower&family=Gowun+Batang&family=Gowun+Dodum&family=Hi+Melody&family=Nanum+Gothic&family=Nanum+Gothic+Coding&family=Nanum+Pen+Script&family=Poor+Story&family=Sunflower:wght@300&display=swap"
	rel="stylesheet">
<link
	href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/css/bootstrap.min.css"
	rel="stylesheet">
<script src="https://code.jquery.com/jquery-3.7.0.js"></script>
<title>Insert title here</title>
<style type="text/css">
div.layout{
	
	position: absolute;
}
div.title{
	width: 100%;
	height: 80px;
	line-height: 80px;
	font-size: 30px;
	font-family: 'Sunflower';
	text-align: center;
}
div.menu{
	width: 100%;
	height: 80px;
	line-height: 80px;
	font-family: 'Sunflower';
	text-align: center;
	top: 80px;
}

div.info{
	width: 200px;
	height: 500px;
	line-height: 10px;
	font-family: 'Sunflower';
	font-size: 15px;
	left: 100px;
	top: 300px;
	padding: 20px 10px;
	border-radius: 30px;
}

div.main{
	width: 1200px;
	height: 1000px;
	font-size: 13pt;
	font-family: 'Sunflower';
	left: 400px;
	top: 220px;
}


</style>

</head>

<% 
//절대경로잡기
String root=request.getContextPath();
String mainPage="layout/main.jsp";  //기본페이지

//url을 통해 main값을 얻어서 메인 웹페이지에 출력
if(request.getParameter("main")!=null)
{
	mainPage=request.getParameter("main");	
	
}
%>

<body>
	<div class="layout title">
		<jsp:include page="layout/title.jsp"/></div>
	<div class="layout menu">
		<jsp:include page="layout/menu.jsp"/></div>
	<div class="layout info">
		<jsp:include page="layout/info.jsp"/></div>
	<div class="layout main">
		<jsp:include page="<%=mainPage %>"/></div>
</body>
</html>
