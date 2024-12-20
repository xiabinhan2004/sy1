<%@ page language="java" import="java.util.*" pageEncoding="GB18030"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
  <head>
    
    
    <title>购物车信息</title>
    
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
	       <h1>购物车中的信息</h1>
	       
	    <hr>
	    <div id="back"><a href="clearcart">清空购物车</a>  <a href="GetAllGoodsServlet">继续购物</a>  <a href="buyinfo.jsp">进入结算</a></div>
	  <table border="1">
	  	<tr><th>物品编号</th><th>物品名称</th><th>物品价格</th><th>数量</th><th>操作</th></tr>
	  	<c:forEach items="${cart}" var="item">
	  	<form action="ProcessCart">
	  	<input type="hidden" name="cid" value="${item.goods.cid }" />
		  <tr>
			  <td>${item.goods.cid}</td>
			  <td>${item.goods.cname}</td>
			  <td>${item.goods.cprice}</td>
			  <td><input name="quantity" type="text" value="${item.quantity}" size="5" /></td>
			  <td><input type="submit" name="action" value="修改" />
			      <input type="submit" name="action" value="删除" /></td>	 
		  </tr>	 
		 </form> 
	  	</c:forEach>  
	  </table>
	   
  </c:if>
  <c:if test="${empty cart}">
  	<div id="back"><a href="GetAllGoodsServlet">您尚未选购任何产品，请点击此处选购</a></div>
  
  </c:if>
   <div id="back"><a href="userinfo.jsp">返回个人主页</a></div>
  </body>
</html>
