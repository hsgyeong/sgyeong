<%@page import="idx.model.IdxDao"%>
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
</head>
<body>
<% 
	String id=request.getParameter("id");
	String pass=request.getParameter("pass");
	String save=request.getParameter("savechk");
	
	//아이디와 비번이 맞는지 확인
	IdxDao db=new IdxDao();
	
	boolean flag=db.isLogin(id, pass);
	
	//맞으면 세션 지정후 로그인 메인으로 이동
	if(flag)
	{
		//로그인중인지 알 수 있는 세션 저장
		session.setAttribute("loginok","yes");
		//아이디 세션 저장
		session.setAttribute("idok", id); //request로 받은 id값 넣기
		//체크값 세션 저장 ..체크하면 값은 on, 체크하지 않으면 값은 null
		session.setAttribute("saveok", save);
		//세션 유지시간
		session.setMaxInactiveInterval(60*60*8);  //8시간동안 유지(생략시 30분)
		
		//로그인 메인으로 이동
		response.sendRedirect("loginMain.jsp");
	}else{%>
	<script type="text/javascript">
	alert("아이디와 비밀번호가 맞지 않습니다");
	history.back();
	</script>
		<%}
	
%>
</body>
</html>