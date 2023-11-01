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
<link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.11.1/font/bootstrap-icons.css">
<script src="https://code.jquery.com/jquery-3.7.0.js"></script>
<title>Insert title here</title>
</head>
<body>
<div style="margin: 50px 150px">
	<table class="table table-bordered" style="width:600px;">
	<tr>
		<td>
		<h4><b>${dto.subject }</b>
		<span style="font-size: 10pt; color: gray; float:right;">
		<fmt:formatDate value="${dto.writeday }" pattern="yyyy-MM-dd HH:mm"/>
		</span>
		</h4>
		<span>작성자:${dto.name }(${dto.myid })</span>
		
		<c:if test="${dto.uploadfile!='no' }">
		<span style="float:right;"><i class="bi bi-cloud-download" style="cursor:pointer;"></i>
		&nbsp;<a href="download?clip=${dto.uploadfile }"><b>${dto.uploadfile }</b></a></span>
		</c:if>
		</td>
	</tr>
	
	<tr>
		<td>
		<div class="d-inline-flex">
		<c:if test="${bupload==true }">
			<img alt="" src="../savefile/${dto.uploadfile }" style="width: 200px; height:200px;">
			&nbsp;&nbsp;&nbsp;&nbsp;
		</c:if>	
			<br><br>
			
			<pre>${dto.content }</pre>
			
			<br>
			</div>
			<span style="float:right;"><b>조회: ${dto.readcount }</b></span>
		</td>
	</tr>
	
	<!-- 버튼들 추가  -->
	<tr>
		<td align="right">
		<c:if test="${sessionScope.loginok!=null }">
		<button type="button" class="btn btn-outline-success" 
		onclick="location.href='form'">글쓰기</button>
		</c:if>
		<c:if test="${sessionScope.loginok!=null and sessionScope.myid==dto.myid}">
		<button type="button" class="btn btn-outline-success" 
		onclick="location.href='updateform?num=${dto.num}'">수정</button>
		</c:if>						<!--ajax가 아니라 그냥 넘기는 것  -->		
		<c:if test="${sessionScope.loginok!=null and sessionScope.myid==dto.myid}">
		<button type="button" class="btn btn-outline-success" 
		onclick="location.href='delete?num=${dto.num}'">삭제</button>
		</c:if>
		<button type="button" class="btn btn-outline-success" 
		onclick="location.href='list'">목록</button>
		</td>
	</tr>
	
	</table>
</div>
</body>
</html>