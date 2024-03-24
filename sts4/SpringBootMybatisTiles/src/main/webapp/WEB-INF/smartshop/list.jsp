<%@ page language="java" contentType="text/html; charset=UTF-8"	pageEncoding="UTF-8"%>
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
<button type="button" class="btn btn-info" onclick="location.href='form'">스마트상품으로 가기</button>
<br>
<hr>
	<table class="table table-bordered">
		<tr  style="text-align: center;">
			<th>no</th>
			<th>상품명</th>
			<th>가격</th>
			<th width="80">색상</th>
			<th>상세설명</th>
			<th width="110">입고일</th>
		</tr>
		<tr>
			<c:forEach var="dto" items="${list }" varStatus="i">
				<tr>
					<td style="text-align: center;">${dto.num }</td>
					<td style="text-align: center;">${dto.sangname }</td>
					<td style="text-align: center;">${dto.price }</td>
					<td style="color:${dto.color }; text-align: center;">■</td>
					<td>${dto.content }</td>
					<td>${dto.ipgoday }</td>
				</tr>
			</c:forEach>
		</tr>
	</table>
	
	<!-- 페이징 -->
	<c:if test="${totalCount>0 }">
		<div style="width:800px; text-align:center;">
			<ul class="pagination justify-content-center">
				<!-- 이전 -->
				<c:if test="${startPage>1 }">
					<li>
						<a href="list?currentPage=${startPage-1 }"></a>
					</li>
				</c:if>
				<c:forEach var="pp" begin="${startPage }" end="${endPage }">
					<c:if test="${currentPage==pp }">
						<li class="page-item active">
							<a class="page-link" href="list?currentPage=${pp }"></a>
						</li>
					</c:if>
					<c:if test="${currentPage!=pp }">
						<li class="page-item">
							<a class="page-link" href="list?currentPage=${pp }">${pp }</a>
						</li>
					</c:if>
				</c:forEach>
				<!-- 다음 -->
				<c:if test="${endPage<totalPage }">
					<li class="page-item">
						<a href="list?currentPage=${endPage+1 }">다음</a>
					</li>
				</c:if>
			</ul>
		</div>
	</c:if>
</body>
</html>