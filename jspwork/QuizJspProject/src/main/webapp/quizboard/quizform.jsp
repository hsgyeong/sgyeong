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
<link rel="stylesheet"
	href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.10.5/font/bootstrap-icons.css">
<title>Insert title here</title>
</head>
<body>
	<div>
		<form action="quizaction.jsp" method="post" enctype="multipart/form-data">
			<table class="table table-bordered"
				style="width: 480px; margin-left: 480px; margin-top: 150px;">
				<tr>
					<th style="text-align: center;">작성자</th>
					<td><input type="text" name=writer class="form-control"
						required="required" autofocus="autofocus" style="width: 150px"></td>
				</tr>
				<tr>
					<th style="text-align: center;">제목</th>
					<td><input type="text" name="title" class="form-control"
						required="required" style="width: 300px"></td>
				</tr>
				<tr>
					<th style="text-align: center;">내용</th>
					<td><input type="text" name="content" class="form-control"
						required="required" style="width: 300px; height: 300px;">
					</td>
				</tr>
				<tr>
					<th style="text-align: center;">이미지</th>
					<td><input type="file" name="imgname" class="form-control"
						style="width: 200px"></td>
				</tr>
				<tr>
					<td colspan="2" align="center"><input type="image"
						src="../image/submit4.png" style="width: 50px"> 
						<input
						type="image" src="../image/list2.png" style="width: 50px;"
						onclick="location.href='quizlist.jsp';return false;"></td>
				</tr>
			</table>
		</form>
	</div>
</body>
</html>