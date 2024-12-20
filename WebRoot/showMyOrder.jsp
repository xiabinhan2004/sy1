<%@ page language="java" import="java.util.*,java.sql.*,bean.*" pageEncoding="gb2312"%>
	<%
	String path = request.getContextPath();
	String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
	%>
	
	<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
	<html>
	  <head>
	    <base href="<%=basePath%>">
	    
	    <title>My JSP 'showMyOrder.jsp' starting page</title>
	    
		<meta http-equiv="pragma" content="no-cache">
		<meta http-equiv="cache-control" content="no-cache">
		<meta http-equiv="expires" content="0">    
		<meta http-equiv="keywords" content="keyword1,keyword2,keyword3">
		<meta http-equiv="description" content="This is my page">
	
	  </head>
	  
	  <body>
		<%
		if(session.getAttribute("username") != null) {
		    String username = session.getAttribute("username").toString();
		    DB db = new DB();
		    String sql = "SELECT * FROM ordertable WHERE username = '" + username + "'"; // 根据用户名查询
		    ResultSet rs = db.executeQuery(sql);
		%>
		  
		  <table>
		      <tr>
		      	  <td>序号</td>
			      <td>订单号</td>
			      <td>买家</td>
			      <td>购买时间</td>
			      <td>发货状态</td>
			      <td>收货地址</td>
			      <td>收件人</td>
			      <td>联系方式</td>
			      <td>邮编</td>
			      <td>付款方式</td>
		      </tr>
		  <%
		  int i = 1;
		  while(rs.next()) {
		      String deleteURL = "deleteinfo.jsp?id=" + rs.getDouble(1); // 使用 getDouble() 方法
		  %>
		      <tr>
		          <td><%=i%></td>
		          <td><%=rs.getString(1)%></td>
		          <td><%=rs.getString(2)%></td>
		          <td><%=rs.getString(3)%></td>
		          <td><%=rs.getString(4)%></td>
		          <td><%=rs.getString(5)%></td>
		          <td><%=rs.getString(6)%></td>
		          <td><%=rs.getString(7)%></td>
		          <td><%=rs.getString(8)%></td>
		          <td><%=rs.getString(9)%></td>
		          <td><a href="<%=deleteURL%>">删除</a></td>
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
