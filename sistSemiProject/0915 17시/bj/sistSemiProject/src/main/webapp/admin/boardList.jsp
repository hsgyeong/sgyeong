<%@page import="java.text.SimpleDateFormat"%>
<%@page import="data.dao.AdminBoardDao"%>
<%@page import="data.dto.AdminBoardDto"%>
<%@page import="java.util.List"%>
<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.1/dist/css/bootstrap.min.css" rel="stylesheet">
<script src="https://code.jquery.com/jquery-3.7.0.js"></script>
<link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.10.5/font/bootstrap-icons.css">
<!DOCTYPE html>
<html>
<head>
<meta charset="EUC-KR">
<title>������ ����</title>
</head>
<style>
   .sidebar {
    height: 800px;
    width: 220px;
    position: fixed;
    top: 100px;
    left: -250px; /* �ʱ⿡�� ȭ�� �ۿ� ��ġ */
    background-color: wheat;
    transition: left 0.3s ease;
    z-index: 999; /* �� �κ��� �߰��ؼ� sidebar�� �ٸ� ��� ���� ��Ÿ������ ���� */
}

        /* ���̵�� ��ũ ��Ÿ�� (���콺 ȣ�� ��) */
.sidebar a:hover {
            background-color: #555;
        }

        /* ���� �κ� ��Ÿ�� */
.content {
            margin-left: 0; /* ���̵�ٰ� ���� �� ���� �κ��� �ű�� ���� ���� */
            padding: 20px;
        }

        /* ���̵�� ���� �� �ִϸ��̼� */
.sidebar.open {
   left: 0;
        }
.a {
	margin-left:360px;
	border : 0px solid black;
	display:flex;
	margin-top:100px;
}
#tb1 {
	width:800px;
}

#a1 {
}
</style>
<%
String root= request.getContextPath();
String myid=(String)session.getAttribute("myid");
AdminBoardDao AdminBoardDao = new AdminBoardDao();

	int totalCount = AdminBoardDao.getTotalCount(); //��ü ����
   int totalPage; //�� ������ ��
   int startPage; //�� ������ ������ ����������
   int endPage; //�� ������ ������ ��������
   int startNum; //db���� ������ ���� ���۹�ȣ(mysql�� ù���� 0, oracle�� 1)
   int perPage = 5; //���������� ������ �� ����
   int perBlock = 5; //�� ���� ������ ������ ����
   int currentPage; //����������
   int no; //�� ������ �� ����� ���۹�ȣ

   //���������� �б�(�� null�ϰ��� 1�������� �ش�)����� �ؾ��ϹǷ� int�� ����ȯ
   if (request.getParameter("currentPage") == null || request.getParameter("currentPage").equals("null"))
      currentPage = 1;
   else
      //getParameter�� ��ȯ���� String�̶� int�� ����ȯ
      currentPage = Integer.parseInt(request.getParameter("currentPage"));

   //�� �������� ���ϱ�
   //�� ���� ����/�� �������� ������ ������ ����   ex)7/5=2������
   totalPage = totalCount / perPage + (totalCount % perPage == 0 ? 0 : 1);

   //�� ���� �������� ����������
   //perBlock=5�ϰ��� ���������� 1~5 ����:1 ��:5
   //���������� 13      ����:11  ��:15
   startPage = (currentPage - 1) / perBlock * perBlock + 1;

   //�� ���� ���̴� ������������
   //ex) ���������� 6������, perblock 5�ϰ�� - endPage:10
   endPage = startPage + perBlock - 1;

   //�� �������� 23�ϰ�� ���������� 25�� �ƴ϶� 23�̴�
   if (endPage > totalPage)
      endPage = totalPage;

   //�� ���������� ������ ���۹�ȣ
   //1������: 0,2������:5, 3������:10...0���� ���� perPage 5�ϰ��
   startNum = (currentPage - 1) * perPage;

   //���������� ����� ���۹�ȣ ���ϱ�
   //ex) �� �۰����� 23�̸� 1������ 23, 2������ 18, 3������ 13...
   no = totalCount - (currentPage - 1) * perPage;

   //���������� ������ �۸� ��������
   List<AdminBoardDto> list = AdminBoardDao.getPagingList(startNum, perPage);

	SimpleDateFormat sdf = new SimpleDateFormat("yyyy�� MM�� dd��");

   //������ ������ ���� �� ����� ���������� ���´� -> �ذ�: �̹��������� �̵�
   if (list.size() == 0 && currentPage != 1) {
   %>
   <script type="text/javascript">
         location.href="index.jsp?main=myCourse/myCourseList.jsp?currentPage=<%=currentPage - 1%>;
      </script>
   <%
   }


   
