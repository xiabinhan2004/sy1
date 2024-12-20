<%@ page language="java" import="java.util.*,java.sql.*,bean.*" pageEncoding="gb2312"%>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
  <head>
    <base href="<%=basePath%>">
    
    <title>My JSP 'showGoods.jsp' starting page</title>
    
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
      String sql="select*from goods";
      ResultSet rs=db.executeQuery(sql);
    
     %>
     <table>
     <tr><td>商品号</td><td>商品名称</td><td>商品价格</td><td>商品图片</td><td>商品操作</td></tr>
    <%
      
      while(rs.next())
      {
       String deleteURL="deleteGoods.jsp?cid="+rs.getString(1);
       String modifyURL="modifyGoods.jsp?cid="+rs.getString(1);
     %>
       <tr>
          
          <td><%=rs.getString(1)%></td>
          <td><%=rs.getString(2)%></td>
          <td><%=rs.getString(4)%></td>
          <td><img src="<%=rs.getString(6)%>" /></td>
          <td><a href="<%=deleteURL%>">删除</a><a href="<%=modifyURL%>">修改</a></td>      
       </tr>
       <%
       }
        %>
   <div id="back"><a href="c_manager.jsp">返回商品管理</a></div>
    </table>
  </body>
</html>
