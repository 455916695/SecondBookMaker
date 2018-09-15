<%--  展示书架为空的页面 --%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%--<%@ taglib prefix="s" uri="/struts-tags" %>--%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<meta http-equiv="X-UA-Compatible" content="IE=edge">
<meta name="viewport" content="width=device-width, initial-scale=1">
<title>商品列表页面</title>
<!--商品列表样式表-->
<link rel="stylesheet" href="../../../css/bootstrap.min.css">
<link rel="stylesheet" type="text/css" href="../../../css/bookcase.css" />
<style type="text/css">
.bc2_h1 {
    height: 300px;
    text-align: center;
    margin-top: 130px;
    letter-spacing: 4px;
}
</style>
</head>
<body>

<!--jsp读取web.xml中的主机IP地址  -->
<% 
		String url = application.getInitParameter("ServiceIpAddress");
%>



<!--网页最上面的横条-->
  	<div id="header">
  		<div class="container">
  			<span>专业二手书商城</span> 
  			<div class="register">
  				<c:if test="${eUser != null}">
  					<a href="${pageContext.request.contextPath }/WEB-INF/jsp/bak/personal.jsp">个人中心</a>
  					<span class="glyphicon glyphicon-user"></span>：${eUser.user_name}
  					<a href="${pageContext.request.contextPath }/user_quit.action">注销&nbsp;<span class="glyphicon glyphicon-off"></span></a>
  				</c:if>
  				<c:if test="${eUser == null}">
  					<a href="${pageContext.request.contextPath }/WEB-INF/jsp/bak/login.jsp.bak">登录&nbsp;<span class="glyphicon glyphicon-user"></span></a>
  					<a href="${pageContext.request.contextPath }/WEB-INF/jsp/bak/regist.jsp.bak">注册&nbsp;<span class="glyphicon glyphicon-user"></span></a>
  				</c:if>
  			</div>
  		</div>
  	</div>
  	<!--中间的logn 搜索框 以及图标位置 部分-->
  	<div id="logn" class="container">
  		<div class="logo">
  			<h1>For-Knowledge</h1>
  			<div class="input-group search">
  				<input type="text" class="" placeholder="请输入搜索的内容"><button class="btn"><span class="glyphicon glyphicon-search"></span></button>
  			</div>
  			<div class="search_bottom">
  				<span>热搜：<a href="#" class="">四大名著</a>|<a href="#" class="">金典书城</a>|<a href="#" class="">国外名著</a>|<a href="#" class="">小说</a></span>
  			</div>
  		</div>
  		<div class="logo_logo">
  			<img src="../../../img/logo.png" />
  		</div>
  	</div>

  		<!--导航栏部分-->
  	<nav id="nav_main" >
  		<div class="container">
	  		<ul class="hp_ul">
	  			<li>
					<a href="http://localhost:8847/"><%-- <span class="glyphicon glyphicon-home"></span>&nbsp; --%>首页</a></li><li >
					<a href="http://localhost:8859/common/stack"><!--<span class="glyphicon glyphicon-th-list"></span>&nbsp;-->书库</a></li><li >
					<a href="http://localhost:8857/common/wishlist"><!--<span class="glyphicon glyphicon-list-alt"></span>&nbsp;-->心愿单</a></li><li >
					<a href="http://localhost:8855/common/sellbook"><!--<span class="glyphicon glyphicon-log-in"></span>&nbsp;-->卖书</a></li><li class="active">
					<a href="javascript:void(0)"><span class="glyphicon glyphicon-tasks"></span>&nbsp;书架</a></li><li>
					<a href="http://localhost:8851/common/client"><!--<span class="glyphicon glyphicon-phone"></span>&nbsp;-->客户端</a></li><li >
					<a href="http://localhost:8849/common/community"><!--<span class="glyphicon glyphicon-comment"></span>&nbsp;-->社区</a></li>
			</ul>
  		</div>
  	</nav>
    <div class="container">
	    <div class="bc2_h1"> 
	    	<h1>书架为空</h1>
	    </div>
    </div>
		<!--尾部声明-->
		<footer class="tail">
		
		</footer>
				<!-- jQuery (necessary for Bootstrap's JavaScript plugins) -->
				<script src="../../../js/jquery-3.1.1.js"></script>
				<!-- Include all compiled plugins (below), or include individual files as needed -->
				<script src="../../../js/bootstrap.min.js"></script>
				<script src="../../../js/index.js"></script>
</body>
</html>