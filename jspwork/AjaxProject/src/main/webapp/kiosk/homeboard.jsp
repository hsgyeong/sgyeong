<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<>
<meta charset="utf-8">
<link href="https://fonts.googleapis.com/css2?family=East+Sea+Dokdo&family=Moirai+One&family=Nanum+Pen+Script&family=Orbit&display=swap" rel="stylesheet">
<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/css/bootstrap.min.css" rel="stylesheet">
<script src="https://code.jquery.com/jquery-3.7.0.js"></script>
<title>Insert title here</title>
<style>
   #coffee{
      cursor: pointer;
   }
</style>
<script>
   $(function(){
      
      //목록호출
      list();
      
      //커피카테고리 클릭시 커피메뉴나옴
      $(document).on("click","#coffee",function(){
         

         
         $("div.cmenu").show();
      })
   });
   
   
   
      function list(){
      
      $.ajax({
         
         type:"get",
         url:"list.jsp",
         dataType:"json",
         success:function(data){
            
            //alert(data.length);
            //제목출력
            var s="<table class='table table=bordered' style='width:700px'>";
               s+="<caption align='top'>Project KIOSK</caption>";
               s+="<tr class='table-info'>";
                  s+="<th width='60' id='coffee'>커피</th>";
                  s+="<th width='120'>스무디/프라페</th>"; //제목으로 들어가야 내용나옴
                  s+="<th width='120'>에이드/주스</th>";
                  s+="<th width='80'>티(Tea)</th>";
                  s+="<th width='80'>디저트</th>";
                  s+="</tr>";
                  
                  if(data.length==0){
                  s+="<tr>";
                  s+="<td colspan='4' align='center'>";
                  s+="<b>주문내역이 없습니다</b>";
                  s+="</td></tr>";
                  }else{
                     //데이터가 1개 이상인경우
                     $.each(data,function(i,item){
                        s+="<tr>";
                        s+="<td align='center'>"+(i+1)+"</td>";
                        s+="<td>";
                        s+="<span num='"+item.num+"' class='detail'>"+item.name+"</span> ";
                        s+="</td>";
                        s+="<td>"+item.imgage+"</td>";
                        s+="<td>"+item.price+"</td>";
                        
                        s+="</tr>";
                     })
                     
                  }
               s+="</table>";
               $("#board").html(s);
         }
      })
   }
</script>
</head>
<body>
   <body>
   <div class="cmenu">   
      <form>   
         <table class='table table-bordered' style='width:700px'>
               <caption align='top'>Project KIOSK</caption>
               <tr class='table-info'>
                  <th width='60' id='coffee'>커피</th>
                  <th width='120'>스무디/프라페</th>
                  <th width='120'>에이드/주스</th>
                  <th width='80'>티(Tea)</th>
                  </tr>
         </table>
         
         <table></table>
            <tr>
               <th>작성자</th>
               <td>
                  <input type="text" id="writer" style="width: 120px;"
                  class="form-control">
               </td>
            </tr>
         
            <tr>
               <th>아메리카노</th>
               <th>카페라떼</th>
               <td>
               </td>
            </tr>
            <tr>
               <td colspan="2" align="center">
                  <textarea style="width: 290px; height: 80px;"
                  id="story" class="form-control"></textarea>
               </td>
            </tr>
            <tr>
               <td colspan="2" align="center">
                  <button type="button" class="btn btn-danger" 
                  id="btnadd">주문완료</button>
               </td>
            </tr>
         </table>
      </form>
   </div>
   
      
   

</body>
</html>