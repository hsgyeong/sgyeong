/*
 * Generated by the Jasper component of Apache Tomcat
 * Version: Apache Tomcat/9.0.80
 * Generated at: 2023-10-10 08:16:15 UTC
 * Note: The last modified time of this file was set to
 *       the last modified time of the source file after
 *       generation to assist with modification tracking.
 */
package org.apache.jsp.myteam;

import javax.servlet.*;
import javax.servlet.http.*;
import javax.servlet.jsp.*;
import model.sinsang.SinsangDto;
import model.myteam.TeamDto;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import model.myteam.TeamDao;

public final class list_jsp extends org.apache.jasper.runtime.HttpJspBase
    implements org.apache.jasper.runtime.JspSourceDependent,
                 org.apache.jasper.runtime.JspSourceImports {

  private static final javax.servlet.jsp.JspFactory _jspxFactory =
          javax.servlet.jsp.JspFactory.getDefaultFactory();

  private static java.util.Map<java.lang.String,java.lang.Long> _jspx_dependants;

  private static final java.util.Set<java.lang.String> _jspx_imports_packages;

  private static final java.util.Set<java.lang.String> _jspx_imports_classes;

  static {
    _jspx_imports_packages = new java.util.HashSet<>();
    _jspx_imports_packages.add("javax.servlet");
    _jspx_imports_packages.add("javax.servlet.http");
    _jspx_imports_packages.add("javax.servlet.jsp");
    _jspx_imports_classes = new java.util.HashSet<>();
    _jspx_imports_classes.add("model.myteam.TeamDto");
    _jspx_imports_classes.add("model.sinsang.SinsangDto");
    _jspx_imports_classes.add("model.myteam.TeamDao");
    _jspx_imports_classes.add("java.text.SimpleDateFormat");
    _jspx_imports_classes.add("java.util.ArrayList");
  }

  private volatile javax.el.ExpressionFactory _el_expressionfactory;
  private volatile org.apache.tomcat.InstanceManager _jsp_instancemanager;

  public java.util.Map<java.lang.String,java.lang.Long> getDependants() {
    return _jspx_dependants;
  }

  public java.util.Set<java.lang.String> getPackageImports() {
    return _jspx_imports_packages;
  }

  public java.util.Set<java.lang.String> getClassImports() {
    return _jspx_imports_classes;
  }

  public javax.el.ExpressionFactory _jsp_getExpressionFactory() {
    if (_el_expressionfactory == null) {
      synchronized (this) {
        if (_el_expressionfactory == null) {
          _el_expressionfactory = _jspxFactory.getJspApplicationContext(getServletConfig().getServletContext()).getExpressionFactory();
        }
      }
    }
    return _el_expressionfactory;
  }

  public org.apache.tomcat.InstanceManager _jsp_getInstanceManager() {
    if (_jsp_instancemanager == null) {
      synchronized (this) {
        if (_jsp_instancemanager == null) {
          _jsp_instancemanager = org.apache.jasper.runtime.InstanceManagerFactory.getInstanceManager(getServletConfig());
        }
      }
    }
    return _jsp_instancemanager;
  }

  public void _jspInit() {
  }

  public void _jspDestroy() {
  }

  public void _jspService(final javax.servlet.http.HttpServletRequest request, final javax.servlet.http.HttpServletResponse response)
      throws java.io.IOException, javax.servlet.ServletException {

    if (!javax.servlet.DispatcherType.ERROR.equals(request.getDispatcherType())) {
      final java.lang.String _jspx_method = request.getMethod();
      if ("OPTIONS".equals(_jspx_method)) {
        response.setHeader("Allow","GET, HEAD, POST, OPTIONS");
        return;
      }
      if (!"GET".equals(_jspx_method) && !"POST".equals(_jspx_method) && !"HEAD".equals(_jspx_method)) {
        response.setHeader("Allow","GET, HEAD, POST, OPTIONS");
        response.sendError(HttpServletResponse.SC_METHOD_NOT_ALLOWED, "JSP들은 오직 GET, POST 또는 HEAD 메소드만을 허용합니다. Jasper는 OPTIONS 메소드 또한 허용합니다.");
        return;
      }
    }

    final javax.servlet.jsp.PageContext pageContext;
    javax.servlet.http.HttpSession session = null;
    final javax.servlet.ServletContext application;
    final javax.servlet.ServletConfig config;
    javax.servlet.jsp.JspWriter out = null;
    final java.lang.Object page = this;
    javax.servlet.jsp.JspWriter _jspx_out = null;
    javax.servlet.jsp.PageContext _jspx_page_context = null;


    try {
      response.setContentType("text/html; charset=UTF-8");
      pageContext = _jspxFactory.getPageContext(this, request, response,
      			null, true, 8192, true);
      _jspx_page_context = pageContext;
      application = pageContext.getServletContext();
      config = pageContext.getServletConfig();
      session = pageContext.getSession();
      out = pageContext.getOut();
      _jspx_out = out;

      out.write("\n");
      out.write("\n");
      out.write("\n");
      out.write("\n");
      out.write("\n");
      out.write("\n");
      out.write("<!DOCTYPE html>\n");
      out.write("<html>\n");
      out.write("<head>\n");
      out.write("<meta charset=\"UTF-8\">\n");
      out.write("<link\n");
      out.write("	href=\"https://fonts.googleapis.com/css2?family=Cute+Font&family=Dongle:wght@300&family=Gamja+Flower&family=Gowun+Batang&family=Gowun+Dodum&family=Hi+Melody&family=Nanum+Gothic&family=Nanum+Gothic+Coding&family=Nanum+Pen+Script&family=Poor+Story&family=Sunflower:wght@300&display=swap\"\n");
      out.write("	rel=\"stylesheet\">\n");
      out.write("<link\n");
      out.write("	href=\"https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/css/bootstrap.min.css\"\n");
      out.write("	rel=\"stylesheet\">\n");
      out.write("<script src=\"https://code.jquery.com/jquery-3.7.0.js\"></script>\n");
      out.write("<title>Insert title here</title>\n");
      out.write("<script>\n");
      out.write("function confirmDelete(num) {  							/* confirmDelete 함수정의 매개변수 'num'은 삭제할 팀의 number  */\n");
      out.write("    var result = confirm(\"정말 삭제하시겠습니까?\");			/* 메세지 '정말 삭제하시겠습니까?' 클릭 > 확인, 취소 버튼 누른 결과를 'result'변수에 저장 */\n");
      out.write("    if (result) {											/* 확인 버튼을 누른 경우 teamdelete.jsp 페이지로 이동하면서 해당 팀의 번호를 쿼리 문자열로 전달 */	\n");
      out.write("        location.href = \"teamdelete.jsp?num=\" + num;\n");
      out.write("        \n");
      out.write("        alert(\"삭제되었습니다\")								/* 확인 버튼을 누른 경우 경고창  */\n");
      out.write("    }else\n");
      out.write("    	alert(\"취소되었습니다\")								/* 취소 버튼을 누른 경우 경고창 */\n");
      out.write("}\n");
      out.write("\n");
      out.write("</script>\n");
      out.write("</head>\n");

TeamDao dao = new TeamDao();
ArrayList<TeamDto> list = dao.getAllMyTeams();
SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd HH:mm");

      out.write("\n");
      out.write("<body>\n");
      out.write("\n");
      out.write("	<a href=\"addForm.jsp\">팀원추가</a>\n");
      out.write("	<br>\n");
      out.write("	<table class=\"table table-bordered\" style=\"width: 800px;\">\n");
      out.write("		<tr align=\"center\" class=\"table-warning\">\n");
      out.write("			<th width=\"60\">번호</th>\n");
      out.write("			<th width=\"120\">이름</th>\n");
      out.write("			<th width=\"100\">운전면허</th>\n");
      out.write("			<th width=\"260\">주소</th>\n");
      out.write("			<th width=\"160\">작성일</th>\n");
      out.write("			\n");
      out.write("			\n");
      out.write("			\n");
      out.write("			\n");
      out.write("			\n");
      out.write("			\n");
      out.write("			<th width=\"120\">수정|삭제</th>\n");
      out.write("		</tr>\n");
      out.write("\n");
      out.write("		");

		for (int i = 0; i < list.size(); i++) {
			TeamDto dto = list.get(i); //i번지의 dto를 꺼낸다
		
      out.write("\n");
      out.write("		<tr>\n");
      out.write("			<td align=\"center\">");
      out.print(i + 1);
      out.write("</td>\n");
      out.write("			<td align=\"center\">");
      out.print(dto.getName());
      out.write("</td>\n");
      out.write("			<td align=\"center\">");
      out.print(dto.getDriver());
      out.write("</td>\n");
      out.write("			<td>");
      out.print(dto.getAddr());
      out.write("</td>\n");
      out.write("			<td>");
      out.print(sdf.format(dto.getWriteday()));
      out.write("</td>\n");
      out.write("			<td>\n");
      out.write("			<button type=\"button\" class=\"btn btn-outline-info btn-sm\"\n");
      out.write("			onclick=\"location.href='updateForm.jsp?num=");
      out.print(dto.getNum());
      out.write("'\">수정</button>\n");
      out.write("			<button type=\"button\" class=\"btn btn-outline-danger btn-sm\"\n");
      out.write("			onclick=\"confirmDelete(");
      out.print(dto.getNum());
      out.write(")'\">삭제</button>\n");
      out.write("			</td>\n");
      out.write("		</tr>\n");
      out.write("\n");
      out.write("		");
}

      out.write("\n");
      out.write("	</table>\n");
      out.write("</body>\n");
      out.write("</html>");
    } catch (java.lang.Throwable t) {
      if (!(t instanceof javax.servlet.jsp.SkipPageException)){
        out = _jspx_out;
        if (out != null && out.getBufferSize() != 0)
          try {
            if (response.isCommitted()) {
              out.flush();
            } else {
              out.clearBuffer();
            }
          } catch (java.io.IOException e) {}
        if (_jspx_page_context != null) _jspx_page_context.handlePageException(t);
        else throw new ServletException(t);
      }
    } finally {
      _jspxFactory.releasePageContext(_jspx_page_context);
    }
  }
}