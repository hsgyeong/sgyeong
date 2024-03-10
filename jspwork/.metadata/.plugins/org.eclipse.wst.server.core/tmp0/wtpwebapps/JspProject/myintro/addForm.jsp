<%@page import="model.intro.IntroDto"%>
<%@page import="model.intro.IntroDao"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<link
	href="https://fonts.googleapis.com/css2?family=Cute+Font&family=Dongle:wght@300&family=Gamja+Flower&family=Gowun+Batang&family=Gowun+Dodum&family=Hi+Melody&family=Nanum+Gothic&family=Nanum+Gothic+Coding&family=Nanum+Pen+Script&family=Poor+Story&family=Sunflower:wght@300&display=swap"
	rel="stylesheet">
<link
	href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/css/bootstrap.min.css"
	rel="stylesheet">
<script src="https://code.jquery.com/jquery-3.7.0.js"></script>
<title>Insert title here</title>
<%
String Intro_num = request.getParameter("intro_num");
IntroDao dao = new IntroDao();
IntroDto dto = dao.getData(Intro_num);
%>
</head>
<body>
	<form action="addIntro.jsp" method="post">
		<table class="talbe table-bordered" style="width: 300px;">
			<tr>
				<th>이름</th>
				<td><input type="text" name="intro_name" class="form-control"
					required="required" style="width: 120px;" placeholder="이름">
				</td>
			</tr>

			<tr>
				<th>혈액형</th>
				<td><select name="intro_blood">
						<option value="A">A형</option>
						<option value="B">B형</option>
						<option value="AB">AB형</option>
						<option value="O">O형</option>
				</select></td>
			</tr>

			<tr>
				<th>핸드폰</th>
				<td><input type="date" name="ipgoday" style="width: 400px;"
					placeholder="입고일" required="required" class="form-control">
				</td>
			</tr>

			<tr>
				<th>지역</th>
				<td><input type="radio" name="intro_city" value="서울">서울<br>
					<input type="radio" name="intro_city" value="수원">수원<br>
					<input type="radio" name="intro_city" value="부산">부산<br>
					<input type="radio" name="intro_city" value="천안">천안<br>
					<input type="radio" name="intro_city" value="제주">제주<br>
				</td>
			</tr>

			<tr>
				<th>현재날짜</th>
				<td><input type="date" name="gaipday" style="width: 400px;"
					placeholder="가입일" required="required" class="form-control">
				</td>
			</tr>
			</form>
</body>
</html>