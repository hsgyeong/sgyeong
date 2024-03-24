<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
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
 #showimg{
 	border: 1px solid gray;
 	width:180px;
 	height:160px;
 }
</style>
<script type="text/javascript">
$(function(){
	 $("#btnphoto").click(function(){
		 
		 $("#myphoto").trigger("click");
		 
	 });
	       //사진 미리보기
	  $("#myphoto").on("change", function(event) {

	       var file = event.target.files[0];

	       var reader = new FileReader();
	       reader.onload = function(e) {

	       $("#showimg").attr("src", e.target.result);
	       }

	        reader.readAsDataURL(file);
	       
		});
	       
	       //아이디 입력시 아이디 체크
	    $("#btnidcheck").click(function(){
	
	    	var id = $("#id").val();
	    	   
	   		//alert(id);
	    	   
	    	$.ajax({
	    		   type:"get",
	    		   url:"idcheck", //중간경로 빼야함
	    		   dataType:"json", 
	    		   data:{"id":id}, //data가 컨트롤러에서 넘어가는 값
	    		   success: function(res){
	    			   
	    			   if(res.count==0){
	    				   
	    				   $("span.idsuccess").text("사용 가능한 아이디입니다.");
	    				   
	    			   }else{
	    				   
	    				   $("span.idsuccess").text("사용중인 아이디입니다.");
	    			   }
	    			   
	    		   }
	    		   
	    	});
	    });
	       
	       //2번째 비밀번호 입력시 체크
	       
	    $("#pass2").keyup(function(){
	    	var p1=$("#pass").val();
	    	var p2=$(this).val();
	    	   
	    	if(p1==p2){
	    		   $("span.passsuccess").text("비밀번호가 일치합니다.");
	    	}else{
	    		   $("span.passsuccess").text("비밀번호가 일치하지 않습니다.");
	    	}
	    });
	       
	 });
	 
	function check(){
	   
	   //사진
	   if($("#myphoto").val()==''){
			alert("사진을 넣어주세요");
			return false;
		}
	   
	   //id
	   if($("span.idsuccess").text()!='사용 가능한 아이디입니다.'){
		   alert('아이디 중복체크를 해주세요');
		   return false;
		}
	   
	   //비밀번호
	   if($("span.passsuccess").text()!='비밀번호가 일치합니다.'){
		   alert('비밀번호가 다릅니다');
		   return false;
		}
	   
 	}
	
</script>
</head>
<body>
	<div style="margin: 100px 100px;">
		<form action="insert" method="post" enctype="multipart/form-data" onsubmit="return check()">
			<table class="table table-bordered" style="width: 400px;">
				<caption align="top">
					<b>회원가입</b>
				</caption>
				<tr>
					<td rowspan="4" align="center" style="width:200px;">
						<input type="file" id="myphoto" name="myphoto" style="display: none;">
						<button type="button" id="btnphoto" class="btn btn-secondary"">사진선택</button>
						<br>
						<img id="showimg">
					</td>
					<td>		
						<div class="d-inline-flex">													<!-- ajax로 id있는지 었는지 체크하기 위해 아이디 만들어줌  -->
							<input type="text" name="id" class="form-control" placeholder="아이디" id="id" style="width:120px;">&nbsp;&nbsp;
							<button type="button" class="btn btn-danger" id="btnidcheck">중복체크</button> &nbsp;&nbsp;
							<span class="idsuccess" style="width:230px; color:green;"></span>
						</div>
					</td>
				</tr>
				<tr>
					<td>
						<div class="d-inline-flex">
							<input type="password" name="pass" class="form-control" style="width:120px;"
							id="pass" placeholder="비밀번호" maxlength="4" required="required">&nbsp;
							<input type="password" name="pass2" class="form-control" style="width:120px;"
							id="pass2" placeholder="비밀번호" maxlength="4" required="required">	
							<span class="passsuccess" style="width:240px; color:green;"></span>
						</div>
					</td>
				</tr>
				<tr>
					<td>
						<input type="text" name="name" class="form-control" placeholder="이름" required="required"
						style="width:150px">
					</td>
				</tr>
				<tr>
					<td>
						<input type="text" name="hp" class="form-control" placeholder="연락처" required="required">
					</td>
				</tr>
				<tr>
					<td  colspan="2">
						<input type="text" name="email" class="form-control" placeholder="이메일" required="required">
					</td>
				</tr>	
				<tr>
					<td  colspan="2">
						<input type="text" name="addr" class="form-control" placeholder="주소입력" required="required">
					</td>
				</tr>
				<tr>
					<td colspan="2" align="center">
						<button type="submit" class="btn btn-outline-info" style="width:120px;">회원가입</button>&nbsp;
						<button type="button" class="btn btn-outline-success" style="width:120px;"
						onclick="location.href='../login/main'">로그인</button>
					</td>
				</tr>
			</table>
		</form>
	</div>
</body>
</html>