%>

<body>
&nbsp;&nbsp;<button id="a1" onclick="toggleSidebar()"><i class="bi bi-menu-app" style="font-size:20px; border:none;"></i></button><br><br>

<div class="a">
<div class="b1">
<table class="table" id="tb1">
<tr>
<td><b style="float:left; font-size:22px;"><</b></td>
<td align="center"><b style="align:center; font-size:24px;">&nbsp;&nbsp;���ǻ��� ����Ʈ</b></td>
<td><b style="float:right; font-size:22px;">></b>
</tr>

<tr>
<td width="80">
<b>��ü</b>
</td>
<td><b>��������</b></td>
<td></td>
</tr>
</table><br>

<input type="hidden" name="id" value="<%=myid %>">

<table class="table table-bordered" style="width:800px;">
<caption align="top"><b>�� <%=totalCount %>��</b></caption>

   <%for(int i=0; i<list.size(); i++){ 
      AdminBoardDto adminboardDto = list.get(i);   %>
   <tr class="tourList" style="height:25px">
   	  <td width="50px" style="algin:center;"><input type="checkbox" class="chk"></td>
      <td style="width:700px;">
      <b class="subject" style="font-size:24px;">
      <%-- <a href="index.jsp?main=admin/detailPage.jsp?num=<%=adminboardDto.getNum() %>&currentPage=<%=currentPage%>&id=<%=myid %>"> --%>
      ���� : <%=adminboardDto.getSubject()%></b><br>
      <p style="font-size:12px;"id="writeday" disabled>�ۼ���¥ : <%=sdf.format(adminboardDto.getWriteday()) %></p>
      </td>
   </tr>
<%} %>
</table>





<!-- ��������ȣ ��� -->
   <div>
   <button type="button" style="float:right;">�۾���</button>
   <button type="button">���</button>
      <ul class="pagination justify-content-center">
	
         <%
         //����
         if (startPage > 1) {
         %>
         <li class="page-item"><a class="page-link"
            href="index.jsp?main=admin/boardList.jsp?currentPage=<%=startPage - perBlock%>"><<</a></li>
         <%
         } else {
         %>
         <li class="page-item"><a class="page-link"
            href="index.jsp?main=admin/boardList.jsp?currentPage=<%=startPage%>"><<</a></li>

         <%
         }
         %>

         <%
         if (currentPage > 1) {
         %>
         <li class="page-item"><a class="page-link"
            href="index.jsp?main=admin/boardList.jsp?currentPage=<%=currentPage - 1%>"><</a></li>

         <%
         } else {
         %>
         <li class="page-item"><a class="page-link"
            href="index.jsp?main=admin/boardList.jsp?currentPage=<%=startPage%>"><</a></li>

         <%
         }
         %>





         <%
         for (int pp = startPage; pp <= endPage; pp++) {
            if (pp == currentPage) {
         %>
         <li class="page-item active"><a class="page-link"
            href="index.jsp?main=admin/boardList.jsp?currentPage=<%=pp%>"><%=pp%></a></li>
         <%
         } else {
         %>
         <li class="page-item"><a class="page-link"
            href="index.jsp?main=admin/boardList.jsp?currentPage=<%=pp%>"><%=pp%></a></li>
         <%
         }
         }
         %>



         <!-- ������ư -->
         <%
         if (currentPage < totalPage) {
         %>
         <li class="page-item"><a class="page-link"
            href="index.jsp?main=admin/boardList.jsp?currentPage=<%=currentPage + 1%>">></a></li>

         <%
         } else {
         %>
         <li class="page-item"><a class="page-link"
            href="index.jsp?main=admin/boardList.jsp?currentPage=<%=endPage%>">></a></li>

         <%
         }
         %>

         <%
         if (totalPage > (endPage + 1)) {
         %>
         <li class="page-item"><a class="page-link"
            href="index.jsp?main=admin/boardList.jsp?currentPage=<%=endPage + 1%>">>></a></li>
         <%
         } else {
         %>
         <li class="page-item"><a class="page-link"
            href="index.jsp?main=admin/boardList.jsp?currentPage=<%=endPage%>">>></a></li>

         <%
         }
         %>
      </ul>
   </div>
   </div>
    <div id="detail1">
   
   
   </div>
