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

<!--controller, xml일때 서버 껐다 켜야함. 그냥 디자인일 경우 새로고침만 하면 됨 -->

<c:set var="tot" value="${java+spring }"/>
<c:set var="avg" value="${tot/2 }"/>

<h2>점수 출력 결과</h2>
<pre>
	자바점수:${java }
	스프링점수:${spring }
	
	총점:${tot }
	평균:${avg }
</pre>
</body>
</html>