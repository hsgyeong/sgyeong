<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/css/bootstrap.min.css" rel="stylesheet">
<link href="https://fonts.googleapis.com/css2?family=Dongle:wght@300&family=Gaegu:wght@300&family=Nanum+Pen+Script&family=Sunflower:wght@300&display=swap" rel="stylesheet">
<script src="https://code.jquery.com/jquery-3.7.0.js"></script>
<title>Insert title here</title>
</head>
<body>
<c:set var="root" value="<%=request.getContextPath() %>"/>
	<!--로그인 안하면 기본사진, 로그인하면 자기사진으로 변경 -->
	<c:if test="${sessionScope.loginok==null}">
	<img alt="" src="${root }/image/11.png" style="width:230px; height:200px; left:50px;">
	</c:if>
	<c:if test="${sessionScope.loginok!=null}">
	<img alt="" src="${root }/membersave/${sessionScope.loginphoto}" style="width:230px; height:200px; left:50px;">
	</c:if>
	
	<br>

	
</body>
</html>