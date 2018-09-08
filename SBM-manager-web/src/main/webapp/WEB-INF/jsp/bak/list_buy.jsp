<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <title>二手书交易平台</title>
    <link href="../../../css/bootstrap.min.css" rel="stylesheet">
    <link href="../../../css/list_bs.css" rel="stylesheet">
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
	  				<a href="sell_book.jsp"><!--<span class="glyphicon glyphicon-log-in"></span>&nbsp;-->卖书</a></li><li >
	  				<a href="${pageContext.request.contextPath }/cart_findByPage.action"><!--<span class="glyphicon glyphicon-tasks"></span>&nbsp;-->书架</a></li><li >
	  				<a href="client.jsp"><!--<span class="glyphicon glyphicon-phone"></span>&nbsp;-->客户端</a></li><li >
	  				<a href="community.jsp"><!--<span class="glyphicon glyphicon-comment"></span>&nbsp;-->社区</a></li>
	  		</ul>
  		</div>
  	</nav>
  	<div id="sk_body" class="container">
  		<div id="sk_left">
  			
  			<div class="sk_person">
  				<h3><span id="sk_person_span" class="glyphicon glyphicon-user"></span>个人资料</h3>
  				<div class="sk_person_info">
		  			<ul>
		  				<li><span>姓名</span><p>${eUser.user_name}</p></li>
		  				<li><span>性别</span><p>${eUser.user_sex}</p></li>
		  				<li><span>年龄</span><p>${eUser.user_age}</p></li>
		  				<li><span>手机号</span><p>${eUser.user_phone}</p></li>
		  				<li><span>QQ/微信</span><p>${eUser.user_qq}</p></li>
		  				<li><span>现居地</span><p>${eUser.user_addr}</p></li>
		  				<li><span>自我介绍</span><p>${eUser.user_instro}</p></li>
		  			</ul>
  				</div>
  			</div>
  			<div class="sk_person_footer">
  				<span><b>温馨提示：</b>想要修改的话，请到<a href="${pageContext.request.contextPath}/WEB-INF/jsp/bak/personal.jsp">个人中心</a>修改和完善信息</span>
  			</div>
  		</div>
  		<div id="sk_right">
  			<div class="sk_book">
  				<h3>你想要的书籍</h3>
  				<form id="itemForm" action="${pageContext.request.contextPath }/wish_upload.action?state=1" enctype="multipart/form-data" name="input_file" method="post" >
  					<table>
	  					<tr>
	  						<td><label for="book_name">书籍名称</label></td>
	  						<td><input type="text" name="book_name" id="book_name"/></td>
	  					</tr>
	  					<!-- <tr>
	  						<td class="sk_info">
	  							<label for="book_pho">书籍照片</label></td>
	  						<td>
									<input type="file" name="upload"> 
	  						</td>
	  					</tr> -->
	  					<tr>
	  						<td class="sk_info">
	  							<label for="book_pho">书籍照片</label></td>
	  						<td>
	  							<div class="sk_book_img" id="book_pho"></div>
		  								<input id="fileId1" id="multifile" multiple type="file" accept="image/png,image/gif" name="upload" style="display: none;" onchange="document.input_file.fild_text.value=this.value"/>
		  								<input type="button" name="fild_btn" id="fild_btn" value="选择图片" class="btn btn-default" onclick="document.input_file.fileId1.click()" />
		  								<input type="text" name="fild_text" id="fild_text" />
	  						</td>
	  							 					
		  				</tr>
	  					<tr>
	  						<td><label for="lb_book_cash">报酬</label></td>
	  						<td><input type="text" name="book_price" id="lb_book_cash"/></td>
	  					</tr>
	  					<tr>
	  						<td><label for="book_new">书籍新旧</label></td>
	  						<td>
	  							<select name="book_state">
	  									<option value="三成新">三成新</option>
									  	<option value="五成新">五成新</option>
									  	<option value="七成新">七成新</option>
									  	<option value="九成新">九成新</option>
										</select>
	  						</td>
	  					</tr>
	  					<tr>
	  						<td class="sk_info">
	  							<label for="book_requ" name="book_instru">请求</label>
	  						</td>
	  						<td><textarea id="book_requ" name="book_requ" placeholder="你有什么对于书友的请求" rows="" cols=""></textarea></td>
	  						<!-- name="info" -->
	  					</tr>
	  					<tr>
	  						<td class="sk_info">
	  							<label for="address" name="additional">附加</label>
	  						</td>
	  						<td><textarea id="info" name="info" placeholder="你对于这本书你还有什么要求，比如有没有笔记之类的" rows="" cols=""></textarea></td>
	  						<!-- name="info" -->
	  					</tr>
	  					
  					</table>
  				
  			</div>
  		</div>
  	</div>
  	<div class="container">
  		<button type="submit" id="sk_btn" class="btn btn-default" ">生成心愿单</button>
  		<div id="lb_href">返回&nbsp;<a href="${pageContext.request.contextPath }/wish_findByPage.action">心愿单&nbsp;<span class="glyphicon glyphicon-log-out"></span></a></div>
  	</div>
  	</form>
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