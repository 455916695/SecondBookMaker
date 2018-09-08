<%@page import="javafx.scene.chart.PieChart.Data"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <title>二手书交易平台</title>
	<!-- 导入jquery核心类库 -->
	<script type="text/javascript" src="${pageContext.request.contextPath}/js/jquery-1.8.3.js"></script>
    <link href="${pageContext.request.contextPath}/css/bootstrap.min.css" rel="stylesheet">
    <link href="${pageContext.request.contextPath}/css/login.css" rel="stylesheet">
      <script src="https://cdn.bootcss.com/html5shiv/3.7.3/html5shiv.min.js"></script>
      <script src="https://cdn.bootcss.com/respond.js/1.4.2/respond.min.js"></script>
<!--

//对服务协议按钮做出的判断  
function arrgement(){  
	  if(document.getElementById("checked").checked){  
		          
		      document.getElementById("zhuce").innerHTML="<input class=\"loginregister\" id=\"loginregister\" type=\"submit\" onclick=\"clickregister()\" value=\"注册 \"  />";  
		      document.getElementById("loginregister").style.color = "#FFF";  
		      document.getElementById("loginregister").style.backgroundColor="#60F";  
		      return true;  
		}else {  
		          
		      document.getElementById("zhuce").innerHTML="<input class=\"loginregister\" id=\"loginregister\" type=\"button\"  value=\"注册 \"  />";  
		      document.getElementById("loginregister").style.color =="#000000";  
		      document.getElementById("loginregister").style.backgroundColor="#D5D3CD";  
		      return false;  
		  }  
} 
 
	//判断有没有勾选协议
			if(document.getElementById("checked").checked==true){  
				          
				      document.getElementById("zhuce").innerHTML="<input class=\"loginregister\" id=\"loginregister\" type=\"submit\" onclick=\"clickregister()\" value=\"注册 \"  />";  
				      document.getElementById("loginregister").style.color = "#FFF";  
				      document.getElementById("loginregister").style.backgroundColor="#60F";  
				      //return true;  
				}else {  
				          
				      document.getElementById("zhuce").innerHTML="<input class=\"loginregister\" id=\"loginregister\" type=\"button\"  value=\"注册 \"  />";  
				      document.getElementById("loginregister").style.color =="#000000";  
				      document.getElementById("loginregister").style.backgroundColor="#D5D3CD";  
					  if(flag){
						flage =  false;
						}  
				  }  
		return flage;
}

-->
<style type=text/css>
.error{
	color:red;
}
.success{
	color:green;
}
.login_add {
	position: absolute;
	font-size: 13px;
	padding-left: 8px;
}
</style>
</head>
<body>
<%--<form id="form" name="registerForm" action="${pageContext.request.contextPath}/userRegist"  onsubmit="return clickregister()" method="post">--%>

