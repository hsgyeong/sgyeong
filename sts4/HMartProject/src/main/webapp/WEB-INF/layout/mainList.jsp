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
<link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.11.3/font/bootstrap-icons.min.css">
<script src="https://code.jquery.com/jquery-3.7.0.js"></script>
<title>Insert title here</title>
<style type="text/css">
.mainItemPhoto {
	width: 200px;
	height: 260px;
	margin-bottom: 35px;
	border-radius: 5px;
}

.inputBasket {
	width: 200px;
	height: 36px;
}

.price {
	font-weight: bold;
	font-size: 20px;
}

.itemName {
	font-size: 18px;
	margin-bottom: 4px;
	width: 200px;
}

.bi-chat-dots, .like {
	margin-right: 10px;
	font-size: 18px;
}

.review {
	margin-bottom: 10px;
	font-size: 13px;
	margin-right: 25px;
}

.inputBasket {
	background-color: #7DAB12;
	color: white;
	border-color: #7DAB12;
	border-radius: 5px;
	font-size: 18px;
	margin-bottom: 100px;
}

.container {
	top: 1200px;/**/
	margin-bottom: 400px;
}

.buy-bt {
	margin-bottom: 30px;
}

.row .col {
	padding: 2px;
}

#mainList {
	justify-content: center;
}

.icons {
	display: flex;
}

.like, .chat {
	color: #7DAB12;
}
</style>

</head>
<body>
<c:set var="root" value="<%=request.getServletContext() %>"/>
<div class="container"  id="mainList">
	<div class="rowclass">
		<c:forEach var="dto" items="${list }" varStatus="i">
			<c:if test="${i.index%4==0 }">
				<div class="row">
			</c:if>
			<div class="col">
				<div class="item-item">
					<a href="/item/detail?item_id=${dto.item_id }">
						<img alt="" src="../save/${dto.item_photo }" class="mainItemPhoto">
					</a>
				</div>
				<div class="buy-bt">
					<button type="button" class="bt inputBasket">담기</button>
				</div>
				<div class="item-info"> 
					<div class="itemName">${dto.item }</div>
					<div class="price">
						<fmt:formatNumber value="${dto.price }" type="currency" currencySymbol=""
							maxFractionDigits="0"/>
					</div>
					<div class="icons">
						<div class="review">
							<i class="bi bi-chat-dots chat"></i>${dto.reviewcount }
						</div>
						<i class="bi bi-heart like"></i>
					</div>
				</div>
			</div>
			<c:if test="${i.index%4==3 ||i.last }">
				</div>
			</c:if>
		</c:forEach>
	</div>
</div>	
</body>
</html>