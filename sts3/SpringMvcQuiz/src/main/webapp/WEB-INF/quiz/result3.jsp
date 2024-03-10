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
	<table class="table table-bordered" style="width:400px;">
	<th>상품 정보 출력</th>
		<tr>
			<td>상품명: ${dto.sangpum }</td>
		</tr>
		
		<tr>
			<td>카테고리: ${dto.category }</td>
		</tr>
		
		<tr>
			<td>색상:${dto.color }</td>
			
		</tr>
		
		<tr>
			<td>가격: ${dto.price }</td>
		</tr>
	</table>
</body>
</html>