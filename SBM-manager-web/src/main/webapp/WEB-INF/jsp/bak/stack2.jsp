<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@taglib uri="/struts-tags" prefix="s"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<meta http-equiv="X-UA-Compatible" content="IE=edge">
<meta name="viewport" content="width=device-width, initial-scale=1">
<title>二手书交易平台</title>
<link href="../../../css/bootstrap.min.css" rel="stylesheet">
<link href="../../../css/stack.css" rel="stylesheet">
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
				<input type="text" class="" placeholder="请输入搜索的内容">
				<button class="btn">
					<span class="glyphicon glyphicon-search"></span>
				</button>
			</div>
			<div class="search_bottom">
				<span>热搜：<a href="#" class="">四大名著</a>|<a href="#" class="">金典书城</a>|<a
					href="#" class="">国外名著</a>|<a href="#" class="">小说</a></span>
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
	  				<a href="sell_book.jsp"><!--<span class="glyphicon glyphicon-log-in"></span>&nbsp;-->卖书</a></li><li >
	  				<a href="${pageContext.request.contextPath }/cart_findByPage.action"><!--<span class="glyphicon glyphicon-tasks"></span>&nbsp;-->书架</a></li><li >
	  				<a href="client.jsp"><!--<span class="glyphicon glyphicon-phone"></span>&nbsp;-->客户端</a></li><li >
	  				<a href="community.jsp"><!--<span class="glyphicon glyphicon-comment"></span>&nbsp;-->社区</a></li>
	  		</ul>
  		</div>
  	</nav>
	<!--书籍的分类-->
	<div id="screen" class="container">
		<div class="screen src_1">
			<span>书籍语言</span>
			<ul>
				<li class="active"><a href="${pageContext.request.contextPath }/book_findAllBooks.action">全部</a></li>
				<li ><a href="${pageContext.request.contextPath }/book_getLanguage?yuyan=中文">中文</a></li>
				<li><a href="${pageContext.request.contextPath }/book_getLanguage?yuyan=英语">英语</a></li>
				<li><a href="${pageContext.request.contextPath }/book_getLanguage?yuyan=日语">日语</a></li>
				<li><a href="${pageContext.request.contextPath }/book_getLanguage?yuyan=韩语">韩语</a></li>
				<li><a href="${pageContext.request.contextPath }/book_getLanguage?yuyan=德文">德文</a></li>
				<li><a href="${pageContext.request.contextPath }/book_getLanguage?yuyan=其他">其他</a></li>
			</ul>
		</div>
		<div class="screen src_2">
			<span>书籍种类</span>
			<ul>
				<li class="active"><a href="${pageContext.request.contextPath }/book_findAllBooks.action">全部</a></li>
				<li><a href="${pageContext.request.contextPath }/book_getKind?zhonglei=考研">考研</a></li>
				<li><a href="${pageContext.request.contextPath }/book_getKind?zhonglei=学习">学习</a></li>
				<li><a href="${pageContext.request.contextPath }/book_getKind?zhonglei=小说">小说</a></li>
				<li><a href="${pageContext.request.contextPath }/book_getKind?zhonglei=科普">科普</a></li>
				<li><a href="${pageContext.request.contextPath }/book_getKind?zhonglei=法律">法律</a></li>
				<li><a href="${pageContext.request.contextPath }/book_getKind?zhonglei=经济">经济</a></li>
				<li><a href="${pageContext.request.contextPath }/book_getKind?zhonglei=哲学">哲学</a></li>
				<li><a href="${pageContext.request.contextPath }/book_getKind?zhonglei=历史">历史</a></li>
				<li><a href="${pageContext.request.contextPath }/book_getKind?zhonglei=休闲">休闲</a></li>
				<li><a href="${pageContext.request.contextPath }/book_getKind?zhonglei=其他">其他</a></li>
			</ul>
		</div>
		<div class="screen src_3">
			<span>书籍新旧</span>
			<ul>
				<li class="active"><a href="${pageContext.request.contextPath }/book_findAllBooks.action">全部</a></li>
				<li><a href="${pageContext.request.contextPath }/book_getDegree?xingjiu=九成新">九成新</a></li>
				<li><a href="${pageContext.request.contextPath }/book_getDegree?xingjiu=七成新">七成新</a></li>
				<li><a href="${pageContext.request.contextPath }/book_getDegree?xingjiu=五成新">五成新</a></li>
				<li><a href="${pageContext.request.contextPath }/book_getDegree?xingjiu=三成新">三成新</a></li>
				<li><a href="${pageContext.request.contextPath }/book_getDegree?xingjiu=一层新">一层新</a></li>
			</ul>
		</div>
		<div class="screen src_3">
			<span>书籍价格</span>
			<ul>
				<li class="active"><a href="${pageContext.request.contextPath }/book_findAllBooks.action">全部</a></li>
				<li><a href="${pageContext.request.contextPath }/book_getPrice?price=10">低于10元</a></li>
				<li><a href="${pageContext.request.contextPath }/book_getPrice?price=30">10元到30元</a></li>
				<li><a href="${pageContext.request.contextPath }/book_getPrice?price=50">30元到50元</a></li>
				<li><a href="${pageContext.request.contextPath }/book_getPrice?price=100">50元到100元</a></li>
				<li><a href="${pageContext.request.contextPath }/book_getPrice?price=500">高于100元</a></li>
			</ul>
		</div>
	</div>

	<!--主体销售-->
	<div id="book_sell" class="container">
		<div id="to_shopping">
		<s:iterator value="page.beanList">
			<div class="right_books">
					<div class="book_lock">
						<a href="book_getByBookId.action?book_id=<s:property value="book_id"/>"> 
						<img
							src="<%=url %>/<s:property value="book_main_img"/>" />
						</a>
					</div>
					<span class="hidden_span"><s:property value="book_name"/></span>
					<p class="money">￥<s:property value="price"/></p>
					<div class="btn_find">
						<button class="btn" type="button" name="btn" type="button"
							id="btn_look" onclick="window.open('${pageContext.request.contextPath }/book_getByBookId.action?book_id=<s:property value="book_id"/>')" >
						去看看
						</button>
					</div> 
					<span class="info_book_right"> <a href="${pageContext.request.contextPath }/book_getByBookId.action?book_id=<s:property value="book_id"/>">
							<s:property value="main_title"/> </a>
					</span>
				</div>
		</s:iterator>

			<div class="page_index ">
				<ul id="ul_icon">
					<c:if test="${ page.pageCode != 1 }">
					<li><a href="book_findAllBooks.action?pageCode=${ page.pageCode - 1 }">上一页</a></li>
					</c:if>
					<c:forEach var="i" begin="${ page.pageCode - 5 > 0 ? page.pageCode - 5 : 1 }" end="${ page.pageCode + 4 > page.totalPage ? page.totalPage : page.pageCode+4 }" step="1">
  						<c:if test="${ page.pageCode == i }">
  						<li class="active">${ i }</li>
  						</c:if>
  						<c:if test="${ page.pageCode != i }">
  					     	<li><a href="book_findAllBooks.action?pageCode=${ i }">${ i }</a></li>
  						</c:if>
  					</c:forEach>
					</ul>
					<c:if test="${ page.pageCode != page.totalPage }">
				<button id="stack_ul_btn"><a href="book_findAllBooks.action?pageCode=${ page.pageCode + 1}">下一页</a></button>
					</c:if>
			</div>
		</div>
	</div>
	<footer class="tail"> </footer>
	<!-- jQuery (necessary for Bootstrap's JavaScript plugins) -->
	<script src="../../../js/jquery-3.1.1.js"></script>
	<!-- Include all compiled plugins (below), or include individual files as needed -->
	<script src="../../../js/bootstrap.min.js"></script>
	<script src="../../../js/index.js"></script>
</body>
</html>