<%@ page language="java" contentType="text/html; charset=UTF-8"
		 pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html>
<head>
	<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
	<meta http-equiv="X-UA-Compatible" content="IE=edge">
	<meta name="viewport" content="width=device-width, initial-scale=1">
    <title>二手书交易平台</title>
    <link href="${pageContext.request.contextPath}/css/bootstrap.min.css" rel="stylesheet">
    <link href="${pageContext.request.contextPath}/css/home_page.css" rel="stylesheet">
      <script src="https://cdn.bootcss.com/html5shiv/3.7.3/html5shiv.min.js"></script>
      <script src="https://cdn.bootcss.com/respond.js/1.4.2/respond.min.js"></script>
	<script src="${pageContext.request.contextPath}/js/jquery-1.8.3.js"></script>
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
  					<a href="${pageContext.request.contextPath }/common_login">登录&nbsp;<span class="glyphicon glyphicon-user"></span></a>
  					<a href="${pageContext.request.contextPath }/common_regist">注册&nbsp;<span class="glyphicon glyphicon-user"></span></a>
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
  			<img src="${pageContext.request.contextPath}/img/logo.png" />
  		</div>
  	</div>
  	
  		<!--导航栏部分-->
  	<nav id="nav_main" >
  		<div class="container">
	  		<ul class="hp_ul">
	  			<li class="active">
                    <a href="http://localhost:8847/"><span class="glyphicon glyphicon-home"></span>&nbsp;首页</a></li><li >
	  				<a href="http://localhost:8859/common/stack"><!--<span class="glyphicon glyphicon-th-list"></span>&nbsp;-->书库</a></li><li >
	  				<a href="http://localhost:8859/common/wishlist"><!--<span class="glyphicon glyphicon-list-alt"></span>&nbsp;-->心愿单</a></li><li >
	  				<a href="http://localhost:8855/common/sellbook"><!--<span class="glyphicon glyphicon-log-in"></span>&nbsp;-->卖书</a></li><li >
	  				<a href="http://localhost:8853/common/bookcase"><!--<span class="glyphicon glyphicon-tasks"></span>&nbsp;-->书架</a></li><li >
	  				<a href="http://localhost:8851/common/client"><!--<span class="glyphicon glyphicon-phone"></span>&nbsp;-->客户端</a></li><li >
	  				<a href="http://localhost:8849/common/community"><!--<span class="glyphicon glyphicon-comment"></span>&nbsp;-->社区</a></li>
	  		</ul>
  		</div>
  	</nav>

  	<!--主体轮播图一行栏-->
  	<div id="img_play" class="container">
  		<div class="row">
  			<div class="col-xs-3">
  				<div id="index_book">
  					<h3>书籍分类</h3>
					<div  style="z-index: 1000;">
  					<ul id="bookcatUl" style="z-index: 2000;">
						<script type="text/javascript" >
                            $(function () {
                                $.ajax({
                                    type: "GET",                                                   //请求方式
                                    url: "/bookcat/findBookCatByParentId",//地址，就是json文件的请求路径
                                    dataType: "json",
                                    cache: true,
                                    success: function(result) {              //返回的参数就是 action里面所有的有get和set方法的参数
										for (var i = 0; i<result.length ;i++) {
											var tbBookCat = result[i];
											var name = tbBookCat.name;
											var id = tbBookCat.id;
										    var childList = tbBookCat.childList;
										    $("#bookcatUl").append("<li class='bookCatLi' ><input type='hidden' value='"+id+"'><div class='book_search'><span>"+name+"</span><ul id='"+id+"'></ul></div></li>")
											lookList(childList);
										}

                                    }
                                });

                            });

                            function lookList(childList) {
                                for(var i = 0 ;i < childList.length ;i++) {
                                    var childBookCat  = childList[i];
                                    var bookCatId = childBookCat.id;
                                    var parentId = childBookCat.parentId;
                                    var name = childBookCat.name;
                                    $("#"+parentId).append("<li><a href=${pageContext.request.contextPath }/bookcat/findBookByCatId?bookCatId="+bookCatId+">"+name+"</a></li>")
                                }
                            };

