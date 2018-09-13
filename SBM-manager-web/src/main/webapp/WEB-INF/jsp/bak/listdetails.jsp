<%--  心愿单 详情页面 --%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
    <%--<%@ taglib uri="/struts-tags" prefix="s" %>--%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<%-- <meta http-equiv="refresh" content="0;url=${pageContext.request.contextPath }/comment_findAll.action"/> --%>
 <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <title>二手书交易平台</title>
    <link href="../../../css/bootstrap.min.css" rel="stylesheet">
    <link href="../../../css/list_details.css" rel="stylesheet">
    <!-- HTML5 shim and Respond.js for IE8 support of HTML5 elements and media queries -->
    <!-- WARNING: Respond.js doesn't work if you view the page via file:// -->
    <!--[if lt IE 9]>
      <script src="https://cdn.bootcss.com/html5shiv/3.7.3/html5shiv.min.js"></script>
      <script src="https://cdn.bootcss.com/respond.js/1.4.2/respond.min.js"></script>
    <![endif]-->
<script src="${pageContext.request.contextPath }/js/jquery-1.11.3.min.js"></script>

<script type="text/javascript">
	//点赞
	function clickPraise(){
		//请求地址
		var url = "${pageContext.request.contextPath }/wish_clickPraise.action";
		//onPrise=${wish.onPrise}&&wid=${wish.wid}
		//设置参数
		var wid =${wish.wid };
		var param ={"wid":wid};
		//发送ajax请求
		$.post(url,param,function(data){
			//回显数据
			$("#praiseTip").html("已有"+data+"赞");
		},"json");
	}
</script>



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
	  			<li><a href="home_page.jsp.bak"><%-- <span class="glyphicon glyphicon-home"></span>&nbsp; --%>首页</a></li><li>
	  				<a href="${pageContext.request.contextPath }/book_findAllBooks.action"><!-- <span class="glyphicon glyphicon-th-list"></span>&nbsp; -->书库</a></li><li class="active">
	  				<a href="${pageContext.request.contextPath }/wish_findByPage.action"><span class="glyphicon glyphicon-list-alt"></span>&nbsp;心愿单</a></li><li >
	  				<a href="sellbook.jsp"><!--<span class="glyphicon glyphicon-log-in"></span>&nbsp;-->卖书</a></li><li >
	  				<a href="${pageContext.request.contextPath }/cart_findByPage.action"><!--<span class="glyphicon glyphicon-tasks"></span>&nbsp;-->书架</a></li><li >
	  				<a href="client.jsp"><!--<span class="glyphicon glyphicon-phone"></span>&nbsp;-->客户端</a></li><li >
	  				<a href="community.jsp"><!--<span class="glyphicon glyphicon-comment"></span>&nbsp;-->社区</a></li>
	  		</ul>
  		</div>
  	</nav>
  	<div class="ld_fix">
  		<h3>商家信息</h3>
  		<ul>
  			<li><span>姓名</span><p>${wish.userinfo.user_name}</p></li>
  			<li><span>性别</span><p>${wish.userinfo.user_sex}</p></li>
  			<li><span>手机号码</span><p>${wish.userinfo.user_phone}</p></li>
  			<li><span>QQ/微信</span><p>${wish.userinfo.user_qq}</p></li>
  			<li><span>附加</span><p>${wish.userinfo.user_instro}</p></li>
  		</ul>
  		<button id="ld_fix_btn" class="btn btn-default">关闭</button>
  	</div>
  	<div class="container">
  		<div id="ld_body">
  			<div class="ld_left">
  				<div id="ld_ret">返回&nbsp;<a href="${pageContext.request.contextPath }/wish_findByPage.action">心愿单&nbsp;<span class="glyphicon glyphicon-log-out"></span></a></div>
  					<span  class="ld_icon glyphicon glyphicon-thumbs-up" onclick="clickPraise()"></span>
  				<div class="ld_icon_rig">
  				<span id="praiseTip">已有<mark>${wish.onPrise}</mark>赞</span></div>
  				<div class="ld_center">
	  				<div class="ld_info">
			  			<div class="ld_photo">
			  				<img src="<%=url %>/${wish.userinfo.user_headimg}" height="100" width="100"/>
			  			</div>
			  			<div class="ld_name">
			  				<span>${wish.userinfo.user_name}</span>
			  			</div>
			  			<div class="ld_time">
			  				<time>${wish.book_publish }</time>
			  			</div>
		  			</div>
	  				<div class="ld_person">
	  					<ul>
	  					
	  						<li>书名：<span>${wish.book_name }</span></li>
	  						<li>要求：<span>${wish.book_state }</span></li>
	  						<li>报酬：<span>${wish.book_price}</span></li>
	  						<li>请求：
	  							<div class="ld_request ld_request_1">
	  								<span>${wish.book_instru }</sapn>
	  							</div>
	  						</li>
	  						<li>图片：
	  							<div class="ld_books">
		  							<div class="ld_book">
		  								<img src="<%=url %>/${wish.main_img }" height="120" width="86"/>
                          		  	<div class="ld_book">
		  								<img src="../../../img/ld_img_2.jpg" />
		  							</div>
		  							<div class="ld_book">
		  								<img src="../../../img/ld_img_3.jpg" />
		  							</div>
		  							<div class="ld_book">
		  								<img src="../../../img/ld_img_4.jpg" />
		  							</div>
	  							</div>
	  						</li>
	  						<li id="ld_add">附加：
	  							<div class="ld_request ld_request_2">
	  								<span>${wish.additional }</sapn>
	  							</div>
	  						</li>
	  					</ul>
	  				</div>
	  				<button id="ld_btn" class="btn btn-default">回应他</button>
  				</div>
  			</div>
  			
  			<div class="ld_right">
  				<div class="ld_comments">
  					<h3>评论区</h3>
  					<div class="ld_hight">
  					<c:forEach items="${comList }" var="comment">
	  					<div id="ld_com">
	  						<div class="ld_img">
	  							<img src="<%=url %>/${comment.headimg }" height="50" width="50" />
	  						</div>
	  						<div class="ld_com">
	  							<ul>
	  								<li><span>${comment.uname }</span>:</li>
	  								<li><span></span>${comment.content }</li>
	  							</ul>
	  						</div>
	  					</div>
	  					</c:forEach>
	  					
  					</div> 
  					<div class="ld_text">
  					<form action="${pageContext.request.contextPath }/comment_saveSession.action?wid=${wish.wid }" method="post">
  						<input type="text" id="ld_text" name ="content" placeholder="我想说点什么"><button class="ld_btn btn">发表</button>
  					</form>
  					</div>
  				</div>
  			</div>
  		</div>
  		
  	</div>
  	<!--尾部声明-->
  	<footer class="tail">
  		
  	</footer>
    <!-- jQuery (necessary for Bootstrap's JavaScript plugins) -->
 
    <!-- Include all compiled plugins (below), or include individual files as needed -->
    <script src="../../../js/bootstrap.min.js"></script>
    <script src="../../../js/index.js"></script>
    <script type="text/javascript" src="../../../js/list_details.js"></script>
</body>
</html>