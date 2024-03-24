<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/css/bootstrap.min.css" rel="stylesheet">
<link href="https://fonts.googleapis.com/css2?family=Dongle:wght@300&family=Gaegu:wght@300&family=Nanum+Pen+Script&family=Sunflower:wght@300&display=swap" rel="stylesheet">
<link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.11.1/font/bootstrap-icons.css">
<script src="https://code.jquery.com/jquery-3.7.0.js"></script>
<title>Insert title here</title>
<style type="text/css">
.likes{cursor:pointer;}
</style>
<script type="text/javascript">
$(function(){
	
	$("span.likes").click(function(){
		
		var num= ${dto.num};  //dto에서 값 받아올때 중괄호 사용
		
		//alert(num);
		
		var thum=$(this).find("i").attr("class");
		//alert(thum)
			
		if(thum=='bi bi-hand-thumbs-up'){
				$(this).find("i").attr("class","bi bi-hand-thumbs-up-fill");
		}
		if(thum=='bi bi-hand-thumbs-up-fill'){
				$(this).find("i").attr("class","bi bi-hand-thumbs-up");
		}
			
		$.ajax({
			
			type:"get",
			data:{"num":num},
			dataType:"json",   
			url:"updateLikes",
			success:function(res){
				
				//alert(num);
				//alert(res.likes);
				
				$("span.likes").find("b").text(res.likes);				
				
			}

		});
			
	});
});

</script>
</head>
<body>
<div style="width: 600px; margin: 50px 100px;">
	<table class="table table-bordered">
		<tr>
			<td>
				<h3>${dto.subject }</h3>
				<span style="float:right;"><b>${dto.name }(${dto.id })</b></span><br>
				<span style="color: gray; float:right; font-size: 0.7em;">
					<fmt:formatDate value="${dto.writeday }" pattern="yyyy-MM-dd HH:mm"/>
					&nbsp;&nbsp;&nbsp;&nbsp;
					조회: ${dto.readcount }
				</span>
			</td>
		</tr>
		<tr>
			<td>
				<pre>
				${dto.content }
				</pre>
				<br><br>
				<c:if test="${dto.photo!='no' }">
					<c:forEach var="photo" items="${dto.photo }">
						<img alt=" " src="../rephoto/${photo }" width="100" class="img-thumbnail">
					</c:forEach>
				</c:if>
				<br><br>
				<span class="likes">
					<i class="bi bi-hand-thumbs-up"></i>
					&nbsp;&nbsp;
				</span>
				좋아요 <b>${dto.likes }</b>
			</td>
		</tr>
		<tr>
			<td>
				<button type="button" class="btn btn-outline-success"
				onclick="location.href='form?num=${dto.num}&regroup=${dto.regroup }&relevel=${dto.relevel }&restep=${dto.restep }&currentPage=${currentPage }'">답글</button>
				<c:if test="${sessionScope.loginok!=null && sessionScope.myid == dto.id }">
					<button type="button" class="btn btn-outline-success" onclick="location.href=''">수정</button>
				</c:if>
				<c:if test="${sessionScope.loginok!=null && sessionScope.myid == dto.id }">
					<button type="button" class="btn btn-outline-success" onclick="location.href=''">삭제</button>
				</c:if>
				<button type="button" class="btn btn-outline-success" onclick="location.href=''">목록</button>
				<c:if test="${sessionScope.loginok!=null }">
					<button type="button" class="btn btn-outline-success" onclick="location.href=''">글쓰기</button>
				</c:if>
			</td>
		</tr>
	</table>
</div>
</body>
</html>