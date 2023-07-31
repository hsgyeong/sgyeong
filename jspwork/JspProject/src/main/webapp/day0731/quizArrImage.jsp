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
</head>
<body>
	<!--f1~f20.png 4행 5열(2중for)로 출력하세요-->
	<table class="table table-bordered" style="width: 650px;">

		<%
		int n = 0;

		for (int row = 1; row <= 4; row++) {
		%>
		<tr>
			<%
			for (int col = 1; col <= 5; col++) 
			{
				n++;
			%>
			<td>
			<img src="../image/f<%=n%>.png" width="150" height="150">
			</td>

			<%}
			%>
		</tr>
		<%}
		%>

	</table>
</body>
</html>