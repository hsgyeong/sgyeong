<%@page import="java.text.NumberFormat"%>
<%@page import="java.text.SimpleDateFormat"%>
<%@page import="model.mymall.MallDto"%>
<%@page import="model.mymall.MallDao"%>
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
<%
	String num=request.getParameter("num");
	MallDao dao=new MallDao();
	MallDto dto=dao.getData(num);
	
	NumberFormat nf=NumberFormat.getCurrencyInstance();
	SimpleDateFormat sdf=new SimpleDateFormat("yyyy-MM-dd HH시");
%>
<body>

	<form>
		<div style="margin: 100px 100px;"> 
		<table class="table table-bordered" style="width: 700px;">
			<caption align="top"><h4>상세정보</h4></caption>
			<tr align="center">
				<td rowspan="4">
				<img alt="" src="../img/<%=dto.getPhoto() %>.jpg">
				</td>
			</tr>

			<tr>
				<th>상품명</th>
			<td><%=dto.getSangpum() %></td>
			</tr>

			<tr>
				<th>가격</th>
				<td><%=nf.format(dto.getPrice()) %></td>
			</tr>

			<tr>
				<th>등록일</th>
				<td><%=sdf.format(dto.getWriteday())%></td>
			</tr>

			<tr>
				<td colspan="3" align="center">
					<button type="button" value="전송" class="btn btn-outline-info" 
					onclick="history.back()">이전으로 가기</button>
				</td>
			</tr>

		</table>
	</form>

<button onclick="location.href='lsit.jsp'">목록으로 이동</button>
</body>
</html>