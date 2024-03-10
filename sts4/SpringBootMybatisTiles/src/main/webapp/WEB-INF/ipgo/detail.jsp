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
<style type="text/css">
.sang{
font-size: 22px;
text-align: center;
display: flex;
align-items: center;}
.sang img{
margin-right:20px;
}
</style>
</head>
<body>
<table class="table table-bordered sang"
style="margin-left: 400px; margin-top: 120px;">
	<tr>
		<td>
		<img src="../upload/${dto.photoname }" >
		</td>
	</tr>

<tr>
	<td>
		<h5>
		<p>${dto.sangpum }</p>
		<p>${dto.price }</p>
		<p>${dto.ipgoday }</p>
		</h5>
	</td>
</tr>
</table>
</body>
</html>