<%@page import="db.simpleguest.SimpleGuestDto"%>
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
<body>

<% 
	request.setCharacterEncoding("utf-8");

	String num=request.getParameter("num");
	String pass=request.getParameter("pass");
	SimpleGuestDao dao=new SimpleGuestDao();
	
	//SimpleGuestDto dto=dao.getData(num);

		if(dao.isEqualPass(num, pass))
		{	
		dao.deleteGuest(num);
		
		response.sendRedirect("guestList.jsp");
	
	}else{//틀리면 자바스크립트로 경고 후 이전화면으로 이동
		%>
		<script type="text/javascript">
		alert("비밀번호가 맞지 않습니다");
		history.back();
		 	
	<%}
%>
</script>
</body>
</html>