<%@page import="kiosk.kioskDto"%>
<%@page import="kiosk.kioskDao"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<% 
	
kioskDao dao=new kioskDao();

request.setCharacterEncoding("utf-8");
String num=request.getParameter("num");
String price=request.getParameter("price");
String stock=request.getParameter("stock");

kioskDto dto=new kioskDto();
dto.setNum(num);
dto.setPrice(price);
dto.setStock(stock);

dao.uadateKiosk(dto);

%>