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
  
  
    <p><a href="showLogin.jsp">������Ϣ�޸�</a></p>
    <p><a href="showUser.jsp">��ʾ�û�</a></p>
    <p><a href="cart.jsp">�ҵĹ��ﳵ</a></p>
    <p><a href="showGoods.jsp">��Ʒ��ʾ</a></p>
    <p><a href="GetAllGoodsServlet">����</a></p>
    <p><a href="c_add.jsp">�����Ʒ</a></p>
    <p><a href="showMyOrder.jsp">�ҵĶ���</a></p>
    <p><a href="LogoutServlet">ע��</a></p>

  </body>
</html>
