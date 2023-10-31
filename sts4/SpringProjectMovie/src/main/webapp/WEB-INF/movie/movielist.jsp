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
.dv{
float:left;
padding-left: 20px;
margin-right: 20px;
}
</style>
</head>
<body>
<c:if test="${totalCount==0 }">
	<div class="alert alert-success">
	<b>영화가 없습니다</b>
	</div>
</c:if>
<c:if test="${totalCount>0 }">
<div class="alert alert-info">
	총 ${totalCount }개의 영화가 있습니다.
</div>
</c:if>

<button type="button" class="btn btn-info"
onclick="location.href='writeform'" style="margin-left: 100px">영화등록</button>
<br><br><br>
<table class="table table-bordered" style="width:1000px">
<c:forEach var="dto" items="${list }" varStatus="c">
 <div class="dv">
 	<div align="center">
 	<figure style="float:left;">
 		<a href="detail?num=${dto.mv_num }">
 		<img alt="" src="../moviephoto/${dto.mv_poster}" style="width:200px; height:320px;"></a>
 		<figcaption>
 		${dto.mv_title }<br>
 		${dto.mv_director }<br>
	 	</figcaption>
 	</figure>
 	</div>
 </div>
</c:forEach>
</table>
</body>
</html>