<%@page import="java.util.List"%>
<%@page import="java.util.ArrayList"%>
<%@page import="db.quiz.QuizBoardDao"%>
<%@page import="db.quiz.QuizBoardDto"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<link
	href="https://fonts.googleapis.com/css2?family=Cute+Font&family=Dongle:wght@300&family=Gamja+Flower&family=Gowun+Batang&family=Gowun+Dodum&family=Hi+Melody&family=Nanum+Gothic&family=Nanum+Gothic+Coding&family=Nanum+Pen+Script&family=Poor+Story&family=Sunflower:wght@300&display=swap"
	rel="stylesheet">
<link
	href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/css/bootstrap.min.css"
	rel="stylesheet">
<script src="https://code.jquery.com/jquery-3.7.0.js"></script>
<title>Insert title here</title>
</head>
<%

QuizBoardDao dao=new QuizBoardDao();
List<QuizBoardDto> list=dao.getAllBoards();
%>
<table class="table table-borederd">
<body>
<div style="margin:30px 30px; width:800px;">
</div>
<br>
<table class="table table-bordered" style="width:600px; text-align:center;">
<caption><h6>게시판</h6></caption>
<tr>
<th>번호</th>
<th>제목</th>
<th>작성자</th>
<th>작성일</th>
<th>조회</th>
<th>이미지</th>
</tr>
<% 
if(list.size()==0)
{%>
<tr>
<td>
<h6><b>등록된 게시물이 없습니다</b></h6>
</td>
</tr>
<%}
%>
</table>
	<div>

		<tr> 
			<td><img src="../upload/<%=dto.getImgname() %>"> <br>
			작성자: <%=dto.getWriter() %><br>
			제목: <%=dto.getTitle() %></td>
		
 
		</tr>
	</div>
</body>
</table>
</html>