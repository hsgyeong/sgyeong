
<%@page import="java.util.ArrayList"%>
<%@page import="Admin.adminDao"%>
<%@page import="Admin.adminDto"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<script src="https://code.jquery.com/jquery-3.7.0.js"></script>
<link href="https://fonts.googleapis.com/css2?family=Cute+Font&family=Dongle:wght@300&family=Gamja+Flower&family=Gowun+Batang&family=Gowun+Dodum&family=Hi+Melody&family=Nanum+Gothic&family=Nanum+Gothic+Coding&family=Nanum+Pen+Script&family=Poor+Story&family=Sunflower:wght@300&display=swap" rel="stylesheet">
<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/css/bootstrap.min.css" rel="stylesheet">
<title>Insert title here</title>
</head>
<%
	adminDao dao = new adminDao();
	ArrayList<adminDto> list = dao.getAllMenus();
%>

<body>
<div>
<button type="button" onclick="location.href='insertAdminForm.jsp'">상품 추가</button>
<table class="table table-bordered" style="width: 900px;">
<tr class="table-warning" style="text-align: center;">
	
	<th width="320">상품명</th>
	<th width="180">상품 종류</th>
	<th width="100">가격</th>
	<th width="100">재고</th>
	<th width="200">재고</th>
</tr>
<%
	for(int i=0;i<list.size();i++){
		adminDto dto = list.get(i);
		%>
	<tr style="text-align: center;">
		<td><%=dto.getName() %></td>
		<td><%=dto.getType() %></td>
		<td><%=dto.getPrice() %></td>
		<td><%=dto.getStock() %></td>
		<td>
		<button type="button" onclick="location.href='updateAdminForm.jsp?num=<%=dto.getNum() %>'">재고 관리</button>
		<button type="button" onclick="location.href='deleteAdmin.jsp?num=<%=dto.getNum() %>'">상품 삭제</button>
		</td>
	</tr>	
	<%}
%>
</table>
</div>
</body>
</html>