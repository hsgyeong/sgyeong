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
	<h2>제목: ${title }</h2>
	<h2>업로드한 실제 경로: ${path }</h2>
	<h2>업로드한 이미지들: ${fileName }</h2>
	
	<c:forEach var="ims" items="${files }">
	<img alt="" src="../photo/${ims }" style="width:100px; height:100px; border:1px solid gray;">
	</c:forEach>
	
<%-- 	<c:if ${fileName }=null></c:if> --%>
	
</body>
</html>