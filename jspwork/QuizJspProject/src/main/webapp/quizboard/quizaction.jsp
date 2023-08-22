<%@page import="db.quiz.QuizBoardDto"%>
<%@page import="db.quiz.QuizBoardDao"%>
<%@page import="com.oreilly.servlet.multipart.DefaultFileRenamePolicy"%>
<%@page import="com.oreilly.servlet.MultipartRequest"%>
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
<body>
<%
String realPath=getServletContext().getRealPath("/upload");
int uploadSize=1024*1024*3;

MultipartRequest multi=null;

multi=new MultipartRequest(request,realPath,uploadSize,"utf-8",
		new DefaultFileRenamePolicy());

QuizBoardDao dao=new QuizBoardDao();


QuizBoardDto dto=new QuizBoardDto();

dto.setWriter(multi.getParameter("writer"));
dto.setTitle(multi.getParameter("title"));
dto.setContent(multi.getParameter("content"));

String image=multi.getFilesystemName("imgname");

if(image==null)
	dto.setImgname("../image/noimage2.png");
else
	dto.setImgname("../upload/"+image);

dao.insertBoard(dto);

response.sendRedirect("quizlist.jsp");
%>
</body>
</html>