<div class="container">
  		<div id="reg_header">
  			<div class="login_logo">
  				<img src="${pageContext.request.contextPath}/img/logo.png" />
  			</div>
  			<h1>欢迎注册</h1>
  			<div class="login_sapn">返回&nbsp;<a href="${pageContext.request.contextPath}/common_login">登录&nbsp;<span class="glyphicon glyphicon-log-out"></span></a></div>
  		</div>
	<form id="registerForm"  action="${pageContext.request.contextPath}/userRegist"  method="post">
  		<div class="login_center">
  			<div class="login_left">
  				<div class="login_body">
	  					<ul>
	  						
		  					<li>
		  						<%--@declare id="username"--%><label for="user_name">用户名</label>
		  						<%--<input type="text" id="user_name" class="required" name="username"  value="${tbUser.username}" onblur="userNameBlur()" placeholder="你的昵称"/>--%>
		  						<input type="text" id="user_name" class="required" name="username"  value="${tbUser.username}"  onblur="userNameBlur()" placeholder="你的昵称"/>
		  					</li>
		  					<span id="usernameTip" class="login_add"></span>
	  						<li>
	  							<%--@declare id="password"--%><label for="user_password">设置密码</label>
	  							<%--<input type="text" id="user_password" class="required" name="password" value="${tbUser.password}" onblur="passwordBlur()" placeholder="设置的复杂点啊"/>--%>
	  							<input type="password" id="user_password" class="required" name="password" value="${tbUser.password}" placeholder="设置的复杂点啊"/>
	  						</li>
		  					<span id="passwordTip" class="login_add"></span>
	  						<li>
	  							<label for="user_repassword">确认密码</label>
	  							<input type="password" id="user_repassword" class="required"    placeholder="和上面一样"/>
	  						</li>
		  					<span id="repasswordTip" class="login_add"></span>
	  						<li>
	  							<label for="user_phone">手机号</label>
	  							<input type="text" id="user_phone" class="required" name="phone"   placeholder="最好是常用邮箱"/>
	  						</li>
		  					<span id="phoneTip" class="login_add"></span>
	  						<li>
	  							<label for="ver_code">验证码</label>
	  							<%--<input type="text" id="ver_code" class="required"   placeholder="后面的奇怪图片"/>--%>
	  							<input type="text" id="ver_code" class="required" onblur="vercodeBlur()"  placeholder="后面的奇怪图片"/>
	  							<div class="ver_code_img">
									<img id="loginform:vCode" src="${pageContext.request.contextPath }/validatecode"
										 onclick="javascript:document.getElementById('loginform:vCode').src='${pageContext.request.contextPath }/validatecode?'+Math.random();" />
	  							</div>
	  						</li>
	  						<span id="ver_codeTip" class="login_add"></span>
	  					</ul>
	  					<div class="login_btn" id="readname">
	  						<input type="checkbox" id="checked"  onclick="arrgement()"  value="520" checked="checked"/>&nbsp;
	  						<span>《二手书注册协议》</span>
	  						<div id="zhuce" class="loginname">
	  							<input type="button" class="loginregister btn btn-default" id="loginregister" value="立即注册" />
		  					</div>	
	  					</div>	
  				</div>
  			</div>
  			<div class="login_right">
  				<div class="login_partner">
  					<h3>合作伙伴</h3>
  					<figure>
	  					<img src="img/login_1.jpg" />
	  					<figcaption><a href="http://www.chtc.edu.cn/">巢湖学院</a></figcaption>
	  				</figure>
  				</div>
  			</div>
  		</div>
	</form>
  	</div>

  	<footer class="tail">
  		
  	</footer>


