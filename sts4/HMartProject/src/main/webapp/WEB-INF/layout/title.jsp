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
<link href="https://fonts.googleapis.com/css2?family=Gugi&display=swap" rel="stylesheet">
<script src="https://code.jquery.com/jquery-3.7.0.js"></script>
<title>Insert title here</title>
<style type="text/css">
.ul {
	display: flex;
	float: right;
	list-style: none;
	margin-right:50px;
	margin-top:10px;
}

.select-li {
	list-style: none;
}

.member {
	display: flex;
	align-content: right;
	justify-content: right;
	margin-right: 100px;
	right: 0;
	top: 0;
	margin-top: 0;
}

.login, .logout, .member-name {
	text-decoration: none;
	color: #477500;
	font-weight: bold;
}

.member-name, .join {
	margin-right:50px;
}

.join {
	margin-left: 25px;
	text-decoration: none;
	color: #477500;
	font-weight: bold;
	list-style: none;
}

.bi {
	margin-right: 25px;
	font-size: 25px;
	cursor: pointer;
}

.item-insertbt, .event-insertbt {
    cursor:pointer !important;
	 position: relative;
	 z-index: 9999;
	 background-color: #7DAB12;
	 color: white;
	 border-color: #7DAB12;
	 width: 120px;
	 height: 40px;
	 border-radius: 5px;
}

</style>
</head>
<body>
	<c:set var="root" value="<%=request.getContextPath()%>" />		
	<div class="member">
		<ul class="ul">
			<c:if test="${sessionScope.login == null }">
				<li><a class="join" href="/join">회원가입</a></li>
			</c:if>
			<c:if test="${sessionScope.login != null }">
				<li class="member-name"><a>${sessionScope.name }</a>&nbsp;&nbsp;님</li>
			</c:if>
			<c:if test="${sessionScope.login == null }">
				<li class="select-li"><a class="login" href="/login">로그인</a></li>
			</c:if> 
			<c:if test="${sessionScope.login != null }">
				<li class="select-li"><a class="logout" href="/logout">로그아웃</a><li>
			</c:if>
		</ul>
		<i class="bi bi-heart"></i>
		<i class="bi bi-truck"></i>
		<i class="bi bi-basket3"></i>
	</div>
	<c:if test="${sessionScope.login != null && sessionScope.myid == 'admin'}">
		<div style="text-align:right; margin-right: 60px; margin-top:40px;">
			<button type="button" class="item-insertbt"
			onclick="location.href='item-upload'">상품 등록</button>
			<button type="button" class="event-insertbt">이벤트 등록</button>
		</div>
	</c:if>	
</body>
</html>