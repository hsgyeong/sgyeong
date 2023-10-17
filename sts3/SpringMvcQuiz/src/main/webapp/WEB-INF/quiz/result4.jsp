<%@ page language="java" contentType="text/html; charset=UTF-8"
   pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<link href="https://fonts.googleapis.com/css2?family=East+Sea+Dokdo&family=Moirai+One&family=Nanum+Pen+Script&family=Orbit&display=swap" rel="stylesheet">
<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/css/bootstrap.min.css" rel="stylesheet">
<script src="https://code.jquery.com/jquery-3.7.0.js"></script>
<title>Insert title here</title>
</head>
<body>
	<table class="table table-bordered" style="width:400px">
		<tr>
			<th style="text-align: center;">이름</th>
			<td>${name }</td>
		</tr>
		<tr>
			<th style="text-align: center;">나이</th>
			<td>${age }</td>
		</tr>
		<tr>
			<th style="text-align: center;">혈액형</th>
			<td>${blood }</td>
		</tr>
		<tr>
			<th style="text-align: center;">주소</th>
			<td>${addr }</td>
		</tr>
	</table>
</body>
</html>