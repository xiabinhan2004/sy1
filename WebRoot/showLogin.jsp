<%@ page language="java" import="java.util.*,java.sql.*,bean.*" pageEncoding="gb2312"%>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
  <head>
    <base href="<%=basePath%>">
    
    <title>My JSP 'showLogin.jsp' starting page</title>
    
	<meta http-equiv="pragma" content="no-cache">
	<meta http-equiv="cache-control" content="no-cache">
	<meta http-equiv="expires" content="0">    
	<meta http-equiv="keywords" content="keyword1,keyword2,keyword3">
	<meta http-equiv="description" content="This is my page">
	<!--
	<link rel="stylesheet" type="text/css" href="styles.css">
	-->

  </head>
  
  <body>
	<%
	if(session.getAttribute("username") != null) {
	    String username = session.getAttribute("username").toString();
	    DB db = new DB();
	    String sql = "SELECT * FROM user WHERE username = '" + username + "'"; // 根据用户名查询
	    ResultSet rs = db.executeQuery(sql);
	%>
	  <%
	  if(session.getAttribute("ModifyMessage") != null) {
	      out.println(session.getAttribute("ModifyMessage"));
	      session.removeAttribute("ModifyMessage");
	  }
	  %>
	  
	  <table>
	      <tr><td>序号</td></tr>
	  <%
	  int i = 1;
	  while(rs.next()) {
	      String deleteURL = "deleteLogin.jsp?id=" + rs.getInt(1);
	      String modifyURL = "modifyLogin.jsp?id=" + rs.getInt(1);
	  %>
	      <tr>
	          <td><%=i%></td>
	          <td><%=rs.getString(2)%></td>
	          <td><%=rs.getString(3)%></td>
	          <td><%=rs.getString(4)%></td>
	          <td><a href="<%=deleteURL%>">删除</a><a href="<%=modifyURL%>">修改</a></td>
	      </tr>
	  <%
	        i++;
	    }
	} else {
	    response.sendRedirect("userinfo.jsp");
	}
	%>
    </table>
    <div id="back"><a href="userinfo.jsp">返回个人主页</a></div>
</body>
</html>


