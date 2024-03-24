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
<style type="text/css">
.box{
width:40px;
height:40px;
border: 1px solid gray;
border-radius: 100px;
}
</style>
</head>
<body>
<div style="margin:50px 100px; width:1000px;">
	<img alt="" src="../2.png" style="width:100px; height:100px;">
		<button type="button" class="btn btn-info"
		onclick="location.href='carform'">자동차정보입력</button>
		<br><br>
		<h3 class="alert alert-info">
			<b>총 ${totalCount }개의 자동차 정보가 있습니다.</b>
		</h3>
		<table class="table table-bordered">
			<tr align="center">
				<th width="60px">번호</th>
				<th width="150px">차량명</th>
				<th width="100px">색상</th>
				<th width="160px">가격</th>
				<th width="180px">구입일</th>
				<th width="180px">등록일</th>
				<th width="150px">편집</th>
			</tr>
		<tr>
			<c:forEach var="dto" items="${list }" varStatus="i">
				<tr>
					<td align="center">${i.count }</td>
					<td align="center">
						<a href="detail?num=${dto.num }">
							<img alt="" src="../save/${dto.carphoto }" width="40" height="40" border="1" hspace="10">
						</a>
						${dto.carname }
					</td>
					<td align="center">
						<div style="background-color: ${dto.carcolor}" class="box"></div>
					</td>
					<td align="center"><fmt:formatNumber value="${dto.carprice }" type="currency"/></td>
					<td align="center">${dto.carguip }</td>
					<td align="center"><fmt:formatDate value="${dto.guipday }" pattern="yyyy-MM-dd HH:mm" /></td>
					<td align="center">
						<button type="button" class="btn btn-info btn-sm"
						onclick="location.href='carupdate?num=${dto.num}'" >수정</button>
						<button type="button" class="btn btn-danger btn-sm"
						onclick="location.href='delete?num=${dto.num}'" >삭제</button>
					</td>
				</tr>
			</c:forEach>
		</tr>
	</table>
</div>
</body>
</html>