<%--<script type="text/javascript">--%>
    <%--$(function () {--%>
        <%--$("#loginregister").click(function () {--%>
            <%--checkVercode(); //user/checkVercode--%>
            <%--checkuserName();--%>
            <%--checkEmail();--%>
            <%--passwordBlur();--%>
            <%--repasswordBlur();--%>
            <%--if($(".error").length> 0){   //获取class 属性 存在error型的，再获取其中的个数--%>
                <%--return false;--%>
            <%--}else{--%>
                <%--$("#registerForm").submit();--%>
                <%--return true;--%>
            <%--}--%>
        <%--});--%>
    <%--});--%>

    <%--//验证邮箱--%>
    <%--function checkEmail(){--%>
        <%--var email = $("#email").val();--%>
        <%--// 进行判断，说明没有输入密码--%>
        <%--if(email.trim() == ""){--%>
            <%--// 给提示--%>
            <%--$("#emailTip").addClass("error").html("邮箱不能为空");--%>
        <%--}--%>
    <%--}--%>
    <%--//验证邮箱--%>
    <%--function emailBlur(){--%>
        <%--var email = $("#email").val();--%>
        <%--// 进行判断，说明没有输入密码--%>
        <%--if(email.trim() == ""){--%>
            <%--// 给提示--%>
            <%--$("#emailTip").addClass("error").html("邮箱不能为空");--%>
        <%--}else{--%>
            <%--if(!/.+@.+\.[a-zA-Z]{2,4}$/.test(email)){--%>
                <%--// 给提示--%>
                <%--$("#emailTip").addClass("error").html("邮箱格式不正确！");--%>
            <%--}else{--%>
                <%--//邮箱不为空，ajax请求，验证--%>
                <%--var url = "${pageContext.request.contextPath}/user/checkEmail";--%>
                <%--var param = {"email":email};--%>
                <%--$.post(url,param,function(data){--%>
                    <%--// 操作data，进行判断--%>
                    <%--if(data && data == "yes"){--%>
                        <%--// 提示--%>
                        <%--$("#emailTip").addClass("error").html("邮箱已经存在！");--%>
                    <%--}else{--%>

                        <%--$("#emailTip").removeClass("error").addClass("success").html("√可以使用");--%>
                    <%--}--%>
                <%--});--%>
            <%--}--%>
        <%--}--%>

    <%--}--%>

    <%--//验证验证码--%>
    <%--function checkVercode() {--%>
        <%--var ver_code = $("#ver_code").val();--%>
        <%--// 进行判断，说明没有输入密码--%>
        <%--if(ver_code.trim() == ""){--%>
            <%--// 给提示--%>
            <%--$("#ver_codeTip").addClass("error").html("验证码不能为空");--%>
        <%--}--%>
    <%--}--%>



    <%--//验证登录名--%>
    <%--function checkuserName() {--%>
        <%--// 获取用户输入的登录名--%>
        <%--var user_name = $("#user_name").val();--%>
        <%--// 进行判断，说明没有输入登录名--%>
        <%--if(user_name.trim() == ""){--%>
            <%--// 给提示--%>
            <%--$("#usernameTip").addClass("error").html("登录名不能为空");--%>

        <%--}--%>
    <%--}--%>
    <%--//验证登录名--%>
    <%--function userNameBlur() {--%>
        <%--// 获取用户输入的登录名--%>
        <%--var user_name = $("#user_name").val();--%>
        <%--// 进行判断，说明没有输入登录名--%>
        <%--if(user_name.trim() == ""){--%>
            <%--// 给提示--%>
            <%--$("#usernameTip").addClass("error").html("登录名不能为空");--%>

        <%--}else{--%>
            <%--// 登录名不为空，ajax请求，验证--%>
            <%--var url = "${pageContext.request.contextPath}/user/checkUsername";--%>
            <%--var param = {"user_name":user_name};--%>
            <%--$.post(url,param,function(data){--%>
                <%--// 操作data，进行判断--%>
                <%--if(data && data == "no"){--%>
                    <%--// 提示--%>
                    <%--$("#usernameTip").addClass("error").html("登录名已经存在");--%>
                <%--}else{--%>

                    <%--$("#usernameTip").removeClass("error").addClass("success").html("√可以使用");--%>
                <%--}--%>
            <%--});--%>
        <%--}--%>
    <%--}--%>

    <%--//验证密码--%>
    <%--function passwordBlur(){--%>
        <%--var user_password = $("#user_password").val();--%>
        <%--// 进行判断，说明没有输入密码--%>
        <%--if(user_password.trim() == ""){--%>
            <%--// 给提示--%>
            <%--$("#passwordTip").addClass("error").html("密码不能为空");--%>
        <%--}else{--%>
            <%--$("#passwordTip").removeClass("error").addClass("success").html("√可以使用");--%>
        <%--}--%>
    <%--}--%>

    <%--//再次验证密码--%>
    <%--function repasswordBlur(){--%>
        <%--var repassword=$("#repassword").val();--%>
        <%--var user_password = $("#user_password").val();--%>
        <%--if(repassword.trim() == "") {--%>
            <%--// 给提示--%>
            <%--$("#repasswordTip").addClass("error").html("确认密码不能为空");--%>
        <%--}else{--%>
            <%--if(repassword.trim()!= user_password.trim()){--%>
                <%--// 给提示--%>
                <%--$("#repasswordTip").addClass("error").html("两次密码输入必须一致");--%>
            <%--}else {--%>
                <%--$("#repasswordTip").removeClass("error").addClass("success").html("√密码一致");--%>
            <%--}--%>
        <%--}--%>
    <%--}--%>



