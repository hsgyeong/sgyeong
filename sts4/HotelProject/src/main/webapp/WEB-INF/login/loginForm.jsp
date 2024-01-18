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
<script src="https://code.jquery.com/jquery-3.7.0.js"></script>
<link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.11.1/font/bootstrap-icons.css">
<title>Insert title here</title>
<style>
.login {
	display: flex;
	margin-left:900px;
	justify-content: center;
	margin-top: 300px;
}
.id{
	display:inline-flex;
}
.pass{
	display: inline-flex;	
}

.loginbt{
	width:275px;
	height:40px;
	border-radius: 5px;
	background-color: orange;
	color:white;
}
</style>
</head>
<% 
String id = (String)session.getAttribute("id");
String saveok = (String) session.getAttribute("saveok");

boolean save = true;

if(saveok==null)
{
	id="";
	save=false;
}else{
	save=true;
	
}

%>
<body>
	<div class="login">
		<form action="login_insert" method="post">
			<table class="table table-bordered" style="width: 500px;">
				<span class="id">아이디&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<input type="text" name="id" style="width: 200px;"
					class="form-control" required="required"></span>
				<br><br>
				<span class="pass">비밀번호&nbsp;&nbsp;<input type="password" name="pass" style="width: 200px;"
					class="form-control" required="required"></span>
					
		
			</table>
			<br><button type="submit" class="btn loginbt">
			<i class="bi bi-door-open"></i>&nbsp;&nbsp;로그인</button>
		</form>
	</div>
</body>
</html>