<%@page import="kiosk.kioskDao"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<% 
	kioskDao dao=new kioskDao();
	String num=request.getParameter("num");
	dao.deleteKiosk(num);
%>