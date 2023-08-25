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
<link rel="stylesheet"
	href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.10.5/font/bootstrap-icons.css">
<script src="https://code.jquery.com/jquery-3.7.0.js"></script>
<script>
	$(function() {

		$("i.camera").click(function() {
			$("#photo").trigger("click"); //이벤트 강제 호출

		})
	})
	
	function readURL(input) {
       if (input.files && input.files[0]) {
           var reader = new FileReader(); //파일을 읽기 위한 FileReader객체 생성
           reader.onload = function (e) {
           //파일 읽어들이기를 성공했을때 호출되는 이벤트 핸들러
               //이미지 Tag의 SRC속성에 읽어들인 File내용을 지정 
               $('#showimg').attr('src', e.target.result);
           }
           //File내용을 읽어 dataURL형식의 문자열로 저장 
           reader.readAsDataURL(input.files[0]);
       }
   }//readURL()--
</script>

<title>Insert title here</title>
</head>
<body>
	<!--이미지 미리보기  -->

	<img alt="" src="" id="showimg"
		style="position: absolute; left: 800px; top: 100px; max-width: 200px;">
		
	<form action="guest/addproc.jsp" method="post"
		enctype="multipart/form-data">
		<table class="table table-bordered" style="width: 600px;">
					<caption align="top"><b>방명록 등록</b>
				&nbsp;&nbsp;<i class="bi bi-camera-fill fs-3 camera"></i> <input
					type="file" name="photo" id="photo" style="visibility: hidden";
					onchange="readURL(this)";>
			</caption>
			<tr height="100">
			
				<td width="520">
				<textarea style="width: 500px; height: 100px"
						; name="content"; required="required" class="form-control"></textarea>
				</td>
				<td>
					<button type="submit" class="btn btn-outline-info"
						style="width: 100px;">등록</button>
				</td>
			
			</tr>
		</table>
	</form>
</body>
</html>