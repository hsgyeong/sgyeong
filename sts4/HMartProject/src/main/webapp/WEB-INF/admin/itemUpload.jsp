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
	width:600px;
	border: 1px solid gray;
	margin-top: -100px;
}

.upload-title {
	text-decoration: none;
	font-weight: bold;
	color: #477500;
	display: block;

}
.item-upload {
	margin-right:100px;
}

.title-div {
	margin: auto;
	position: relative;
	margin-bottom: -40px;
}

.item-form {
	display: flex;
	margin-top: 180px;
	flex-direction: column;
}

.item-tablebt {
	text-align: center;
}

.item-upload, .upload-cancle {
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

.radio-bt {
	display: flex;
}

.rd {
	margin-right: 15px;
}

select {
	width: 200px;
	-moz-appearance: none;
	-webkit-appearance: none;
	appearance: none;
	border-radius: 0.2em;
}


</style>
<title>Insert title here</title>
</head>
<body>
	<form action="registration" method="post" enctype="multipart/form-data"  class="item-form">
	<span class="title-div"><a class="upload-title">상품 등록</a></span>
		<table class="table uploadTable" style="width:800px; margin: auto; margin-top: 160px;">
		
		<tr>
			<th>상품명</th>
			<td>
			<input type="text" class="form-control" name="item" required="required">
			</td>
		</tr>
		<!-- 파일 업로드의 경우 이름과 dto가 같다고 해서 바로 올라가는게 아니다.. -->
			<!-- 이름을 똑같이 할 경우 오류 찾기가 어려워,, 구분을 위해 dto name과 여기 input의 Name을 다르게 준다. -->
		
		<tr>
			<th>그룹</th>
			<td>
			<select class="sel" name="maingroup" >
				<option value="베스트">베스트</option>
				<option value="세일">세일</option>
				<option value="신상품">신상품</option>
			</select>
			</td>
		</tr>
		<tr>
			<th>카테고리</th>
			<td>
			<select class="sel" name="category">
				<option value="채소,쌀">채소,쌀</option>
				<option value="과일,견과">과일,견과</option>
				<option value="수산,해산,건어물">수산,해산,건어물</option>
				<option value="정육,가공육,계란">정육,가공육,계란</option>
				<option value="국,반찬,샐러드">국,반찬,샐러드</option>
				<option value="메인요리,밀키트">메인요리,밀키트</option>
				<option value="면,양념,오일">면,양념,오일</option>
				<option value="생수,음료,커피">생수,음료,커피</option>
				<option value="간식,과자,떡">간식,과자,떡</option>
				<option value="베이커리">베이커리</option>
				<option value="유제품">유제품</option>
				<option value="건강식품">건강식품</option>
				<option value="주류">주류</option>
			</select>
			</td>
		</tr>
		<tr>
			<th>상품 사진</th>
			<td>
			<input type="file" class="form-control" name="itemupload" id="itemupload" required="required">
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
			<div class="radio-bt"><input type="radio" class="rd" value="상온(종이포장)" name="packingtype" required="required">상온&nbsp;(종이포장)</div>
			<div class="radio-bt"><input type="radio" class="rd" value="냉장(종이포장)" name="packingtype" required="required">냉장&nbsp;(종이포장)</div>
			<div class="radio-bt"><input type="radio" class="rd" value="냉동(종이포장)" name="packingtype" required="required">냉동&nbsp;(종이포장)</div>
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
			<td class="item-tablebt" colspan="2">
			<button class="item-upload" type="submit">상품등록</button>
			<button class="upload-cancle" type="button" onclick="location.href='/'">취소</button>
			</td>
		</tr>
		</table>
	</form>


</body>
</html>