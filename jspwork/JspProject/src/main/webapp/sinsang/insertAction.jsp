<%@page import="model.sinsang.SinsangDao"%>
<%@page import="model.sinsang.SinsangDto"%>
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
	String name=request.getParameter("name");  //name과 addr 파라미터 값을 가져와 각각 name, addr 변수에 저장
	String addr=request.getParameter("addr");  //입력한 이름과 주소 정보가 변수들에 할당
	
	//입력데이터를 bto로 묶어서 
	SinsangDto dto=new SinsangDto();  //SinsangDto 클래스의 새로운 인스턴스 생성. 이 인스턴스는 사용자가 인력한 이름과 주소 정보를 담을 객체
	
	dto.setName(name);   //dto  객체의 setName과 setAddr 메서드를 사용하여 이름과 주소 정보 설정
 	dto.setAddr(addr);
	
	//insert 메소드 전달
	SinsangDao dao=new SinsangDao();    //SinsangDao 클래스의 새로운 인스턴스 생성
	dao.insertSinsang(dto);   //이전에 설정한 dto 객체를 이용하여 데이터베이스에 새로운 레코드를 추가하는 insertSinsang 메서드 호출
	
	//출력 jsp로 이동 url이 바뀜
	response.sendRedirect("list.jsp");  //데이터를 추가한 후 사용자를 "list.jsp"페이지로 리디렉션
	
%>
</body>
</html>