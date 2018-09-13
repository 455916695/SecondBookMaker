<%--  来源于书架的商品详情页面展示  --%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%--<%@ taglib uri="/struts-tags" prefix="s" %>--%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
 <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <title>二手书交易平台</title>
    <link href="../../../css/bootstrap.min.css" rel="stylesheet">
    <link href="../../../css/details.css" rel="stylesheet">
    <!-- HTML5 shim and Respond.js for IE8 support of HTML5 elements and media queries -->
    <!-- WARNING: Respond.js doesn't work if you view the page via file:// -->
    <!--[if lt IE 9]>
      <script src="https://cdn.bootcss.com/html5shiv/3.7.3/html5shiv.min.js"></script>
      <script src="https://cdn.bootcss.com/respond.js/1.4.2/respond.min.js"></script>
    <![endif]-->
</head>
<body>

<!--jsp读取web.xml中的主机IP地址  -->
<% 
		String url = application.getInitParameter("ServiceIpAddress");
%>



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
	  			<li><a href="home_page.jsp.bak"><%-- <span class="glyphicon glyphicon-home"></span>&nbsp; --%>首页</a></li><li class="active">
	  				<a href="${pageContext.request.contextPath }/book_findAllBooks.action"><span class="glyphicon glyphicon-th-list"></span>&nbsp;书库</a></li><li>
	  				<a href="${pageContext.request.contextPath }/wish_findByPage.action"><%-- <span class="glyphicon glyphicon-list-alt"></span>&nbsp; --%>心愿单</a></li><li >
	  				<a href="sellbook.jsp"><!--<span class="glyphicon glyphicon-log-in"></span>&nbsp;-->卖书</a></li><li >
	  				<a href="${pageContext.request.contextPath }/cart_findByPage.action"><!--<span class="glyphicon glyphicon-tasks"></span>&nbsp;-->书架</a></li><li >
	  				<a href="client.jsp"><!--<span class="glyphicon glyphicon-phone"></span>&nbsp;-->客户端</a></li><li >
	  				<a href="community.jsp"><!--<span class="glyphicon glyphicon-comment"></span>&nbsp;-->社区</a></li>
	  		</ul>
  		</div>
  	</nav>
  	
  	<div class="details_fix">
  		<h3>商家信息</h3>
  		<ul>
  			<li><span>姓名</span><p>${u.user_name}</p></li>
  			<li><span>性别</span><p>${u.user_sex}</p></li>
  			<li><span>手机号码</span><p>${u.user_phone}</p></li>
  			<li><span>QQ/微信</span><p>${u.user_qq}</p></li>
  			<li><span>附加</span><p>${u.user_instro}</p></li>
  			
  		</ul>
  		<button id="details_fix_btn" class="btn btn-default">关闭</button>
  	</div>
  	
  	<div id="details" class="container">
  		<h3>物品详情</h3>
  		<div class="details_left">
  			<div class="details_book">
					<div class="book_ul_1">
						<img src="<%=url %>/${book.book_main_img}">
					</div>
					<div class="left_btn">
		  				<a href=""><sapn class="glyphicon glyphicon-menu-left"></span></a>
		  			</div>
		  			<div class="right_btn">
		  				<a href=""><sapn class="glyphicon glyphicon-menu-right"></span></a>
		  			</div>
					<ul class="book_ul_2">
						<li><img src="<%=url %>/${book.book_main_img}"></li>
					</ul>
				</div>
  		</div>
  		<div class="details_right">
  			<div id="details_href">返回&nbsp;<a href="${pageContext.request.contextPath }/cart_findByPage.action">书架&nbsp;<span class="glyphicon glyphicon-log-out"></span></a></div>
  			<div class="details_book">
  				<div class="details_info">
  					<ul>
  						<li>书籍名称：<span>${book.book_name}</span></li>
  						<li>书籍简介：<div class="span_info">${book.book_detail}</div></li>
  						<li>书籍价格：<span>${book.price} 元</span></li>
  						<li>书籍语言：<span>${book.book_language}</span></li>
  						<li>书籍种类：<span>${book.book_kind}</span></li>
  						<li>书籍成色：<span>${book.book_degree}</span></li>
  						<li>发布时间：<span>${book.book_time}</span></li>
  						<li>书籍库存：<span>目前还有99+本</span></li>
  						<li>卖家介绍：<span>${book.addition}</span></li>
  					</ul>
  				</div>
  				<button id="details_collect" class="btn"><a href="#"> 已加入</a></button>
  				<button id="details_link" class="btn">想要交易</button>
  			</div>
  		</div>
  	</div>
  	
  	<footer class="tail">
  		
  	</footer>
    <!-- jQuery (necessary for Bootstrap's JavaScript plugins) -->
    <script src="../../../js/jquery-3.1.1.js"></script>
    <!-- Include all compiled plugins (below), or include individual files as needed -->
    <script src="../../../js/bootstrap.min.js"></script>
    <script src="../../../js/index.js"></script>
</body>
</html>