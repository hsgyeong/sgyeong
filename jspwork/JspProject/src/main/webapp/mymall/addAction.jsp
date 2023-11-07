<%@page import="model.mymall.MallDao"%>
<%@page import="model.mymall.MallDto"%>
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
	//한글엔코딩
	request.setCharacterEncoding("utf-8");

	String sangpum=request.getParameter("sangpum"); //웹 요청으로부터 "sangpum"이라는 이름의 파라미터 값을 가져와서 sangpum 변수에 저장
	String photo=request.getParameter("photo");  //웹 요청으로부터 "photo"라는 이름의 파라미터 값을 가져와서 photo 변수에 저장
	/* int price=Integer.parseInt(request.getParameter("price")) */
	String price=request.getParameter("price"); //웹 요청으로부터 "price"라는 이름의 파라미터 값을 가져와서 price 변수에 저장
	String ipgoday=request.getParameter("ipgoday");  //String ipgoday=request.getParameter("ipgoday");: 웹 요청으로부터 "ipgoday"라는 이름의 파라미터 값을 가져와서 ipgoday 변수에 저장
	
	MallDto dto = new MallDto();  //MallDto 클래스의 새로운 인스턴스인 dto를 생성. 데이터베이스에 삽입할 데이터를 담기 위한 데이터 전송 객체(DTO)
	
	dto.setSangpum(sangpum);  //MallDto 객체의 setSangpum 메서드를 사용하여 sangpum 변수의 값을 dto 객체의 제품 이름 속성에 설정
	dto.setPhoto(photo);  //MallDto 객체의 setPhoto 메서드를 사용하여 photo 변수의 값을 dto 객체의 제품 사진 속성에 설정
	dto.setPrice(price);  //MallDto 객체의 setPrice 메서드를 사용하여 price 변수의 값을 dto 객체의 제품 가격 속성에 설정
	dto.setIpgoday(ipgoday);  //MallDto 객체의 setIpgoday 메서드를 사용하여 ipgoday 변수의 값을 dto 객체의 제품 추가 일자 속성에 설정
	
	MallDao dao=new MallDao();  //클래스의 새로운 인스턴스를 생성. . 이 객체는 데이터베이스 작업을 처리하는 데이터 액세스 객체(DAO)
	dao.insertMyMall(dto);  // 생성한 MallDto 객체를 사용하여 데이터베이스에 제품 정보를 삽입하기 위해 MallDao 객체의 insertMyMall 메서드를 호출
	
	response.sendRedirect("list.jsp");  //데이터베이스에 제품 정보가 성공적으로 삽입된 후, "list.jsp" 페이지로 사용자를 리디렉션

%>
</body>
</html>