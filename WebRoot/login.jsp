<%@ page language="java" import="java.util.*" pageEncoding="gb2312"%>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
  <head>
    <base href="<%=basePath%>">
    
    <title>My JSP 'login.jsp' starting page</title>
    
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
    <form id="login" name="login" method="post" action="LoginServlet">
 <p>�û�����
      <input type="text" name="username" class="ipt-t"  />
  ��&nbsp; �룺
      <input type="password" name="userpass" class="ipt-t" />
 </p>
 
 <%
       if(session.getAttribute("message")!=null)
      {
         out.println(session.getAttribute("message"));
         
      }
      %>
 
 <p>&nbsp;
   <input type="submit" name="submit" value="�ύ" />
    <input type="reset" value="����" name="reset" />
  </p>
</form>

<a href="reg.jsp">��Ҫע��</a>


  </body>
</html>
