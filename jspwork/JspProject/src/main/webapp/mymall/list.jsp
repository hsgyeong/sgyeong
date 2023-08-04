<%@page import="java.text.NumberFormat"%>
<%@page import="java.text.SimpleDateFormat"%>
<%@page import="model.mymall.MallDto"%>
<%@page import="java.util.ArrayList"%>
<%@page import="model.mymall.MallDao"%>
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
<%
MallDao dao = new MallDao();
ArrayList<MallDto> list = dao.getAllMymall();
%>
<body>

	<%-- 	<table class="table table-bordered" style="width: 1000px";>
		<tr align="center">



		<th width="150">번호</th>
			<th width="150">상품명</th>
			<th width="250">사진</th>
			<th width="120">가격</th>
			<th width="200">입고일</th>
			<th width="200">작성일</th>
			<th width="120">수정/삭제</th>
		</tr>

		<% 
			for (int i=0; i<list.size(); i++) {
				MallDto dto = list.get(i);
		%>
		<tr>
			<td><%=i+1 %></td>
			<td><%=dto.getSangpum() %></td>
			<td><img src='<%=dto.getPhoto() %>' style= "width:200px; height:250px;"></td>
			<td><%=dto.getPrice() %></td>
			<td><%=dto.getIpgoday()%></td>
			<td><%=sdf.format(dto.getWriteday()) %></td>
			<td style="width:160px">
			<button type="button" class="btn btn-outline-info btn-sm"
			onclick="location.href='updateForm.jsp?num=<%=dto.getNum() %>'">수정</button>	
			<button type="button" class="btn btn-outline-danger btn-sm"
			onclick="location.href='deleteForm.jsp?num=<%=dto.getNum() %>'">삭제</button>	
			</td>
		</tr>	

		<%}
	%> --%>
	
	
	<button type="button" class="btn btn-warning btn-sm"
					onclick="location.href='addForm.jsp'">상품 추가</button>
	<table class="table table-bordered" style="width: 1000px";>
		<tr align="center">
			<th width="150">번호</th>
			<th width="100">상품명</th>
			<th width="150">상품사진</th>
			<th width="120">가격</th>
			<th width="200">입고일</th>
			<th width="200">작성일</th>
			<th width="150">수정/삭제</th>
		</tr>
		<%
		if(list.size()==0){
			%>
		<tr>
			<td colspan="6" align="center">
				<h5>등록된 상품이 없습니다</h5>
			</td>
		</tr>
		<%}else{
			
			NumberFormat nf=NumberFormat.getCurrencyInstance();
			SimpleDateFormat sdf=new SimpleDateFormat("yyyy-MM-dd");
			
			for(int i=0;i<list.size();i++)
			{
				MallDto dto=list.get(i);
				%>

		<tr>
			<td align="center"><%=i+1 %></td>
			<td><b><%=dto.getSangpum() %></b></td>
			<td><img alt="" src=<%=dto.getPhoto() %> width="60" height="60"
				class="img-thumnail"></td>
			<td align="center" valign="middle"><%=nf.format(Integer.parseInt(dto.getPrice())) %></td>
			<td align="center" valign="middle"><%=dto.getIpgoday() %></td>
			<td valign="middle"><%=sdf.format(dto.getWriteday()) %></td>
			<td>
				<button type="button" class="btn btn-success btn-sm"
					onclick="location.href='updateForm.jsp?num=<%=dto.getNum() %>'">수정</button>
				<button type="button" class="btn btn-warning btn-sm"
					onclick="location.href='deleteForm.jsp?num=<%=dto.getNum() %>'">삭제</button>
			</td>
		</tr>
		<%}
		}
	%>
	</table>

</body>
</html>