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
<link href="https://fonts.googleapis.com/css2?family=IBM+Plex+Sans+KR:wght@100;200;300;500;600&family=Nanum+Gothic+Coding:wght@400;700&family=Noto+Sans+KR:wght@100;300;400;600;700&family=Roboto:wght@100&display=swap" rel="stylesheet">
<script src="https://code.jquery.com/jquery-3.7.0.js"></script>
<title>Insert title here</title>
<script type="text/javascript">
$(function(){
	
	$("#allcheck").click(function(){
		
		var chk=$(this).is(":checked");
		/* console.log(chk); */
		
		$(".del").prop("checked",chk);
				
	});
	
	$("#btnmemberdel").click(function(){
		
		var cnt=$(".del:checked").length;
		/* console.log(cnt); */
		
		 if(cnt==0)
			{
			alert("먼저 선택할 사람을 선택해주세요");
			return;
			} 
	
		$(".del:checked").each(function(i,element){
			var num = $(this).attr("num");
			/* console.log(num); */
			//alert(num);
			
		//선택한 체크 삭제
			$.ajax({
				type:"get",
				url:"delete", //url은 action이기 때문에 중간경로 쓰지 않는다.  
				dataType:"html",
				data:{"num":num},
				success:function(){
					alert("삭제되었습니다");
					location.reload();
				}
			
			}) 
		})
	});
});
</script>
</head>
<body>

<h5 class="alert alert-info" style="font-family: Noto Sans KR; text-align: center;
margin-top: 50px;">${totalCount }명의 회원이 있습니다</h5>

<button type="button" class="btn btn-outline-info" style="margin-left: 900px;"
onclick="location.href='form'">회원가입</button>
<br><br>

<table class="table table-bordered">

 <tr style="text-align: center; vertical-align: middle;">
 	<th></th>
 	<th>이름</th>
 	<th>아이디</th>
 	<th width="140">hp</th>
 	<th>주소</th>
 	<th>이메일</th>
 	<th width="190">가입일</th>
 	<th><input type="checkbox" id="allcheck">삭제</th>
 </tr>
 <c:forEach var="dto" items="${list }" varStatus="i">
 <tr style="text-align: center; vertical-align: middle; font-family: Noto Sans KR; ">
 <td><img alt="" src="../membersave/${dto.photo }" style="width:80px; height:80px;"></td>
 <td>${dto.name }</td>
 <td>${dto.id }</td>
 <td>${dto.hp }</td>
 <td>${dto.addr }</td>
 <td>${dto.email }</td>
 <td>${dto.gaipday }</td>
 <td><input type="checkbox" num=${dto.num } class="del"></td>
 </tr>
 </c:forEach>

</table>
<button type="button" class="btn btn-danger" id="btnmemberdel">Delete</button>
</body>
</html>