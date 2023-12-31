<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<link
	href="https://fonts.googleapis.com/css2?family=Cute+Font&family=Dongle:wght@300&family=Gamja+Flower&family=Gowun+Batang&family=Gowun+Dodum&family=Hi+Melody&family=Nanum+Gothic&family=Nanum+Gothic+Coding&family=Nanum+Pen+Script&family=Poor+Story&family=Sunflower:wght@300&display=swap"
	rel="stylesheet">
<link rel="stylesheet"
	href="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/css/bootstrap.min.css">
<script src="https://code.jquery.com/jquery-3.7.0.js"></script>  <!--bootstrap 3  -->
<title>Insert title here</title>
<script type="text/javascript">
$(function(){
	$("#btnGaip").click(function(){
		if(mfrm.mid.value.length==0){
			alert("아이디를 입력해주세요");
			return false;
		}
	})
	
})
</script>
</head>
<body>
	<div style="margin: 50px; 100px;">
		<form action="addProc.jsp" method="post" enctype="multipart/form-data"
			class="form-inline" id="mfrm">
			<table class="table table-bordered" style="width: 500px;">
				<caption align="top">
					<b>회원가입</b>
				</caption>
				<tr>
					<td style="background-color: #87cefa; text-align:center" width="120">아이디</td>
					<td><input type="text" class="form-control" name="id"
						style="width: 120px;" readonly="readonly" required="required"  id="mid">
						<button type="button" class="btn btn-danger btn-sm"
							onclick="openId()">아이디 입력</button></td>
				</tr>
				<tr>
					<td style="background-color: #87cefa; text-align:center" width="120">비밀번호</td>
					<td><input type="password" class="form-control"
						style="width: 120px;" name="pass" required="required"></td>
				</tr>

				<tr>
					<td style="background-color: #87cefa; text-align:center" width="120">이름</td>
					<td><input type="text" class="form-control"
						style="width: 120px;" name="name" required="required"></td>
				</tr>

				<tr>
					<td style="background-color: #87cefa; text-align:center" width="120">사진</td>
					<td><input type="file" class="form-control"
						style="width: 250px;" name="uploadImg"></td>
				</tr>

				<tr>
					<td style="background-color: #87cefa; text-align:center" width="120">핸드폰</td>
					<td><input type="text" class="form-control"
						style="width: 200px;" name="hp" required="required"></td>
				</tr>
				
				<tr>
				<td colspan="2" align="center">
				<button type="submit" class="btn btn-success" id="btnGaip" >회원가입</button>
				<button type="button" class="btn btn-warning" onclick="location.href='memberList.jsp'">회원목록</button>
				</td>
				</tr>
			</table>
		</form>
	</div>
	
	<script type="text/javascript">
	function openId(){
		window.open("idcheck.jsp","e","left=400px, top=100px, width=300px, height=250px");
	}
	</script>
</body>
</html>