//                            //jquery动态添加的元素不能直接绑定事件，可用如下的方案
//                            $("body").on("mouseover", ".bookCatLi", function() {
//                                $("#bookCatDiv").show();
//                            	var idInp = $(".bookCatLi").children("input");
//
//                                $.ajax({
//                                    type: "GET",                                                   //请求方式
//                                    url: "/bookcat/findBookCatByParentId?parentId="+idInp.val(),//地址，就是json文件的请求路径
//                                    dataType: "json",
//                                    cache: false,
//                                    success: function(result) {              //返回的参数就是 action里面所有的有get和set方法的参数
//                                        $("#bookCatDiv").append("<ul id='bookcatUl2'></ul>");
//                                        for (var i = 0; i<result.length ;i++) {
//                                            var tbBookCat = result[i];
//                                            var name = tbBookCat.name;
//                                            var id = tbBookCat.id;
//                                            var childList = tbBookCat.childList;
//                                            $("#bookcatUl2").append("<li  ><input type='hidden' value='"+id+"'><div class='book_search'><span>"+name+"</span><ul id='"+id+"'></ul></div></li>")
//
//                                        }
//                                    }
//                                });
//                                $("#bookCatDiv").mouseout(function () {  //此处存在问题未曾解决
//                                    $("#bookCatDiv").hide();
//                                });

