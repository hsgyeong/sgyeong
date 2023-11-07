<%@page import="java.util.StringTokenizer"%>
<%@page import="data.dto.MemberDto"%>
<%@page import="data.dao.MemberDao"%>
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
<script type="text/javascript">
	$(function() {
		//id중복체크
		$("#btncheck").click(function() {
			//id읽기
			var id = $("#id").val();
			//alert(id);

			$.ajax({
				type : "get",
				url : "member/idsearch.jsp",
				dataType : "json",
				data : {"id" : id},
				success : function(data) {

					//alert(data.count);
					if (data.count == 1) {
						alert("이미 가입된 아이디입니다\n다시 입력해주세요");
						//$("span.idsuccess").text("fail");
						//$("#id").val("");
					} else {
						alert("가입이 가능한 아이디 입니다");
						//$("span.idsuccess").text("success");
					}

				}

			})
		});
		
		//선택 이메일 주소 넣기.. 혹은 직접 입력
		
		$("#selemail").change(function(){
			if($(this).val()=="-"){
				$("#email2").val("");
				$("#email2").focus();
		
				}else{
				$("#email2").val($(this).val());
				}
			
		})

	})

	function check(f) 
	{
		if(f.pass.value!=f.pass2.value)
			{
			alert("비밀번호가 서로 다릅니다");
			f.pass.value="";
			f.pass2.value="";
			
			return false;  //action이 호출되지 않는다
			}
	}
</script>
</head>
<%
	//num
	String num=request.getParameter("num");
	//dao
	MemberDao dao=new MemberDao();
	//dto 얻기
	MemberDto dto=dao.getMember(num);
	
	//이메일 구분하기(@기준으로)_#1
	/* int idx=dto.getEmail().indexOf('@');
	String email1=dto.getEmail().substring(0, idx);  //0~(idx-1)
	String email2=dto.getEmail().substring(idx+1);  //idx+1번지부터 끝까지 */
	
	//@을 구분자로 분리_#2
	StringTokenizer st=new StringTokenizer(dto.getEmail(),"@");
	String email1=st.nextToken();
	String email2=st.nextToken();
	
%>
<body>														<!--submit을 할 때 check로 가서 한번 더 확인  -->
	<form action="member/updateproc.jsp" method="post" onsubmit="return check(this)"> 
		<input type="hidden" name="num" value="<%=num %>">
		<table class="table table-borderd"
			style="width: 500px; font-family: Sunflower">
			<caption align="top">
				<b>회원가입</b>
			</caption>
			<tr>
				<th
					style="width: 100; background-color: #d3d3d3; text-align: center;">아이디</th>
				<td><input type="text" name="id" id="id" required="required"
					style="width: 120px;" class="form-group" value="<%=dto.getId()%>">

					<span class="idsuccess"></span></td>
			</tr>
			<tr>
				<th
					style="width: 100px; background-color: #d3d3d3; text-align: center;">비밀번호</th>
				<td><input type="password" name="pass" required="required"
					style="width: 120px;" placeholder="비밀번호" class="form-group" value="<%=dto.getPass() %>">
					<input type="password" name="pass2" required="required"
					style="width: 120px;" placeholder="비밀번호 확인" class="form-group" value="<%=dto.getPass() %>">
				</td>
			</tr>
			<tr>
				<th
					style="width: 100px; background-color: #d3d3d3; text-align: center;">회원명</th>
				<td><input type="text" name="name" required="required"
					placeholder="이름" style="width: 120px;" value="<%=dto.getName() %>"></td>
			</tr>
			<tr>
				<th
					style="width: 100px; background-color: #d3d3d3; text-align: center;">핸드폰</th>
				<td><input type="text" name="hp" required="required"
					placeholder="핸드폰번호" style="width: 200px;" value="<%=dto.getHp() %>"></td>
			</tr>

			<tr>
				<th
					style="width: 100px; background-color: #d3d3d3; text-align: center;">주소</th>
				<td><input type="text" name="addr" required="required"
					placeholder="주소" style="width: 300px;" value="<%=dto.getAddr() %>"></td>
			</tr>
			
			<tr>
				<th
					style="width: 100px; background-color: #d3d3d3; text-align: center;">이메일</th>
				<td><input type="text" name="email1" class="form-group"
					required="required" style="width: 120px;" value="<%=email1 %>"> <b
					style="font-size: 13px;">@</b> <input type="text" name="email2"
					id="email2" required="required" style="width: 120px;" value="<%=email2 %>"> <select
					id="selemail">
						<option value="-">직접입력</option>
						<option value="naver.com">네이버</option>
						<option value="google.com">구글</option>
						<option value="hanmail.net">다음</option>
				</select></td>
			</tr>
			<tr>
				<td colspan="2" ; align="center">
					<button type="submit" class="btn btn-outline-info"
						style="width: 100px;">수정</button>
					<button type="reset" class="btn btn-outline-success"
						style="width: 100px;">초기화</button>
				</td>
			</tr>
		</table>
	</form>
</body>
</html>