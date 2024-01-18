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
<title>Insert title here</title>
<style type="text/css">
.member-join {
	font-size: 25px;
	font-weight: bold;
	text-align: center;
}

.join-form {
	margin-top: 100px;
	width: 100%;
	height: 800px;
	display: flex;
	flex-direction: column;
	align-items: center;
}

.join {
	align-content: center;
	justify-content: center;
	align-items: center;
}

#id {
	margin: auto;
	margin-left: 150px;
}

.inputid {
	display: flex;
}

.inputpassword {
	display: flex;
	margin-left:-160px;
}

.id {
	margin: auto;
	display: flex;
}

.password {
	margin: auto;
	display: flex;
}

.idbox {
	display: flex;
}

#idcheck {
	width: 300px;
}

#pass1, #pass2 {
	margin: auto; 
	margin-left: 135px;
	width: 340px;
}

.passwordcheck {
	display: flex;
	margin: auto;
	margin-left: -200px;
}

.passwordchk {
	display: flex;
	margin: auto;
	margin-left:500px;

}

.namebox {
	display: flex;
	width: 100%;
	
}

#name {
	margin-left: 200px;
}

#addr {
	width:250px;
}

.emailbox {
	display: flex;
	float: right;
}

</style>
</head>
<body>
	<c:set var="root" value="<%=request.getContextPath()%>" />
	<form action="join">
		<div class="join">
			<div class="join-form">
				<div class="member-join">회원가입</div>
				<hr>
				<br> <br> <br>
				<div class="inputid">
					<span class="id">아이디
						<div class="idbox">
							<input type="text" class="form-control" name="id" id="id">
							<button type="button" class="btn" id="idcheck">중복확인</button>
						</div>
					</span>
				</div>
				<br><br><br>
				<div class="inputpassword">
					<span class="password">비밀번호
						<div class="passwordbox">
							<input type="text" class="form-control" name="pass1" id="pass1">
						</div>
					</span>
				</div>
				<br><br><br>
				<div class="passwordcheck">
					<span class="passwordchk">비밀번호 확인
						<div class="passchkbox">
							<input type="text" class="form-control" name="pass2" id="pass2">
						</div>
					</span>
				</div>
				<br><br><br>
				<div class="inputname">
					<span class="namebox">이름
						<div class="name">
							<input type="text" class="form-control" name="name" id="name">
						</div>
					</span>
				</div>
				<br><br><br>
				<div class="inputemail">
					<span class="emailbox">이메일
						<div class="email">
							<input type="text" class="form-control" name="email" id="email">
						</div>
					</span>
				</div>
				<div class="inputaddr">
					<span class="addrbox">주소
						<div class="addr">
							<button type="button" class="btn btn-ouline" name="addr" id="addr">주소 검색</button>
						</div>
					</span>
				</div>
				</div>
			</div>
	</form>
</body>
</html>