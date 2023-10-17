<%@page import="data.dto.SmartDto"%>
<%@page import="java.text.SimpleDateFormat"%>
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
<script src="https://unpkg.com/sweetalert/dist/sweetalert.min.js"></script>
<script src="https://code.jquery.com/jquery-3.7.0.js"></script>
<title>Insert title here</title>
<style>
span.day {
	font-size: 0.8em;
	color: gray;
	margin-left: 20px;
}

img {
	max-width: 300px;
}

div.alist {
	margin-left: 50px;
}

span.aday {
	color: gray;
	font-size: 0.8em;
	float: right;
}

i.adel {
	margin-left: 10px;
	color: red;
	font-size: 1em;
}

i.del {
	cursor: pointer;
}
</style>
<script type="text/javascript">
$(function(){

	//시작할때 
	list();
	
	//댓글부분 ajax insert
	//num alert 테스트
	var num=$("#num").val();
	//alert(num);
	
 	$("#btnadd").click(function(){
		
		var nickname=$("#nickname").val().trim();
		var content=$("#content").val().trim();
		
		 if(nickname.trim().length==0){
			 swal ( "잠깐" ,  "닉네임을 입력해주세요" ,  "error" );
			 return;
		 }
		 
		 if(content.trim().length==0){
			 swal ( "잠깐" ,  "댓글 내용을 입력해주세요" ,  "success" );
			 return;
		 }
		 
		 $.ajax({
			 type:"get", /*post방식으로 하면 한글 깨짐  / get으로 하면 multipart로 했을 때 오류가 남 무조건 post로 해야함*/
			 url:"board/insertanswer.jsp",
			 dataType:"html",
			 data:{"num":num, "nickname":nickname, "content":content},
			 success:function(){
				 //기존입력값 지우기
				 $("#nickname").val("");
				 $("#content").val("");
				 
				 //리스트
				 list();
			 },
			 statusCode:{
				 404:function(){
					 alert("json파일을 찾을 수 없어요");
				 },
				 500:function(){
					 alert("서버오류. 코드 다시 한번 볼 것");
				 }
			 }
			 
		 })
	})	 

	
 $(document).on("click",".del",function(){
	
	var idx=$(this).attr("idx");
	
	 var a=confirm("삭제하려면 [확인]을 누르세요");
	
	 if(a){
		
		$.ajax({
			type:"post",
			dataType:"html",
			url:"board/deleteanswer.jsp",
			data:{"idx":idx},
			success:function(){
				
				//리스트
				list();
			}
			
		}) 
	}
		
}) 

});

function list(){
	
	console.log("list num="+$("#num").val());
	
	$.ajax({
		type:"get",
		url:"board/listanswer.jsp",
		dataType:"json",
		data:{"num":$("#num").val()},
		success:function(res){
			
			//댓글갯수출력
			$("b.acount>span").text(res.length);
		
			//출력
			var s="";
			$.each(res,function(idx,item){
				
				s+="<div>"+item.nickname+" :   "+item.content;
				s+="<span class='aday'>"+item.writeday+"</span>"
				s+="&nbsp;&nbsp;&nbsp;&nbsp;<i idx="+item.idx+" class='bi bi-x-square del' style='color:red' ></i>";
				s+="</div>"
				
			});
			
			$("div.alist").html(s);
		}
	})
}

</script>
</head>
<jsp:useBean id="dao" class="data.dao.SmartDao" />
<body>
	<%
	String num = request.getParameter("num");

	//현재페이지받기
	String currentPage = request.getParameter("currentPage");
	dao.updateReadCount(num);

	SmartDto dto = dao.getData(num);
	SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd HH:mm");
	%>

	<div style="margin: 30px 30px; width: 500px;">

		<input type="hidden" id="num" value="<%=num%>">
		<table class="table table-bordered"
			style="margin-left: 110px; width: 1200px">

			<tr>
				<td><b style="font-size: 25pt; margin-left: 20px"><%=dto.getSubject()%></b><b
					style="margin-left: 100px;">작성자: <%=dto.getWriter()%></b><br>
					<span class="day"><%=sdf.format(dto.getWriteday())%>
						&nbsp;&nbsp;&nbsp; 조회: <%=dto.getReadcount()%></span></td>
			</tr>
			<tr height="150px;">
				<td><%=dto.getContent()%></td>
			</tr>

			<tr>
				<!-- 댓글 -->
				<td><b class="acount" id="alist">댓글<span>0</span></b><br>
					<div class="alist"></div>
					<div class="aform input-group">
						<input type="text" id="nickname" class="form-control"
							style="width: 50px;" placeholder="닉네임입력"> <input
							type="text" id="content" class="form-control"
							style="width: 800px;" placeholder="댓글메세지">
						<button type="button" id="btnadd" class="btn btn-outline-info">저장</button>
					</div></td>
			</tr>

			<tr>
				<td align="right">
					<button type="button" class="btn btn-outline-success"
						onclick="location.href='index.jsp?main=board/smartform.jsp'">글쓰기</button>
					<button type="button" class="btn btn-outline-success"
						onclick="location.href='index.jsp?main=board/boardlist.jsp?currentPage=<%=currentPage%>'">목록</button>
					<button type="button" class="btn btn-outline-warning"
						onclick="location.href='index.jsp?main=board/updateform.jsp?num=<%=num%>&currentPage=<%=currentPage%>'">수정</button>
					<button type="button" class="btn btn-outline-danger"
						onclick="funcdel(<%=num%>,<%=currentPage%>)">삭제</button>

				</td>
			</tr>

			</tr>

		</table>
	</div>
	<script type="text/javascript">
	function funcdel(num,currentPage){
		//alert(num+","+currentPage);
		
		var a=confirm("삭제하려면 [확인]을 눌러주세요");
		
		if(a)
			{
			location.href="board/deleteaction.jsp?num="+num+"&currentPage="+currentPage;
			}
	}
	
	
	</script>
</body>
</html>