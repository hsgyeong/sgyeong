<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<%@ taglib prefix="tiles" uri="http://tiles.apache.org/tags-tiles" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/css/bootstrap.min.css" rel="stylesheet">
<link href="https://fonts.googleapis.com/css2?family=Dongle:wght@300&family=Gaegu:wght@300&family=Nanum+Pen+Script&family=Sunflower:wght@300&display=swap" rel="stylesheet">
<script src="https://code.jquery.com/jquery-3.7.0.js"></script>
<title>Insert title here</title>
<style type="text/css">
	
	div.layout div.title{
		position:absolute;
		top: 10px;
		left: 600px;
		height:200px;
		width:350px;
		text-align: center;
	}
	
	div.layout div.menu{
		position:absolute;
		top: 100px;
		margin-top:50px;
		width:1200px;
		left: 220px;
		height:50px;
	}
	
	div.layout div.info{
		position:absolute;
		top: 270px;
		left: 30px;
		width:200px;
		height:200px;
		font-family: 'IBM Plex Sans KR', sans-serif;
		font-size: 17px;
	}
	
	div.layout div.info2{
		position:absolute;
		top: 250px;
		left: 1270px;
		width:200px;
		height:200px;
		font-family: 'IBM Plex Sans KR', sans-serif;
		font-size: 17px;
	}
		div.layout div.main{
		position:absolute;
		top: 180px;
		left: 260px;
		margin-top:30px;
		width:1000px;
		height:1000px;
		font-family: 'IBM Plex Sans KR', sans-serif;
		font-size: 17px;
	}
</style>
</head>
<body>
<div class="layout">
	<div class="title">
		<tiles:insertAttribute name="title"/>
	</div>
	<div class="menu">
		<tiles:insertAttribute name="menu"/>
	</div>
	<div class="info">
		<tiles:insertAttribute name="info"/>
	</div>
		<div class="info2">
		<tiles:insertAttribute name="info2"/>
	</div>
	<div class="main">
		<tiles:insertAttribute name="main"/>
	</div>
</div>
</body>
</html>