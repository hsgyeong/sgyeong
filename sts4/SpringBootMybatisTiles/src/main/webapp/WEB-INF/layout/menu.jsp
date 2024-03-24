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
	ul.menu{
	list-style:none;

	position:absolute;
	}
	ul.menu li{
	
	width:125px;
	float:left;
	border:1px solid white;
	height:55px;
	line-height:60px;
	text-align:center;
	font-size: 10px;
	font-family: 'IBM Plex Sans KR', sans-serif;
	background-color:white;
	cursor: pointer;
	vertical-align: center;
	transition: background-color 0.3s;
	&:hover{background-color:purple; color:white;}
	}
	
	ul.menu li a{
	text-decoration: none;
	color:black;
	display: flex;
    align-items: center;
    height: 53px; 
    justify-content: center;
	}

</style>
</head>
<body>
<c:set var="root" value="<%=request.getContextPath() %>"/>
	<ul class="menu">
		<li>
			<a href="/" class="btn" >Home</a>
		</li>
		<li>
			<a href="${root }/login/main" class="btn">로그인</a>
		</li>
		<li>
			<a href="${root }/smart/list" class="btn">스마트샵</a>
		</li>	
		<li>
			<a href="${root }/ipgo/list" class="btn">상품목록</a>
		</li>
		<li>
			<a href="${root }/reboard/list" class="btn">답변형게시판</a>
		</li>
		<li>
			<a href="${root }/member/list" class="btn">회원목록</a>
		</li>
		<li>
			<a href="${root }/member/myinfo" class="btn">나의정보</a>
		</li>
		<li>
			<a href="${root }/memboard/list" class="btn">회원게시판</a>
		</li>
		<li>
			<a href="${root }/load/map" class="btn">오시는길</a>
		</li>	
	</ul>
</body>
<script type="text/javascript">
$(document).ready(function(){
	
	$(".btn").click(function(){
		
		$(this).css("background-color","purple");
		$(this).css("color","white");
	})
	
})
</script>
</html>