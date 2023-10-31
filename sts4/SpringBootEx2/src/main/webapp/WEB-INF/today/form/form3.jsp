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
</head>
<body>
<h1>폼데이터 Map 읽기</h1>
<form action="myread" method="post">
	<table class="table table-bordered" style="width:300px">
	<tr>
		<th>이름</th>
		<td>
		<input type="text" name="name" class="form-control">
		</td>
	</tr>
	
	<tr>
		<th>혈액형</th>
		<td>
		<input type="text" name="blood" class="form-control">
		</td>
	</tr>
	
	<tr>
		<th>나이</th>
		<td>
		<input type="text" name="age" class="form-control">
		</td>
	</tr>
	
	<tr>
	<td colspan="2" align="center">
	<button type="submit" class="btn btn-info">서버에 전송</button>
	</td>
	</tr>
	
	</table>
</form>
</body>
</html>