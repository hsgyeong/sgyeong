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
	
	//세션이 있는지 확인후 없으면 꽝!
	String msg=(String)session.getAttribute("msg");  //object type이기 때문에 오류가 남. 좌우 형을 맞춰주면 됨.
	String travel=request.getParameter("travel");
	
	if(msg==null || !msg.equals("happy"))
	{%>
		<h3 style="color:red;">시간초과로 꽝입니다</h3>
	<%}else{
		%>
		<h3>축! <%=travel %>상품에 당첨됨</h3>
	<%}
%>

<a href="sessionForm.jsp">다시 선택</a>
</body>
</html>