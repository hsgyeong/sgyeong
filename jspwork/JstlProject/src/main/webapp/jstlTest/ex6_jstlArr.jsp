<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link
	href="https://fonts.googleapis.com/css2?family=Cute+Font&family=Dongle:wght@300&family=Gamja+Flower&family=Gowun+Batang&family=Gowun+Dodum&family=Hi+Melody&family=Nanum+Gothic&family=Nanum+Gothic+Coding&family=Nanum+Pen+Script&family=Poor+Story&family=Sunflower:wght@300&display=swap"
	rel="stylesheet">
<link
	href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/css/bootstrap.min.css"
	rel="stylesheet">
<script src="https://code.jquery.com/jquery-3.7.0.js"></script>
</head>
<body>
	<c:forEach var="s" begin="1" end="10">
	[${s }]&nbsp;
	</c:forEach>
	<br>
	<%
	String[] myColor = { "red", "orange", "green", "blue", "violet", "yellow", "pink" };
	%>
	<caption>전체 값 출력</caption>
	<c:set var="mycolor" value="<%=myColor%>" />
	<table class="table table-borderd" style="width: 300px;">
		<tr>
			<th>index</th>
			<th>count</th>
			<th>color</th>
		</tr>
		<c:forEach var="a" items="${mycolor }" varStatus="i">
			<tr align="center">
				<td>${i.index }</td>
				<td>${i.count }</td>
				<td style="background-color: ${a}">${a }</td>
			</tr>
		</c:forEach>
	</table>
	
	<caption>일부 값 출력</caption>
	<table class="table table-borderd" style="width: 300px;">
		<tr>
			<th>index</th>
			<th>count</th>
			<th>color</th>
		</tr>
		<c:forEach var="a" items="${mycolor }" varStatus="i" begin="2" end="5">
			<tr align="center">
				<td>${i.index }</td>
				<td>${i.count }</td>
				<td style="background-color: ${a}">${a }</td>
			</tr>
		</c:forEach>
	</table>
	
	
	<hr>
	<c:set var="msg" value="민규,성신,영환,성경,희찬"/>
	${msg }<br>
	
	<h2>msg값을 컴마로 분리해서 출력</h2>
	<c:forTokens var="s" items="${msg }" delims="," varStatus="i">
	<h3>${i.count }: ${s }</h3>
	</c:forTokens>
</body>
</html>