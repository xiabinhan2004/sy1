<%@ page language="java" import="java.util.*,java.sql.*,bean.*" pageEncoding="gb2312"%>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
  <head>
    <base href="<%=basePath%>">
    
    <title>My JSP 'showUser.jsp' starting page</title>
    
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
    if(session.getAttribute("username")!=null)
    {
      DB db=new DB();
      String sql="select * from user";
      ResultSet rs=db.executeQuery(sql);
    %>
    <%
       if(session.getAttribute("ModifyMessage")!=null)
      {
         out.println(session.getAttribute("ModifyMessage"));
         session.removeAttribute("ModifyMessage");
      }
      %>
      
      <table>
      <tr><td>���</td></tr>
    <%
      int i=1;
      while(rs.next())
      {
       String deleteURL="deleteUser.jsp?id="+rs.getInt(1);
       String modifyURL="modifyUser.jsp?id="+rs.getInt(1);
     %>
       <tr>
          <td><%=i%></td>
          <td><%=rs.getString(2)%></td>
          <td><%=rs.getString(3)%></td>
          <td><%=rs.getString(4)%></td>
          <td><%=rs.getString(5)%></td>
          <td><%=rs.getString(6)%></td>
          <td><a href="<%=deleteURL%>">ɾ��</a><a href="<%=modifyURL%>">�޸�</a></td>
       </tr>
       
    <%    
       i++;
      }
    
    }
    else
    {
      response.sendRedirect("login.jsp");
    }
    %>
    </table>
    <div id="back"><a href="userinfo.jsp">���ظ�����ҳ</a></div>
  </body>
</html>
