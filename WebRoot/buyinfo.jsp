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
          <td>�ջ��ˣ�</td>
          <td><input name="receivename" type="text" class="ipt-t" id="receivename" /></td>
        </tr>
        <tr>
          <td>��ϵ�绰��</td>
          <td><input name="tele" type="text" class="ipt-t" id="tele" /></td>
        </tr>
        <tr>
          <td>�ʱࣺ</td>
          <td><input name="zipcode" type="text" class="ipt-t" id="zipcode" /></td>
        </tr>
        <tr>
          <td>�ջ���ַ��</td>
          <td>
            <select name="address" id="address">
              <option value="�㽭" >�㽭</option>
              <option value="����" selected>����</option>
              <option value="ɽ��">ɽ��</option>
              <option value="����">����</option>
              <option value="�Ϻ�">�Ϻ�</option>
              <option value="���">���</option>
            </select>
          </td>
        </tr>
        <tr>
          <td>���ʽ��</td>
          <td>
            <select name="paymode" id="paymode">
              <option value="��������" >��������</option>
              <option value="���ϸ���" selected>���ϸ���</option>
            </select>
          </td>
        </tr>
        <tr>
          <td colspan="2" align="center">
            <input name="submit" type="submit" id="submit" value="�ύ"/>
            <input name="reset" type="reset" id="reset" value="����" />
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
