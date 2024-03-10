
<%@page import="db.kiosk.KioskDto"%>
<%@page import="java.util.ArrayList"%>
<%@page import="db.kiosk.KioskDao"%>

<%@page import="db.kiosk.KioskDao"%>
<%@page import="db.kiosk.KioskDto"%>
<%@page import="java.util.ArrayList"%>

<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">

<link href="https://fonts.googleapis.com/css2?family=East+Sea+Dokdo&family=Moirai+One&family=Nanum+Pen+Script&family=Orbit&display=swap" rel="stylesheet">
<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/css/bootstrap.min.css" rel="stylesheet">
<script src="https://code.jquery.com/jquery-3.7.0.js"></script>
<title>Insert title here</title>
</head>
<body>
<title>Insert title here</title>
<link
   href="https://fonts.googleapis.com/css2?family=Cute+Font&family=Dongle:wght@300&family=Gamja+Flower&family=Gowun+Batang&family=Gowun+Dodum&family=Hi+Melody&family=Nanum+Gothic&family=Nanum+Gothic+Coding&family=Nanum+Pen+Script&family=Poor+Story&family=Sunflower:wght@300&display=swap"
   rel="stylesheet">
<link
   href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/css/bootstrap.min.css"
   rel="stylesheet">
<script src="https://code.jquery.com/jquery-3.7.0.js"></script>
</head>

<%
KioskDao dao=new KioskDao();
ArrayList<KioskDto> list=dao.getAllMenus();
%>

<body>
<table class="table table-bordered" style="width:400px; margin-left: 500px">
<tr align="center">
<th>주문번호</th>
<th>메뉴</th>
<th>수량</th>
<th>금액</th>
</tr>
<% 
for(int i=0;i<list.size();i++)
{
   KioskDto dto=list.get(i);
   %>
   <tr align="center">
   <td > <input type="text" name="num"> </td>
   <td><%=dto.getName() %></td>
   <td><%=dto.getStock() %></td>
   <td><%=dto.getPrice() %></td>

   </tr>
<%}
%>
</table>
<button type="submit" class="btn btn-primary" id="btn1">주문하기</button>

<script type="text/javascript">
	$("#btn1").click(function() {
		
		$("list").empty();
	}
</script>
</body>
</html>