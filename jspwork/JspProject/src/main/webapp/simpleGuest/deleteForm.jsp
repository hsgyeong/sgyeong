<%@page import="db.simpleguest.SimpleGuestDao"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
 <link  href="https://fonts.googleapis.com/css2?family=Cute+Font&family=Dongle:wght@300&family=Gamja+Flower&family=Gowun+Batang&family=Gowun+Dodum&family=Hi+Melody&family=Nanum+Gothic&family=Nanum+Gothic+Coding&family=Nanum+Pen+Script&family=Poor+Story&family=Sunflower:wght@300&display=swap"
 		rel="stylesheet">
 <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/css/bootstrap.min.css" rel="stylesheet">
    <script src="https://code.jquery.com/jquery-3.7.0.js"></script>
<title>Insert title here</title>
</head>
<%
String num=request.getParameter("num");
%>
<body>

<form action="deleteAction.jsp" method="post">
<table>
	<tr>
	<th>비밀번호</th>
	<td>
	<input type="hidden" name="num" value="<%=num %>">
	<input type="password" name="pass">
	<button type="submit">입력</button>
	<button type="button" onclick="location.href='guestList.jsp'" value="취소">취소</button>
	</td>
	</tr>
</table>
<!-- <button type="submit">입력</button> -->
</form>
</body>
</html>