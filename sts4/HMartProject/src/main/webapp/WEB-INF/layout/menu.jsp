<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/css/bootstrap.min.css" rel="stylesheet">
<link href="https://fonts.googleapis.com/css2?family=Dongle:wght@300&family=Gaegu:wght@300&family=Nanum+Pen+Script&family=Sunflower:wght@300&display=swap" rel="stylesheet">
<script src="https://code.jquery.com/jquery-3.7.0.js"></script>
<title>Insert title here</title>
<style type="text/css">
ul.menu
{
list-style: none;
position:absolute;
justify-content:center;
width:100%;
display: flex;
}

ul.menu li
{
border: 1px solid blue;
width:140px;
height:60px;
text-align: center;
display: flex;
float: left;
align-items: center;
justify-content: center;
margin-left: 50px;
cursor: pointer;
}

</style>
</head>
<body>
<c:set var="root" value="<%=request.getContextPath() %>"/>
<ul class="menu">
	<li>
	<a href="#" class="btn">카테고리</a>
	</li>
	<li>
	<a href="#" class="btn">베스트</a>
	</li>
	<li>
	<a href="#" class="btn">세일</a>
	</li>
	<li>
	<a href="#" class="btn">신상품</a>
	</li>
	<li>
	<a href="#" class="btn">이벤트</a>
	</li>
</ul>
</body>
</html>