<%--</script>--%>

	<!-- jQuery (necessary for Bootstrap's JavaScript plugins) -->
	    <!-- 引入JQ -->
	<%--<script type="text/javascript" src="${ pageContext.request.contextPath }/js/jquery-1.8.3.js"></script>--%>
    <!-- Include all compiled plugins (below), or include individual files as needed -->
    <script src="js/bootstrap.min.js"></script>

    <script type="text/javascript">

        $(function () {
            $("#loginregister").click(function () {

                REGISTER.register();
            });
        });

        //验证验证码
        function vercodeBlur() {
            var ver_code = $("#ver_code").val();
            // 进行判断，说明没有输入密码
            if(ver_code.trim() == ""){
                // 给提示
                $("#ver_codeTip").addClass("error").html("验证码不能为空");
            }else{
                // 验证码不为空，ajax请求，验证
                var url = "${pageContext.request.contextPath}/user/checkVercode";
                var param = {"vercode":ver_code};
                $.post(url,param,function(data){
                    // 操作data，进行判断
                    if(data && data == "no"){
                        // 提示
                        $("#ver_codeTip").addClass("error").html("验证码错误");
                    }else{
                        $("#ver_codeTip").removeClass("error").addClass("success").html("√正确");
                    }
                });
            }
        }

    </script>

    <script type="text/javascript">
        var  REGISTER = {
            //登录
            register: function(){
                if(this.inputCheck()) {

                    this.beforSubmit();
                }
            },
            //校验输入的数据是否为空，若果为空，就展示错误，并将标志位改成false
            inputCheck:function () {
                var falg = true ;   //定义标志位
                if($("#user_name").val().trim() == "" ){ //用户名
                    $("#usernameTip").addClass("error").html("×登录名不能为空");
                    falg = false;
                }else{
                    $("#usernameTip").removeClass("error").addClass("success").html(""); //去掉错误信息
                }

                if($("#user_password").val().trim() == "" ){ //密码
                    $("#passwordTip").addClass("error").html("×密码不能为空");
                    falg = false;
                }else{
                    $("#passwordTip").removeClass("error").addClass("success").html("√密码可用"); //去掉错误信息
                }

                if($("#user_repassword").val().trim() == "" ){   //重复密码
                    $("#repasswordTip").addClass("error").html("×重复密码不能为空");
                    falg = false;
                }else if($("#user_repassword").val() != $("#user_password").val()){
                    $("#repasswordTip").removeClass("success").addClass("error").html("两次密码需要相同");
                    falg = false;
                }else{
                    $("#repasswordTip").removeClass("error").addClass("success").html("√密码正确"); //去掉错误信息
                }

                if($("#user_phone").val().trim() == "" ){  //手机号码
                    $("#phoneTip").addClass("error").html("×手机号码不能为空");
                    falg = false;
                }else{
                    $("#phoneTip").removeClass("error").addClass("success").html(""); //去掉错误信息
                }

                if($("#ver_code").val().trim() == "" ){  //验证码
                    $("#ver_codeTip").addClass("error").html("×验证码不能为空");
                    falg = false;
                }else{
                    $("#ver_codeTip").removeClass("error").addClass("success").html(""); //去掉错误信息
                }

                return falg;
            },
            //提交数据 ，  使用ajax，一项一项数据的进行提交，校验，如果失败就报错，如果成功就进行下一项数据的校验
            beforSubmit:function () {
                $.ajax({ //ajax校验用户名是否可用，如果可用继续校验手机号，不可用展示错误
                    url: "/user/check/"+escape($("#user_name").val())+"/1?r="+Math.random(), //路径上带参数 1 表示校验用户名， 2表示校验手机号
                    success : function (data) {
                        if(data.data) {
                            //继续调用ajax ，校验手机号
                            $.ajax({
                                url: "/user/check/"+escape($("#user_phone").val())+"/2?r="+Math.random(),
                                success: function (data) {
                                    //如果结果为true，就调用方法提交数据
                                    if(data.data) {
                                        //提交数据
                                        REGISTER.doSubmit();
                                    }else{
                                        $("#phoneTip").removeClass("success").addClass("error").html("×该手机号已被注册");
                                    }
                                }
                            });
                        }else{
                            $("#usernameTip").removeClass("success").addClass("error").html("×用户名已存在");
                        }
                    }

                });
            },
            doSubmit :function () {
                $.post(
                    "/user/register",
                    $("#registerForm").serialize(),
                    function(data){
                        if(data.data) {

                            //若果成功，调用方法跳转到登录页面
                            REGISTER.login();

                        }else{
                            //提交表单数据，如果失败弹出提示框注册失败
                            alert("注册失败!");
                        }
                    }
                );
            },
            login :function () {
                location.href = "/page/login";
                return false;
            }
        };
    </script>


</body>
</html>