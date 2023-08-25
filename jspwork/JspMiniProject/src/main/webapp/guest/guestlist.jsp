<%@page import="data.dao.MemberDao"%>
<%@page import="java.text.SimpleDateFormat"%>
<%@page import="data.dto.GuestDto"%>
<%@page import="java.util.List"%>
<%@page import="data.dao.GuestDao"%>
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
<link rel="stylesheet"
	href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.10.5/font/bootstrap-icons.css">
<script src="https://code.jquery.com/jquery-3.7.0.js"></script>
<style type="text/css">
span.day {
	float: right;
	font-size: 14px;
	color: gray;
}

img.photo {
	border-radius:10px;
	border:1px solid gray;
}
</style>
<title>Insert title here</title>
</head>
<body>
	<%
//로그인 상태 확인후 나타낼 것_회원만 보이게 
String loginok=(String)session.getAttribute("loginok");

GuestDao dao=new GuestDao();

int totalCount = dao.getTotalCount();
int currentPage;
int startPage;
int endPage;
int totalPage;
int startNum;
int perPage=5;
int perBlock=4;
int no;


if(request.getParameter("currentPage")==null)
	currentPage = 1;
else
	currentPage=Integer.parseInt(request.getParameter("currentPage"));

totalPage = totalCount / perPage + (totalCount % perPage == 0?0:1);
startPage = (currentPage-1)/perBlock*perBlock+1;
endPage = startPage + perBlock-1;

if(endPage > totalPage)
	endPage = totalPage;

startNum = (currentPage - 1)*perPage;

no=totalCount-(currentPage-1)*perPage;

List<GuestDto> list=dao.getList(startNum, perPage);

SimpleDateFormat sdf=new SimpleDateFormat("yyyy-MM-dd HH:mm");

//마지막 페이지 남은 한개글 지우면 빈페이지만 남는다.(해결책)이전페이지로 간다
if(list.size()==0 && currentPage!=1)
{%>

<script type="text/javascript">
location.href="index.jsp?main=guest/guestlist.jsp?currentPage=<%=currentPage-1%>";
</script>
<%}
%>
</body>
<% 
if(loginok!=null){%>

<jsp:include page="addform.jsp" />
<hr align="left" width="700">

<% }
%>
<div>
	<b>총 <%=totalCount %>개의 글이 있습니다
	</b>
	<% 
MemberDao mdao=new MemberDao();
for(GuestDto dto:list)
{
	//이름얻기
	String name=mdao.getName(dto.getMyid());
	%>
	<table class="table" style="width: 600px;">
		<tr>
			<td><b><i class="bi bi-person"></i>&nbsp;&nbsp;<%=name %>(<%=dto.getMyid() %>)</b>&nbsp;&nbsp;
				<% 
			//로그인한 아이디
			String myid=(String)session.getAttribute("myid");
			
			//로그인한 아이디와 글쓴 아이디가 같을 경우에만 수정,삭제 
			if(loginok!=null && dto.getMyid().equals(myid)){
			%> <a href="index.jsp?main=guest/updateform.jsp?num=<%=dto.getNum() %>&currentPage=<%=currentPage %>" style="color: green;"><i
					class="bi bi-pencil-square"></i></a>&nbsp; 
					<a href="guest/deleteform.jsp?num=<%=dto.getNum() %>&currentPage=<%=currentPage %>"
				style="color: red;"><i class="bi bi-trash"></i></a> <%}
			%> <span class="day"><%=sdf.format(dto.getWriteday()) %></span></td>
		</tr>

		<tr height="120">
			<td>
				<!--이미지가 null이 아닌 경우만 출력--> <% 
		if(dto.getPhotoname()!=null){%> <a href="save/<%=dto.getPhotoname()%>"
				target="_blank"> <img src="save/<%=dto.getPhotoname()%>"
					align="left" alt="" style="width: 100px;" hspace="20px" class="photo"></a> <%}
		%> <%=dto.getContent().replace("\n","<br>") %>

			</td>
		</tr>

	<!--댓글,추천-->
	<tr>
	<td>
	<span class="answer" style="cursor:pointer;" num=<%=dto.getNum() %>>댓글0</span>
	<spanclass="likes" style="margin-left:20px; cursor:pointer;"
	num=<%=dto.getNum() %>>추천</span>
	<span class="chu"><%=dto.getChu() %></span>
	</td>
	</tr>
	</table>

	<%}
%>
</div>

<div>
	<ul class="pagination justify-content-center">
		<%
         
          //이전
          if(startPage>=1 && currentPage > 1)
          {%>
		<li class="page-item active"><a class="page-link"
			href="index.jsp?main=guest/guestlist.jsp?currentPage=<%=currentPage-1%>"><i
				class="bi bi-arrow-left"></i></a></li>
		<%}
          
          for(int pp=startPage;pp<=endPage;pp++)
          {
             
             if(pp==currentPage)
             {%>

		<li class="page-item active"><a class="page-link"
			href="index.jsp?main=guest/guestlist.jsp?currentPage=<%=pp%>"><%=pp %></a>
		</li>

		<%}else
             {%>
		<li class="page-item"><a class="page-link"
			href="index.jsp?main=guest/guestlist.jsp?currentPage=<%=pp%>"><%=pp %></a>
		</li>
		<%}
          }
          
          //다음
          if(endPage<=totalPage && currentPage<totalPage)
          {%>
		<li class="page-item active"><a class="page-link"
			href="index.jsp?main=guest/guestlist.jsp?currentPage=<%=currentPage+1%>"><i
				class="bi bi-arrow-right"></i></a></li>
		<%}
       %>
	</ul>
</div>
</html>