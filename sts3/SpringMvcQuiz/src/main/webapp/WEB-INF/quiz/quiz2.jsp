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
<form action="info" method="get">
<table class="table table-bordered" style="width:600px;">
	<tr>
		<th>이름</th>
		<td><input type="text" name="name" class="form-control"><br></td>
	</tr>
	
	<tr>
		<th>학교</th>
		<td><input type="text" name="school" class="form-control"><br></td>
	</tr>
	
	<tr>
	<th>학년</th>
	<td>
		<select name="grade" class="form-control">
		<option value="1학년">1학년</option>
		<option value="2학년">2학년</option>
		<option value="3학년">3학년</option>
		</select>
	</td>
	</tr>
	
	<tr>
		<th>주소</th>
		<td><input type="text" name="addr" class="form-control"></td>
	</tr>
	
	<tr>
		<td colspan="2" align="center">
			<button type="submit" class="btn btn-info">데이터 전송</button>
		</td>
	</tr>
</table>
</form>
</body>
</html>