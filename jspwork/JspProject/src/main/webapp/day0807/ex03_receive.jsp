<%@page import="org.json.simple.JSONObject"%>
<%@page import="netscape.javascript.JSObject"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<% 
//front에서 보낸 데이터 읽어오기
String photono=request.getParameter("photono");
String photoname=request.getParameter("photoname");
String like1=request.getParameter("like1");
String like2=request.getParameter("like2");
String like3=request.getParameter("like3");

//총점==>String을 int로 변환
int tot=Integer.parseInt(like1)+Integer.parseInt(like2)+Integer.parseInt(like3);
//평균
double avg=tot/3.0;

//front 형태로 만들어서 다시 front로 보내기(Json)
JSONObject ob=new JSONObject();

ob.put("photo", "../Food/"+photono+".jpg");
ob.put("food", photoname);
ob.put("tot", tot);
ob.put("avg",avg);

%>

<%=ob.toString() %>