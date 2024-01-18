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
<style>
.button {
	margin-left: 900px;
}

.content {
	margin-left: 300px;
}
</style>
<script>
$(function(){
	$("img.photo").click(function(){
		$("#photo.trigger("click"));
	})
	
})
function readURL(input){
	if(input.files&&input.files[0]){
		var reader=new FileReader();
		reader.onload=function(e){
			$('#showing').attr('src',e.target.result);
		}
		reader.readAsDataURL(input.files[0]);
	}
}
</script>

<title>Insert title here</title>
</head>
<body>
	<form action="tourReview/tourSpotReviewAction.jsp" method="post"
		enctype="multipart/form-data">
			<table class="table table-bordered"
			style="width: 1100px; height: 400px; margin-top: 100px; margin-left:180px;">
			<tr>

				<td><img src="../image/이미지.png" id="showing"
					onclick="openFileInput()" alt="" width="50px;" class="photo"
					height="40px" margin-top="10px";> <input type="file"
					class="image" id="image" style="visibility: hidden;"
					onchange="readURL(this)">


					<div class="input-container"
						style="margin-left:818px; width: 300px;"><br>
					
					</div> <br><input type="text" name="title" class="form-control"
					style="width: 1100px; margin-left: 10px" required="required" placeholder="제목">
					<br>
					<textarea style="width: 1100px; height: 150px; margin-left: 10px"
						name="content" required="required" class="form-control"
						placeholder="리뷰를 작성해주세요"></textarea>


					<button class="btn btn-primary" type="submit"
						style="margin-top: 10px; margin-left: 1052px; background-color: #696969; border-color: #696969;">등록</button>
	</form>
</body>
</html>