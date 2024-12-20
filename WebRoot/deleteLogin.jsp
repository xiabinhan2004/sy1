<%@ page language="java" import="java.util.*,java.sql.*,bean.*" pageEncoding="gb2312"%>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
  <head>
    <base href="<%=basePath%>">
    
    <title>My JSP 'deleteLogin.jsp' starting page</title>
    
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
       DB db=new DB();
       String sql = "delete from user where id="+request.getParameter("id");
       boolean i=db.executeUpdate(sql);
        if(i)
          {
            session.setAttribute("message","É¾³ý³É¹¦!");
            response.sendRedirect("login.jsp");
            
          }
        else
          {
            session.setAttribute("message","É¾³ýÊ§°Ü!");
            response.sendRedirect("showLogin.jsp");
          }
     %>
  </body>
</html>
