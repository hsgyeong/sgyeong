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
div.layout{
	position:relative;
}
div.layout div.menu
{
position:absolute;
top:100px;
width:100%;
margin-top: 50px;
height:100px;
border: 1px solid green;
}

div.layout div.main
{
position:absolute;
top:180px;
margin-top:30px;
width:100%;
height:100%;
font-size: 17px;
margin-bottom: 100px;
}
div.layout div.title
{
position:absolute;
width:100%;
height:150px;
}

div.layout div.info
{
position:absolute;
width: 100%;
height: 20%;
top: calc(180px + 30px + 1000px + 50px);
bottom: 0 !important;
}

div.layout div.category
{
position: absolute;
height: 100%;
width: 300px;
}


</style>
</head>
<body>
<div class="layout">
	<div class="main">
	<tiles:insertAttribute name="main"/>
	</div>
	<div class="title">
	<tiles:insertAttribute name="title"/>
	</div>
	<div class="menu">
	<tiles:insertAttribute name="menu"/>
	</div>
	<div class="info">
	<tiles:insertAttribute name="info"/>
	</div>
</div>
</body>
</html>