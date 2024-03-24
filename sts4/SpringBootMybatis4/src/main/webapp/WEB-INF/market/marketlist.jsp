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
<c:if test="${totalCount==0 }">
	<div class="alert alert-success">
		<b>저장된 상품 정보가 없습니다</b>
	</div>
</c:if>
<c:if test="${totalCount>0 }">
	<div class="alert alert-info">
		총 ${totalCount }개의 정보가 있습니다.
	</div>
</c:if>
<table class="table table-bordered" style="width:800px;">
	<tr align="center" >
		<th width="80">번호</th>
		<th width="200">상품명</th>
		<th width="110">가격</th>
		<th width="150">입고일자</th>
		<th width="180">편집</th>
	</tr>

	<tr>
		<c:forEach var="mdto" items="${list }" varStatus="i">
			<tr>
				<td align="center">${i.count }</td>
				<td align="center">
					<c:if test="${mdto.photoname != 'no'}">
						<a href="../save/${photo }"><img alt="" src="../save/${mdto.photoname }" style="width:100px; height:100px;"></a>
					</c:if>
					<c:if test="${mdto.photoname == 'no' }">
						<a href="../image/noimage.png">
							<img alt="" src="../image/noimage.png" style="width:100px; height:100px;">
						</a>
					</c:if>
					${mdto.sang }
				</td>	
				<td align="center">${mdto.price }</td>
				<td align="center"><fmt:formatDate value="${mdto.ipgoday }" pattern="yyyy-MM-dd"/></td>
				<td align="center">
					<button type="button" class="btn btn-warning" onclick="location.href='updateform?num=${mdto.num}'">수정</button>
					<button type="button" class="btn btn-danger" onclick="location.href='delete?num=${mdto.num}'">삭제</button>
				</td>
			</tr>
		</c:forEach>
	</tr>
</table>
<div style="margin:100px 100px;">
	<button type="button" class="btn btn-info"
	onclick="location.href='writeform'">글쓰기</button>
</div>
</body>
</html>