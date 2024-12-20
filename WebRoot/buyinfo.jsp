<%@ page language="java" import="java.util.*" pageEncoding="gb2312"%>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
  <head>
    <base href="<%=basePath%>">
    
    <title>My JSP 'buyinfo.jsp' starting page</title>
    
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
    <form action="BuyServlet" name="form1" method="post">
      <table width="400" border="0" align="center">
        <tr>
          <td>收货人：</td>
          <td><input name="receivename" type="text" class="ipt-t" id="receivename" /></td>
        </tr>
        <tr>
          <td>联系电话：</td>
          <td><input name="tele" type="text" class="ipt-t" id="tele" /></td>
        </tr>
        <tr>
          <td>邮编：</td>
          <td><input name="zipcode" type="text" class="ipt-t" id="zipcode" /></td>
        </tr>
        <tr>
          <td>收货地址：</td>
          <td>
            <select name="address" id="address">
              <option value="浙江" >浙江</option>
              <option value="江苏" selected>江苏</option>
              <option value="山东">山东</option>
              <option value="北京">北京</option>
              <option value="上海">上海</option>
              <option value="天津">天津</option>
            </select>
          </td>
        </tr>
        <tr>
          <td>付款方式：</td>
          <td>
            <select name="paymode" id="paymode">
              <option value="货到付款" >货到付款</option>
              <option value="线上付款" selected>线上付款</option>
            </select>
          </td>
        </tr>
        <tr>
          <td colspan="2" align="center">
            <input name="submit" type="submit" id="submit" value="提交"/>
            <input name="reset" type="reset" id="reset" value="重置" />
          </td>
        </tr>
      </table>
      <%
      if(session.getAttribute("error") != null) {
         out.println(session.getAttribute("error"));
         session.setAttribute("error", null);
      }
      %>
    </form>
  </body>
</html>
