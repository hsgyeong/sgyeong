<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/css/bootstrap.min.css" rel="stylesheet">
<link href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.7.2/font/bootstrap-icons.css" rel="stylesheet">
<link href="https://fonts.googleapis.com/css2?family=Dongle:wght@300&family=Gaegu:wght@300&family=Nanum+Pen+Script&family=Sunflower:wght@300&display=swap" rel="stylesheet">
<link href="https://fonts.googleapis.com/css2?family=Gugi&display=swap" rel="stylesheet">
<title>Insert title here</title>
<style>
.gologin {
	width: 250px;
	height: 60px;
	border-radius: 5px;
	color: #477500;
	background-color: white;
	border-color: #7DAB12;
}	

.item-name {
	font-size: 22px;
}

.item-price {
	margin-bottom: 40px;
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

.detail-table {
	margin-top: 300px;
	display: flex;
	justify-content: center;
}

#go {
	margin-bottom: 1px;
}

.item-detail {
	margin-top: 200px;
	margin-bottom: 500px;
	width: 950px;
}

.selectlist {
	display: flex;
	margin-top: 100px;
	justify-content: center;
}

.selectlist span {
	cursor: pointer;
	border: 1px solid #7DAB12;
	padding: 5px 10px;
	width: 280px;
	height: 50px;
	display: flex;
	align-items: center;
	justify-content: center;
	color: #477500;
	font-weight: bold;
}

#detail {
	width: 950px;
	table-layout: fixed;
}

div .a {
	margin-bottom: 100px;
}

td.info-data {
	width: 450px;
	margin-left: 20px;
}

.info-label {
	width: 100px;
	margin-left: 20px;
}

td img.img {
	width: 350px;
}

</style>
</head>
<body>
<c:set var="root" value="<%=request.getContextPath() %>"/>
  <div class="detail-table">
	<table class="detail" id="detail">
		<div class="a">
			<tr>
				<td rowspan="5">
					<img alt="" src="../save/${dto.item_photo }" class="img">
				</td>
				<td style="width: 300px;" colspan="2">
					<div class="item-name">${dto.item}</div> 
					<div class="item-price">
						<span class="fmt"><fmt:formatNumber value="${dto.price }" var="price"/>${price }</span>
						<span class="won">원</span>
					</div>
				</td>
			</tr>
			<tr>
				<td class="info-label">판매자</td>
				<td class="info-data" colspan="2">${dto.seller }</td>
			</tr>
			<tr>
				<td class="info-label">포장타입</td>
				<td class="info-data" colspan="2">${dto.packingtype }</td>
			</tr>
			<tr>
				<td class="info-label">소비기한<br>(유통기한)</td>
				<td class="info-data" colspan="2">${dto.expiration }</td>	
			</tr>
			<tr>	
				<td colspan="2">
					<c:if test="${sessionScope.login == null }">
						<div id="go">
							로그인 후, 쿠폰이 제공됩니다.
						</div><br>
					<button type="button" class="gologin" onclick="location.href='/login'">3,000원 할인 쿠폰 받고 구매하기</button>
					</c:if>
				</td>
			</tr>
		</div>
			<tr>
				<td colspan="4">
					<div class="selectlist">
						<span class="detail-info"><a>상세정보</a></span>
						<span class="item-review"><a>후기</a></span>
						<span class="qna"><a>문의</a></span>
						<span class="delivery-info"><a>배송정보</a></span>
					</div>
				</td>
			</tr>
	  		<tr>
				<td colspan="2">
					<div class="detail-photo"><img alt="" src="../save/${dto.item_detail }" class="item-detail"></div>
					<div class="review-list">
					<c:forEach var="dto" items="${list }" varStatus="i">
						<table>
							<tr>
								<td>
									<div type="hidden">${i.count }</div>
									<div>${dto.name }</div>
								</td>
							</tr>
						</table>
					</c:forEach>
					</div>
				</td>
			</tr>
		</table>
	</div>
</body>
</html>