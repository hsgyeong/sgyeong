<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
 <link  href="https://fonts.googleapis.com/css2?family=Cute+Font&family=Dongle:wght@300&family=Gamja+Flower&family=Gowun+Batang&family=Gowun+Dodum&family=Hi+Melody&family=Nanum+Gothic&family=Nanum+Gothic+Coding&family=Nanum+Pen+Script&family=Poor+Story&family=Sunflower:wght@300&display=swap"
 		rel="stylesheet">
 <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/css/bootstrap.min.css" rel="stylesheet">
    <script src="https://code.jquery.com/jquery-3.7.0.js"></script>
<title>Insert title here</title>
<style type="text/css">
div.loginform{
	width:500px;
	margin-top: 100px;
	margin-left: 200px;
}
</style>
</head>
<body>
<% 
	//세션으로부터 아이디 세이브 체크값 얻기
	String myid=(String)session.getAttribute("idok");
	String saveid=(String)session.getAttribute("saveok");
	
	boolean save=true;  //null조건 만들기 위해 true 먼저 줌
	
	if(saveid==null)
	{
		myid="";  //아이디 저장을 체크하지 않을 경우 아이디 없앤다
		save=false;  //체크하지 않을 경우 false, 그 이외에는 초기값이 true니까 true가 된다
	}
%>
<div class="loginform">
<form action="loginAction.jsp" method="post">
<input type="text" name="id" style="width:200px;"
class="form-control" placeholder="아이디" required="required"
value="<%=myid %>"><br>
<input type="password" name="pass" style="width:200px;"
class="form-control" placeholder="비밀번호" required="required"><br>

<button type="submit" class="btn btn-success sm" style="width:200px; height:40px;">로그인</button>
<br><br>
<input type="checkbox" name="savechk" <%=save?"checked":"" %>>아이디저장
</form>
</div>
</body>
</html>