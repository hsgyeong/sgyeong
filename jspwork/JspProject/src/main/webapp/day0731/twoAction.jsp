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
<body>
	<%
	String per1=request.getParameter("person");	// "person"이라는 이름의 매개변수 값을 가져와서 해당 값을 문자열 변수에 저장
	String [] per2= request.getParameterValues("person2");  //"person2"라는매개변수(parameter) 값을 가져와서 해당 값을 문자열 배열(String [])에 저장
	%>
	
	조장 1순위: <%=per1 %><br><br>
	
	예비 조장: 
	<%
	if(per2==null)
	{%>
		<b style="color: red;">예비조장 없음</b>
	<%}else{
		
		for(int i=0;i<per2.length;i++)
		{%>
			
			[<%=per2[i] %>]&nbsp;
		<%}%>
		
		<b>총 <%=per2.length %>명의 예비조장 있음</b>
	<%}
	%>
</body>
</html>