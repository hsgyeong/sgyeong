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
.loginbenefit {
	width: 250px;
	height: 60px;
	border-radius: 5px;
}	
	
.item_photo {
	width: 350px;
	height: 450px;
	border-radius: 5px;
	margin-right: 50px;
}

.item-name {
	font-size: 22px;
}

.item-price {
	margin-bottom: 50px;
}

.fmt {
	margin-right: 10px;
	font-weight: bold;
	font-size: 24px;
}	

.won {
	font-size: 18px;
	font-weight: bold;
}
</style>
</head>
<body>
	<table>
		<tr>
			<td rowspan="4"><img alt="" src="../save/${dto.item_photo }" class="item_photo"></td>
			<td>
			<div class="item-name">${dto.item}</div> 
			<div class="item-price"><span class="fmt"><fmt:formatNumber value="${dto.price }" var="price"/>${price }</span>
			<span class="won">원</span></div>
			<div>
			<c:if test="${sessionScope.login == null }">
				로그인 후, 쿠폰이 제공됩니다.<br>
				<button type="button" class="loginbenefit">3,000원 할인 쿠폰 받고 구매하기</button>
			</c:if>
			</div>
			</td>
		</tr>
		<tr>
			<td>
			<div>판매자</div>
			<div>${dto.seller }</div>
			</td>
		</tr>
		<tr>
			<td>
			<div>포장타입</div>
			<div>${dto.packingtype }</div>	
			</td>
		</tr>
	</table>
</body>
</html>