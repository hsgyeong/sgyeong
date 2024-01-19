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
	<link rel="preconnect" href="https://fonts.googleapis.com">
<link rel="preconnect" href="https://fonts.gstatic.com" crossorigin>
<link href="https://fonts.googleapis.com/css2?family=IBM+Plex+Sans+KR:wght@100;200;300;500;600&family=Nanum+Gothic+Coding:wght@400;700&family=Noto+Sans+KR:wght@100;300;400;600;700&family=Roboto:wght@100&display=swap" rel="stylesheet">
<link rel="stylesheet"
	href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.11.1/font/bootstrap-icons.css">
<script src="https://code.jquery.com/jquery-3.7.0.js"></script>
<title>Insert title here</title>
<style type="text/css">
.main {

	flex-direction: column;
	align-items: center;
}

.main img {
	width: 220px;
	height: 200px;
}

.image-group {
	display: flex;
	flex-wrap: wrap;
	justify-content: center;
}

.bt {
	width: 225px;
	height: 38px;
	background-color: white;
	border: 1px solid lightgray;
	border-radius: 3px;
}
</style>
</head>
<body>
	<c:set var="root" value="<%=request.getContextPath()%>" />
	<span class="main"> <br><br><br>
		<h4>
			<div style="text-align: center;"><b>베스트</b></div>
		</h4> <br>
	<br>

		<div class="image-group"
			style="text-align: center; align-items: center; align-content: center;">
			<a> <span class="cow" style="padding: 20px 20px; font-family: IBM Plex Sans KR;"> <img
					src="${root }/image/1.jpeg"><br>
				<br>&nbsp;&nbsp;&nbsp;
					<button type="button" class="bt">
						<span style="font-family:  Godic Coding; font-size: 14px; 
						color: gray;"><i class="bi bi-cart-plus"></i>담기</span>
					</button>
					<br>
				<br> [횡성한우]소고기개껌 <br> <b>6,000원</b>
			</span>
			</a> 
			<a> <span class="chicken" style="padding: 20px 20px; font-family: IBM Plex Sans KR;"> <img
					src="${root }/image/2.jpeg"><br>
				<br>&nbsp;&nbsp;&nbsp;
					<button type="button" class="bt">
						<span style="font-family:  Godic Coding; font-size: 14px; 
						color: gray;"><i class="bi bi-cart-plus"></i>담기</span>
					</button>
					<br>
				<br> [충남부여]닭고기육포 <br> <b>5,500원</b>
			</span>
			</a> 
			<a> <span class="chicken" style="padding: 20px 20px; font-family: IBM Plex Sans KR;"> <img
					src="${root }/image/3.jpeg"><br>
				<br>&nbsp;&nbsp;&nbsp;
					<button type="button" class="bt">
						<span style="font-family:  Godic Coding; font-size: 14px; 
						color: gray;"><i class="bi bi-cart-plus"></i>담기</span>
					</button>
					<br>
				<br> 동글동글베이글 <br> <b>3,480원</b>
			</span>
			</a>
		</div> <br>
		<div class="image-group"
			style="text-align: center; align-items: center; align-content: center;">
			<a> <span class="gogi" style="padding: 20px 20px; font-family: IBM Plex Sans KR;"> <img
					src="${root }/image/4.jpg"><br>
				<br>&nbsp;&nbsp;&nbsp;
					<button type="button" class="bt">
						<span style="font-family:  Godic Coding; font-size: 14px; 
						color: gray;"><i class="bi bi-cart-plus"></i>담기</span>
					</button>
					<br>
				<br> 맛있는육포 <br> <b>4,500원</b>
			</span>
			</a>
			 <a> <span class="cookie" style="padding: 20px 20px; font-family: IBM Plex Sans KR;">
			  <img src="${root }/image/5.jpeg"><br>
				<br>&nbsp;&nbsp;&nbsp;
					<button type="button" class="bt">
						<span style="font-family:  Godic Coding; font-size: 14px; 
						color: gray;"><i class="bi bi-cart-plus"></i>담기</span>
					</button>
					<br>
				<br> [경기이천]우리쌀쿠키 <br> <b>5,000원</b>
			</span>
			</a> 
			<a> <span class="duck" style="padding: 20px 20px; font-family: IBM Plex Sans KR;"> 
			<img src="${root }/image/6.jpg"><br>
				<br>&nbsp;&nbsp;&nbsp;&nbsp;
					<button type="button" class="bt">
						<span style="font-family:  Godic Coding; font-size: 14px; 
						color: gray;"><i class="bi bi-cart-plus"></i>담기</span>
					</button>
					<br>
				<br> 오리오리꽥 <br> <b>5,700원</b>
			</span>
			</a>
		</div>
	</span>
	<br>
	<br>
	<p>	<img src="${root }/image/banner1.png"
			style="width: 950px; height: 140px; cursor: pointer;"><br>&nbsp;&nbsp;&nbsp;
	</p>
	<div style="display: flex; flex-direction: row;">
	<div class="infos" style="font-family: IBM Plex Sans KR;">
	고객센터
	<b><h2>1544-0000</h2></b>
	</div>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
			&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
			&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
	<div style="color:gray; font-size: 9pt; font-family: 'IBM Plex Sans KR', sans-serif;">
	<a style="cursor:pointer">독캣컬리</a>&nbsp;&nbsp;<a style="cursor:pointer">인재채용</a>&nbsp;&nbsp;
	<a style="cursor:pointer">이용약관</a>&nbsp;&nbsp;<a style="cursor:pointer">개인정보처리방침</a><br><br>
	법인명(상호):독캣컬리&nbsp;&nbsp;사업자등록번호:100-33-222442<br>
	주소: 충남 부여군 부여읍 동남리 독캣컬리<br>
	채용문의: sgyeong0711@gmail.com
	</div>
	</div>
</body>
</html>