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
      <td>�û�����</td>
      <td><input name="username" type="text" class="ipt-t" id="username" value="<%=rs.getString(2)%>"/></td>
    </tr>
    <tr>
      <td>���룺</td>
      <td><input name="userpass" type="password" class="ipt-t" id="userpass" value="<%=rs.getString(3)%>"/></td>
    </tr>
    <tr>
      <td>�ظ����룺</td>
      <td>
        <input name="reuserpass" type="password" class="ipt-t" id="reuserpass" />
   </td>
    </tr>
    <tr>
      <td>�Ա�</td>
      <td><label>
      <input type="radio" name="gender" value="��" id="gender" <%if(rs.getString(4).equals("��"))out.println("checked");%>/>
��</label>
        <label>
        <input type="radio" name="gender" value="Ů" id="gender" <%if(rs.getString(4).equals("Ů"))out.println("checked");%>/>
Ů</label></td>
    </tr>
    
    <tr><td valign="top">�������ڣ�<br /></td>
    <td valign="top"><input type="text" name="birthdate" class="ipt-t" value="<%=rs.getString(5)%>"/></td></tr>
    <tr>
      <td>���᣺</td>
      <td><label>
        <select name="nativeplace" id="nativeplace">
          <option value="�㽭" <%if(rs.getString(6).equals("�㽭"))out.println("selected");%>>�㽭</option>
          <option value="����" <%if(rs.getString(6).equals("����"))out.println("selected");%>>����</option>
          <option value="ɽ��" <%if(rs.getString(6).equals("ɽ��"))out.println("selected");%>>ɽ��</option>
          <option value="����" <%if(rs.getString(6).equals("����"))out.println("selected");%>>����</option>
          <option value="�Ϻ�" <%if(rs.getString(6).equals("�Ϻ�"))out.println("selected");%>>�Ϻ�</option>
          <option value="���" <%if(rs.getString(6).equals("���"))out.println("selected");%>>���</option>
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
       }
     %>
    
  </body>
</html>
