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
	String [] str={"13.jpg","14.jpg","16.jpg","17.jpg","18.jpg","21.jpg",
			"24.jpg","29.jpg","33.jpg"};
	int n=0;
	
%>

<!--3행 3열에서 이미지가 오게 하도록  -->
<table class="table table-bordered" style="width: 460px;">
	<%
	for(int i=0;i<3;i++)
	{%>
		<tr>
		<%
		for(int j=0;j<3;j++)
		{%>
			<td>
			<img alt="" src="../image/<%=str[n]%>" width="150" height="150">
			</td>
		<%
			n++;
		}
		%>
		</tr>
	<%}
	%>
</table>
</body>
</html>