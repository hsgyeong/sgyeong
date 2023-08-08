<%@page import="org.json.simple.JSONObject"%>
<%@page import="org.json.simple.JSONArray"%>
<%@page import="java.util.List"%>
<%@page import="db.memo.MemoDto"%>
<%@page import="db.memo.MemoDao"%>
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
MemoDao dao=new MemoDao();

//엔코딩
request.setCharacterEncoding("utf-8");

//데이타읽기(writer, story, avata)
String num=request.getParameter("unum");
String writer=request.getParameter("uwriter");
String story=request.getParameter("ustory");
String avata=request.getParameter("uavata");

//dto로 묶기
MemoDto dto=new MemoDto();
dto.setNum(num);
dto.setWriter(writer);
dto.setStory(story);
dto.setAvata(avata);

//update
dao.updateMemo(dto);

%>
</body>
</html>