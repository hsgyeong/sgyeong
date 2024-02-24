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
<link href="https://fonts.googleapis.com/css2?family=Gugi&display=swap" rel="stylesheet">
<script src="https://code.jquery.com/jquery-3.7.0.js"></script>
<script src="//t1.daumcdn.net/mapjsapi/bundle/postcode/prod/postcode.v2.js"></script>
<title>Insert title here</title>
<style type="text/css">
.member-join {
	font-size: 22px;
	font-weight: bold;
	text-align: center;
	margin-top: 25px;
	margin-bottom: 10px;
}

.join-form {
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
    margin-bottom: 50px;
}

.inputname {
	display: flex;
    flex-direction: column;
    margin-left: -150px;
    margin-bottom: 50px;
}

.inputpassword {
	display: flex;
	margin-left:-160px;
	flex-direction: column;
	margin-bottom: 50px;
}

.id {
	margin: auto;
	display: flex;
	width: 800px;
	margin-bottom: 5px;
}

.idbox {
	display: flex;
}

#idcheck {
	width: 200px;
	margin-left:10px;
}

.validid, .passok, .validpass  {
	font-size:12px;
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
    margin-bottom: 50px;
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
	margin-left:150px;
	width: 340px;
}

.password, .passwordchk, .namebox {
	margin: auto;
	display: flex;

}

#name {
	margin: auto;
	margin-left: 158px;
	width: 340px;
}

#addr {
	width: 340px;
	margin-left: 160px;
	margin-bottom: 50px;
}

#postcode {
	width: 120px;
}

.emailbox {
	display: flex;
	float: right;
}

.inputemail {
	margin-left:-150px;
	margin-bottom: 50px;
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

#joinform {
	margin-top: 270px;
}

.input	{
	width: 340px;
}

</style>
</head>
<body>
	<c:set var="root" value="<%=request.getContextPath()%>" />
	<form action="join-success" method="post" id="joinform">
		<div class="join">
			<div class="join-form">
				<div class="member-join">회원가입</div>
				<hr>
				
				<div class="inputid">
				<div class="idbox">
					<span class="id">아이디
							<input type="text" class="form-control" name="id" id="id">
							<button type="button" class="btn" id="idcheck">중복확인</button>
					</span>
				</div>
					
				<span class="validid"></span>
				</div>
			    
				<div class="inputpassword">
					<span class="password">비밀번호
						<div class="passwordbox">
							<input type="text" class="form-control" name="password" id="pass1">
						</div>
					</span>
						
				<span class="validpass"></span>
				</div>
				
				<div class="passwordcheck">
					<span class="passwordchk">비밀번호 확인
						<div class="passchkbox">
							<input type="text" class="form-control passchk" name="pass2" id="pass2">
						</div>
				   </span>
				   
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
							<button type="button" class="btn btn-ouline" name="addr" id="addr"
							onclick="DaumPostCode()">주소 검색</button>
						</div>
					</span>
				</div>
                <div style="display:flex;">			
				<input type="text" id="postcode" name="postcode" class="form-control input postcode" placeholder="우편번호"
				style="height:38px;;">
				<input type="text" id="addr" name="addr" class="form-control input addr" placeholder="주소">
				</div>
				<br>
				<input type="text" id="detailaddr" name="detailaddr" class="form-control input detailaddr" placeholder="상세주소"><br>
 				
				</div>
				<button type="submit" class="btn btn success" style="background-color:#7DAB12; color: white;" id="successbtn"
				onclick="location.href='/'">가입하기</button>
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
			
		$("#idcheck").click(function(){
			
			var id = $("#id").val();
			
			alert(id);
			
			$.ajax({
				
				type:"get",
				dataType:"json",
				url:"idcheck",
				data:{"id":id},
				success:function(res){
					if(res.count==0){
						alert("사용 가능한 아이디입니다.");
						$("span.validid").text("사용 가능한 아이디입니다.").css("color","green");
					}else
					{
						alert("이미 사용중인 아이디입니다. 다시 입력해주세요.");
						$("span.validid").text("이미 사용중인 아이디입니다. 다시 입력해주세요.").css("color","red");
					}
				}
			})	
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
			
		//	var passval = $("span.validpass").text("");
			
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
	
		
		function DaumPostCode(){
			
			new daum.PostCode({
				complete: function(data){
					
					var addr = '';
					
					if(data.userSelectedType === 'street'){
						addr = data.streetaddr;
					}else{
						addr = data.cadastraladdr;
					}
					
					if(data.userSelectedType === 'street'){
						
						if(data.legalName !== '' && /[동/로/가]$/g.test(data.legalName))
							{
								extraAddr += data.legalname;
							}
						
						if(data.buildingName !== '' && data.apartment === 'Y'){
								extraAddr += '('+extraAddr+')';
							}
						
						document.getElementById('extraAddr').value = extraAddr;
					}
					else{
						document.getElementById('extraAddr').value = '';
					}
				
					document.getElementById('postcode').value = data.zonecode;
					document.getElementById('address').value = addr;
					
					document.getElementById('detailaddr').focuse();
				}
			}).open();
		
		}
		
</script>
</html>