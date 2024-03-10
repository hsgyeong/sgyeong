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
	<form action="info" method="post">
		<table class="table table-bordered" style="width: 400px;">
			<tr>
				<th>이름</th>
				<td><input type="text" name="name" class="form-control"></td>
			</tr>	
			<tr>
				<th>나이</th>
				<td><input type="text" name="age" class="form-control"></td>
			</tr>
			<tr>
				<th>혈액형</th>
				<td>
				<select name="blood" class="form-control">
				<option value="A형">A형</option>
				<option value="B형">B형</option>
				<option value="AB형">AB형</option>
				<option value="O형">O형</option>
				</select>
				</td>
			</tr>
			<tr>
				<th>주소</th>
				<td><input type="text" name="addr" class="form-control"></td>
			</tr>
			
			<tr>
			 <td colspan="2" align="center">
			 <button type="submit" class="btn btn-info">DB저장</button>
			</td>
			</tr>
		</table>
	</form>
</body>
</html>