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
<style>

.image{padding-left: 300px;}
.info{display:flex;
justify-content:center;
align-items: center;}
</style>
</head>
<body>

	<div class="info"><h3>상세 정보</h3></div>
	<br>
	<br>
	<table style="width:1000px;">
	<tr rowspan="3">
	<td>
	<div class="image">
	<img alt="" src="../moviephoto/${dto.mv_poster }" style="width:300px; height:400px;">
	</div>
	</td>
	<td>
	
	<h2>
	영화제목:${dto.mv_title }<br>
	감독:${dto.mv_director }<br>
	개봉일:${dto.mv_opendate }<br><br>
	</h2>
	
	<button type="button" class="btn btn-warning" onclick="location.href='updateform?num=${dto.mv_num}'">수정</button>
	&nbsp;
	<button type="button" class="btn btn-danger"  onclick="location.href='delete?num=${dto.mv_num}'">삭제</button>
	&nbsp;
	<button type="button" class="btn btn-info"  onclick="location.href='redirect'">목록</button>
	&nbsp;
	<button type="button" class="btn btn-success"  onclick="location.href='writeform'">글쓰기</button>
	
	
	</td>
	</tr>
	</table>
</body>
</html>