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
<style>
.log {
	font-weight: bold;
	font-size: 25px;
}

.tb {
	border-style: none;
	margin-top: 200px;
	text-align: center;
}

.loginTitle {
	margin-bottom: 150px;
}

.myid {
	margin-right: 100px;
}

.mypassword {
	margin-right: 80px;
}

.inputid {
	margin-bottom: 30px;
}

.input-myid, .input-mypass {
	width: 280px;
	height: 60px;
	border-radius: 1px;
	border-color: gray;
}

</style>
</head>
<body>
<c:set var="root" value="<%=request.getContextPath() %>"/>
<form action="login-success" method="post" id="loginform">
	<table class="tb">
	<div class="tb-box">
	<tr>
		<td>
			<div class="loginTitle">
		<span class="log">로그인</span>
			</div>
		</td>
	<tr>

	<tr>
		<td>
			<div class="inputid">
			<span class="myid">아이디</span>
			<input type="text" id="myid" class="input-myid" name="myid" placeholder="아이디를 입력해주세요">
			</div>
		</td>
	<tr>
	
	<tr>
		<td>
			<div class="inputpassword">
			<span class="mypassword">비밀번호</span>
			<input type="text" id="mypass" class="input-mypass" name="mypass" placeholder="비밀번호를 입력해주세요">
			</div>
		</td>
	<tr>
	
	</div>
	</table>
</form>
</body>
</html>