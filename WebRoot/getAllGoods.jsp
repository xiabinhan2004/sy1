<%@ page language="java" import="java.util.*" pageEncoding="GB18030"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
  <head>
 
    
    <title>������Ʒ��Ϣ</title>
    
	<meta http-equiv="pragma" content="no-cache">
	<meta http-equiv="cache-control" content="no-cache">
	<meta http-equiv="expires" content="0">    
	<meta http-equiv="keywords" content="keyword1,keyword2,keyword3">
	<meta http-equiv="description" content="This is my page">
	
	<link rel="stylesheet" type="text/css" href="main.css">
	

  </head>
  
  <body>
      <h1>��ʾ��Ʒ��Ϣ</h1>
  <hr/>
  <table border="1">
  <tr><th>��Ʒ���</th><th>��Ʒ����</th><th>��Ʒ�۸�</th><th>ͼƬ</th><th>����</th></tr>
  <c:forEach items="${goodslist}" var="g">
	  <tr>
		  <td>${g.cid}</td>
		  <td>${g.cname}</td>
		  <td>${g.cprice}</td>
	 	 <td><img src="${g.cimage}" /></td>
		  <td><a href="AddToCart?cid=${g.cid}">��ӵ����ﳵ</a></td> 
	  </tr>
  </c:forEach>  
  </table>
  <div id="back">
  <c:if test="${pageNo==1}">
  	��һҳ ��һҳ
  </c:if>
  <c:if test="${pageNo!=1}">
  	<a href="GetAllGoodsServlet?pageNo=1">��һҳ</a> <a href="GetAllGoodsServlets?pageNo=${pageNo-1}">��һҳ</a>
  </c:if>
  <c:if test="${pageNo==pageCount}">
  	��һҳ ���һҳ
  </c:if>
  <c:if test="${pageNo!=pageCount}">
  	<a href="GetAllGoodsServlet?pageNo=${pageNo+1}">��һҳ</a> <a href="GetAllGoodsServlet?pageNo=${pageCount}">���һҳ</a>
  </c:if>
  <form action="GetAllGoodsServlet">
  	��ת��<input type="text" name="pageNo" />ҳ<input type="submit" value="��ת" />
  </form>
  
 
  <div id="back"><a href="userinfo.jsp">���ظ�����ҳ</a></div>
  </div>
  </body>
</html>
