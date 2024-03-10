<%@page import="kiosk.kioskDto"%>
<%@page import="kiosk.kioskDao"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%
kioskDao dao = new kioskDao();
request.setCharacterEncoding("utf-8");
String name = request.getParameter("name");
String image = request.getParameter("image");
String price = request.getParameter("price");
String stock = request.getParameter("stock");

kioskDto dto = new kioskDto();

dto.setName(name);
dto.setImage(image);
dto.setPrice(price);
dto.setStock(stock);

dao.insertMenu(dto);
%>
