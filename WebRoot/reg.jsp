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
      <td>�û�����</td>
      <td><input name="username" type="text" class="ipt-t" id="username" /></td>
    </tr>
    <tr>
      <td>���룺</td>
      <td><input name="userpass" type="password" class="ipt-t" id="userpass" /></td>
    </tr>
    <tr>
      <td>�ظ����룺</td>
      <td><input name="reuserpass" type="password" class="ipt-t" id="reuserpass" /></td>
    </tr>
    <tr>
      <td>�Ա�</td>
      <td><label>
      <input type="radio" name="gender" value="��" id="gender"  />
��</label>
        <label>
        <input type="radio" name="gender" value="Ů" id="gender"  />
Ů</label></td>
    </tr>
    
    <tr><td valign="top">�������ڣ�<br /></td>
    <td valign="top"><input type="text" name="birthdate" class="ipt-t" /></td></tr>
    <tr>
      <td>���᣺</td>
      <td><label>
        <select name="nativeplace" id="nativeplace">
          <option value="�㽭" >�㽭</option>
          <option value="����" selected>����</option>
          <option value="ɽ��">ɽ��</option>
          <option value="����">����</option>
          <option value="�Ϻ�">�Ϻ�</option>
          <option value="���">���</option>
        </select>
      </label></td>
    </tr>
    <tr>
      <td colspan="2" align="center"><label>
        <input name="submit" type="submit" id="submit" value="�ύ"/>
        <input name="reset" type="reset" id="reset" value="����" />
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
