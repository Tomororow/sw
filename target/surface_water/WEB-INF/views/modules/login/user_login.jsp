<%@ page language="java" import="java.util.*" pageEncoding="utf-8"%>
<%@ include file="/WEB-INF/views/base.jsp"%>

<!doctype html>
<html lang="en">
<head>
	<meta charset="UTF-8">
	<title>系统登录界面</title>
	<link rel="stylesheet" type="text/css" href="${ctxstc}/css/login/zui.css" media="all">
	<link rel="stylesheet" type="text/css" href="${ctxstc}/css/login/login.css" media="all">
	<link rel="stylesheet" type="text/css" href="${ctxstc}/css/login/animate.min.css" >
	<link rel="stylesheet" type="text/css" href="${ctxstc}/css/login/font-awesome.min.css" >
	<style>
		body {background-image: url(${ctxstc}/images/login/4.jpg);}
	</style>
</head>

<body>
	<div id="main-box"></div>
	<div id="main-content">
		<div class="login-body  animated fadeInLeft">
			<div class="login-main pr">
				<form action="${ctx}/login/login" method="post" class="login-form">
					<h3>金志智慧水务</h3>
					<h5 style="padding-bottom:10px;">管理中心</h5>
					<!-- 账号登陆 -->
					<div id="MobileBox" class="item-box">
						<div class="input-group user-name">
							<span class="input-group-addon">
								<img src="${ctxstc}/images/login/user.png" width="28" height="28">
							</span>
							<input type="text" name="userName" class="form-control" placeholder="用户名/手机号">
						</div>
						
						<div class="input-group password">
							<span class="input-group-addon">
								<img src="${ctxstc}/images/login/pwd.png" width="30" height="30">
							</span>
							<input type="password" name="userPwd" class="form-control" placeholder="密码">
						</div>

						<div class="use-qrcode-a">
							<a class="use-ding" href="javascript:void(0)"><span>${loginMessage}</span>
						</div>

						<div class="login_btn_panel">
							<button class="btn btn-primary btn-block btn-lg"
								data-ajax="post" type="submit" data-callback="success">登&nbsp;&nbsp;&nbsp;&nbsp;录</button>
							<div class="check-tips"></div>
						</div>
					</div>
				</form>
			</div>
		</div>
	</div>
</body>
</html>