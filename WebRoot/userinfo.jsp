<%@ page language="java" import="java.util.*" pageEncoding="gb2312"%>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
  <head>
    <base href="<%=basePath%>">
    
    <title>My JSP 'userinfo.jsp' starting page</title>
    
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
  
  <%=session.getAttribute("message") %>
  
  
    <p><a href="showLogin.jsp">个人信息修改</a></p>
    <p><a href="showUser.jsp">显示用户</a></p>
    <p><a href="cart.jsp">我的购物车</a></p>
    <p><a href="showGoods.jsp">商品显示</a></p>
    <p><a href="GetAllGoodsServlet">购物</a></p>
    <p><a href="c_add.jsp">添加商品</a></p>
    <p><a href="showMyOrder.jsp">我的订单</a></p>
    <p><a href="LogoutServlet">注销</a></p>

  </body>
</html>
