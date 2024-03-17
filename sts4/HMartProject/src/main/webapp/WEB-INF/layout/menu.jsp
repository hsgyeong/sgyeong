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
	font-weight:bold;	
	font-size: 15px;
	text-decoration: none;
	color:#477500;
	z-index: 9999;
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
	margin-left: 28px;
	cursor: pointer;
	border-radius: 3px;
}

.categorylist {
	border: 1px solid orange;
	height: 560px;
	width: 240px;
	margin-top: 100px;
	position: absolute;
}

.li {
	font-weight: bold;
	list-style: none;
	margin-bottom: 0px;
	cursor: pointer;
	height:40px;
	vertical-align: middle;
	align-items: center;
}

.menu li:hover{
	color:white;
	background-color: #7DAB12;
	border-radius: 3px;
}

.type{
	margin-left:40px;
	margin-top:30px;
}

.l{
	margin-left: 35px;
}

</style>
</head>
<body>
<c:set var="root" value="<%=request.getContextPath() %>"/>
<ul class="menu">
	<li class="cate">
	카테고리
	</li>
	<li class="b">
	베스트
	</li>
	<li class="sa">
	세일
	</li>
	<li class="sin">
	신상품
	</li>
	<li class="evt">
	이벤트
	</li>
</ul>
<div class="categorylist">
	<div class="type">
	<li class="li"><span class="l">채소,쌀</span></li>
	<li class="li"><span class="l">과일,견과</span></li>
	<li class="li"><span class="l">수산,해산,건어물</span></li>
	<li class="li"><span class="l">정육,가공육,계란</span></li>
	<li class="li"><span class="l">국,반찬,샐러드</span></li>
	<li class="li"><span class="l">메인요리,밀키트</span></li>
	<li class="li"><span class="l">면,양념,오일</span></li>
	<li class="li"><span class="l">생수,음료,커피</span></li>
	<li class="li"><span class="l">간식,과자,떡</span></li>
	<li class="li"><span class="l">베이커리</span></li>
	<li class="li"><span class="l">유제품</span></li>
	<li class="li"><span class="l">건강식품</span></li>
	<li class="li"><span class="l">주류</span></li>
	</div>
</div>
</body>
<script type="text/javascript">
$(document).ready(function(){
	
	$("div.categorylist").hide(); 
	
	$("li.cate").mouseover(function(){
		$("div.categorylist").show();
	})
	
	$("div.categorylist").mouseover(function(){
		$("div.categorylist").show();
	})
	
	$("div.categorylist").mouseout(function(){
		$("div.categorylist").hide();
	})
})
</script>
</html>