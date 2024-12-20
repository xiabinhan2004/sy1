<%@ page language="java" import="java.util.*" pageEncoding="gb2312"%>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
  <head>
    <base href="<%=basePath%>">
    
    <title>My JSP 'reg.jsp' starting page</title>
    
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
    <form action="RegServlet" name="form1" method="post">
  <table width="400" border="0" align="center">
    <tr>
      <td>用户名：</td>
      <td><input name="username" type="text" class="ipt-t" id="username" /></td>
    </tr>
    <tr>
      <td>密码：</td>
      <td><input name="userpass" type="password" class="ipt-t" id="userpass" /></td>
    </tr>
    <tr>
      <td>重复密码：</td>
      <td><input name="reuserpass" type="password" class="ipt-t" id="reuserpass" /></td>
    </tr>
    <tr>
      <td>性别：</td>
      <td><label>
      <input type="radio" name="gender" value="男" id="gender"  />
男</label>
        <label>
        <input type="radio" name="gender" value="女" id="gender"  />
女</label></td>
    </tr>
    
    <tr><td valign="top">出生日期：<br /></td>
    <td valign="top"><input type="text" name="birthdate" class="ipt-t" /></td></tr>
    <tr>
      <td>籍贯：</td>
      <td><label>
        <select name="nativeplace" id="nativeplace">
          <option value="浙江" >浙江</option>
          <option value="江苏" selected>江苏</option>
          <option value="山东">山东</option>
          <option value="北京">北京</option>
          <option value="上海">上海</option>
          <option value="天津">天津</option>
        </select>
      </label></td>
    </tr>
    <tr>
      <td colspan="2" align="center"><label>
        <input name="submit" type="submit" id="submit" value="提交"/>
        <input name="reset" type="reset" id="reset" value="重置" />
      </label></td>
      </tr>
  </table>
  <%
  
      if(session.getAttribute("error")!=null)
      {
         out.println(session.getAttribute("error"));
         session.setAttribute("error",null);
      }
     
     
   %>
  
  
  
  
  
  </form>
  </body>
</html>
