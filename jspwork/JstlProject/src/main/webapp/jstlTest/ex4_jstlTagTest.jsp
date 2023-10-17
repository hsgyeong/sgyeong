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
<fmt:requestEncoding value="utf-8"/>
	<form action="" method="post">
		<table class="table table-borderd" style="width: 300px;">
			<tr>
				<th>이름</th>
				<td><input type="text" name="name" class="form-control"
					style="width: 120px;"></td>
			</tr>
			<tr>
				<th>나이</th>
				<td><input type="text" name="age" class="form-control"
					style="width: 120px;"></td>
			</tr>
			<tr>
				<th>급여</th>
				<td><input type="text" name="pay" class="form-control"
					style="width: 120px;"></td>
			</tr>
			<tr>
				<th>가고싶은 나라</th>
				<td><input type="text" name="nara" class="form-control"
					style="width: 120px;"></td>
			</tr>

			<tr>
				<td colspan="2" align="center">
					<button type="submit" class="btn btn-success">결과확인</button>
				</td>
			</tr>
			
			<!--이름을 입력했을 경우에만 div 출력
			
			이름: 신짱구
			나이: 5세(미성년자).. 20살 이상이면 성년 아니면 미성년
			월급여: 180만원 .. 화폐단위와 천단위 구분기호
			가고싶은 나라: choose 이용해서 출력 마음대로 할 것
						
			-->
			<c:if test="${!empty param.name }">
			<div class="alert alert-info" style="width:400px;">
			이름: ${param.name }<br>
			나이: ${param.age }세(
			
			<c:if test="${param.age>=20 }">
			<span style="color:blue;">성인</span>
			</c:if>
			<c:if test="${param.age<20 }">
			<span style="color:green;">미성년자</span>
			</c:if>
			)
			<br>
			급여: <fmt:formatNumber value="${param.pay}" type="currency"/>
			<br>
			가고싶은 나라: ${param.nara }
			
			<c:choose>
			<c:when test="${param.nara=='미국'}">
			<h4 style="color:blue;">미국</h4>
			</c:when>
			<c:when test="${param.nara=='캐나다' }">
			<h4 style="color:pink;">캐나다</h4>
			</c:when>
			<c:when test="${param.nara=='독일' }">
			<h4 style="color:green;">독일</h4>
			</c:when>
			<c:when test="${param.nara=='중국' }">
			<h4 style="color:orange;">중국</h4>
			</c:when>
			<c:when test="${param.nara=='일본' }">
			<h4 style="color:yellow;">일본</h4>
			</c:when>
			</c:choose>
			</div>
			</c:if>


		</table>
	</form>
</body>
</html>