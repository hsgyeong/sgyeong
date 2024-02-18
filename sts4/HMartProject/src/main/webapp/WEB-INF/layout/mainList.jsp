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
width: 300px;
height: 380px;
margin-bottom: 25px;
}

.inputBasket {
width: 300px;
height: 40px;
}

.price {
font-weight: bold;
font-size: 23px;
}

.productName {
font-size: 23px;
margin-bottom: 4px;
width: 300px;
}

.bi-chat-dots {
margin-right: 10px;
}

.review {
margin-bottom: 10px;
}

.inputBasket{
background-color: #7DAB12;
color: white;
border-color: #7DAB12;
border-radius: 5px;
font-size: 20px;
}

</style>
</head>
<body>
<c:set var="root" value="<%=request.getServletContext() %>"/>
<div class="container">
	<div class="row">
	<c:forEach var="dto" items="${list }" varStatus="i">
			<div class="col">
				<div class="product-item">
				<img alt="" src="../save/${dto.product_photo }" class="mainItemPhoto">
				<div class="product-info"> 
					<div class="productName">${dto.product }</div>
					<div class="price">
					<fmt:formatNumber value="${dto.price }" type="currency" currencySymbol=""
					maxFractionDigits="0"/>
					</div>
					<div class="review"><i class="bi bi-chat-dots"></i>${dto.reviewcount }</div>
				</div>
					<button type="button" class="bt inputBasket">담기</button>
				</div>
			</div>
	</c:forEach>
	</div>
</div>
</body>
</html>