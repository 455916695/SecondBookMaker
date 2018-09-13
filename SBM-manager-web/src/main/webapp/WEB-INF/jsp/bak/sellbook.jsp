<%--  卖书页面 --%>
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
    <link href="../../../css/sell_book.css" rel="stylesheet">
    <!-- HTML5 shim and Respond.js for IE8 support of HTML5 elements and media queries -->
    <!-- WARNING: Respond.js doesn't work if you view the page via file:// -->
    <!--[if lt IE 9]>
      <script src="https://cdn.bootcss.com/html5shiv/3.7.3/html5shiv.min.js"></script>
      <script src="https://cdn.bootcss.com/respond.js/1.4.2/respond.min.js"></script>
    <![endif]-->
    <script>
function showFileName(){      
    console.log(" FileList Demo:"); 
    var file; 
    //取得FileList取得的file集合 
    for(var i = 0 ;i<document.getElementById("multifile").files.length;i++){ 
        //file对象为用户选择的某一个文件 
        file=document.getElementById("multifile").files[i];         //此时取出这个文件进行处理，这里只是显示文件名 
       console.log(file.name);          
    } 
 } 
</script>
</head>
<body>
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
	  				<a href="${pageContext.request.contextPath }/book_findAllBooks.action"><!-- <span class="glyphicon glyphicon-th-list"></span> &nbsp;-->书库</a></li><li>
	  				<a href="${pageContext.request.contextPath }/wish_findByPage.action"><%-- <span class="glyphicon glyphicon-list-alt"></span>&nbsp; --%>心愿单</a></li><li class="active">
	  				<a href="sellbook.jsp"><span class="glyphicon glyphicon-log-in"></span>&nbsp;卖书</a></li><li >
	  				<a href="${pageContext.request.contextPath }/cart_findByPage.action"><!--<span class="glyphicon glyphicon-tasks"></span>&nbsp;-->书架</a></li><li >
	  				<a href="client.jsp"><!--<span class="glyphicon glyphicon-phone"></span>&nbsp;-->客户端</a></li><li >
	  				<a href="community.jsp"><!--<span class="glyphicon glyphicon-comment"></span>&nbsp;-->社区</a></li>
	  		</ul>
  		</div>
  	</nav>
  	<div id="sk_body" class="container">
  		<div id="sk_left">
  			<div class="sk_book">
  				<h3><span class="glyphicon glyphicon-book"></span>书籍信息</h3>
  				<form   name="input_file" action="${pageContext.request.contextPath }/book_saveBook.action" method="post" enctype="multipart/form-data">
  					<table>
	  					<tr>
	  						<td><label for="book_name">书籍名称</label></td>
	  						<td><input type="text" id="book_name" class="required" name="book_name" placeholder="请输入书籍的全名"/></td>
	  					</tr>
	  					<tr>
	  						<td class="sk_info">
	  							<label for="info">书籍主旨</label>
	  						</td>
	  						<td>
	  							<textarea id="info" name="main_title" class="required" placeholder="在20字以内作为书籍的主标题，把握重点，让书友有购买欲" rows="" cols=""></textarea>
	  						</td>
	  					</tr>
	  					<tr>
	  						<td class="sk_info">
	  							<label for="info_2">书籍简介</label>
	  						</td>
	  						<td>
	  							<textarea id="info_2" name="book_detail" class="required" placeholder="可以适当增加一点你对这本书的理解，在50字以内" rows="" cols=""></textarea>
	  						</td>
	  					</tr>
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
	  						<td><label for="book_cash">报价</label></td>
	  						<td><input type="text" id="price" name="price" class="required" placeholder="合理报价"/></td>
	  					</tr>
	  					<tr>
	  						<td><label>书籍语言</label></td>
	  						<td>
	  							<select id="book_language" name="book_language">
									  	<option value="中文">中文</option>
									  	<option value="英语">英语</option>
									  	<option value="日语">日语</option>
									  	<option value="韩语">韩语</option>
									  	<option value="其他">其他</option>
										</select>
	  						</td>
	  					</tr>
	  					<tr>
	  						<td><label>书籍种类</label></td>
	  						<td>
	  							<select id="book_kind" name="book_kind">
									  	<option value="考研">考研</option>
									  	<option value="学习">学习</option>
									  	<option value="小说">小说</option>
									  	<option value="科普">科普</option>
									  	<option value="法律">法律</option>
									  	<option value="经济">经济</option>
									  	<option value="哲学">哲学</option>
									  	<option value="历史">历史</option>
									  	<option value="休闲">休闲</option>
									  	<option value="其他">其他</option>
										</select>
	  						</td>
	  					</tr>
	  					
	  					<tr>
	  						<td><label for="book_new">书籍新旧</label></td>
	  							<td>
	  							<select id="book_degree" name="book_degree">
	  									<option value="三成新">三成新</option>
									  	<option value="五成新">五成新</option>
									  	<option value="七成新">七成新</option>
									  	<option value="九成新">九成新</option>
										</select>
	  							</td>
	  					</tr>
	  					
	  					<tr>
	  						<td class="sk_info">
	  							<label for="address">附加</label>
	  						</td>
	  						<td><textarea id="addition" class="required" name="addition" placeholder="对于这次交易你的补充说明" rows="" cols=""></textarea></td>
	  					</tr>
  					</table>
  			</div>
  	  </div>
  		<div id="sk_right">
  			<div>
  				<h3>卖家须知</h3>
  				<div class="sk_right_content">
  				<h4>售出提成: </h4>
  				<p>单笔交易完成后，从卖方收入中提取0.5%-10%的交易额作为提成。对于卖家来说，在网站交易后的净利润明显比其他途径售出旧书所获得的可观，因此设定的0.5%-10%的提成比率对用户来说是在可接受范围之内的，对于我方来讲每笔订单的提成将是一笔很客观的收入。</p>
					<h4>信用等级制度:</h4>
					<p>卖家每次成功交易加信用积分,信用积分可以在本站用于  商品排名提前 降低提取交易额 </p>
					<h4>商品优化: </h4>
					<p>给予本网站的保证金我们优先显示您的商品在搜索结果中</p>
					<h4>广告植入收入:  </h4>
					<p>这部分是重要的收入来源，植入的广告主要分为三类：弹窗广告、点击广告、显示广告。</p>
					<h4>大数据:</h4>
					<p>收集消费者的数据和信息.</p>
					<h4>支出费用:</h4>
					<p>工资:校园代理，管理人员的报酬支出宣传支出;传单，海报等的支出，以及校园宣传活动的支出;管理费用，涵盖的是管理网站，建造网络注册，电子档案的费用;资料，材料等费用支出。</p>
  				</div>
  			</div>
  		</div>
 </div>
  	<div class="container">
  		<button type="submit" id="sk_btn" class="btn btn-default">提交</button> 
  	</div>	
  	</form>
  	<!--尾部声明-->
  	<footer class="tail">
  	</footer>
    <!-- jQuery (necessary for Bootstrap's JavaScript plugins) -->
    <script src="../../../js/jquery-3.1.1.js"></script>
    <!-- Include all compiled plugins (below), or include individual files as needed -->
    <script src="../../../js/bootstrap.min.js"></script>
    <script src="../../../js/sell_book.js"></script>
</body>
</html>