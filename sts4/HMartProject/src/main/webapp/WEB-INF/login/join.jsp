<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/css/bootstrap.min.css"
	rel="stylesheet">
<link href="https://fonts.googleapis.com/css2?family=Dongle:wght@300&family=Gaegu:wght@300&family=Nanum+Pen+Script&family=Sunflower:wght@300&display=swap"
	rel="stylesheet">
<script src="https://code.jquery.com/jquery-3.7.0.js"></script>
<title>Insert title here</title>
<style type="text/css">
.member-join {
	font-size: 25px;
	font-weight: bold;
	text-align: center;
	margin-bottom: 100px;
}

.join-form {
	margin-top: 100px;
	width: 100%;
	height: 800px;
	display: flex;
	flex-direction: column;
	align-items: center;
	justify-content: center;
}

.join {
	align-content: center;
	justify-content: center;
	align-items: center;
}

#id {
	margin: auto;
	margin-left: 150px;
	width: 340px;
}

.inputid {
	display: flex;
    flex-direction: column;
    margin-left: 100px;
    margin-bottom: 80px;
}

.inputname {
	display: flex;
    flex-direction: column;
    margin-left: -150px;
    margin-bottom: 80px;
}

.inputpassword {
	display: flex;
	margin-left:-160px;
	flex-direction: column;
	margin-bottom: 80px;
}

.id {
	margin: auto;
	display: flex;
	width: 800px;
}

.password {
	margin: auto;
	display: flex;
}

.idbox {
	display: flex;
}

#idcheck {
	width: 200px;
	margin-left:10px;
}

.validpass {
	margin-left:80px;
}

#pass1, #pass2 {
	margin: auto; 
	margin-left: 135px;
	width: 340px;
	flex:1;
}

#email, .inputemail, inputaddr {
	flex:1;
}

.passwordcheck {
	display: flex;
    flex-direction: column;
    margin-left:-160px;
    margin-bottom: 80px;
  
}

.passchkbox {
	display: flex;
}

.addrbox {
	display : flex;
	margin-left: -140px;
}

#pass2 {
	margin-left:100px;
}

#email {
	margin-left:160px;
	width: 340px;
}

.passwordchk {
	margin: auto;
	display: flex;

}

.namebox {
	margin: auto;
	display: flex;
}

#name {
	margin: auto;
	margin-left: 180px;
	width: 340px;
}

#addr {
	width: 340px;
	margin-left: 170px;
}

.emailbox {
	display: flex;
	float: right;
}

.inputemail {
	margin-left:-150px;
	margin-bottom: 50px;
}

.inputaddr {
	margin-bottom: 100px;
}

#successbtn {
	margin: auto;
	width: 340px;
	height: 60px;
	align-items: center;
	justify-content: center;
	display: flex;
	margin-left: auto;
	margin-right: auto;
}

</style>
</head>
<body>
	<c:set var="root" value="<%=request.getContextPath()%>" />
	<form action="join" id="joinform">
		<div class="join">
			<div class="join-form">
				<div class="member-join">회원가입</div>
				<hr>
				
				<div class="inputid">
				<div class="idbox">
					<span class="id">아이디
							<input type="text" class="form-control" name="id" id="id">
							<button type="button" class="btn" id="idcheck">중복확인</button>
						</div>
					</span>
					<br>
				<span class="validid"></span>
				</div>
			    
				<div class="inputpassword">
					<span class="password">비밀번호
						<div class="passwordbox">
							<input type="text" class="form-control" name="pass1" id="pass1">
						</div>
					</span>
						<br>
				<span class="validpass"></span>
				</div>
				
				<div class="passwordcheck">
					<span class="passwordchk">비밀번호 확인
						<div class="passchkbox">
							<input type="text" class="form-control passchk" name="pass2" id="pass2">
						</div>
				   </span>
				   <br>
						<span class="passok"></span>
				</div>
				
				<div class="inputname">
					<span class="namebox">이름
						<div class="name">
							<input type="text" class="form-control" name="name" id="name">
						</div>
					</span>
				</div>
			
				<div class="inputemail">
					<span class="emailbox">이메일
						<div class="email">
							<input type="text" class="form-control" name="email" id="email">
						</div>
					</span>
				</div>
				<div class="inputaddr">
					<span class="addrbox">주소
						<div class="addr">
							<button type="button" class="btn btn-ouline" name="addr" id="addr">주소 검색</button>
						</div>
					</span>
				</div>
				</div>
				<button type="submit" class="btn btn success" style="background-color:#7DAB12; color: white;" id="successbtn">가입하기</button>
			</div>
	</form>
</body>
<script>
	$(function(){
		
		$("#id").keyup(function(){
			
			function ValidId(id){
				var idvalid = /^[a-z0-9]{6,12}$/;
				return idvalid.test(id);
			}
			
			var id = $(this).val();
			//alert(id);
			
			var validId = ValidId(id);
			if(validId){
				$("span.validid").text("");
			}
				else
				{	
				$("span.validid").text("6~12자의 영문 소문자와 숫자만 가능합니다.").css("color","red");
				}
			})
			
			
		$("#pass1").keyup(function(){
			
			var pass1 = $(this).val();
			//alert(pass1);
			
			var validPass = ValidPass(pass1);
			if(validPass){
				$("span.validpass").text("");
			}else {
				$("span.validpass").text("비밀번호는 8~12자리의 영소문자 또는 대문자, 숫자, 특수문자를 포함해야합니다.").css("color","red");
			}
				
		})
		
		function ValidPass(pass1){
			var passvalid = /^(?=.*[a-zA-Z])(?=.*\d)(?=.*[@$!%*?&])[A-Za-z\d@$!%*?&]{8,12}$/;
			return passvalid.test(pass1);
		}
		
		$("#pass2").keyup(function(){
			
			var pass1 = $("#pass1").val();
			var pass2 = $("#pass2").val();
			
			var passval = $("span.validpass").text("");
			
			if(pass1==pass2 && ValidPass(pass1)){
				$("span.passok").text("비밀번호가 일치합니다.").css("color","green");
			}else
			{
				$("span.passok").text("비밀번호가 일치하지 않습니다.").css("color","red");
				$("#pass2").focus();
			}
		})
		
		$("#joinform").submit(function(){
			
			var pass1 = $("#pass1").val();
			var pass2 = $("#pass2").val();
			
			if(!ValidPass(pass1))
				{
					alert("유효하지 않은 비밀번호입니다. 다시 입력해주세요.");
					e.preventDefault();
					return;
				}
			
			if(pass1 !== pass2){
					alert("비밀번호가 일치하지 않습니다. 다시 확인해주세요.");
					e.preventDefault();
					return;
			}
		})
		})
		
		
</script>
</html>