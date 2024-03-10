<%@page import="com.mysql.cj.jdbc.ha.BestResponseTimeBalanceStrategy"%>
<%@page import="data.dto.AnswerDto"%>
<%@page import="data.dao.AnswerDao"%>
<%@page import="data.dto.GuestDto"%>
<%@page import="data.dao.GuestDao"%>
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
	//엔코딩
	request.setCharacterEncoding("utf-8");

	//data읽어서 dao 담기
	AnswerDto dto=new AnswerDto();

	//data읽기
	AnswerDao dao = new AnswerDao();

	String idx=request.getParameter("idx");
	String num=request.getParameter("num");
	String myid=request.getParameter("myid");
	String content=request.getParameter("content");
	
	//페이지 번호 읽기
	String currentPage=request.getParameter("currentPage");

	dto.setIdx(idx);
	dto.setNum(num);
	dto.setMyid(myid);
	dto.setContent(content);
	
	dao.insertAnswer(dto);
	
	response.sendRedirect("../index.jsp?main=guest/guestlist.jsp?currentPage="+currentPage);
	
	
%>
</body>
</html>