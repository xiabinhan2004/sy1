<%@ page language="java" import="java.util.*" pageEncoding="GB18030"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
  <head>
    
    
    <title>���ﳵ��Ϣ</title>
    
	<meta http-equiv="pragma" content="no-cache">
	<meta http-equiv="cache-control" content="no-cache">
	<meta http-equiv="expires" content="0">    
	<meta http-equiv="keywords" content="keyword1,keyword2,keyword3">
	<meta http-equiv="description" content="This is my page">
	
	<link rel="stylesheet" type="text/css" href="main.css">
	<script type="text/javascript">
	function init(){
		alert("${info}");
	}
	<c:if test="${!empty info}">
		window.onload=init;
	</c:if>	
	</script>

  </head>
  
  <body>
  <c:if test="${!empty cart}">
	       <h1>���ﳵ�е���Ϣ</h1>
	       
	    <hr>
	    <div id="back"><a href="clearcart">��չ��ﳵ</a>  <a href="GetAllGoodsServlet">��������</a>  <a href="buyinfo.jsp">�������</a></div>
	  <table border="1">
	  	<tr><th>��Ʒ���</th><th>��Ʒ����</th><th>��Ʒ�۸�</th><th>����</th><th>����</th></tr>
	  	<c:forEach items="${cart}" var="item">
	  	<form action="ProcessCart">
	  	<input type="hidden" name="cid" value="${item.goods.cid }" />
		  <tr>
			  <td>${item.goods.cid}</td>
			  <td>${item.goods.cname}</td>
			  <td>${item.goods.cprice}</td>
			  <td><input name="quantity" type="text" value="${item.quantity}" size="5" /></td>
			  <td><input type="submit" name="action" value="�޸�" />
			      <input type="submit" name="action" value="ɾ��" /></td>	 
		  </tr>	 
		 </form> 
	  	</c:forEach>  
	  </table>
	   
  </c:if>
  <c:if test="${empty cart}">
  	<div id="back"><a href="GetAllGoodsServlet">����δѡ���κβ�Ʒ�������˴�ѡ��</a></div>
  
  </c:if>
   <div id="back"><a href="userinfo.jsp">���ظ�����ҳ</a></div>
  </body>
</html>
