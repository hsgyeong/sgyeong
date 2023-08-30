<%@page import="data.dto.AnswerDto"%>
<%@page import="data.dao.AnswerDao"%>
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
<link href="https://fonts.googleapis.com/css2?family=East+Sea+Dokdo&family=Moirai+One&family=Nanum+Pen+Script&family=Orbit&display=swap" rel="stylesheet">
<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/css/bootstrap.min.css" rel="stylesheet">
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.1/dist/js/bootstrap.bundle.min.js"></script>
<script src="https://code.jquery.com/jquery-3.7.0.js"></script>
<link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.10.5/font/bootstrap-icons.css">
<script type="text/javascript">
//추천수 증가
$(function() {
   

$("span.likes").click(function() {
   
   var num=$(this).attr("num");
   //alert(num);
   var tag=$(this);
   
   $.ajax({
      
      type:"get",
      dataType:"json",
      url:"guest/ajaxlikes.jsp",
      data:{"num":num},
      success:function(data){
         
         //alert(data.chu);
         tag.next().text(data.chu);
         
         //추천클릭시 하트 커지고 끝나면 다시 0px;
         tag.next().next().animate({"font-size":"20px"},300,function(){
            $(this).css("font-size","0px");
         });
         
         
      }
   });
});

   //댓글부분은 무조건 안보이게 처리
   $("div.answer").hide();
   
   //댓글클릭시 댓글부분이 보였다 안보였다 하기
   $("span.answer").click(function() {
      
     // $(this).prev().toggle();
     $(this).parent().find("div.answer").toggle()
     
   })
   
   //댓글삭제 이벤트
   $("i.adel").click(function(){
	   
	   var idx=$(this).attr("idx");
	   //alert(idx);
	   var a=confirm("삭제하려면 [확인]을 누르세요");
	   
 	   if(a){
	
	    $.ajax({
		   type:"get",
		   dataType:"html",
		   url:"guest/answerdelete.jsp",
		   data:{"idx":idx},
		   success:function(){
				location.reload();   
		   	}
		   }); 
   		}
   });
   
 
	
 
	 //수정아이콘 누르면 모달로 수정폼 띄우기
	 $("i.amod").click(function(){
		var idx=$(this).attr("idx"); 
	/* 	alert(idx); */
		
		//댓글수정폼의 hidden에 idx를 넣어주기
		$("#idx").val(idx);
		
		//모달창 띄우기
		/* $("#myModal").modal(); */
		
		$.ajax({
			type:"get",
			dataType:"json",
			url:"guest/answercontent.jsp",
			data:{"idx":idx},
			success:function(res){
				$("#idx").val(res.idx);
				$("#content").val(res.story);
			}
		
		})
	 });
	 
	 //모달창의 수정버튼 누르면 수정이 된 후 reload()
	  $("#btnupdate").click(function(){
		 
		 var idx=$("#idx").val();
		 
		 var content=$("#content").val();
		 
		 $.ajax({
			 type:"post",
			 dataType:"html",
			 url:"guest/answerupdate.jsp",
			 data:{"idx":idx,"content":content},
			 success:function(){
				 location.reload();
			 }
		 })
	 }) 
   
});

</script>
<title>Insert title here</title>
<style type="text/css">
span.day {
	float: right;
	font-size: 14px;
	color: gray;
}

img.photo {
	border-radius: 20px;
	border: 1px solid gray;
}
</style>
</head>
<%
//로그인 상태 확인후 입력폼 나타낼것_회원만 보이게
String loginok = (String) session.getAttribute("loginok");
GuestDao dao = new GuestDao();

int totalCount = dao.getTotalCount(); //전체갯수
int totalPage; //총 페이지수
int startPage; //각 블럭에서 보여질 시작페이지
int endPage; //각 블럭에서 보여질 끝페이지
int start; //db에서 가져올 글의 시작번호(mysql은 첫글이 0,오라클은 1)
int perPage = 3; //한 페이지당 보여질 글의갯수
int perBlock = 5; //한 페이지당 보여질 페이지 갯수
int currentPage; //현재 페이지
int no; //각페이지당 출력할 시작번호
int startNum; //각페이지에서 보여질 시작번호

//현재페이지 읽기(단 null일경우는 1페이지로 준다)계산을 해야하므로 int로 형변환해줌
if (request.getParameter("currentPage") == null)
	currentPage = 1;

else
	currentPage = Integer.parseInt(request.getParameter("currentPage"));

//총 페이지수 구하기
//총 글의갯수/한페이지당 보여질 개수로 나눔(7/5=1)
//나머지가 1이라도 있으면 무조건 1페이지 추가(1+1=2페이지)
totalPage = totalCount / perPage + (totalCount % perPage == 0 ? 0 : 1);

