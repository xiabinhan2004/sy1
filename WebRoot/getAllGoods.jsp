<%@ page language="java" import="java.util.*" pageEncoding="GB18030"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
  <head>
 
    
    <title>所有物品信息</title>
    
	<meta http-equiv="pragma" content="no-cache">
	<meta http-equiv="cache-control" content="no-cache">
	<meta http-equiv="expires" content="0">    
	<meta http-equiv="keywords" content="keyword1,keyword2,keyword3">
	<meta http-equiv="description" content="This is my page">
	
	<link rel="stylesheet" type="text/css" href="main.css">
	

  </head>
  
  <body>
      <h1>显示物品信息</h1>
  <hr/>
  <table border="1">
  <tr><th>物品编号</th><th>物品名称</th><th>物品价格</th><th>图片</th><th>操作</th></tr>
  <c:forEach items="${goodslist}" var="g">
	  <tr>
		  <td>${g.cid}</td>
		  <td>${g.cname}</td>
		  <td>${g.cprice}</td>
	 	 <td><img src="${g.cimage}" /></td>
		  <td><a href="AddToCart?cid=${g.cid}">添加到购物车</a></td> 
	  </tr>
  </c:forEach>  
  </table>
  <div id="back">
  <c:if test="${pageNo==1}">
  	第一页 上一页
  </c:if>
  <c:if test="${pageNo!=1}">
  	<a href="GetAllGoodsServlet?pageNo=1">第一页</a> <a href="GetAllGoodsServlets?pageNo=${pageNo-1}">上一页</a>
  </c:if>
  <c:if test="${pageNo==pageCount}">
  	下一页 最后一页
  </c:if>
  <c:if test="${pageNo!=pageCount}">
  	<a href="GetAllGoodsServlet?pageNo=${pageNo+1}">下一页</a> <a href="GetAllGoodsServlet?pageNo=${pageCount}">最后一页</a>
  </c:if>
  <form action="GetAllGoodsServlet">
  	跳转到<input type="text" name="pageNo" />页<input type="submit" value="跳转" />
  </form>
  
 
  <div id="back"><a href="userinfo.jsp">返回个人主页</a></div>
  </div>
  </body>
</html>
