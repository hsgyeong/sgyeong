<%@page import="db.simpleguest.SimpleGuestDao"%>
<%@page import="db.simpleguest.SimpleGuestDto"%>
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
<%-- <% 
	request.setCharacterEncoding("utf-8");

	String nick=request.getParameter("nick");
	String pass=request.getParameter("pass");
	String image=request.getParameter("image");
	String story=request.getParameter("story");
	
	SimpleGuestDto dto=new SimpleGuestDto();
	
	dto.setNick(nick);
	dto.setPass(pass);
	dto.setImage(image);	
	dto.setStory(story);
	
	SimpleGuestDao dao=new SimpleGuestDao();
	dao.insertSimpleGuest(dto);
	
	response.sendRedirect("guestList.jsp");
%> --%>

<!-- 자바빈즈로 변경하려면?  
useBean은 new로 객체를 생성하는 것과 같다-->

<% 
	request.setCharacterEncoding("utf-8");
%>

<!--생성하는 역할 -->
<jsp:useBean id="dao" class="db.simpleguest.SimpleGuestDao"/>
<jsp:useBean id="dto" class="db.simpleguest.SimpleGuestDto"/>

								<!--참조변수명으로 부름 -->
<jsp:setProperty property="*" name="dto"/>

<%

//db에 insert 호출
dao.insertSimpleGuest(dto);

//목록으로 이동
response.sendRedirect("guestList.jsp");
%>
</body>
</html>