//각 블럭당 보여야할 시작페이지
//perBlock=5일경우는 현재페이지 1~5 시작:1 끝:5
//현재페이지 13 시작:11 끝:15
startPage = (currentPage - 1) / perBlock * perBlock + 1; // (12/5)*5 +1=11

endPage = startPage + perBlock - 1;

//총페이지가 23일경우 마지막블럭은 25가아니라 23이다
if (endPage > totalPage)
	endPage = totalPage;

//각페이지에서 보여질 시작번호
//1페이지: 0, 2페이지 :5, 3페이지 :10...
startNum = (currentPage - 1) * perPage;

//각페이지당 출력할 시작번호 구하기
//총글개수가 23이면 1페이지 23, 2 페이지 18, 3페이지 13......
//no=totalCount-(currentPage-1)*perPage;
no = totalCount - startNum;

//각페이지 필요한 게시글 자겨오기
List<GuestDto> list = dao.getList(startNum, perPage);

SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd HH:mm");

//마지막 페이지 남은 한개글 지우면 빈페이지만 남는다.(해결책)이전페이지로간다

if (list.size() == 0 && currentPage != 1) {
%>
<script type="text/javascript">
location.href="index.jsp?main=guest/guestlist.jsp?currentPage=<%=currentPage - 1%>";
	
</script>
<%
}
%>
<body>
	<%
	if (loginok != null) {
	%>

	<jsp:include page="addform.jsp" />
	<hr align="left" width="700px;">
	<%
	}
	%>
	<div style="margin-left:100px;">
		<b>총<%=totalCount%>개의 게시글이 있습니다
		</b>
		<br><br>

		<%
		MemberDao mdao = new MemberDao();
		for (GuestDto dto : list) {
			//이름얻기
			String name = mdao.getName(dto.getMyid());
		%>

		<table class="table table-bordered" style="width: 1200px;">
			<tr>
				<td>&nbsp;&nbsp;<b>&nbsp;<i class="bi bi-person-square"></i>&nbsp;&nbsp;<%=name%>(<%=dto.getMyid()%>)</b>
					<%
					//로그인한 아이디
					String myid = (String) session.getAttribute("myid");

					//로그인한 아이디와 글쓴아이디가 같을경우에만 수정,삭제
					if (loginok != null && dto.getMyid().equals(myid) || loginok != null && myid.equals("admin")) {
					%> <a
					href="index.jsp?main=guest/updateform.jsp?num=<%=dto.getNum()%>&currentPage=<%=currentPage%>"
					style="color: green"><i class="bi bi-pencil-square"></i></a> <a
					href="guest/delete.jsp?num=<%=dto.getNum()%>&currentPage=<%=currentPage%>"
					style="color: red"><i class="bi bi-trash-fill"></i></a> <%
 }
 %> <span class="day"><%=sdf.format(dto.getWriteday())%></span></td>
			</tr>

			<tr height="120">
				<td>
					<!-- 이미지가 null이 아닌경우만 출력 --> <%
 if (dto.getPhotoname() != null) {
 %> <a href="save/<%=dto.getPhotoname()%>" target="blank"> <img
						src="save/<%=dto.getPhotoname()%>" align="left"
						style="width: 100px; margin-top: 15px;" hspace="20" class="photo"></a> <%
 }
 %> 
 
 &nbsp;&nbsp;&nbsp;<%=dto.getContent().replace("\n", "<br>")%>
				</td>
			</tr>

			<!-- 댓글,추천 -->
			<!-- 추천수 클릭시 추천숫자 옆에 하트 커졌다 사라지게 animate -->
			<tr>
				<td>
					<%
					//각 방명록에 달린 댓글 목록 가져오기
					AnswerDao adao = new AnswerDao();
					List<AnswerDto> alist = adao.getAllAnswers(dto.getNum());
					%>

					<div class="answer">
						<%
						if (loginok != null) {
						%>

						<div class="answerform">
							<form action="guest/answerinsert.jsp" method="post">
								<table class="table table-bordered" style="width: 500px;">
									<tr>
										<td><textarea style="width: 500px; height: 80px;"
												name="content" required="required" class="form-control"></textarea></td>
										<td>
											<button type="submit" class="btn btn-success"
												style="width: 80px; height: 80px;">등록</button> <!--hidden값 3개-->
											<input type="hidden" name="num" value="<%=dto.getNum()%>">
											<input type="hidden" name="myid" value="<%=myid%>"> 
											<input type="hidden" name="currentPage" value="<%=currentPage%>">
										</td>
									</tr>
									
								</table>
							</form>
						</div>
						<%
						}
						%>

						<div class="answerlist" >
							<table class="table" style="width: 480px;">
								<% 
						for(AnswerDto adto:alist)
						{%>
								<tr>
									<td width="60">
									<i class="bi bi-person-circle" style="font-size: 20pt"></i>
									</td>
									<td>
									<%
									//작성자명
									String aname=mdao.getName(adto.getMyid());
									%>
									<br>
									<b><%=aname %></b>
									&nbsp;
									<%
									//글쓴이와 댓글쓴이가 같을 경우 [작성자]
											if(dto.getMyid().equals(adto.getMyid()))
											{%>
												<b><span style="color:red; border: 1px solid red; border-radius: 20px; font-size:5pt;">작성자</span></b>
												
											<%}
									%>
									
									<span style="font-size: 9pt; color: gray; margin-left:30px;"><%=sdf.format(adto.getWriteday()) %></span>
									<br>
									<span><%=adto.getContent() %></span>
									<%
									//수정 삭제는 로그인중이면서 로그인한 아이디와 같은 경우만 보이게
									if(loginok!=null && adto.getMyid().equals(myid)){%>
										<i class="bi bi-trash3 adel" style="cursor:pointer; margin-left: 100px;"
										idx=<%=adto.getIdx() %>></i> &nbsp;
										<i class="bi bi-pencil-square amod" style="cursor:pointer;" data-bs-target="#myModal" data-bs-toggle="modal"
										idx="<%=adto.getIdx() %>" ></i>
									
									<%}
									%>
									</td>
								</tr>
								<%}
						%>
							</table>
						</div>

					</div> 
					<span class="answer" style="cursor: pointer;"
					num=<%=dto.getNum()%>>&nbsp;&nbsp;&nbsp;<i class="bi bi-chat-dots-fill"
						style=""></i>&nbsp;&nbsp;댓글 <%=alist.size() %></span> <span class="likes"
					style="margin-left: 20px; cursor: pointer"
					;
              num=<%=dto.getNum()%>>&nbsp;&nbsp;<i
						class="bi bi-hand-thumbs-up-fill"></i>&nbsp;&nbsp;추천</span>

					<span class="chu"><%=dto.getChu()%></span> <i
					class="bi bi-heart-fill" style="color: red; font-size: 0px;"></i>
				</td>
			</tr>


		</table>
		<%
		}
		%>
	</div>

	<div style="width: 600px; text-align: center;">
		<ul class="pagination justify-content-center">
			<%
			//이전
			if (startPage >= 1 && currentPage > 1) {
			%>
			<li class="page-item active"><a class="page-link"
				href="index.jsp?main=guest/guestlist.jsp?currentPage=<%=currentPage - 1%>"><i
					class="bi bi-arrow-left"></i></a></li>
			<%
			}

			for (int pp = startPage; pp <= endPage; pp++) {

			if (pp == currentPage) {
			%>

			<li class="page-item active"><a class="page-link"
				href="index.jsp?main=guest/guestlist.jsp?currentPage=<%=pp%>"><%=pp%></a>
			</li>

			<%
			} else {
			%>
			<li class="page-item"><a class="page-link"
				href="index.jsp?main=guest/guestlist.jsp?currentPage=<%=pp%>"><%=pp%></a>
			</li>
			<%
			}
			}

			//다음
			if (endPage <= totalPage && currentPage < totalPage) {
			%>
			<li class="page-item active"><a class="page-link"
				href="index.jsp?main=guest/guestlist.jsp?currentPage=<%=currentPage + 1%>"><i
					class="bi bi-arrow-right"></i></a></li>
			<%
			}
			%>
		</ul>
	</div>
	
	
	
<!-- The Modal -->
<div class="modal" id="myModal">
  <div class="modal-dialog">
    <div class="modal-content">

      <!-- Modal Header -->
      <div class="modal-header">
        <h5 class="modal-title">댓글 수정</h5>
        <button type="button" class="btn-close" data-bs-dismiss="modal"></button>
      </div>

      <!-- Modal body -->
      <div class="modal-body">
      <div class="updateform">
      <input type="hidden" id="idx" >
      <input type="text" id="content">
      <button type="button" class="btn btn-outline-info"
      id="btnupdate">수정하기</button>
     <!--  </div>
        <td><textarea style="width: 465px; height: 80px;"
			name="content" required="required" class="form-control"></textarea></td>
      </div> -->

      <!-- Modal footer -->
      <div class="modal-footer">
        <button type="button" class="btn btn-outline-info" data-bs-dismiss="modal">수정</button>
        <button type="button" class="btn btn-outline-danger" data-bs-dismiss="modal">취소</button>
      </div>

    </div>
  </div>
</div>
  
</body>
</html>