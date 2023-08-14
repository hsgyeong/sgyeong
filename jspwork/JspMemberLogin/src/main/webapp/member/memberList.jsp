<%@page import="java.text.SimpleDateFormat"%>
<%@page import="member.model.MemberDto"%>
<%@page import="java.util.ArrayList"%>
<%@page import="member.model.MemberDao"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<link
	href="https://fonts.googleapis.com/css2?family=Cute+Font&family=Dongle:wght@300&family=Gamja+Flower&family=Gowun+Batang&family=Gowun+Dodum&family=Hi+Melody&family=Nanum+Gothic&family=Nanum+Gothic+Coding&family=Nanum+Pen+Script&family=Poor+Story&family=Sunflower:wght@300&display=swap"
	rel="stylesheet">
<link
	href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/css/bootstrap.min.css"
	rel="stylesheet">
<script src="https://code.jquery.com/jquery-3.7.0.js"></script>
<title>Insert title here</title>
</head>
<% 
	MemberDao dao = new MemberDao();
	ArrayList<MemberDto> list=dao.getAllMember();
%>

<body>
	<table class="table table-borderd" style="width: 1000px; border: 1px solid gray;">

		<tr>
			<th>번호</th>
			<th>아이디</th>
			<th>회원명</th>
			<th>핸드폰</th>
			<th>가입일</th>
			<th>편집</th>
		</tr>
		<%
if(list.size()==0){
%>
		<tr>
			<td colspan="5" align="center">
				<h5>등록된 정보가 없습니다</h5>
			</td>
		</tr>
		<%}else{
	
	SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd");
	
	for (int i=0;i<list.size();i++)
	{
		MemberDto dto = list.get(i);
	%>

		<tr>
			<td><%=i+1 %></td>
			<td><%=dto.getId() %></td>
			<td><%=dto.getName() %></td>
			<td><%=dto.getHp() %></td>
			<td><%=dto.getGaip() %></td>
			<td><button type="button" class="btn btn-info btn-sm"
					onclick="location.href=''">수정</button>
				<button type="button" class="btn btn-warning btn-sm"
					onclick="location.href=''">삭제</button>
			</td>
	</tr>
	<%}
}

%>
	</table>
</body>
</html>