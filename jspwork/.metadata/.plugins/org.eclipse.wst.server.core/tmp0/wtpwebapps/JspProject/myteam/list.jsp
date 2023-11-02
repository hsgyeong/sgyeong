<%@page import="model.sinsang.SinsangDto"%>
<%@page import="model.myteam.TeamDto"%>
<%@page import="java.text.SimpleDateFormat"%>
<%@page import="java.util.ArrayList"%>
<%@page import="model.myteam.TeamDao"%>
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
<script>
function confirmDelete(num) {  							/* confirmDelete 함수정의 매개변수 'num'은 삭제할 팀의 number  */
    var result = confirm("정말 삭제하시겠습니까?");			/* 메세지 '정말 삭제하시겠습니까?' 클릭 > 확인, 취소 버튼 누른 결과를 'result'변수에 저장 */
    if (result) {											/* 확인 버튼을 누른 경우 teamdelete.jsp 페이지로 이동하면서 해당 팀의 번호를 쿼리 문자열로 전달 */	
        location.href = "teamdelete.jsp?num=" + num;
        
        alert("삭제되었습니다")								/* 확인 버튼을 누른 경우 경고창  */
    }else
    	alert("취소되었습니다")								/* 취소 버튼을 누른 경우 경고창 */
}

</script>
</head>
<%
TeamDao dao = new TeamDao();
ArrayList<TeamDto> list = dao.getAllMyTeams();
SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd HH:mm");
%>
<body>

	<a href="addForm.jsp">팀원추가</a>
	<br>
	<table class="table table-bordered" style="width: 800px;">
		<tr align="center" class="table-warning">
			<th width="60">번호</th>
			<th width="120">이름</th>
			<th width="100">운전면허</th>
			<th width="260">주소</th>
			<th width="160">작성일</th>
			
			
			
			
			
			
			<th width="120">수정|삭제</th>
		</tr>

		<%
		for (int i = 0; i < list.size(); i++) {
			TeamDto dto = list.get(i); //i번지의 dto를 꺼낸다
		%>
		<tr>
			<td align="center"><%=i + 1%></td>
			<td align="center"><%=dto.getName()%></td>
			<td align="center"><%=dto.getDriver()%></td>
			<td><%=dto.getAddr()%></td>
			<td><%=sdf.format(dto.getWriteday())%></td>
			<td>
			<button type="button" class="btn btn-outline-info btn-sm"
			onclick="location.href='updateForm.jsp?num=<%=dto.getNum()%>'">수정</button>
			<button type="button" class="btn btn-outline-danger btn-sm"
			onclick="confirmDelete(<%=dto.getNum()%>)'">삭제</button>
			</td>
		</tr>

		<%}
%>
	</table>
</body>
</html>