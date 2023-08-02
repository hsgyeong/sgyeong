<%@page import="model.sinsang.SinsangDao"%>
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
//삭제메서드 호출
String num=request.getParameter("num");  //웹 요청(Request) 객체인 request에서 파라미터(parameter) 중 이름이 "num"인 값을 가져오는 것을 의미
SinsangDao dao=new SinsangDao();  //SinsangDao 클래스의 새로운 인스턴스를 생성하고, 그 인스턴스를 변수 dao로 참조
dao.deleteSinsang(num);  


//리스트로 이동
response.sendRedirect("list.jsp");  //다른 URL(list.jsp)로 리디렉션(재전송)

%>
</body>
</html>