<%@page import="model.mymall.MallDto"%>
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
<%
	String num=request.getParameter("num");
	MallDao dao=new MallDao();
	MallDto dto=dao.getData(num);
%>
</head>
<body>
	<form action="updateAction.jsp" method="post">

		<input type="hidden" name="num" value="<%=num %>">
		<table class="table table-bordered" style="width: 400px;">
			<caption align="top">
				<h4>상품수정</h4>
			</caption>
			<tr>
				<th>상품명</th>
				<td><input type="text" name="sangpum" style="width: 400px;"
					placeholder="상품명" required="required" class="form-control"
					value="<%=dto.getSangpum() %>"></td>
			</tr>

			<tr>
				<th>상품사진</th>
				<td><select name="photo" id="photo" class="form-select"
					style="width: 150px">
						<!-- <option value="../image/12.jpg">구두</option>
							<option value="../image/30.jpg">헤어밴드</option>
							<option value="../image/35.jpg">모자</option> -->

						<option value="../image/12.jpg"
							<%=dto.getPhoto().equals("../image/12.jpg")?"selected":"" %>>구두</option>
						<option value="../image/30.jpg"
							<%=dto.getPhoto().equals("../image/30.jpg")?"selected":"" %>>헤어밴드</option>
						<option value="../image/35.jpg"
							<%=dto.getPhoto().equals("../image/35.jpg")?"selected":"" %>>모자</option>
				</select></td>
			<tr>
			<tr>
				<th>가격</th>
				<td><input type="text" name="price" style="width: 400px;"
					placeholder="상품명" required="required" class="form-control"
					value="<%=dto.getPrice() %>"></td>
			</tr>
			<tr>
				<th>입고일</th>
				<td><input type="date" name="ipgoday" style="width: 500px;"
					required="required" class=form-control
					value="<%=dto.getIpgoday() %>"></td>
			</tr>


			<td colspan="2" align="center">
				<button type="submit" class="btn btn-info">상품정보저장</button>
				<button type="button" class="btn btn-success"
					onclick="location.href='list.jsp'">목록으로이동</button>
			</td>
			</tr>


		</table>
	</form>
</body>
</html>