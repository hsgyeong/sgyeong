<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<link
	href="https://fonts.googleapis.com/css2?family=East+Sea+Dokdo&family=Moirai+One&family=Nanum+Pen+Script&family=Orbit&display=swap"
	rel="stylesheet">
<link
	href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/css/bootstrap.min.css"
	rel="stylesheet">
<script src="https://code.jquery.com/jquery-3.7.0.js"></script>
<title>Insert title here</title>
</head>
<body>
	<table class="table table-bordered" style="width: 700px;">
		<h2>정보 출력</h2>
		<tr>
			<th style="text-align: center;">이름</th>
			<td>${dto.name }<br></td>
		</tr>
		<tr>	
			<th style="text-align: center;">좋아하는 색</th>
			<td><span style="color: ${dto.color }">■</span><br></td>
		</tr>
		<tr>
			<th style="text-align: center;">취미</th>
		<%-- 	<c:set var="hobby" value="${dto.hobby }"></c:set> --%>
		<%-- 	<td>${hobby==null?"없음":hobby }<br></td> --%>
		
		<td>
		<c:if test="${empty dto.hobby }">취미없음</c:if>
		<c:if test="${!empty dto.hobby }">
		<c:forEach var="h" items="${dto.hobby }">
		[${h }]
		</c:forEach>
		</c:if>
		</td>
		</tr>
		<tr>
			<th style="text-align: center;">가장 좋아하는 언어</th>
			<td>${dto.language }<br></td>
		</tr>
	</table>
</body>
</html>