<%@page import="model.sinsang.SinsangDto"%>
<%@page import="java.util.Vector"%>
<%@page import="model.sinsang.SinsangDao"%>
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
<%
SinsangDao dao=new SinsangDao();
Vector<SinsangDto> list=dao.getAllDatas();

%>
<body>
<button type="button" class="btn btn-info"
onclick="location.href='insertForm.jsp'">데이터추가</button>
<br>
<table class="table table-bordered" style="width: 700px;">
<tr class="table-success" style="text-align: center;">
<th width="60">번호</th>
<th width="100">이름</th>
<th width="250">주소</th>
<th width="150">날짜</th>
<th width="150">편집</th>
</tr>

<%
for(int i=0;i<list.size();i++)
{
	SinsangDto dto=list.get(i);
	%>
	<tr>
	<td><%=i+1 %></td>
	<td><%=dto.getName() %></td>
	<td><%=dto.getAddr() %></td>
	<td><%=dto.getSdate() %></td>
	<td><button type="button" class="btn btn-info btn-sm"
	onclick="location.href='updateForm.jsp?num=<%=dto.getNum()%>'">수정</button>
	<button type="button" class="btn btn-danger btn-sm"
	onclick="location.href='delete.jsp?num=<%=dto.getNum()%>'">삭제</button></td>
	<!--'delete.jsp?num=dto.getNum()': 이동하고자 하는 새로운 URL을 나타냄. delete.jsp 페이지로 이동하되, URL에 파라미터 num을 추가하여 
	삭제할 데이터의 식별 번호(dto.getNum())를 전달함. dto.getNum()은 서버측 코드로, dto 객체의 getNum() 메서드를 호출하여 해당 데이터의 식별 번호를 가져오는 것을 의미  -->
	</tr>
<%}
%>
</body>
</html>