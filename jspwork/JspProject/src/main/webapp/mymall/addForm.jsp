<%@page import="model.mymall.MallDto"%>
<%@page import="model.mymall.MallDao"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<link
	href="https://fonts.googleapis.com/css2?family=Cute+Font&family=Dongle:wght@300&family=Gamja+Flower&family=Gowun+Batang&family=Gowun+Dodum&family=Hi+Melody&family=Nanum+Gothic&family=Nanum+Gothic+Coding&family=Nanum+Pen+Script&family=Poor+Story&family=Sunflower:wght@300&display=swap"
	rel="stylesheet">
<link
	href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/css/bootstrap.min.css"
	rel="stylesheet">
<script src="https://code.jquery.com/jquery-3.7.0.js"></script>
<title>Insert title here</title>
<style type="text/css">
#selphoto{
	
	position: absolute;
	left: 500px;
	top: 100px;
	width: 300px;
	height: 400px;
	border-radius: 30px;

}
</style>
<script type="text/javascript">
$(function(){
	
	//select된 선택값 얻기
	var srcImg=$("#photo").val();
	//selphoto에 넣기
	$("#selphoto").attr("src",srcImg);
	
	$("#photo").change(function(){
		
		var s= $(this).val();  //var s="../쇼핑몰사진/"+$(this).val()+".jpg"
		$("#selphoto").attr("src",s);
	});
	
})
</script>
</head>

<body>
	<div style="margin: 30px 30px;">
		<form action="addAction.jsp" method="post">
			<table class="table table-bordered" style="width: 400px;">
				<cation align="top"><h4>상품등록</h4></cation>
				<tr align="center">
					<th>상품명</th>
					<td><input type="text" name="sangpum" style="width: 400px;"
						placeholder="상품명" required="required" class="form-control">
					</td>
				</tr>

				<tr>
					<th>상품사진</th>
					<td><select name="photo" id="photo">
							<!-- <option value="../image/12.jpg">구두</option>
							<option value="../image/30.jpg">헤어밴드</option>
							<option value="../image/35.jpg">모자</option> -->
						
							<option value="../image/12.jpg">구두</option>
							<option value="../image/30.jpg">헤어밴드</option>
							<option value="../image/35.jpg">모자</option>
					</select>
			
				</td>
				</tr>

				<tr>
					<th>가격</th>
					<td><input type="text" name="price" style="width: 400px;"
						placeholder="상품명" required="required" class="form-control">
					</td>
				</tr>

				<tr>
					<th>입고일</th>
					<td><input type="date" name="ipgoday" style="width: 400px;"
						placeholder="입고일" required="required" class="form-control">
					</td>
				</tr>


				<tr>
					<td colspan="2" align="center">
						<button type="submit" value="전송" class="btn btn-info">상품저장</button>
						<button type="button" value="목록"
							onclick="location.href='list.jsp'" class="btn btn-success">목록으로이동</button>
					</td>
				</tr>

			</table>
		</form>
	</div>
	
	<img alt="" src="" id="selphoto">
	
</body>
</html>