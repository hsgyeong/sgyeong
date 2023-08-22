<%@page import="java.util.List"%>
<%@page import="db.quiz.QuizBoardDto"%>
<%@page import="java.text.SimpleDateFormat"%>
<%@page import="db.quiz.QuizBoardDao"%>
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
<link rel="stylesheet"
	href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.10.5/font/bootstrap-icons.css">
<title>Insert title here</title>
</head>
<% 
QuizBoardDao dao=new QuizBoardDao();

int totalCount = dao.getTotalCount();
int currentPage;
int startPage;
int endPage;
int totalPage;
int startNum;
int perPage=5;
int perBlock=4;
int no;


if(request.getParameter("currentPage")==null)
	currentPage = 1;
else
	currentPage=Integer.parseInt(request.getParameter("currentPage"));

totalPage = totalCount / perPage + (totalCount % perPage == 0?0:1);
startPage = (currentPage-1)/perBlock*perBlock+1;
endPage = startPage + perBlock-1;

if(endPage > totalPage)
	endPage = totalPage;

startNum = (currentPage - 1)*perPage;

no=totalCount-(currentPage-1)*perPage;

List<QuizBoardDto> list = dao.getPagingList(startNum, perPage);

%>
<body>
	<div style="margin-left: 150px; font-family: sunflower;">
	<ul style="margin-left:550px">
	<button type="button" class="btn btn-outline-info"
	onclick="location.href='quizform.jsp'" style="margin-top:100px;"><i class="bi bi-pencil-square"></i>글쓰기</button>
	
	<button type="button" class="btn btn-outline-success"
	onclick="location.href='quizimagelist.jsp'" style="margin-top:100px;"><i class="bi bi-image"></i>이미지</button>
	</ul>
		<br> <br> <br>
		<h5>
			총
			<%=totalCount %>개의 글이 있습니다
		</h5>
		<table class="table table-bordered" style="width: 750px;">
			<caption align="top">
				<b>게시판</b>
			</caption>
			<tr>
				<th style="width: 80px; text-align: center">번호</th>
				<th style="width: 300px; text-align: center">제목</th>
				<th style="width: 120px; text-align: center">작성자</th>
				<th style="width: 200px; text-align: center">작성일</th>
				<th style="width: 50px; text-align: center">조회</th>
			</tr>

			<%
if(list.size()==0)
{%>
			<tr>
				<td colspan="5" align="center">
					<h6>등록된 게시글이 없습니다</h6>
				</td>
			</tr>
			<%
			}else{
				SimpleDateFormat sdf=new SimpleDateFormat("yyyy-MM-dd");
				for(int i=0; i<list.size(); i++)
				{
					QuizBoardDto dto = list.get(i);
					%>
					<tr>
					<td align="center"><%=no-- %></td>
					<td ><%=dto.getTitle() %><img src="<%=dto.getImgname() %>" style="width:80px"></td>
					<td style="text-align:center;"><%=dto.getWriter() %></td>
					<td style="text-align:center;"><%=sdf.format(dto.getWriteday()) %></td>
					<td><%=dto.getReadcount() %></td>
					</tr>
					<%
			 }
			}
			%>
		</table>
	</div>
</body>
</html>