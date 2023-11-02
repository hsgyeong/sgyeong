<%@page import="java.util.ArrayList"%>
<%@page import="db.simpleguest.SimpleGuestDao"%>
<%@page import="db.simpleguest.SimpleGuestDto"%>
<%@page import="java.text.SimpleDateFormat"%>
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
<%
SimpleGuestDao dao = new SimpleGuestDao();
ArrayList<SimpleGuestDto> list = dao.getAllSimpleGuest();
SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd");
%>

<style>
.wd {
	text-align: right;
}
</style>
</head>
<body>
	<div style="margin: 50px; 100px;">
		<button type="button" class="btn btn-outline-success"
			onclick="location.href='insertForm.jsp'">글쓰기</button>
	</div>

	<table class="table table-bordered" style="width: 1000px;">
		<!-- 	<tr>
			<th style="width: 50px; text-align: center">번호</th>
			<th style="width: 80px; text-align: center">작성자</th>
			<th style="width: 500px; text-align: center">내용</th>
			<th style="width: 130px; text-align: center">작성일</th>
	
		</tr> -->

		<%
		for (int i = 0; i < list.size(); i++) {
			SimpleGuestDto dto = list.get(i);
			int no = list.size() - i;
		%>

		<table class="table" style="width: 500px; border:1px solid rightgray;">
			<tr>
				<td align="center"><b>NO.<%=no%></b> <b><%=dto.getNick()%></b>
				</td>
				<td margin-left="70px;"><b style="color: gray;"><%=sdf.format(dto.getWriteday())%></b>
				</td>
			</tr>
			<tr height="100">
				<td colspan="2" valign="middle"><img alt=""
					src="../avata/b<%=dto.getImage()%>.png" width="60" height="60"
					align="left" hspace="20"> <pre><%=dto.getStory()%></pre></td>
			</tr>			
			
		<div style="position: absolute; left: 400px;">
			<button type="button" class="btn btn-success btn-sm"
				onclick="location.href='updateForm.jsp?num=<%=dto.getNum()%>'">수정</button>
			<button type="button" class="btn btn-warning btn-sm"
				onclick="location.href='deleteForm.jsp?num=<%=dto.getNum()%>'">삭제</button>
		</div>
		</table>

		<%
		}
		%>

	</table>
</body>
</html>