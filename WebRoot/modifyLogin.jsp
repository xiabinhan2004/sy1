<%@ page language="java" import="java.util.*,java.sql.*,bean.*" pageEncoding="gb2312"%>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
  <head>
    <base href="<%=basePath%>">
    
    <title>My JSP 'modifyUser.jsp' starting page</title>
    
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
       String sql="select*from user where id="+request.getParameter("id");
       ResultSet rs=db.executeQuery(sql);
       if(rs.next())
       {
     %>
     <form action="ModifyLogin?id=<%=request.getParameter("id")%>" name="form1" method="post">
  <table width="300" border="0" align="center">
    <tr>
      <td>用户名：</td>
      <td><input name="username" type="text" class="ipt-t" id="username" value="<%=rs.getString(2)%>"/></td>
    </tr>
    <tr>
      <td>密码：</td>
      <td><input name="userpass" type="password" class="ipt-t" id="userpass" value="<%=rs.getString(3)%>"/></td>
    </tr>
    <tr>
      <td>重复密码：</td>
      <td>
        <input name="reuserpass" type="password" class="ipt-t" id="reuserpass" />
   </td>
    </tr>
    <tr>
      <td>性别：</td>
      <td><label>
      <input type="radio" name="gender" value="男" id="gender" <%if(rs.getString(4).equals("男"))out.println("checked");%>/>
男</label>
        <label>
        <input type="radio" name="gender" value="女" id="gender" <%if(rs.getString(4).equals("女"))out.println("checked");%>/>
女</label></td>
    </tr>
    
    <tr><td valign="top">出生日期：<br /></td>
    <td valign="top"><input type="text" name="birthdate" class="ipt-t" value="<%=rs.getString(5)%>"/></td></tr>
    <tr>
      <td>籍贯：</td>
      <td><label>
        <select name="nativeplace" id="nativeplace">
          <option value="浙江" <%if(rs.getString(6).equals("浙江"))out.println("selected");%>>浙江</option>
          <option value="江苏" <%if(rs.getString(6).equals("江苏"))out.println("selected");%>>江苏</option>
          <option value="山东" <%if(rs.getString(6).equals("山东"))out.println("selected");%>>山东</option>
          <option value="北京" <%if(rs.getString(6).equals("北京"))out.println("selected");%>>北京</option>
          <option value="上海" <%if(rs.getString(6).equals("上海"))out.println("selected");%>>上海</option>
          <option value="天津" <%if(rs.getString(6).equals("天津"))out.println("selected");%>>天津</option>
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
       }
     %>
    
  </body>
</html>
