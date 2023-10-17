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
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/css/bootstrap.min.css">
<script src="https://code.jquery.com/jquery-3.7.0.js"></script>
<script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/js/bootstrap.min.js"></script>
<title>Insert title here</title>
<script type="text/javascript">
function funcdel(num){
	//alert(num)
	$("#btnmdel").attr("num",num);
	$("#myModal").modal(num);

}
</script>
</head>
<%
MemberDao dao = new MemberDao();
ArrayList<MemberDto> list = dao.getAllMember();
%>

<body>
	<table class="table table-borderd"
		style="width: 1000px; border: 1px solid gray;">

		<tr>
			<th>번호</th>
			<th>아이디</th>
			<th>회원명</th>
			<th>핸드폰</th>
			<th>가입일</th>
			<th>편집</th>
		</tr>
		<%
		if (list.size() == 0) {
		%>
		<tr>
			<td colspan="5" align="center">
				<h5>등록된 정보가 없습니다</h5>
			</td>
		</tr>
		<%
		} else {

		SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd");

		for (int i = 0; i < list.size(); i++) {
			MemberDto dto = list.get(i);
		%>

		<tr>
			<td><%=i + 1%></td>
			<td><%=dto.getId()%></td>
			<td><%=dto.getName()%></td>
			<td><%=dto.getHp()%></td>
			<td><%=dto.getGaip()%></td>

			<%
			/*로그인한 본인꺼만 수정/삭제 보이도록  */
			String loginok = (String) session.getAttribute("loginok");
			String id = (String) session.getAttribute("idok");
			%>
			<td>
				<%
				//로그인한 본인꺼만 나오도록
				if (loginok != null && dto.getId().equals(id)) {
				%>
				<button type="button" class="btn btn-info btn-sm"
					onclick="location.href='../member/updateForm.jsp?num=<%=dto.getNum()%>'">수정</button>

				<button type="button" class="btn btn-warning btn-sm"
					onclick="funcdel(<%=dto.getNum()%>)">삭제</button> <%
 } else {
 %>
				<h5>권한없음</h5> <%
 }
 %>
			</td>
		</tr>
		<%
		}
		}
		%>

	</table>

	<!-- Modal -->
	<div class="modal fade" id="myModal" role="dialog">
		<div class="modal-dialog">

			<!-- Modal content-->
			<div class="modal-content">
				<div class="modal-header">
					<button type="button" class="close" data-dismiss="modal">&times;</button>
					<h4 class="modal-title">회원탈퇴</h4>
				</div>
				<div class="modal-body">
					<p>회원탈퇴를 원하시면 [탈퇴확인]을 눌러주세요</p>
					<button type="button" class="btn btn-danger" id="btnmdel" num="">탈퇴확인</button>
				</div>
				<div class="modal-footer">
					<button type="button" class="btn btn-default" data-dismiss="modal">Close</button>
				</div>
			</div>

		</div>
	</div>
	
	<script type="text/javascript">
	$("#btnmdel").click(function(){
		
		//버튼에 있는 num값 읽어오기
		var num=$(this).attr("num");
		//이동
		location.href="../member/deleteMember.jsp?num="+num;
	})
	
	</script>

</body>
</html>