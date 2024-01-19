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
<body>
<form action="insertAdminAction.jsp" method="post">
	<table class="table table-bordered" style="width: 550px;">
		
		<%-- select type으로 만들어보기 --%>
		
		<h1>커피 항목에 상품 추가</h1>
		<tr>
			<th style="width: 160px">상품명</th>
			<td>
				<input type="text" name = "name" style="width: 300px;" placeholder="이름 입력"
				 required="required" class="form form-control"> 
			</td>
		</tr>
		
		<tr>
			<th style="width: 160px">상품 종류</th>
			<td style="width: 300px;">
			<input type="radio" name="type" value="pone" >커피<br>
			<input type="radio" name="type" value="ptwo">스무디&프라페<br>
			<input type="radio" name="type" value="pthree">에이드&주스<br>
			</td>
		</tr>
		
		<tr>
			<th style="width: 160px">상품 이미지</th>
			<td>
				<input type="file" name = "image" style="width: 300px;" placeholder="상품 이미지 업로드"
				 required="required" class="form form-control"> 
			</td>
		</tr>
		
		<tr>
			<th style="width: 160px">상품 가격</th>
			<td>
				<input type="text" name = "price" style="width: 300px;" placeholder="간단 주소 입력"
				 required="required" class="form form-control"> 
			</td>
		</tr>
		
		<tr>
			<th style="width: 160px">수량</th>
			<td>
				<input type="number" name="stock" style="width: 300px;" placeholder="수량 입력"
				 min="1" required="required" class="form form-control"> 
			</td>
		</tr>
		
		<tr>
			<td colspan="2" align="center">
				<input type="submit" value="전송" class="btn btn-info">
				<input type="button" value="관리자 페이지로 이동" onclick="location.href = 'list_admin.jsp'"
				class="btn btn-success">
			</td>
		</tr>
	</table>
</form>
</body>
</html>