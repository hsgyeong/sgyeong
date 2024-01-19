<%@page import="org.json.simple.JSONObject"%>
<%@page import="data.dao.GuestTourSpotReviewDao"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<% 
	//num
	String num=request.getParameter("num");

	//dao
	GuestTourSpotReviewDao dao=new GuestTourSpotReviewDao();
	
	//num에 해당하는 likes 증가
	dao.updateLikes(num);
	
	//증가된 likes값을 json형식으로 변환
	int likes=dao.getData(num).getLikes();
	
	JSONObject ob=new JSONObject();
	ob.put("likes",likes);
%>
<%=ob.toString() %>