<%@page import="java.text.SimpleDateFormat"%>
<%@page import="java.util.List"%>
<%@page import="data.dao.MemberDao"%>
<%@page import="data.dto.MemberDto"%>
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
<script type="text/javascript">
function delfunc(num)
{var yes=confirm("삭제하시겠습니까?");
	if(yes)
		{
		location.href='member/memberdelete.jsp?num='+num;
		}
	}
</script>
</head>
<body>
<% 
MemberDao dao = new MemberDao();
List<MemberDto> list = dao.getAllMembers();
SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd");
int no=1;
%>
</body>
<table class="table table-bordered"; style=width:1000px;">
<caption align="top"><b>전체회원목록</b></caption>
<tr style="background-color: #f0f8ff; text-align: center;">
<th width="80">번호</th>
<th width="100">회원명</th>
<th width="120">아이디</th>
<th width="350">주소</th>
<th width="270">이메일</th>
<th width="200">가입일</th>
<th width="150">삭제</th>
</tr>
<% 
for(MemberDto dto:list)
{%>
<tr align="center">
<td><%=no++ %></td>
<td><%=dto.getName() %></td>
<td><%=dto.getId() %></td>
<td><%=dto.getAddr() %></td>
<td><%=dto.getEmail() %></td>
<td><%=sdf.format(dto.getGaipday()) %></td>
<td>

<button type="button" class="btn btn-outline-danger btn-sm" onclick="delfunc(<%=dto.getNum() %>)">삭제</button>
</td>
</tr>
<%}
%>
</table>
</html>
