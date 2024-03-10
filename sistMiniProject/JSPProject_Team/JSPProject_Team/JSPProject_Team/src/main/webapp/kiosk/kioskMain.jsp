<%@page import="java.text.SimpleDateFormat"%>
<%@page import="java.util.ArrayList"%>
<%@page import="Admin.adminDao"%>
<%@page import="Admin.adminDto"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="utf-8">
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/css/bootstrap.min.css">
  <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.6.4/jquery.min.js"></script>
  <script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/js/bootstrap.min.js"></script>
<title>Insert title here</title>
<style>
   .pone img,.ptwo img,.pthree img{
      width: 100px;
      height: 150px;
      margin-left: 10px;
      margin-top: 10px;
      cursor: pointer;
   }
   
   .product{
      width: 460px;
      margin-left: 500px;
   }
</style>
<script type="text/javascript">

$(function (){
   
   $(".pone").hide();
   $(".ptwo").hide();
   $(".pthree").hide();
   $(".pout").show();
   $("#myModal").hide();
   
});
</script>
</head>
   <%
      adminDao dao=new adminDao();
   	 
      ArrayList<adminDto> list=dao.getAllMenus();
      SimpleDateFormat sdf=new SimpleDateFormat("yyyy-MM-dd");
      
   %>
   <body style="background-color: black;">

   <div style="background-color: white; width: 460px" align="center" class="product">
   
   <h3>ProjectKIOSK</h3>
   
   <button class="btn btn-warning" id="btn1">커피</button>&nbsp;
   <button class="btn btn-warning" id="btn2">스무디&프라페</button>&nbsp;
   <button class="btn btn-warning" id="btn3">에이드&주스</button>&nbsp;
	
   <table class="pone">
  
   	<%
 	
	for(int i=0;i<list.size();i++){
		adminDto dto = list.get(i);
		if(dto.getType().equals("pone")){
		%>
		
	<tr class="col-md-4">
		<td align="center">
		   <img src="../이미지/kiosk_img/<%=dto.getImage()%>"><br>
		   <b><%=dto.getName() %></b><br>
		   <b style="color: red;"><%=dto.getPrice()%>원</b>
   		</td>
   
	</tr>
   	<%}
 	}
   	%>
	
   </table>
   
   <table class="ptwo">
   <%
	for(int i=0;i<list.size();i++){
		adminDto dto = list.get(i);
		if(dto.getType().equals("ptwo") ){
		%>
   <tr class="col-md-4">
   		<td align="center">
   			<img src="../이미지/kiosk_img/<%=dto.getImage()%>"><br>
		   	<b><%=dto.getName() %></b><br>
		   	<b style="color: red;"><%=dto.getPrice()%>원</b>
   		</td>
   </tr>
   <%}
   }
   	%>
   
   </table>   
   
   <table class="pthree">
    <%
	for(int i=0;i<list.size();i++){
		adminDto dto = list.get(i);
		if(dto.getType().equals("pthree")){
		%>
   <tr class="col-md-4">
   		<td align="center">
   			<img src="../이미지/kiosk_img/<%=dto.getImage()%>"><br>
		   	<b><%=dto.getName() %></b><br>
		   	<b style="color: red;"><%=dto.getPrice()%>원</b>
   		</td>
   </tr>
   <%}
    }
   	%>

   </table>
   
   </div>   
   
 
   
   
   <div class="container" align="center" style="margin-left: 150px">
  <h2>Basic Modal Example</h2>
  <!-- Trigger the modal with a button -->
  <button type="button" class="btn btn-info btn-lg" data-toggle="modal" data-target="#myModal">Open Modal</button>

  <!-- Modal -->
  <div class="modal fade" id="myModal" role="dialog">
    <div class="modal-dialog">
    
      <!-- Modal content-->
      <div class="modal-content">
        <div class="modal-header">
          <button type="button" class="close" data-dismiss="modal">&times;</button>
          <h4 class="modal-title">Modal Header</h4>
        </div>
        <div class="modal-body">
          <form action="orderList()">
          	<table>
          		<tr>
          			<td></td>
          		</tr>
          	</table>
          </form>
        </div>
        <div class="modal-footer">
          <button type="button" class="btn btn-default" data-dismiss="modal">Close</button>
        </div>
      </div>
      
    </div>
  </div>
  
</div>
</body>
</html>
   
      
<script>
   $("#btn1").click(function () {
      
      $(".pone").show();
      $(".ptwo").hide();
      $(".pthree").hide();
      
   });
   
   $("#btn2").click(function () {
      
      $(".ptwo").show();
      $(".pone").hide();
      $(".pthree").hide();
      
   });
   
   $("#btn3").click(function () {
      
      $(".pthree").show();
      $(".pone").hide();
      $(".ptwo").hide();
         
   });
   
   $("img").click(function () {
      
      $("#myModal").modal();
   })
</script>
</body>
</html>