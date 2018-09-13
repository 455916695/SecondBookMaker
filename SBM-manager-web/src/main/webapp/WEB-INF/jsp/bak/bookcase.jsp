<%-- 书架页面，相当于购物车 --%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%--<%@ taglib prefix="s" uri="/struts-tags"%>--%>
<%--<%@ taglib uri="/struts-tags" prefix="s" %>--%>
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
	  			<li><a href="home_page.jsp.bak"><%-- <span class="glyphicon glyphicon-home"></span>&nbsp; --%>首页</a></li><li >
	  				<a href="${pageContext.request.contextPath }/book_findAllBooks.action"><!--<span class="glyphicon glyphicon-th-list"></span>&nbsp;-->书库</a></li><li >
	  				<a href="${pageContext.request.contextPath }/wish_findByPage.action"><!--<span class="glyphicon glyphicon-list-alt"></span>&nbsp;-->心愿单</a></li><li >
	  				<a href="sellbook.jsp"><!--<span class="glyphicon glyphicon-log-in"></span>&nbsp;-->卖书</a></li><li class="active">
	  				<a href="${pageContext.request.contextPath }/cart_findByPage.action"><span class="glyphicon glyphicon-tasks"></span>&nbsp;书架</a></li><li>
	  				<a href="client.jsp"><!--<span class="glyphicon glyphicon-phone"></span>&nbsp;-->客户端</a></li><li >
	  				<a href="community.jsp"><!--<span class="glyphicon glyphicon-comment"></span>&nbsp;-->社区</a></li>
	  		</ul>
  		</div>
  	</nav>
    <div class="container">
    	<div class="bc_book">
    		<h3>书籍区<button id="bc_book_btn" class="btn btn-default">( 编辑  )</button></h3>
    	<a href="${ pageContext.request.contextPath }/cart_findByPage?user_id=${user.user_id}&pageCode=${pageBookInfo.pageCode-1}">	
    	   <span id="bc_icon_1" class="glyphicon glyphicon-triangle-left"></span>
        </a>
        <a href="${ pageContext.request.contextPath }/cart_findByPage?user_id=${user.user_id}&pageCode=${pageBookInfo.pageCode+1}">
    		<span id="bc_icon_2" class="glyphicon glyphicon-triangle-right"></span>
    	</a>	
    		<!--书籍区-->
    		<div class="book_list">
    			
    			<!--书籍基数开始-->
    			<c:forEach items="${pageBookInfo.beanList}" var="bookInfoList">
    			<div class="bc_bk">
    				<!--删除按钮-->
    				<a href="${ pageContext.request.contextPath }/cart_deleteBookById?user_id=${user.user_id}&book_id=${bookInfoList.book_id}">
    				     <span class="bc_icon glyphicon glyphicon-trash"></span>
    				</a>
	    			<div class="bc_img">
	    				<a href="${ pageContext.request.contextPath }/cart_findBookById?book_id=${bookInfoList.book_id}">
	    					<img src="<%=url %>/${bookInfoList.book_main_img }" />
	    				</a>
	    			</div>
	    			<div class="bc_info">
	    				<ul>
								<li>名称：<span>${bookInfoList.book_name }</span></li>
								<li>价格：<span>${bookInfoList.price } 元</span></li>
								<li>时间：<span>${bookInfoList.book_time }</span></li>
								<li>成色：<span>${bookInfoList.book_degree }</span></li>
								<li>卖家：<span>巢湖学院学生</span></li>
							</ul>
	  					<button id="bc_btn" class="btn btn-default" onclick="window.open('${ pageContext.request.contextPath }/cart_findBookById?book_id=${bookInfoList.book_id}')">再去看看</button>
	    			</div>
	    		</div>
    			<!--基数结束-->
    			</c:forEach>
    			
    		</div>
    	</div>
    	
    	<div class="bc_lists">
    		<h3 class="bc_h3">心愿单区<button id="bc_wish_btn" class="btn btn-default">( 编辑  )</button></h3>
    		  <a href="${ pageContext.request.contextPath }/cart_findByPage?user_id=${user.user_id}&pageCode=${pageWish.pageCode-1}">
    		    <span id="bc_icon_3" class="glyphicon glyphicon-triangle-left"></span>
    		  </a>
    		  <a href="${ pageContext.request.contextPath }/cart_findByPage?user_id=${user.user_id}&pageCode=${pageWish.pageCode+1}">
    		    <span id="bc_icon_4" class="glyphicon glyphicon-triangle-right"></span>
    		  </a>
    		<div>
    			
    			<!--心愿单基数开始-->
    			<c:forEach items="${pageWish.beanList}" var="wishList">
	  			<div class="list_lists">
	  				<!--删除按钮-->
	  				<a href="${ pageContext.request.contextPath }/cart_deleteWishById?user_id=${user.user_id}&wid=${wishList.wid}">
	  			        <span  class="bc_list_icon glyphicon glyphicon-trash"></span></a>
		  			<div class="person_info">
			  			<div class="person_photo">
			  					<img src="<%=url %>/${wishList.userinfo.user_headimg }" height="50" width="50"/>
			  			</div>
			  			<div class="person_name">
			  				<span>${wishList.userinfo.user_name}</span>
			  			</div>
			  			<div class="person_time">
			  				<time>${wishList.book_publish}</time>
			  			</div>
			  			<div class="person_look">
			  				<a href="${ pageContext.request.contextPath }/wish_findById?wid=${wishList.wid}">详情</a>
			  			</div>
			  		</div>
		  			<div id="person_book">
		  				<div class="person_condition">
		  					<ul>
								<li>书名：<span>${wishList.book_name }</span></li>
								<li>要求：<span>${wishList.book_state }</span></li>
								<li>报酬：<span>${wishList.book_price }</span></li>
								<li>请求：
									<div class="person_request">
										<span>${wishList.book_instru }</sapn>
									</div>
								</li>
							</ul>
		  				</div>
		  				<div class="person_"></div>
		  			</div>
		  			<div class="person_explain">
		  				<div class="person_index">
		  					<a href="${ pageContext.request.contextPath }/wish_findById?wid=${wishList.wid}">
		  						<img src="<%=url %>/${wishList.main_img}" />
		  					</a>
		  				</div>
		  			</div>
	  			</div>
  				<!--基数结束-->
  				</c:forEach>
	  			
    		</div>
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