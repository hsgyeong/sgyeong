<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link
	href="https://fonts.googleapis.com/css2?family=Cute+Font&family=Dongle:wght@300&family=Gamja+Flower&family=Gowun+Batang&family=Gowun+Dodum&family=Hi+Melody&family=Nanum+Gothic&family=Nanum+Gothic+Coding&family=Nanum+Pen+Script&family=Poor+Story&family=Sunflower:wght@300&display=swap"
	rel="stylesheet">
<link
	href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/css/bootstrap.min.css"
	rel="stylesheet">
<script src="https://code.jquery.com/jquery-3.7.0.js"></script>
</head>
<style>
.loginform{
	 margin-left:650px;
	 margin-top:200px;
}
</style>
<body>
<% 
	String myid=(String)session.getAttribute("idok");
	String saveid=(String)session.getAttribute("saveok");
	
	boolean save=true;
	
	if(saveid==null)
	{
		myid="";
		save=false;
	}
%>
<div class="loginform">
<form action="loginAction.jsp" method="post">
<input type="text" name="id" class="form-control" placeholder="아이디" required="required"
value="<%=myid %>" style="width:200px;"><br>
<input type="password" name="pass" class="form-control" placeholder="비밀번호" required="required"
required="required" style="width:200px"><br><br>
<button type="submit" class="btn btn-success">로그인</button>
<button type="button" class="btn btn-info">회원가입</button>
<input type="checkbox" name="savechk" <%=save?"checked":"" %>>아이디저장
</form>
</div>


</body>
</html>