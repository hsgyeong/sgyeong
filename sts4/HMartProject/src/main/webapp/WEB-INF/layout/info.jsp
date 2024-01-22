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
.center {
	margin-bottom: 650px;
	color: #477500;
}
.centerNumber{
	margin-bottom: 50px;
	font-size: 32px;
	font-weight: bold;
	margin-right:40px;
	color: #477500;
}

.infobox {
	justify-content: center;
	align-items: center;
	height:100vh;
	display: flex;
}
.kakao-inquiry, .individual-inquiry, .bulk-inquiry {
	margin-bottom: 30px;
	margin-right: 50px;
	width:160px;
	height: 50px;
	border-radius: 5px;
	background-color: white;
	color: #7DAB12;
	border-color: #7DAB12;
}

.run {
	margin-bottom: 50px;
	margin-top:20px;
	color: #477500;
}

.runtime {
	font-size: 15px;
	color:gray;
}

.left, .right {
	height: 100vh;
}

.left {
	margin-right:100px;
}

.day {
	font-size: 13px;
}

.mt {
	font-family: 'gugi';
	font-weight: bold;
}

.infobt {
	margin-right:20px;
	cursor: pointer;
}

.kakao-inq-btn, .indiv-inq-btn, .bulk-inq-btn {
	display: flex;
}
</style>
</head>
<body>
<c:set var="root" value="<%=request.getContextPath() %>"/>
<div id="info">
	<div class="infobox">
	<hr>
	

	<div class="left">
		<span class="center"><span class="mt">H-Mart</span> 고객센터</span><br>
		<div class="run">
			<span class="centerNumber">1500-0000</span>
			<span class="day">월~토요일 오전 7시 ~ 오후 6시</span><br>
		</div>
	
		<div>
		<div class="kakao-inq-btn">
			<button class="kakao-inquiry">카카오톡 문의</button>
			<div class="runtime">
			월~토요일 | 오전7시~오후6시<br>
			일/공휴일 &nbsp;| 오전7시~오후1시
			</div>
		</div>
		<br>
		<div class="indiv-inq-btn">
		<button class="individual-inquiry">1:1 문의</button>
		<span class="runtime">
		365일
		</span>
		</div>
		<br>
		<div class="bulk-inq-btn">
			<div>
			<button class="bulk-inquiry">대량주문 문의</button>
			</div>
			<div class="runtime">
			월~금요일 | 오전9시~오후6시<br>
			점심시간 &nbsp;&nbsp;| 오후12시~오후1시
			</div>
		</div>
		</div>
	</div>
	<div class="right">
	<span class="infobt">투자정보</span>
	<span class="infobt">인재채용</span>
	<span class="infobt">이용약관</span>
	<span class="infobt">개인정보처리방침</span>
	<span class="infobt">이용안내</span>
	</div>
	
	</div>
</div>
</body>
</html>