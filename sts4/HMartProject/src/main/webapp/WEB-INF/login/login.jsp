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
	font-size: 20px;
}

.tb {
	border-style: none;
	margin-top: 200px;
	text-align: center;
	width:800px;
}

.tb-box {
	align-content: center;
	justify-content: center;
	display: flex;
}

.loginform {
	display:flex;
	align-content: center !important;
	justify-content: center !important;
}

.loginTitle {
	margin-bottom: 80px;
}

.mypassword {
	margin-right: 50px;
}

.myid {
	margin-right: 65px;
}

.inputid {
	margin-bottom: 30px;
	font-size: 14px;
	display: flex;
	justify-content: center;
}

.input-myid, .input-mypass {
	width: 240px !important;
	height: 50px;
	border-color: gray;
	font-size: 14px;
}

.inputpassword {
	margin-bottom: 30px;
	font-size: 14px;
	display: flex;
	justify-content: center;
}

.loginbt {
	width:350px !important;
	height:50px;
}

.searchId {
	margin-right:30px;
}

.idPass {
	margin-bottom: 30px;
	font-size: 13px;
	cursor: pointer;
}

.submitlogin {
	justify-content: center;
	display: flex;
	margin-bottom: 15px;
}

.submitjoin {
	justify-content: center;
	display: flex;
	margin-bottom: 15px;
}

</style>
</head>
<body>
<c:set var="root" value="<%=request.getContextPath() %>"/>
<form action="loginproc" method="post" id="loginform" class="loginform">
	<table class="tb">
	<div class="tb-box">
	<tr>
		<td>
			<div class="loginTitle">
		<span class="log" style="color: #477500;">로그인</span>
			</div>
		</td>
	<tr>

	<tr>
		<td>
			<div class="inputid">
			<span class="myid" style="color:#477500; font-weight:bold;">아이디</span>
			<input type="text" id="myid" class="form-control input-myid" name="id" placeholder="아이디를 입력해주세요">
			</div>
		</td>
	<tr>
	
	<tr>
		<td>
			<div class="inputpassword">
			<span class="mypassword" style="color:#477500; font-weight:bold;">비밀번호</span>
			<input type="text" id="mypass" class="form-control input-mypass" name="password" placeholder="비밀번호를 입력해주세요">
			</div>
		</td>
	<tr>
	
	<tr>
		<td>
		<div class="idPass">
		<span class="searchId" style="color:#477500;">아이디 찾기</span>
		<span class="searchPass" style="color:#477500;">비밀번호 찾기</span>
		</div>
		</td>
	</tr>
	
	<tr>
		<td>
		<div class="submitlogin">
		<button type="submit" class="form-control loginbt" style="background-color: #7DAB12; color:white;" >로그인</button>
		</div>
		</td>
	</tr>
	
	<tr>
		<td>
		<div class="submitjoin">
		<button type="button" class="form-control loginbt" 
		onclick="location.href='join'">회원가입</button>
		</div>
		</td>
	</tr>
	
	</div>
	</table>
</form>
</body>
</html>