//                            });

						</script>
						<%-- 附带的小框   z-index: 设置覆盖的属性 --%>
						<div id="bookCatDiv" style="border: 1px solid black;width: 660px;height:323px;position: absolute;left: 15px;top: 47px;z-index: 100;display:none;background-color: beige">
						</div>
  						<%--<li>--%>
  							<%--<div class="book_search">--%>
  								<%--<span>古籍</span>--%>
  								<%--<ul id="parentId">--%>
  									<%--<li><a href="${pageContext.request.contextPath }/book_findAllBooks.action">诗类</a></li>--%>
  									<%--<li><a href="${pageContext.request.contextPath }/book_findAllBooks.action">书类</a></li>--%>
  									<%--<li><a href="${pageContext.request.contextPath }/book_findAllBooks.action">礼类</a></li>--%>
  									<%--<li><a href="${pageContext.request.contextPath }/book_findAllBooks.action">易类</a></li>--%>
  									<%--<li><a href="${pageContext.request.contextPath }/book_findAllBooks.action">春秋</a></li>--%>
  								<%--</ul>--%>
  							<%--</div>--%>
  						<%--</li>--%>
  					</ul>
					</div>
  				</div>
  			</div>

  			<div class="col-xs-6">
  				<div id="carousel-example-generic" class="carousel slide" data-ride="carousel">
					  <!-- Indicators -->
					  <ol class="carousel-indicators">
					    <li data-target="#carousel-example-generic" data-slide-to="0" class="active"></li>
					    <li data-target="#carousel-example-generic" data-slide-to="1"></li>
					    <li data-target="#carousel-example-generic" data-slide-to="2"></li>
					    <li data-target="#carousel-example-generic" data-slide-to="3"></li>
					    <li data-target="#carousel-example-generic" data-slide-to="4"></li>
					  </ol>
					  <!-- Wrapper for slides -->
					  <div class="carousel-inner" role="listbox">
					    <div class="item active">
					      <img src="${pageContext.request.contextPath}/img/book_1.jpg" alt="...">
					    </div>
					    <div class="item">
					      <img src="${pageContext.request.contextPath}/img/book_2.jpg" alt="...">
					    </div>
					    <div class="item">
					      <img src="${pageContext.request.contextPath}/img/book_3.jpg" alt="...">
					    </div>
					    <div class="item">
					      <img src="${pageContext.request.contextPath}/img/book_4.jpg" alt="...">
					    </div>
					    <div class="item">
					      <img src="${pageContext.request.contextPath}/img/book_5.jpg" alt="...">
					    </div>
					  </div>
					  <!-- Controls -->
					  <a class="left carousel-control" href="#carousel-example-generic" role="button" data-slide="prev">
					    <span class="glyphicon glyphicon-chevron-left" aria-hidden="true"></span>
					    <span class="sr-only">Previous</span>
					  </a>
					  <a class="right carousel-control" href="#carousel-example-generic" role="button" data-slide="next">
					    <span class="glyphicon glyphicon-chevron-right" aria-hidden="true"></span>
					    <span class="sr-only">Next</span>
					  </a>
				</div>
  			</div>
  			<div class="index_img col-xs-3">
  				<div class="img_lock">
  					<img src="${pageContext.request.contextPath}/img/book_6.jpg" />
  				</div>
  				<div class="index_img_bottom">
  					<ul>
  						<li class="index_li_1">
  							<a href="#">活动&nbsp;<span class="glyphicon glyphicon-flag"></span></a>
  							<ul class="sec_ul_1">
  								<li><span>[活动]</span><a href="#">真知奥秘，唯我知晓</a></li>
									<li><span>[活动]</span><a href="#">如此开始知识的纪元</a></li>
									<li><span>[活动]</span><a href="#">知识就是力量</a></li>
									<li><span>[活动]</span><a href="#">我的梦中国梦</a></li>
									<li><span>[活动]</span><a href="#">后山二手书交易</a></li>
									<li><span>[活动]</span><a href="#">元素之光，照亮前途</a></li>
  							</ul>
  						</li><li class="index_li_2">
  							<a href="#">公告&nbsp;<span class="glyphicon glyphicon-bullhorn"></span></a>
  							<ul class="sec_ul_2">
  								<li><span>[公告]</span><a href="#">特此通知：诚信交易</a></li>
									<li><span>[公告]</span><a href="#">请不要私下交易，谨防被骗</a></li>
									<li><span>[公告]</span><a href="#">相信我们的平台</a></li>
									<li><span>[公告]</span><a href="#">星期天更新购物车系统</a></li>
									<li><span>[公告]</span><a href="#">借阅系统正在制作</a></li>
									<li><span>[公告]</span><a href="#">有情人终成眷属</a></li>
  							</ul>
  						</li>
  					</ul>
  				</div>
  			</div>
  		</div>
  	</div>
  	<!--分类部分-->
  	<div class="container">
  		<div class="book_new">
  			<img src="${pageContext.request.contextPath}/img/big_img_2.jpg" />
  		</div>
  		<div id="book_class">
  			<div id="book_man" class="book_set book_set_1">
  				<h4>男生精选</h4>
  				<ol>
  					<li>
  						<em>1.</em>
  						<a href="${pageContext.request.contextPath }/book_findAllBooks.action">
  							<img src="${pageContext.request.contextPath}/img/find_book_1.jpg" />
  						</a>
  						<span><a href="${pageContext.request.contextPath }/book_findAllBooks.action">黑白布局</a></span>
  						<p>魏燕群/谍战</p>
  					</li>
  					<li>
  						<em>2.</em>
  						<a href="${pageContext.request.contextPath }/book_findAllBooks.action">
  							<img src="${pageContext.request.contextPath}/img/find_book_2.jpg" />
  						</a>
  						<span><a href="${pageContext.request.contextPath }/book_findAllBooks.action">水浒传</a></span>
  						<p>施耐庵/小说</p>
  					</li>
  					<li>
  						<em>3.</em>
  						<a href="${pageContext.request.contextPath }/book_findAllBooks.action">
  							<img src="${pageContext.request.contextPath}/img/find_book_3.jpg" />
  						</a>
  						<span><a href="${pageContext.request.contextPath }/book_findAllBooks.action">承担</a></span>
  						<p>佚名/伦理</p>
  					</li>
  					<li>
  						<em>4.</em>
  						<a href="${pageContext.request.contextPath }/book_findAllBooks.action">
  							<img src="img/find_book_4.jpg" />
  						</a>
  						<span><a href="${pageContext.request.contextPath }/book_findAllBooks.action">镜花缘</a></span>
  						<p>李汝珍/长篇古典小说</p>
  					</li>
  					
  					<li>
  						<em>5.</em>
  						<a href="${pageContext.request.contextPath }/book_findAllBooks.action">
  							<img src="${pageContext.request.contextPath}/img/find_book_5.jpg" />
  						</a>
  						<span><a href="${pageContext.request.contextPath }/book_findAllBooks.action">远大前程</a></span>
  						<p>查尔斯·狄更斯/长篇小说</p>
  					</li>
  				</ol>
  			</div>
  			<div id="book_women" class="book_set book_set_1">
  				<h4>女生精选</h4>
  				<ol>
  					<li>
  						<em>1.</em>
  						<a href="${pageContext.request.contextPath }/book_findAllBooks.action">
  							<img src="${pageContext.request.contextPath}/img/find_book_6.jpg" />
  						</a>
  						<span><a href="${pageContext.request.contextPath }/book_findAllBooks.action">孝经</a></span>
  						<p>孔子及其弟子/经典著作</p>
  					</li>
  					<li>
  						<em>2.</em>
  						<a href="${pageContext.request.contextPath }/book_findAllBooks.action">
  							<img src="${pageContext.request.contextPath}/img/find_book_7.jpg" />
  						</a>
  						<span><a href="${pageContext.request.contextPath }/book_findAllBooks.action">诗经</a></span>
  						<p>佚名/古代诗歌</p>
  					</li>
  					<li>
  						<em>3.</em>
  						<a href="${pageContext.request.contextPath }/book_findAllBooks.action">
  							<img src="${pageContext.request.contextPath}/img/find_book_8.jpg" />
  						</a>
  						<span><a href="${pageContext.request.contextPath }/book_findAllBooks.action">马丁·伊登</a></span>
  						<p>[美]杰克·伦敦/长篇小说</p>
  					</li>
  					<li>
  						<em>4.</em>
  						<a href="${pageContext.request.contextPath }/book_findAllBooks.action">
  							<img src="${pageContext.request.contextPath}/img/find_book_9.jpg" />
  						</a>
  						<span><a href="${pageContext.request.contextPath }/book_findAllBooks.action">白话聊斋</a></span>
  						<p>羊春秋 等/小说</p>
  					</li>
  					<li>
  						<em>5.</em>
  						<a href="${pageContext.request.contextPath }/book_findAllBooks.action">
  							<img src="${pageContext.request.contextPath}/img/find_book_10.jpg" />
  						</a>
  						<span><a href="${pageContext.request.contextPath }/book_findAllBooks.action">搜神记</a></span>
  						<p>李辉 等/神话</p>
  					</li>
  				</ol>
  			</div>
  			<div id="book_hot" class="book_set book_set_1">
  				<h4>分类精选</h4>
  				<ol>
  					<li>
  						<em>1.</em>
  						<a href="${pageContext.request.contextPath }/book_findAllBooks.action">
  							<img src="${pageContext.request.contextPath}/img/find_book_11.jpg" />
  						</a>
  						<span><a href="${pageContext.request.contextPath }/book_findAllBooks.action">无声戏</a></span>
  						<p>李渔/短篇小说</p>
  					</li>
  					<li>
  						<em>2.</em>
  						<a href="${pageContext.request.contextPath }/book_findAllBooks.action">
  							<img src="${pageContext.request.contextPath}/img/find_book_12.jpg" />
  						</a>
  						<span><a href="${pageContext.request.contextPath }/book_findAllBooks.action">复活</a></span>
  						<p>列夫·托尔斯泰/长篇小说</p>
  					</li>
  					<li>
  						<em>3.</em>
  						<a href="${pageContext.request.contextPath }/book_findAllBooks.action">
								<img src="${pageContext.request.contextPath}/img/find_book_13.jpg" />
  						</a>
  						<span><a href="${pageContext.request.contextPath }/book_findAllBooks.action">钱穆</a></span>
  						<p>钱穆/语录</p>
  					</li>
  					<li>
  						<em>4.</em>
  						<a href="${pageContext.request.contextPath }/book_findAllBooks.action">
  							<img src="${pageContext.request.contextPath}/img/find_book_14.jpg" />
  						</a>
  						<span><a href="${pageContext.request.contextPath }/book_findAllBooks.action">洛尔迦的诗</a></span>
  						<p>加西亚·洛尔迦/诗歌</p>
  					</li>
  					<li>
  						<em>5.</em>
  						<a href="${pageContext.request.contextPath }/book_findAllBooks.action">
  							<img src="${pageContext.request.contextPath}/img/find_book_15.jpg" />
  						</a>
  						<span><a href="${pageContext.request.contextPath }/book_findAllBooks.action">简爱</a></span>
  						<p>夏洛蒂·勃朗特/长篇小说</p>
  					</li>
  				</ol>
  			</div>
  			<div id="book_recommmend" class="book_set">
  				<h4>强力推荐</h4>
  				<ol>
  					<li><a href="${pageContext.request.contextPath }/book_findAllBooks.action">三生三世，十里桃花</a></li>
  					<li><a href="${pageContext.request.contextPath }/book_findAllBooks.action">斗破苍穹</a></li>
  					<li><a href="${pageContext.request.contextPath }/book_findAllBooks.action">高数详解</a></li>
  					<li><a href="${pageContext.request.contextPath }/book_findAllBooks.action">各种答案汇总</a></li>
  					<li><a href="${pageContext.request.contextPath }/book_findAllBooks.action">期末不挂科宝典</a></li>
  					<li><a href="${pageContext.request.contextPath }/book_findAllBooks.action">海上生明月</a></li>
  					<li><a href="${pageContext.request.contextPath }/book_findAllBooks.action">我爱我家</a></li>
  					<li><a href="${pageContext.request.contextPath }/book_findAllBooks.action">画江湖之不良人</a></li>
  					<li><a href="${pageContext.request.contextPath }/book_findAllBooks.action">梦想X生活</a></li>
  					<li><a href="${pageContext.request.contextPath }/book_findAllBooks.action">秦时明月之君临天下</a></li>
  				</ol>
  			</div>
  		</div>
  	</div>
  	<div id="big_photo">
  		<div class="photo_1">
  			<div class="img_1">
  				<span>白雪</span>
  				<img src="${pageContext.request.contextPath}/img/img_1.jpg"/>
  			</div>
  			<div class="img_1">
  				<span>房屋</span>
  				<img src="${pageContext.request.contextPath}/img/img_2.jpg"/>
  			</div>
  			<div class="img_1">
  				<span>一轮红日</span>
  				<img src="${pageContext.request.contextPath}/img/img_3.jpg"/>
  			</div>
  			<div class="img_1">
  				<span>倒影</span>
  				<img src="${pageContext.request.contextPath}/img/img_8.jpg"/>
  			</div>
  		</div>
  		<div class="photo_2">
  			<div class="book_2">
  				<div class="img_4">
  					<span>树梢</span>
  					<img src="${pageContext.request.contextPath}/img/img_4.jpg"/>
  				</div>
	  			<div class="img_4">
	  				<span>都市生活</span>
	  				<img src="${pageContext.request.contextPath}/img/img_5.jpg">
	  			</div>
	  			<div class="img_2">
	  				<span>梅花鹿</span>
	  				<img src="${pageContext.request.contextPath}/img/img_9.jpg">
	  			</div>
	  		</div>
  			<div class="book_2">
  				<div class="img_3">
  					<span>可爱的小鸟</span>
  					<img src="${pageContext.request.contextPath}/img/img_10.jpg">
  				</div>
  				<div class="img_4">
  					<span>暴风雨</span>
  					<img src="${pageContext.request.contextPath}/img/img_6.jpg">
  				</div>
	  			<div class="img_4">
	  				<span>枫叶+白云</span>
	  				<img src="${pageContext.request.contextPath}/img/img_7.jpg">
	  			</div>
  		</div>
  	</div>
	  </div>
  	<div class="container">
  		<div class="classify_1 h3_position">
  			<h3>经典书库</h3>
  			<div class="left_btn">
  				<a href=""><sapn class="glyphicon glyphicon-menu-left"></span></a>
  			</div>
  			<div class="right_btn">
  				<a href=""><sapn class="glyphicon glyphicon-menu-right"></span></a>
  			</div>
  			<div class="move_img">
  				<ul>
  					<li>
  						<a href="${pageContext.request.contextPath }/book_findAllBooks.action">
  							<img src="${pageContext.request.contextPath}/img/move_1.jpg" />
  						</a>
  						<span><a href="${pageContext.request.contextPath }/book_findAllBooks.action">三国演义</a></span>
  						<p>罗贯中/长篇小说</p>
  					</li>
  					<li>
  						<a href="${pageContext.request.contextPath }/book_findAllBooks.action">
  							<img src="${pageContext.request.contextPath}/img/move_1.jpg" />
  						</a>
  						<span><a href="${pageContext.request.contextPath }/book_findAllBooks.action">三国演义</a></span>
  						<p>罗贯中/长篇小说</p>
  					</li>
  					<li>
  						<a href="${pageContext.request.contextPath }/book_findAllBooks.action">
  							<img src="${pageContext.request.contextPath}/img/move_1.jpg" />
  						</a>
  						<span><a href="${pageContext.request.contextPath }/book_findAllBooks.action">三国演义</a></span>
  						<p>罗贯中/长篇小说</p>
  					</li>
  					<li>
  						<a href="${pageContext.request.contextPath }/book_findAllBooks.action">
  							<img src="${pageContext.request.contextPath}/img/move_1.jpg" />
  						</a>
  						<span><a href="${pageContext.request.contextPath }/book_findAllBooks.action">三国演义</a></span>
  						<p>罗贯中/长篇小说</p>
  					</li>
  					<li>
  						<a href="${pageContext.request.contextPath }/book_findAllBooks.action">
  							<img src="${pageContext.request.contextPath}/img/move_1.jpg" />
  						</a>
  						<span><a href="${pageContext.request.contextPath }/book_findAllBooks.action">三国演义</a></span>
  						<p>罗贯中/长篇小说</p>
  					</li>
  					<li>
  						<a href="${pageContext.request.contextPath }/book_findAllBooks.action">
  							<img src="${pageContext.request.contextPath}/img/move_1.jpg" />
  						</a>
  						<span><a href="${pageContext.request.contextPath }/book_findAllBooks.action">三国演义</a></span>
  						<p>罗贯中/长篇小说</p>
  					</li>
  				</ul>
  			</div>
  			<div class="book_bottom">
  				<div class="book_class_1">
  					<h4>国学</h4>
  					<ul>
  						<li><a href="${pageContext.request.contextPath }/book_findAllBooks.action">东坡易传</a></li>
  						<li><a href="${pageContext.request.contextPath }/book_findAllBooks.action">史记</a></li>
  						<li><a href="${pageContext.request.contextPath }/book_findAllBooks.action">资治通鉴</a></li>
  						<li><a href="${pageContext.request.contextPath }/book_findAllBooks.action">周易</a></li>
  						<li><a href="${pageContext.request.contextPath }/book_findAllBooks.action">三十六计</a></li>
  					</ul>
  					<div class="more_btn">
  						<a href="${pageContext.request.contextPath }/book_findAllBooks.action">更多&nbsp;<sapn class="glyphicon glyphicon-send"></span></a>
  					</div>
  				</div>
  				<div class="book_class_1">
  					<h4>外国文学</h4>
  					<ul>
  						<li><a href="${pageContext.request.contextPath }/book_findAllBooks.action">小王子</a></li>
  						<li><a href="${pageContext.request.contextPath }/book_findAllBooks.action">我的大学</a></li>
  						<li><a href="${pageContext.request.contextPath }/book_findAllBooks.action">在人间</a></li>
  						<li><a href="${pageContext.request.contextPath }/book_findAllBooks.action">童年</a></li>
  						<li><a href="${pageContext.request.contextPath }/book_findAllBooks.action">钢铁是怎么炼成的</a></li>
  					</ul>
  					<div class="more_btn">
  						<a href="${pageContext.request.contextPath }/book_findAllBooks.action">更多&nbsp;<sapn class="glyphicon glyphicon-send"></span></a>
  					</div>
  				</div>
  				<div class="book_class_1">
  					<h4>前沿著作</h4>
  					<ul>
  						<li><a href="${pageContext.request.contextPath }/book_findAllBooks.action">Java面试题</a></li>
  						<li><a href="${pageContext.request.contextPath }/book_findAllBooks.action">Bootstrap实战</a></li>
  						<li><a href="${pageContext.request.contextPath }/book_findAllBooks.action">javaScript DOM的编程艺术</a></li>
  						<li><a href="${pageContext.request.contextPath }/book_findAllBooks.action">物联网与现代物流</a></li>
  						<li><a href="${pageContext.request.contextPath }/book_findAllBooks.action">第一行代码</a></li>
  					</ul>
  					<div class="more_btn">
  						<a href="${pageContext.request.contextPath }/book_findAllBooks.action">更多&nbsp;<sapn class="glyphicon glyphicon-send"></span></a>
  					</div>
  				</div>
  				<div class="book_class_1">
  					<h4>人生感悟</h4>
  					<ul>
  						<li><a href="${pageContext.request.contextPath }/book_findAllBooks.action">解忧杂货店</a></li>
  						<li><a href="${pageContext.request.contextPath }/book_findAllBooks.action">从你的全世界路过</a></li>
  						<li><a href="${pageContext.request.contextPath }/book_findAllBooks.action">追风筝的人</a></li>
  						<li><a href="${pageContext.request.contextPath }/book_findAllBooks.action">看见</a></li>
  						<li><a href="${pageContext.request.contextPath }/book_findAllBooks.action">悍刀雪中行</a></li>
  					</ul>
  					<div class="more_btn">
  						<a href="${pageContext.request.contextPath }/book_findAllBooks.action">更多&nbsp;<sapn class="glyphicon glyphicon-send"></span></a>
  					</div>
  				</div>
  			</div>
  		</div>
  		<!--中间内容的填充-->
  		<div class="fill_content">
  			<img src="${pageContext.request.contextPath}/img/big_img_2.jpg" />
  		</div>
  		<div class="classify_2 h3_position">
  			<h3>考研专题</h3>
  			<div class="left_btn">
  				<a href=""><sapn class="glyphicon glyphicon-menu-left"></span></a>
  			</div>
  			<div class="right_btn">
  				<a href=""><sapn class="glyphicon glyphicon-menu-right"></span></a>
  			</div>
  			<div class="move_img">
  				<ul>
  					<li>
  						<a href="${pageContext.request.contextPath }/book_findAllBooks.action">
  							<img src="${pageContext.request.contextPath}/img/move_1.jpg" />
  						</a>
  						<span><a href="${pageContext.request.contextPath }/book_findAllBooks.action">三国演义</a></span>
  						<p>罗贯中/长篇小说</p>
  					</li>
  					<li>
  						<a href="${pageContext.request.contextPath }/book_findAllBooks.action">
  							<img src="${pageContext.request.contextPath}/img/move_1.jpg" />
  						</a>
  						<span><a href="${pageContext.request.contextPath }/book_findAllBooks.action">三国演义</a></span>
  						<p>罗贯中/长篇小说</p>
  					</li>
  					<li>
  						<a href="${pageContext.request.contextPath }/book_findAllBooks.action">
  							<img src="${pageContext.request.contextPath}/img/move_1.jpg" />
  						</a>
  						<span><a href="${pageContext.request.contextPath }/book_findAllBooks.action">三国演义</a></span>
  						<p>罗贯中/长篇小说</p>
  					</li>
  					<li>
  						<a href="${pageContext.request.contextPath }/book_findAllBooks.action">
  							<img src="${pageContext.request.contextPath}/img/move_1.jpg" />
  						</a>
  						<span><a href="${pageContext.request.contextPath }/book_findAllBooks.action">三国演义</a></span>
  						<p>罗贯中/长篇小说</p>
  					</li>
  					<li>
  						<a href="${pageContext.request.contextPath }/book_findAllBooks.action">
  							<img src="${pageContext.request.contextPath}/img/move_1.jpg" />
  						</a>
  						<span><a href="${pageContext.request.contextPath }/book_findAllBooks.action">三国演义</a></span>
  						<p>罗贯中/长篇小说</p>
  					</li>
  					<li>
  						<a href="${pageContext.request.contextPath }/book_findAllBooks.action">
  							<img src="${pageContext.request.contextPath}/img/move_1.jpg" />
  						</a>
  						<span><a href="${pageContext.request.contextPath }/book_findAllBooks.action">三国演义</a></span>
  						<p>罗贯中/长篇小说</p>
  					</li>
  				</ul>
  			</div>
  			<div class="book_bottom">
  				<div class="book_class_1">
  					<h4>数学</h4>
  					<ul>
  						<li><a href="${pageContext.request.contextPath }/book_findAllBooks.action">概率论</a></li>
  						<li><a href="${pageContext.request.contextPath }/book_findAllBooks.action">离散数学</a></li>
  						<li><a href="${pageContext.request.contextPath }/book_findAllBooks.action">高等数学</a></li>
  						<li><a href="${pageContext.request.contextPath }/book_findAllBooks.action">高等数学（上）</a></li>
  						<li><a href="${pageContext.request.contextPath }/book_findAllBooks.action">高等数学（下）</a></li>
  					</ul>
  					<div class="more_btn">
  						<a href="${pageContext.request.contextPath }/book_findAllBooks.action">更多&nbsp;<sapn class="glyphicon glyphicon-send"></span></a>
  					</div>
  				</div>
  				<div class="book_class_1">
  					<h4>英语</h4>
  					<ul>
  						<li><a href="${pageContext.request.contextPath }/book_findAllBooks.action">新概念</a></li>
  						<li><a href="${pageContext.request.contextPath }/book_findAllBooks.action">大学英语</a></li>
  						<li><a href="${pageContext.request.contextPath }/book_findAllBooks.action">英语写作</a></li>
  						<li><a href="${pageContext.request.contextPath }/book_findAllBooks.action">英语阅读和听力</a></li>
  						<li><a href="${pageContext.request.contextPath }/book_findAllBooks.action">英语专项训练</a></li>
  					</ul>
  					<div class="more_btn">
  						<a href="${pageContext.request.contextPath }/book_findAllBooks.action">更多&nbsp;<sapn class="glyphicon glyphicon-send"></span></a>
  					</div>
  				</div>
  				<div class="book_class_1">
  					<h4>政治</h4>
  					<ul>
  						<li><a href="${pageContext.request.contextPath }/book_findAllBooks.action">马克思主义</a></li>
  						<li><a href="${pageContext.request.contextPath }/book_findAllBooks.action">毛泽东思想</a></li>
  						<li><a href="${pageContext.request.contextPath }/book_findAllBooks.action">邓小平理论</a></li>
  						<li><a href="${pageContext.request.contextPath }/book_findAllBooks.action">科技是第一生产力</a></li>
  						<li><a href="${pageContext.request.contextPath }/book_findAllBooks.action">政治考题汇总</a></li>
  					</ul>
  					<div class="more_btn">
  						<a href="${pageContext.request.contextPath }/book_findAllBooks.action">更多&nbsp;<sapn class="glyphicon glyphicon-send"></span></a>
  					</div>
  				</div>
  				<div class="book_class_1">
  					<h4>专业课</h4>
  					<ul>
  						<li><a href="${pageContext.request.contextPath }/book_findAllBooks.action">数学类</a></li>
  						<li><a href="${pageContext.request.contextPath }/book_findAllBooks.action">文学类</a></li>
  						<li><a href="${pageContext.request.contextPath }/book_findAllBooks.action">计算机类</a></li>
  						<li><a href="${pageContext.request.contextPath }/book_findAllBooks.action">金融类</a></li>
  						<li><a href="${pageContext.request.contextPath }/book_findAllBooks.action">英语类</a></li>
  					</ul>
  					<div class="more_btn">
  						<a href="${pageContext.request.contextPath }/book_findAllBooks.action">更多&nbsp;<sapn class="glyphicon glyphicon-send"></span></a>
  					</div>
  				</div>
  			</div>
  		</div>
  	</div>
  	<footer class="tail">
  		
  	</footer>
    <!-- jQuery (necessary for Bootstrap's JavaScript plugins) -->
    <%--<script src="${pageContext.request.contextPath}/js/jquery-3.1.1.js"></script>--%>

    <!-- Include all compiled plugins (below), or include individual files as needed -->
    <script src="${pageContext.request.contextPath}/js/bootstrap.min.js"></script>
    <script src="${pageContext.request.contextPath}/js/index.js"></script>
</body>
</html>