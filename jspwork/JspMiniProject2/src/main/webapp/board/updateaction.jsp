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
	request.setCharacterEncoding("utf-8");
	String num=request.getParameter("num");
	String currentPage=request.getParameter("currentPage");
%>
<jsp:useBean id="dao" class="data.dao.SmartDao"/>
<jsp:useBean id="dto" class="data.dto.SmartDto"/>

<jsp:setProperty property="*" name="dto"/>

<% 
//db에 update
dao.updateSmart(dto);

//목록으로 이동
//response.sendRedirect("../index.jsp?main=board/boardlist.jsp");

//디테일페이지로 이동하려면 방금 insert된 num값을 알아야한다
response.sendRedirect("../index.jsp?main=board/contentview.jsp?num="+num+"&currentPage="+currentPage);
%>
</body>
</html>
</body>
</html>