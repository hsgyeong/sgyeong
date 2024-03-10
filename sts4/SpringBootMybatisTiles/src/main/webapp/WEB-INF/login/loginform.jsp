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
<!--보안 로그인 save 만들어오기  -->
<style type="text/css">
.form{
margin-left: 300px;
position:relative;
border: 1px solid gray;
width:400px;
height:400px;
align-items: center;
border-radius: 20px;
margin-top: 20px;

}

#log{
margin-left: 100px;
margin-top: 50px;
}
#bt{
margin-left: 100px;
}
</style>
</head>
<% 
String myid = (String) session.getAttribute("myid");
String saveok = (String) session.getAttribute("saveok");

boolean save = true;

if(saveok==null)
{
	myid = "";
	save = false;
}else{
	save = true;
}
%>
<body>
<div style="margin: 100px 300px;">
		<form action="loginprocess" method="post" >
			<table class="table table-bordered" style="width: 300px;">
				<caption align="top"><b>회원 로그인</b></caption>
				<tr>
					<th style="width: 120px;background-color: #ddd">아이디</th>
					<td>
						<input type="text" name="id" class="form-control"
						required="required" autofocus="autofocus"
						style="width: 150px;"
						placeholder="아이디" value="${sessionScope.saveok==null?"":sessionScope.myid }">
					</td>
				</tr>
				<tr>
					<th style="width: 120px;background-color: #ddd">비밀번호</th>
					<td>
						<input type="password" name="pass" class="form-control"
						required="required" style="width: 150px;"
						placeholder="비밀번호">
					</td>
				</tr>
				<tr>
					<td colspan="2" align="center">
						<input type="checkbox" name="cbsave" ${sessionScope.saveok==null?"":"checked"} >아이디저장
												
						<button type="submit" class="btn btn-info"
						style="width: 120px;">회원로그인</button>
					</td>
				</tr>
			</table>
		</form>
	</div>


</body>
</html>