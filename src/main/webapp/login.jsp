<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<html lang="zh-CN">
<head>
<meta charset="utf-8">
<meta http-equiv="X-UA-Compatible" content="IE=edge">
<meta name="viewport"
	content="width=device-width,initial-scale=1, user-scalable=no">
<title>济圣科技后台登陆</title>
<link rel="stylesheet" type="text/css"
	href="${pageContext.request.contextPath}/static/bootstrap/css/bootstrap.css">
<style>
* {
	margin: 0;
	padding: 0;
	box-sizing: border-box;
	-webkit-box-sizing: border-box;
}

a {
	text-decoration: none;
	color: #333;
	display: inline-block;
}

li {
	list-style: none;
}

i {
	font-style: normal;
	display: inline-block;
}

html, body {
	height: 100%;
	width: 100%;
}
/* 初始化完毕 */

/* 大盒子 */
.signIn_box {
	position: relative;
	height: 100%;
	width: 100%;
	background:;
	display: flex;
	display: -webkit-flex;
	justify-content: center;
	-webkit-justify-content: center;
	align-items: center;
	-webkit-align-items: center;
	background: url(static/image/background.jpg)
}

/* logo */
.signIn_logo {
	font-size: 25px;
	font-weight: bold;
	text-shadow: 3px 3px 10px #666;
	color: #333;
	position: absolute;
	right: 50px;
	top: 30px;
}

/* 登陆字样 */
.signIn_theme {
	font-size: 30px;
	font-weight: bold;
	position: absolute;
	color: #fff;
	right: 50px;
	top: 30px;
}

/* 输入框盒子 */
.formBox {
	
}

/* 输入框 */
.signIn_input {
	width: 420px;
	height: 55px;
	padding-left: 75px;
	border-top: none;
	border-left: none;
	border-right: none;
	border-bottom: 2px solid #666;
	background-color: transparent;
	font-size: 19px;
	color: #666;
}

/* 输入框盒子 */
.inputBox {
	position: relative;
	margin-bottom: 60px;
}

.inputMargin {
	margin-bottom: 54px;
}

/* 用户名小图标 */
.signIn_img1, .signIn_img2 {
	width: 60px;
	height: 40px;
	line-height: 40px;
	font-size: 18px;
	color: #666;
	position: absolute;
	top: 5px;
	left: 10px;
}

/* 提交按钮 */
.signIn_botton {
	width: 420px;
	height: 60px;
	line-height: 40px;
	font-size: 20px;
	border-radius: 50px;
	cursor: pointer;
}

.signIn_botton:hover {
	font-size: 23px;
	background: #0c6;
}

/* 文本盒子 */
.textBox {
	width: 100%;
	height: 100px;
	background-color: rgba(0, 0, 0, 0.4);
	position: absolute;
	left: 0;
	bottom: 0;
	display: -webkit-flex;
	display: flex;
	justify-content: center;
	-webkit-justify-content: center;
	align-items: center;
	-webkit-align-items: center;
}

/* 错误提示 */
.error {
	font-weight: bold;
	line-height: 40px;
	text-align: center;
	display: none;
}

/* 验证码输入框 */
#signIn_verification {
	width: 150px;
	height: 40px;
	border-top: none;
	border-left: none;
	border-right: none;
	border-bottom: 2px solid #666;
	background-color: transparent;
	font-size: 19px;
	color: #666;
}

.signIn_ma {
	margin-right: 10px;
	font-size: 18px;
	color: #666;
}
</style>
</head>
<body>
	<div class="signIn_box">
		<i class="signIn_logo">济圣科技后台登陆</i>
		<div class="formBox">
			<form action="${pageContext.request.contextPath}/admin1/login.do"
				method="post" target="test">
				<div class="inputBox">
					<i class="signIn_img1">用户名</i><input type="text" name="adminName"
						class="signIn_input" onblur="verification(this.value)"
						value="${admin.adminName}" onfocus="first(this.value,userTips)"
						required>
					<p class="userTips error"></p>
				</div>
				<div class="inputBox inputMargin">
					<i class="signIn_img2">密码</i><input type="password"
						name="adminPassword" class="signIn_input"
						onblur="veriPass(this.value)" value="${admin.adminPassword}"
						onfocus="first1(this.value,posswordTips)" required>
					<p class="posswordTips error"></p>
				</div>
				<div class="inputBox">
					<button type="submit" class="signIn_botton btn btn-default btn-lg">登陆</button>
				</div>

			</form>
			<!-- <iframe name="test" style="display:none" frameborder="0" class="signIn_iframe"></iframe> -->

		</div>

	</div>


	<script src="lib/jquery/jquery.js"></script>
	<script src="lib/bootstrap/js/bootstrap.js"></script>
	<script>
		// 按钮效果
		$(document).ready(function() {
			var signInInput = $(".signIn_input");
			var signInBotton = $(".signIn_botton");
			var signInImg3 = $(".signIn_img3");
			var error = $(".error");
			signInBotton.mouseenter(function() {
				signInImg3.css({
					"right" : "10px"
				})
			})
			signInBotton.mouseleave(function() {
				signInImg3.css({
					"right" : "40px"
				})
			})
		})
	</script>

</body>
</html>