</div>

<div class="sidebar open">
	<button type="button" style="margin-left:15px; margin-top:20px; border:none;" onclick="toggleSidebar()">
	<i class="bi bi-menu-app" style="font-size:20px;"></i></button>
	<br><br>
    &nbsp;&nbsp;<a href="index.jsp">&nbsp;<i class="bi bi-house-door"></i>&nbsp;&nbsp;&nbsp;&nbsp;<b>Ȩ</b></a><br><br>
    &nbsp;&nbsp;<a href="index.jsp?main=myPage/mypage.jsp">&nbsp;<i class="bi bi-person-lines-fill"></i>&nbsp;&nbsp;&nbsp;&nbsp;<b>��������</b></a><br><br>
    &nbsp;&nbsp;<a href="index.jsp?main=myPage/secure.jsp">&nbsp;<i class="bi bi-shield-shaded"></i>&nbsp;&nbsp;&nbsp;&nbsp;<b>����</b></a><br><br>
    &nbsp;&nbsp;<a href="index.jsp?main=admin/adminBoard.jsp">&nbsp;<i class="bi bi-telephone-outbound-fill"></i>&nbsp;&nbsp;&nbsp;<b>������</b></a>
    <!-- �α��λ��¸� �α׾ƿ� , �α׾ƿ� ���¸� �α������� ���̰��ϱ� 0905 ����� -->
    <br><br><br><br><br><br><br><br><br><br>
    &nbsp;&nbsp;<a href="index.jsp?main=login/logoutAction.jsp">&nbsp;<i class="bi bi-door-closed-fill"></i>&nbsp;&nbsp;&nbsp;�α׾ƿ�</a><br>
    
    <%
		// ������ �α����ϸ� �޴��� �ϳ� �� �߰� ����� 0905 �����
		AdminBoardDto dto = new AdminBoardDto();
    %>
</div>



<script>
    // ���̵�� ����/�ݱ� �Լ�
    function toggleSidebar() {
        var sidebar = document.querySelector('.sidebar');
        sidebar.classList.toggle('open');
    }
    
    var num = '<%=dto.getNum()%>';
    var currentpage = '<%=currentPage %>';
    var id = '<%=myid %>';
    
    $(document).on('click', '.subject', function () {
        $.ajax({
            url: 'admin/detailPage.jsp',
            type: 'POST',
            data: { num: num, currentpage: currentpage, id: id },
            dataType: 'html', // ������ ������ HTML
            success: function (response) {
                // AJAX ��û�� �����ϸ� ������ questionContent div�� ����
                if ($('#detail1').html() == "") {
                    $('#detail1').html(response);
                } else {
                    $('#detail1').html("");
                }
            },
            error: function () {
                alert('�����͸� �ҷ����� �� �����߽��ϴ�.');
            }
        });
    });
</script>

</body>
</html>