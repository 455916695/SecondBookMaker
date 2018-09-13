<%-- 个人中心 --%>
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
    <link href="../../../css/personal.css" rel="stylesheet">
    <!-- HTML5 shim and Respond.js for IE8 support of HTML5 elements and media queries -->
    <!-- WARNING: Respond.js doesn't work if you view the page via file:// -->
    <!--[if lt IE 9]>
      <script src="https://cdn.bootcss.com/html5shiv/3.7.3/html5shiv.min.js"></script>
      <script src="https://cdn.bootcss.com/respond.js/1.4.2/respond.min.js"></script>
    <![endif]-->
    
    <style type=text/css>
	.error{
		color:red;
}
	.success{
		color:green;
	}
	
</style>
    
     <!-- 引入JQ -->
<script type="text/javascript" src="${ pageContext.request.contextPath }/js/jquery-1.11.3.min.js"></script>
<script type="text/javascript">

//验证原始密码
function passwordBlur(){
	
	var user_password = $("#user_password").val();
	// 进行判断，说明没有输入密码
	if(user_password.trim() == ""){
		// 给提示
		$("#passwordTip").addClass("error");
		$("#passwordTip").html("密码不能为空");		
	}else{
		//ajax请求验证
		var url = "${pageContext.request.contextPath}/user_checkPassword.action";
		var param = {"user_password":user_password};
		$.post(url,param,function(data){
			//操作data进行判断
			if(data && data == "no"){
				//提示
				$("#passwordTip").addClass("error");
				$("#passwordTip").html("密码错误！请重试");
			}
			else{
				$("#passwordTip").removeClass("error");
				$("#passwordTip").addClass("success");
				$("#passwordTip").html("√");
				
			}
			
		});
		
	} 
		
	
}

//验证新密码
function newPasswordBlur(){
	var newUser_password = $("#newUser_password").val();
	// 进行判断，说明没有输入密码
	if(newUser_password.trim() == ""){
		// 给提示
		$("#newPasswordTip").addClass("error");
		$("#newPasswordTip").html("密码不能为空");		
	}else{
		$("#newPasswordTip").removeClass("error");
		$("#newPasswordTip").addClass("success");
		$("#newPasswordTip").html("√可以使用");
	}
}
//再次验证新密码
function repasswordBlur(){
	 var repassword=$("#repassword").val();  
	 var newUser_password = $("#newUser_password").val();  
	 if(repassword.trim() == "") {  
		// 给提示
		$("#repasswordTip").addClass("error");
		$("#repasswordTip").html("确认密码不能为空");
	}else{
		 if(repassword.trim()!= newUser_password.trim()){  
		// 给提示
		$("#repasswordTip").addClass("error");
		$("#repasswordTip").html("两次密码输入必须一致");
	 }else {  
	   $("#repasswordTip").removeClass("error");
	   $("#repasswordTip").addClass("success");
	   $("#repasswordTip").html("√密码一致");
	 }  
	}
		
	
}



//阻止表单提交
function clickmodify(){
	passwordBlur();
	newPasswordBlur();
	repasswordBlur();
	if($(".error").length > 0){
		return false;
	}
}

