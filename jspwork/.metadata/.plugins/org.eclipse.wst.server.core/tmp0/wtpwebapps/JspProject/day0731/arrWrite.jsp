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
//배열선언
String [] colors={"yellow", "blue", "pink","green", "purple"};

//제목
String title="배열출력";
%>

<table class="table table-borederd" style="width: 200px;">
<caption><b><%=title %></b></caption>
<tr>
<th>번호</th>
<th>색상</th>
</tr>

<%
	for(int i=0;i<colors.length;i++)
	{%>
		<tr>
		<td align="center"><%=i+1 %></td>
		<td>
		<b style="color: <%=colors[i]%>"><%=colors[i] %></b>		
		</tr>
	<%}
%>
</table>
</body>
</html>