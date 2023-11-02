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
	String name=request.getParameter("sangpum");
	String [] color=request.getParameterValues("color");
	String size=request.getParameter("size");
	String plus=request.getParameter("plus");
%>

<h5>[출력]</h5>
상품명: <%=name %><br>
사이즈: <%=size %><br>
상품색상<br>
 <%if(color==null)
	{%>
		<b>선택색상 없음</b>
	
	<%}else{
	
	for(int i=0;i<color.length;i++)
		{%>
			
			<%=color[i] %>&nbsp;
			<div style="width:200px; height:150px; background-color:<%=color[i]%>"></div>
		
	<%}
	}%>
	
추가상품: <%=plus %><br>

</body>
</html>