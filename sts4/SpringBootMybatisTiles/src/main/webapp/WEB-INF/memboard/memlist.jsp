<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<link
	href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/css/bootstrap.min.css"
	rel="stylesheet">
<link
	href="https://fonts.googleapis.com/css2?family=Dongle:wght@300&family=Gaegu:wght@300&family=Nanum+Pen+Script&family=Sunflower:wght@300&display=swap"
	rel="stylesheet">
<script src="https://code.jquery.com/jquery-3.7.0.js"></script>
<title>Insert title here</title>
</head>
<body>
<div style="margin: 50px 10px; width: 1000px;">
		<c:if test="${sessionScope.loginok!=null }">
			<button type="button" class="btn btn-info"
				onclick="location.href='form'">글쓰기</button>
		</c:if>
		<br>
		<br>
		<c:if test="${totalCount==0 }">
			<tr>
				<td colspan="5" align="center">
					<h4>등록된 글이 없습니다.</h4>
				</td>
			</tr>
		</c:if>
		<c:if test="${totalCount>0 }">
			<tr>
				<td colspan="5" align="center">
					<h4>총 ${totalCount }개의 글이 있습니다.</h4>
			</tr>
		</c:if>
		<table class="table table-bordered"
			style="width: 1000px; text-align: center;">
			<tr class="table-secondary">
				<th width="60">번호</th>
				<th width="360">제목</th>
				<th width="100">이미지</th>
				<th width="160">작성자</th>
				<th width="100">조회</th>
				<th width="260">등록일</th>
			</tr>
			<tr>
				<c:forEach var="dto" items="${list}" varStatus="i">
				<tr style="vertical-align: middle;">
					<td>${dto.num }</td>
					<td><a href="content?num=${dto.num }&currentPage=${currentPage}"
					style="color:black">${dto.subject }</a></td>
					<td><c:if test="${dto.uploadfile!=null }">
							<img alt="" src="../savefile/${dto.uploadfile }"
								style="width: 120px;height:120px;">
						</c:if> 
						<c:if test="${dto.uploadfile==null }">
							<img alt="" src="../image/noimage.png" style="width: 120px;height:120px;">
						</c:if></td>
					<td>${dto.myid }</td>
					<td>${dto.readcount }</td>
					<td>${dto.writeday }</td>
					</tr>
				</c:forEach>
			</tr>
		</table>

		<!-- 페이징 -->
		<c:if test="${totalCount>0 }">
			<div style="width: 800px; text-align: center;">
				<ul class="pagination justify-content-center">
					<!--이전 -->
					<c:if test="${startPage>1 }">
						<li><a href="list?currentPage=${startPage-1 }">이전</a></li>
					</c:if>

					<!--페이지 번호-->
					<c:forEach var="pp" begin="${startPage }" end="${endPage }">
						<c:if test="${currentPage==pp }">
							<li class="page-item active"><a class="page-link"
								href="list?currentPage=${pp }">${pp }</a></li>
						</c:if>

						<c:if test="${currentPage!=pp }">
							<li class="page-item"><a class="page-link"
								href="list?currentPage=${pp }">${pp }</a></li>
						</c:if>
					</c:forEach>

					<!--다음  -->
					<c:if test="${endPage<totalPage }">
						<li class="page-item"><a
							href="list?currentPage=${endPage+1 }">다음</a></li>
					</c:if>

				</ul>
			</div>
		</c:if>
</div>
</body>
</html>