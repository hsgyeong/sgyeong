<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/css/bootstrap.min.css" rel="stylesheet">
<link href="https://fonts.googleapis.com/css2?family=Dongle:wght@300&family=Gaegu:wght@300&family=Nanum+Pen+Script&family=Sunflower:wght@300&display=swap" rel="stylesheet">
<script src="https://code.jquery.com/jquery-3.7.0.js"></script>
<title>Insert title here</title>
</head>
<body>
<form action="update" method="post" enctype="multipart/form-data">
<input type="hidden" name="num" value="${mdto.num }">
	<table style="width:800px" class="table table-bordered">
		<tr align="center">
			<th>상품명</th>
			<td>
			<input type="text" name="sang" class="form-control" required="required" value="${mdto.sang }">
			</td>
		</tr>
		<tr align="center">
			<th>상품이미지</th>
			<td>
			<input type="file" name="photoupload" multiple="multiple" class="form-control" value="${mdto.photoname }"><!-- 이미지에는 value를 넣으면 안됨 --> 
			</td>
		</tr>
		<tr align="center">
			<th>가격</th>
			<td>
			<input type="text" name="price" class="form-control" value="${mdto.price }">
			</td>
		</tr>
		
		<tr align="center">
			<td colspan="2">
			<button type="submit" class="btn btn-info">수정</button>
			<button type="button" class="btn btn-success"
			onclick="location.href='list'">목록</button>
			</td>
		</tr>
	</table>
</form>
</body>
</html>