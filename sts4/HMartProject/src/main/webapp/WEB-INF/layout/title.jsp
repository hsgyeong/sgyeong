<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<link
	href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/css/bootstrap.min.css"
	rel="stylesheet">
<link
	href="https://fonts.googleapis.com/css2?family=Dongle:wght@300&family=Gaegu:wght@300&family=Nanum+Pen+Script&family=Sunflower:wght@300&display=swap"
	rel="stylesheet">
<link href="https://fonts.googleapis.com/css2?family=Gugi&display=swap"
	rel="stylesheet">
<script src="https://code.jquery.com/jquery-3.7.0.js"></script>
<title>Insert title here</title>
<style type="text/css">
.titlebox {
	font-family: 'gugi';
	font-size: 100px;
	text-align: center;
	margin-top: 35px;
	justify-content: center;
	align-items: center;
}

.marttitle {
	text-decoration: none;
	text-align: center;
	position: absolute;
	color: #7DAB12;
	display: inline-block;
	transform: translate(-50%, -50%);
	top: 50%;
}

.member {
	display: flex;
	float: right;
	margin-right: 100px;
}

.login {
	text-decoration: none;
	color: #477500;
	font-weight: bold;
}

.join {
	margin-left: 25px;
	text-decoration: none;
	color: #477500;
	font-weight: bold;
}
</style>
</head>
<body>
	<c:set var="root" value="<%=request.getContextPath()%>" />
	<div class="member">
		<ul>
			<c:if test="${sessionScope.login == null }">
				<li><a class="login" href="login">로그인</a></li>
			</c:if> 
			<c:if test="${sessionScope.login != null }">
				<li><a class="logout" href="#">로그아웃</a><li>
			</c:if>
			<li><a class="join" href="join">회원가입</a></li>
		</ul>
	</div>
	<div class="titlebox">
		<a href="/" class="marttitle">HMart</a>
	</div>
</body>
</html>