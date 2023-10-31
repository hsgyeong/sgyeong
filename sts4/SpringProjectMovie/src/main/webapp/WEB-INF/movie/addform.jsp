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
<form action="insert" method="post" enctype="multipart/form-data">
	<table class="table table-bordered" style="width:800px">
		<tr>
			<th align="center">영화명</th>
			<td>
			<input type="text" name="mv_title" class="form-control" required="required">
			</td>
		</tr>
		<tr>
			<th align="center">포스터</th>
			<td>
			<input type="file" name="poster" class="form-control">
			</td>				<!--file을 add할 때 name을 다르게 해줘야함 -->
		</tr>
		<tr>
			<th align="center">감독</th>
			<td>
			<input type="text" name="mv_director" class="form-control" required="required">
			</td>
		</tr>
		<tr>
			<th align="center">개봉일</th>
			<td>
			<input type="date" name="mv_opendate" class="form-control" required="required">
			</td>
		</tr>
		<tr>
			<td colspan="2">
			<button type="submit" class="btn btn-success">저장</button>
			<button type="button" class="btn btn-info"
			onclick="location.href='list'">목록</button>
			</td>
		</tr>
	</table>
</form>
</body>
</html>