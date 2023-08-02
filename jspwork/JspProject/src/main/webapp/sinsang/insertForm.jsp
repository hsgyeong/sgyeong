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
	rel="stylesheet"



>
<title>Insert title here</title>
</head>
<body>
	<form action="insertAction.jsp" method="post">
		<table class="table table-bordered" style="width: 400px;">
			<tr>
				<th>이름</th>
				<td><input type="text" name="name" style="width: 150px;"
					placeholder="이름입력" required="required"
					class="form-control"></td>
			</tr>

			<tr>
				<th>주소</th>
				<td><input type="text" name="addr" style="width: 250px;"
					placeholder="주소입력" required="required"
					class="form-control"></td>
			</tr>
			
			<tr>
			<td colspan="2" align="center">
			<input type="submit" value="전송" class="btn btn-info"> <!-- type="submit" 웹 페이지의 폼(form)을 제출하거나 사용자의 입력을 서버로 전송 -->
			<input type="button" value="목록" onclick="location.href='list.jsp'"
			class="btn btn-success">
			</td>
			</tr>
			</form>
			<!--form을 만든다  -->
</body>
</html>