</script>
    
    
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
  				<c:if test="${eUser == null}">
  				<a href="personal.jsp">个人中心</a>
  				<a href="login.jsp.bak">登录&nbsp;<span class="glyphicon glyphicon-user"></span></a>
  				</c:if>
  				<c:if test="${eUser != null}">
  				<a href="${pageContext.request.contextPath }/user_quit.action">注销&nbsp;<span class="glyphicon glyphicon-off"></span></a>
  				</c:if>
  			</div>
  		</div>
  	</div>
  	<div class="container">
  		<div id="reg_header">
  			<div class="login_logo">
  				<img src="../../../img/logo.png" />
  			</div>
  			<h1>个人中心</h1>
  			<div class="login_sapn">返回&nbsp;<a href="home_page.jsp.bak">首页&nbsp;<span class="glyphicon glyphicon-log-out"></span></a></div>
  		</div>
  		<div class="per_left">
  			<div id="per_person" class="window_on">
					<div class="per_color">
						<div class="per_img">
							<img src="../../../img/ld_1.jpg" class="img-circle"/>
						</div>
						<div class="per_name">
							<span>物工一班</span>
						</div>
					</div>
					<ul>
						<li><a href="#per_first">基本资料</a></li>
						<li><a href="#per_second">用户头像</a></li>
						<li><a href="#per_third">修改密码</a></li>
						<li><a href="#per_fourth">以往记录</a></li>
					</ul>
				</div>
  		</div>
  		<div class="per_right">
  		
  			<button id="per_btn" class="btn btn-default">修改</button>
  			<div class="per_first">
	  			<h3 id="per_first">基本资料</h3>
	  			<ul>
	  				<li><span>姓名</span><p> ${eUser.user_name} </p></li>
	  				<li><span>性别</span><p> ${eUser.user_sex } </p></li>
	  				<li><span>年龄</span><p> ${eUser.user_age} </p></li>
	  				<li><span>手机号</span><p> ${eUser.user_phone } </p></li>
	  				<li><span>QQ/微信</span><p> ${eUser.user_qq } </p></li>
	  				<li><span>现居地</span><p> ${eUser.user_addr } </p></li>
	  				<li><span>自我介绍</span><p> ${eUser.user_instro } </p></li>
	  			</ul>
	  		</div>
	  		
	  		<form action="${pageContext.request.contextPath }/user_updateBase.action" method="post" >
		  		<div class="per_first_2">
		  			<h3 id="per_first">基本资料</h3>
		  			<ul>
		  				<li><span>姓名</span><input id="user_name" name="user_name" type="text" placeholder="我们需要真实姓名"/></li>
		  				<li><span>性别</span>
			  					<input id="user_sex" name="user_sex" type="radio" value="男" />&nbsp;男
								<input id="user_sex" name="user_sex" type="radio" value="女" />&nbsp;女
		  				</li>
		  				<li><span>年龄</span><input id="user_age" name="user_age" type="number"/></li>
		  				<li><span>手机号</span><input id="user_phone" name="user_phone" type="text" placeholder="请输入常用手机号"/></li>
		  				<li><span>QQ/微信</span><input id="user_qq" name="user_qq" type="text" placeholder="请输入你常用的联系方式"/></li>
		  				<li><span>现居地</span>
	  							<select id="user_addr" name="user_addr">
									  	<option value="合肥">合肥</option>
									  	<option value="南京">南京</option>
									  	<option value="芜湖">芜湖</option>
									  	<option value="巢湖学院">巢湖学院</option>
								</select>
		  				</li>
		  				<li><span>自我介绍</span><textarea id="user_instro" name="user_instro" placeholder="最好在十五字以内，简洁明了"></textarea></li>
		  			</ul>
		  			<button type="submit" id="per_fir_btn" class="btn btn-default">提交</button>
		  		</div>
	  		</form>
	  		
	  		<div class="per_second">
	  			<h3 id="per_second">用户头像</h3>
	  			<div class="per_img_left">
	  				<span>正在使用</span>
	  				<div class="per_img_now">
	  					<img src="<%=url %>/${eUser.user_headimg}"/>
	  				</div>
	  			</div>
	  			
	  			<div class="per_img_right">
	  				<span>更换</span>
	  				<div class="per_img_change">
	  					<img src="<%=url %>/${eUser.user_headimg}" />
	  				</div>
					<form action="${pageContext.request.contextPath }/user_updateImg.action" method="post" enctype="multipart/form-data" name="input_from"><input 
	  					type="file" name="input_file" id="input_file" style="display: none;" onchange="document.input_from.input_text.value=this.value"/><input 
	  					type="button" id="upload" name="upload" value="选择图片" class="btn btn-default"onclick="document.input_from.input_file.click()"/><input 
	  					type="text" name="input_text" id="input_text"/><br>
				　　　　	<input type="submit" id="per_sub" class="btn btn-default" value="提交"/>
					</form>
	  			</div>
	  			
  			</div>
  			
  			
  			<div class="per_third">
  				<h3 id="per_third">修改密码</h3>
  				
  				<form action="${pageContext.request.contextPath }/user_updatePassword.action" onsubmit="return clickmodify()" method="post">
	  				<div class="per_pas">
	  					<ul>
	  						<li><span class="per_li_span">原始密码</span><input id="user_password" name="user_password" onblur="passwordBlur()" type="text" placeholder="输入原来的密码"/></li>
	  						<div>
		  							<SPAN id="passwordTip" class="per_respan"></SPAN>
		  					</div>
	  						<li><span class="per_li_span">修改密码</span><input id="newUser_password" name="newUser_password" onblur="newPasswordBlur()" type="text" placeholder="想要修改的密码"/></li>
	  						<div>
		  							<SPAN id="newPasswordTip" class="per_respan"></SPAN>
		  					</div>
	  						<li><span class="per_li_span">再次密码</span><input id="repassword" name="repassword" onblur="repasswordBlur()" type="text" placeholder="再输入修改的密码"/></li>
	  						<div>
		  							<SPAN id="repasswordTip" class="per_respan"></SPAN>
		  					</div>
	  					</ul>
	  					<button type="submit" id="per_pas_btn" class="btn btn-default">确定修改</button>
	  				</div>
  				</form>
  				
  			</div>
  			<div class="per_fourth">
  				<h3 id="per_fourth">以往记录</h3>
  				<form>
  					<table>
	  					<tr>
	  						<th>时间</th>
	  						<th>书籍</th>
	  						<th>买方</th>
	  						<th>是否成交</th>
	  					</tr>
	  					<tr>
	  						<td>2017.03.21</td>
	  						<td>高数上册</td>
	  						<td>程明</td>
	  						<td>是</td>
	  					</tr>
	  					<tr>
	  						<td>2017.03.21</td>
	  						<td>高数上册</td>
	  						<td>程明</td>
	  						<td>是</td>
	  					</tr>
	  					<tr>
	  						<td>2017.03.21</td>
	  						<td>高数上册</td>
	  						<td>程明</td>
	  						<td>是</td>
	  					</tr>
  					</table>
  				</form>
  			</div>
  		</div>
  		
  	</div>
  	
  	<footer class="tail">
  		
  	</footer>
  	
  	
	<!-- jQuery (necessary for Bootstrap's JavaScript plugins) -->
    <!-- Include all compiled plugins (below), or include individual files as needed -->
    <script src="../../../js/bootstrap.min.js"></script>
    <script src="../../../js/person.js"></script>
</body>
</html>