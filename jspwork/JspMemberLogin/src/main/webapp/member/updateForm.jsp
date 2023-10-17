<%@page import="member.model.MemberDao"%>
<%@page import="member.model.MemberDto"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<link
	href="https://fonts.googleapis.com/css2?family=Cute+Font&family=Dongle:wght@300&family=Gamja+Flower&family=Gowun+Batang&family=Gowun+Dodum&family=Hi+Melody&family=Nanum+Gothic&family=Nanum+Gothic+Coding&family=Nanum+Pen+Script&family=Poor+Story&family=Sunflower:wght@300&display=swap"
	rel="stylesheet">
<link rel="stylesheet"
	href="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/css/bootstrap.min.css">
<script src="https://code.jquery.com/jquery-3.7.0.js"></script>  <!--bootstrap 3  -->
<title>Insert title here</title>
<script type="text/javascript">

</script>
<%
String num=request.getParameter("num");
MemberDao dao=new MemberDao();
MemberDto dto=dao.getData(num);
%>
</head>
<body>
	<div style="margin: 50px; 100px;">
		<form action="addProc.jsp" method="post" enctype="multipart/form-data"
			class="form-inline" id="mfrm">
			<table class="table table-bordered" style="width: 500px;">
				<caption align="top">
					
				</caption>
				<tr>
				<td style="background-color: #87cefa;" width="120">아이디</td>
				<td>
				<b><%=dto.getId() %></b>
				</td>
				</tr>
				<tr>
					<td style="background-color: #87cefa; text-align:center" width="120">비밀번호</td>
					<td><input type="password" class="form-control"
						style="width: 120px;" name="pass" required="required" value="<%=dto.getPass() %>"></td>
				</tr>

				<tr>
					<td style="background-color: #87cefa; text-align:center" width="120">이름</td>
					<td><input type="text" class="form-control"
						style="width: 120px;" name="name" required="required" value="<%=dto.getName() %>"></td>
				</tr>

				<tr>
					<td style="background-color: #87cefa; text-align:center" width="120">사진</td>
					<td><input type="file" class="form-control"
						style="width: 250px;" name="uploadImg" value="<%=dto.getImage() %>"></td>
				</tr>

				<tr>
					<td style="background-color: #87cefa; text-align:center" width="120">핸드폰</td>
					<td><input type="text" class="form-control"
						style="width: 200px;" name="hp" required="required" value="<%=dto.getHp() %>"></td>
				</tr>
				
				<tr>
				<td colspan="2" align="center">
				<button type="submit" class="btn btn-warning" onclick="location.href='memberList.jsp'">회원정보수정</button>
				</td>
				</tr>
			</table>
		</form>
	</div>
	
	<script type="text/javascript">
	function openId(){
		window.open("idcheck.jsp","e","left=400px, top=100px, width=300px, height=250px");
	}
	</script>
</body>
</html>