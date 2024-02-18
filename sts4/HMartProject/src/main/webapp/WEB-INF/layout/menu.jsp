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
margin-left: 100px;
cursor: pointer;

}

.menu a {
font-weight:bold;	
font-size: 15px;
text-decoration: none;
color:#477500;
}

.categorylist {
border: 1px solid orange;
position: absolute;
height: 560px;
width: 240px;
margin-top: 100px;
margin-left: 40px;
float: right;
}

.li {
font-weight: bold;
list-style: none;
margin-bottom: 0px;
cursor: pointer;
height:40px;
vertical-align: middle;
display: flex;
align-items: center;
padding-left: 20px;
}

.li:hover{
color:#477500;
background-color: #F6F6F6;
}

.type{
margin-left:40px;
margin-top:30px;
}
</style>
</head>
<body>
<c:set var="root" value="<%=request.getContextPath() %>"/>
<ul class="menu">
	<li>
	<a href="#" class="cate">카테고리</a>
	</li>
	<li>
	<a href="#" class="b">베스트</a>
	</li>
	<li>
	<a href="/" class="sa">세일</a>
	</li>
	<li>
	<a href="#" class="sin">신상품</a>
	</li>
	<li>
	<a href="#" class="evt">이벤트</a>
	</li>
</ul>
<div class="categorylist">
	<div class="type">
	<li class="li">채소,쌀</li>
	<li class="li">과일,견과</li>
	<li class="li">수산,해산,건어물</li>
	<li class="li">정육,가공육,계란</li>
	<li class="li">국,반찬,샐러드</li>
	<li class="li">메인요리,밀키트</li>
	<li class="li">면,양념,오일</li>
	<li class="li">생수,음료,커피</li>
	<li class="li">간식,과자,떡</li>
	<li class="li">베이커리</li>
	<li class="li">유제품</li>
	<li class="li">건강식품</li>
	<li class="li">주류</li>
	</div>
</div>
</body>
<script type="text/javascript">
$(document).ready(function(){
	
	$("div.categorylist").hide();
	
	$("a.cate").mouseover(function(){
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