<%@ page language="java" import="java.util.*,java.sql.*" pageEncoding="gb2312"%>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
  <head>
    <base href="<%=basePath%>">
    
    <title>My JSP 'c_add.jsp' starting page</title>
    
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
    
    <form action="AddGoodsServlet" method="post"  name="form1" enctype="multipart/form-data">
      <table border="0" align="center">
        <tr>
          <td height="40">商品编号：</td>
          <td> <input name="cid" type="text" class="cbox1" id="cid" value="g008"></td>
        </tr>
        <tr>
          <td height="40">商品名称：</td>
          <td> <input name="cname" type="text" class="cbox1" id="cname" ></td>
        </tr>
        <tr>
          <td height="40">商品数量：</td>
          <td> <input name="cnumber" type="text" class="cbox1" id="cnumber" ></td>
        </tr>
        <tr>
          <td height="40">商品价格：</td>
          <td> <input name="cprice" type="text" class="cbox1" id="cprice" ></td>
        </tr>
        <tr>
          <td height="40">商品简介：</td>
          <td> <textarea name="cintro" cols=20 rows=8></textarea></td>
        </tr>
        
        
<tr>  <td>商品图片：</td>
          <td> <input name="cimage" type="file" id="cimage">   </td>
        </tr>
        <tr>  <td colspan="2" align="center">
            <input type="submit" name="Submit" value="提交">
            <input type="reset" name="Submit2" value="重置">  </td> </tr>
      </table>
</form>
    
    
  </body>
</html>
