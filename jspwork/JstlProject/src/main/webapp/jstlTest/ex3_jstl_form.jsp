<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link
	href="https://fonts.googleapis.com/css2?family=Cute+Font&family=Dongle:wght@300&family=Gamja+Flower&family=Gowun+Batang&family=Gowun+Dodum&family=Hi+Melody&family=Nanum+Gothic&family=Nanum+Gothic+Coding&family=Nanum+Pen+Script&family=Poor+Story&family=Sunflower:wght@300&display=swap"
	rel="stylesheet">
<link
	href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/css/bootstrap.min.css"
	rel="stylesheet">
<script src="https://code.jquery.com/jquery-3.7.0.js"></script>
</head>
<body>
<!--한글엔코딩-->
<fmt:requestEncoding value="utf-8"/>
<form action="ex3_jstl_form.jsp" method="post" style="width:200px;">
<h3>이름입력</h3>
<input type="text" name="irum" class="form-control">
<h3>가고싶은 나라</h3>
<input type="text" name="nara" class="form-control">
<br>
<button type="submit" class="btn btn-info">결과확인</button>
</form>

<!--이름을 입력시에만 결과가 나오게-->
<c:if test="${!empty param.irum }">
<h2>이름: ${param.irum }</h2>
<h3>나라: ${param.nara }</h3>
</c:if>

<c:choose>
<c:when test="${param.nara=='프랑스' }">
<h3 style="color: green;"> 프랑스 에펠탑</h3>
</c:when>
<c:when test="${param.nara=='체코' }">
<h3 style="color: magenta;"> 체코 흑맥주</h3>
</c:when>
<c:when test="${param.nara=='하와이' }">
<h3 style="color: orange;"> 하와이 훌라</h3>
</c:when>
<c:when test="${param.nara=='오스트리아' }">
<h3 style="color: cyan;"> 오스트리아 마리앙트와네트</h3>
</c:when>
<c:otherwise>
<h3 style="color: red;"> ${param.nara }는 해당사항 없음</h3>
</c:otherwise>
</c:choose>
</body>
</html>