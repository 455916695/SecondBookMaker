<%--   心愿单展示列表 --%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%--<%@ taglib uri="/struts-tags" prefix="s" %>--%>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
 <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <title>二手书交易平台</title>
    <link href="../../../css/bootstrap.min.css" rel="stylesheet">
    <link href="../../../css/wish_list.css" rel="stylesheet">
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



<!--网页最上面的横条-->
  	<div id="header">
  		<div class="container">
  			<span>专业二手书商城</span> 
  			<div class="register">
  				<c:if test="${eUser != null}">
  					<a href="${pageContext.request.contextPath }/WEB-INF/jsp/bak/personal.jspbak/personal.jsp">个人中心</a>
  					<span class="glyphicon glyphicon-user"></span>：${eUser.user_name}
  					<a href="${pageContext.request.contextPath }/user_quit.action">注销&nbsp;<span class="glyphicon glyphicon-off"></span></a>
  				</c:if>
  				<c:if test="${eUser == null}">
  					<a href="${pageContext.request.contextPath }/WEB-INF/jsp/bak/login.jsp.bakak/login.jsp.bak">登录&nbsp;<span class="glyphicon glyphicon-user"></span></a>
  					<a href="${pageContext.request.contextPath }/WEB-INF/jsp/bak/regist.jsp.bakk/regist.jsp.bak">注册&nbsp;<span class="glyphicon glyphicon-user"></span></a>
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
					<a href="http://localhost:8847/"><%-- <span class="glyphicon glyphicon-home"></span>&nbsp; --%>首页</a></li><li>
	  				<a href="http://localhost:8859/common/stack"><!-- <span class="glyphicon glyphicon-th-list"></span>&nbsp; -->书库</a></li><li class="active">
	  				<a href="javascript:void(0)"><span class="glyphicon glyphicon-list-alt"></span>&nbsp;心愿单</a></li><li >
	  				<a href="http://localhost:8855/common/sellbook"><!--<span class="glyphicon glyphicon-log-in"></span>&nbsp;-->卖书</a></li><li >
	  				<a href="http://localhost:8853/common/bookcase"><!--<span class="glyphicon glyphicon-tasks"></span>&nbsp;-->书架</a></li><li >
	  				<a href="http://localhost:8851/common/client"><!--<span class="glyphicon glyphicon-phone"></span>&nbsp;-->客户端</a></li><li >
	  				<a href="http://localhost:8849/common/community"><!--<span class="glyphicon glyphicon-comment"></span>&nbsp;-->社区</a></li>
	  		</ul>
  		</div>
  	</nav>
  	<!--心愿单的简介-->
  	<div class="container">
	  	<div class="list_header">
	  		<div class="header_left">
	  			<pre>
我想以另类的方式
	去找我想要的书</pre>
					<div class="list_btn">
	  				<a class="list_a" href="listbuy.jsp">我也想</a>
	  			</div>
	  		</div>
	  		<div class="header_right">
	  			<pre>
我想以另类的方式
	去出售我拥有的书</pre>
					<div class="list_btn">
	  				<a class="list_a" href="listsell.jsp">我也想</a>
	  			</div>
	  		</div>
	  	</div>
	  	<div class="list_group">
  			<button id="list_left_btn" class="btn btn-default" onclick="window.open('${pageContext.request.contextPath }/wish_findByPage.action?state=1')">书友想要</button>
  			<button id="list_right_btn" class="btn btn-default" onclick="window.open('${pageContext.request.contextPath }/wish_findByPage.action?state=0')">书友出售</button>
  			<div class="list_btns">
        	<a href="${ pageContext.request.contextPath }/wish_findByPage?wid=${wish.wid}&pageCode=${pageBookInfo.pageCode-1}">	
	    	   <abbr title="向前一页"><span id="bc_icon_1" class="glyphicon glyphicon-triangle-left"></span></abbr>
	        </a>
	        <a href="${ pageContext.request.contextPath }/wish_findByPage?pageCode=${page.pageCode+1}">
	    		<abbr title="向后一页"><span id="bc_icon_2" class="glyphicon glyphicon-triangle-right"></span></abbr>
	    	</a> 
        </div>
	  	</div>
  	</div>
  	
  	<!--心愿单的展示过程-->
  	<div class="container">
  		
  		<c:forEach items="${page.beanList }" var="wish">
  		<div class="list_lists">
  			<div class="person_info">
	  			<div class="person_photo">
	  				<img src="<%=url %>/${wish.userinfo.user_headimg }" height="50" width="50"/>
	  			</div>
	  			<div class="person_name">
	  				<span>${wish.userinfo.user_name}</span>
	  			</div>
	  			<div class="person_time">
	  				<time>${wish.book_publish }</time>
	  			</div>
	  			<div class="person_look">
	  				<a href="${pageContext.request.contextPath }/wish_findById.action?Wid=${wish.wid}">详情</a> 
	  				
	  			</div>
	  		</div>
  			<div id="person_book">
  				<div class="person_condition">
  					<ul>
  						<li>书名：<span>${wish.book_name }</span></li>
  						<li>要求：<span>${wish.book_state}</span></li>
  						<li>报酬：<span>${wish.book_price }</span></li>
  						<li>请求：
  							<div class="person_request">
  								<span>${wish.book_instru }</sapn>
  							</div>
  						</li>
  					</ul>
  				</div>
  				<div class="person_"></div>
  			</div>
  			<div class="person_explain">
  				<div class="person_index">
  					<img src="<%=url %>/${wish.main_img }" />
  				</div>
  			</div>
  		</div>
  		
  		</c:forEach>
  		
  			
  		
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