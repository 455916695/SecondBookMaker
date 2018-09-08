<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
 <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <title>二手书交易平台</title>
    <link href="${pageContext.request.contextPath}/css/bootstrap.min.css" rel="stylesheet">
    <link href="${pageContext.request.contextPath}/css/register.css" rel="stylesheet">
	<script type="text/javascript" src="${pageContext.request.contextPath}/js/jquery-1.8.3.js"></script>
      <script src="https://cdn.bootcss.com/html5shiv/3.7.3/html5shiv.min.js"></script>
      <script src="https://cdn.bootcss.com/respond.js/1.4.2/respond.min.js"></script>

  <!-- 引入JQ -->
</head>
<body>
	<form id="loginForm" name="form" action="${pageContext.request.contextPath }/user_login.action" onsubmit="return clickLogin()" method="post">
		<div class="container">
		  		<div id="reg_header">
		  			<div class="login_logo">
		  				<img src="${pageContext.request.contextPath}/img/logo.png" />
		  			</div>
		  			<h1>欢迎登录</h1>
		  			<div class="login_sapn">返回&nbsp;<a href="/common_homepage">首页&nbsp;<span class="glyphicon glyphicon-log-out"></span></a></div>
		  		</div>
	  	</div>
	  	<div id="reg_center" class="reg_center">
	  		<div class="container" id="reg_background">
	  			<div class="reg_reg">
	  				<h3>用户登录</h3>
	  					<form>
							<span  id="error"  class="reg_span"> </span>
		  					<tr>
		  						 <div class="input-group">
								      <div class="input-group-addon">
								      	<span   class="glyphicon glyphicon-user"></span>
								      </div>
								      <input type="text" name="phone" id="user_phone" class="required"  placeholder="手机号" />
							    </div>
		  					</tr>
		  					<span id="phoneTip" class="reg_span"></span>
		  					<tr>
		  						<div class="input-group">
							      <div class="input-group-addon">
							      	<span class="glyphicon glyphicon-lock"></span>
							      </div>
							      <input type="password" name="password" id="user_password" class="required" onblur="passwordBlur()" placeholder="请输入密码" />
							   </div>
		  					</tr>
		  					<span id="passwordTip" class="reg_span"></span>
		  					<tr>
		  						<input type="checkbox" id="checkbox" name="remember" value="222"/><span>记住密码</span>
		  						<a href="" id="forget_pw">忘记密码</a>
		  					</tr>
		  					<tr>
		  						<div id="denglu" class="dengluname">
									<input type="button" class="btn login" id="loginButton" value="登录" />
		  							<%--<button type="submit" id="login" class="btn login">登录</button>--%>
			  					</div>	
		  					</tr>
		  					<tr>
		  						<a href="" id="login_other">登录途径</a>
		  						<a href="${pageContext.request.contextPath }/common_regist" id="reg_ontime">立即注册&nbsp;<span class="glyphicon glyphicon-log-out"></span></a>
		  					</tr>
		  				</form>
	  			</div>
	  		</div>
	  	</div>
	  	
		<!-- jQuery (necessary for Bootstrap's JavaScript plugins) -->
	    <!-- Include all compiled plugins (below), or include individual files as needed -->
	    <script type="text/javascript">
            var redirectUrl = "${redirectUrl}";
			var LOGIN = {
			     login : function () {
					if(this.inputLoginCheck()) {
						$.post(
						    "/user/login",
							$("#loginForm").serialize(),
							function (data) {
								//判断登录是否成功，如果失败，就显示用户名或密码错误，如果成功，跳转指定页面
								if(data.data) {

                                    //判断loginUrl是否为空，如果为空就跳转到首页，如果不为空就跳转到指定界面
                                    $("#error").removeClass("error").html("");
                                    if(redirectUrl.trim() == "") {

                                        location.href = "http://localhost:8848";
									}else{

                                        location.href = redirectUrl;
									}
                                }else{
									$("#error").addClass("error").html("×用户名或密码错误");
                                }
                            }
						);
					}
                },
                inputLoginCheck : function () {
			        var falg = true ;
					//判断手机号是否为空
					if($("#user_phone").val().trim() == "") {
						$("#phoneTip").addClass("error").html("×手机号不能为空");
                        falg = false;
					}else {
					    $("#phoneTip").removeClass("error").html("");
					}
					//判断密码是否为空
                    if($("#user_password").val().trim() == "") {
                        $("#passwordTip").addClass("error").html("×密码不能为空");
                        falg = false;
                    }else {
                        $("#passwordTip").removeClass("error").html("");
                    }
                    return falg;
                }
			};

		</script>
		<script type="text/javascript" >

			$(function () {
				$("#loginButton").click (function () {
                    LOGIN.login();
                });
            });
		</script>

	   <script src="${pageContext.request.contextPath}/js/bootstrap.min.js"></script>
	   <%--<script type="text/javascript" src="${ pageContext.request.contextPath }/js/jquery-1.11.3.min.js"></script>--%>
  </form>
</body>
</html>