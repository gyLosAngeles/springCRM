<%@ page language="java" contentType="text/html; charset=utf-8"
    pageEncoding="utf-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="utf-8">
<title>Insert title here</title>
	<link href="/CRMManage/css/layout.css" rel="stylesheet" type="text/css">
	<link href="/CRMManage/css/login.css" rel="stylesheet" type="text/css">
	<script type="text/javascript" src="/CRMManage/js/easyui demo/js/jquery-1.8.0.min.js"></script>
	<script type="text/javascript" src="/CRMManage/js/jquery.cookie.js"></script>
	
	<script type="text/javascript">
	$(function(){
		if($.cookie("username") != undefined){
			$("#username").val($.cookie("username"));
		}
	});
	function submitFromUser() {
		$.ajax({
			type:'post',
			url:'/CRMManage/login',
			dataType:'json',
			data:{
				kaptcha:$("#kaptcha").val(),
				userName:$("#username").val(),
				userPassWord:$("#password").val()
			},
			success:function(res){
				 if(res.success){
					 alert(res.message);
					 window.location.href="/CRMManage/index.jsp";
				 }else{
					alert(res.message);
				 }  
			}
		});		
	}
	function changeCode() { //刷新
		var data = new Date().getTime();
		$("#kaptcha").val("");
		$('#kaptchaImage').click().attr('src', 'KaptchaServlet?tt=' + data);
	}
	</script>
	
</head>
	<style>
		.ibar {display: none;}
	</style>
	<body class="login-bg">
		<div class="main ">
			<!--登录-->
			<div class="login-dom login-max">
				<div class="logo text-center">
					<a href="#">
					<img src="/CRMManage/img/logo.png" width="180px" height="180px">
					</a>
				</div>
				<div class="login container " id="login">
					<p class="text-big text-center logo-color">
						同一个账号，连接一切
					</p>
					<p class=" text-center margin-small-top logo-color text-small">
						控制台 | 云平台 | 论坛 | 云市场
					</p>
					<form class="login-form" autocomplete="off">
						<div class="login-box border text-small" id="box">
							<div class="name border-bottom">
								<input type="text" placeholder="用户名" id="username" name="username" >
							</div>
							<div class="pwd">
								<input type="password" placeholder="密码"  id="password" name="password"  >
							</div>
							<!-- 验证码 -->
							<tr style="padding: 20px;">
								<td>验证码：</td>
								<td><input name="kaptcha" type="text" id="kaptcha" maxlength="4" class="easyui-textbox" required="required"
									style="width:60px;height:25px" /> <img src="KaptchaServlet" id="kaptchaImage" style="height: 30px;" /> 
									<a href="javascript:changeCode()">看不清?换一张</a></td>
							</tr>
						</div>
						<input type="hidden" name="formhash" value="5abb5d21"/>
						<input onclick="submitFromUser()" class="btn text-center login-btn" value="立即登录">
					</form>
				</div>
			</div>

			<div class="footer text-center text-small ie">
				Copyright 2013-2016 某某科技科技有限公司 版权所有 <a href="#" target="_blank">滇ICP备13005806号</a>
				<span class="margin-left margin-right">|</span>
			</div>
			<div class="popupDom">
				<div class="popup text-default">
				</div>
			</div>
		</div>
		<div><a href="http://www.miitbeian.gov.cn/">豫ICP备19014571号-1</a></div>
	</body>
</body>
</html>