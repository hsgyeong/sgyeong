<%@page import="member.model.MemberDto"%>
<%@page import="member.model.MemberDao"%>
<%@page import="com.oreilly.servlet.multipart.DefaultFileRenamePolicy"%>
<%@page import="com.oreilly.servlet.MultipartRequest"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
 <link  href="https://fonts.googleapis.com/css2?family=Cute+Font&family=Dongle:wght@300&family=Gamja+Flower&family=Gowun+Batang&family=Gowun+Dodum&family=Hi+Melody&family=Nanum+Gothic&family=Nanum+Gothic+Coding&family=Nanum+Pen+Script&family=Poor+Story&family=Sunflower:wght@300&display=swap"
 		rel="stylesheet">
  <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.6.4/jquery.min.js"></script>
  <script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/js/bootstrap.min.js"></script>
<script src="https://code.jquery.com/jquery-3.7.0.js"></script>
<title>Insert title here</title>
</head>
<body>
<% 
	String realPath=getServletContext().getRealPath("/upload");
	int uploadSize=1024*1024*3;
	
	MultipartRequest multi=null;
	
	multi=new MultipartRequest(request,realPath,uploadSize,"utf-8",
			new DefaultFileRenamePolicy());
	//dao선언
	MemberDao dao=new MemberDao();
	//dto
	MemberDto dto=new MemberDto();
	
	dto.setNum(multi.getParameter("num"));
	dto.setId(multi.getParameter("id"));
	dto.setPass(multi.getParameter("pass"));
	dto.setName(multi.getParameter("name"));
	dto.setHp(multi.getParameter("hp"));
	
	//dto.setImage(multi.getFilesystemName("uploadImage"));
	String photo=multi.getFilesystemName("uploadImage");
	
	
	if(photo==null)
	{
		String p=dao.getData(dto.getNum()).getImage();  //사진선택안한경우
		dto.setImage(p);
	}
		else
		dto.setImage("upload/"+photo); //사진선택한경우
	//db에 update
	dao.updateMember(dto);
	
	//성공후 이동
	response.sendRedirect("../member/memberList.jsp");
	
%>
</body>
</html>