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
<link href="https://fonts.googleapis.com/css2?family=Gugi&display=swap" rel="stylesheet">
<script src="https://code.jquery.com/jquery-3.7.0.js"></script>
<title>Insert title here</title>
<style type="text/css">
div.layout {
	position:relative;
}

.marttitle {
	 font-family: 'gugi';
	 color: #7DAB12;
	 text-align: center;
	 justify-content: center;
	 text-decoration: none;
	 cursor:pointer !important;
	 position: relative;
	 z-index: 9999;
}

.titlebox {
	font-family: 'gugi';
	font-size: 70px;
	text-align: center;
	justify-content: center;
	align-items: center;
	top: 40px;/**/
	position: absolute;
	width: 100%;
	display: flex;
}
.menu {
	margin-top: 60px;
}
</style>
</head>
<body>
<div class="layout">
	<div class="titlebox">
		<a href="/" class="marttitle">HMart</a>
	</div>
	<div class="title" id="title">
		<tiles:insertAttribute name="title"/>
	</div>
	<div class="menu" id="menu">
		<tiles:insertAttribute name="menu"/>
	</div>
	<div class="main">
		<tiles:insertAttribute name="main"/>
	</div>
    <div class="info" id="info">
		<tiles:insertAttribute name="info"/>
	</div> 
</div>
</body>
</html>