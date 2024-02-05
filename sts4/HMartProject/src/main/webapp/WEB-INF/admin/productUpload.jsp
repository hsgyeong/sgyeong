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
<style type="text/css">

.uploadTable {
	width:800px;
}

.upload-title {
	text-decoration: none;
	font-weight: bold;
	color: #477500;
	display: block;

}
.product-upload {
	margin-right:100px;
}

.title-div {
	margin: auto;
	position: relative;
}

.product-form {
	display: flex;
	margin-top: 180px;
	flex-direction: column;
}

.product-tablebt {
	text-align: center;
}

.product-upload, .upload-cancle {
	width: 180px;
	height:30px;
	border-radius: 4px;
	background-color: #7DAB12;
	border-color:#7DAB12;
	color: white;
}

.upload-title {
	margin-bottom: -30px;
	font-size: 30px;
}
</style>
<title>Insert title here</title>
</head>
<body>
	<form action="registration" method="post" enctype="multipart/form-data" class="product-form">
	<span class="title-div"><a class="upload-title">상품 등록</a></span>
		<table class="table uploadTable" style="width:800px; margin: auto; margin-top: 160px;">
		
		<tr>
			<th>상품명</th>
			<td>
			<input type="text" class="form-control" name="product" required="required">
			</td>
		</tr>
		<tr>
			<th>가격</th>
			<td>
			<input type="text" class="form-control" name="price" required="required">
			</td>
		</tr>
		<tr>
			<th>판매자</th>
			<td>
			<input type="text" class="form-control" name="seller" required="required">
			</td>
		</tr>
		<tr>
			<th>포장타입</th>
			<td>
			<input type="radio" class="form-control" value="상온(종이포장)" name="packingtype" required="required">상온&nbsp;(종이포장)
			<input type="radio" class="form-control" value="냉장(종이포장)" name="packingtype" required="required">냉장&nbsp;(종이포장)
			<input type="radio" class="form-control" value="냉동(종이포장)" name="packingtype" required="required">냉동&nbsp;(종이포장)
			</td>
		</tr>
		<tr>
			<th>판매단위</th>
			<td>
			<input type="text" class="form-control" name="unit" required="required">
			</td>
		</tr>
		<tr>
			<th>중량/용량</th>
			<td>
			<input type="text" class="form-control" name="volumn" required="required">
			</td>
		</tr>
		<tr>
			<td class="product-tablebt" colspan="2">
			<button class="product-upload" type="submit">상품등록</button>
			<button class="upload-cancle" type="button" onclick="location.href='/'">취소</button>
			</td>
		</tr>
		</table>
	</form>


</body>
</html>