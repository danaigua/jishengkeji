<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<html>
<head>
<meta charset="UTF-8">
<title>极盛科技后台管理系统</title>
<link rel="stylesheet"
	href="${pageContext.request.contextPath}/static/layui-v2.5.0/layui/css/layui.css"
	media="all">
<link rel="stylesheet"
	href="${pageContext.request.contextPath}/static/css/style.css">
<script
	src="${pageContext.request.contextPath}/static/layui-v2.5.0/layui/layui.js"
	charset="utf-8"></script>
<script
	src="${pageContext.request.contextPath}/static/jquery/jquery.min.js"></script>
</head>
<script type="text/javascript">
	function submitForm(){
		var userId='${currentAdmin.id}';
		var password='${currentUser.adminPassword}';
		var oldPassword=$("#oldPassword").val();
		var newPassword=$("#newPassword").val();
		var newPassword2=$("#newPassword2").val();
		if(oldPassword==null || oldPassword==""){
			alert("原密码不能为空！");
			return false;
		}
		if(newPassword==null || newPassword==""){
			alert("新密码不能为空！");
			return false;
		}
		if(newPassword2==null || newPassword2==""){
			alert("确认新密码不能为空！");
			return false;
		}
		if(newPassword!=newPassword2){
			alert("确认新密码不一致！");
			return false;
		}
		
		$.post("/jishengkeji/admin1/modify.do",{id:userId,password:newPassword},
			function(result){
				var result=eval('('+result+')');
				if(result.errorMsg){
					alert(result.errorMsg);
				}else{
					alert("密码修改成功，下一次登录生效！");
					resetValue();
				}
			}
		);
	}
</script>
<body>
	<div class="layui-layout layui-layout-admin">
		<jsp:include page="/static/common/head.jsp"></jsp:include>
		<jsp:include page="/static/common/menu.jsp"></jsp:include>
		<div class="layui-body articleEditor">
		<div class="addAdmin">
			<form class="layui-form"
				action="${pageContext.request.contextPath}/admin1/update.do"
				enctype="multipart/form-data" method="post">
				<div class="layui-form-item">
					<label class="layui-form-label">管理员名称</label>
					<div class="layui-input-block">
						<input type="text" name="adminName" lay-verify="title"
							autocomplete="off" placeholder="请输入管理员名称" value="${currentAdmin.adminName}" class="layui-input" readonly="readonly">
					</div>
					<label class="layui-form-label">旧密码</label>
					<div class="layui-input-block">
						<input id="oldPassword" type="password" name="adminPassword" lay-verify="title"
							autocomplete="off" placeholder="请输入管理员密码" class="layui-input">
					</div>
					<label class="layui-form-label">新密码</label>
					<div class="layui-input-block">
						<input id="newPassword" type="password" name="adminPassword" lay-verify="title"
							autocomplete="off" placeholder="请输入管理员密码" class="layui-input">
					</div>
					<label class="layui-form-label">确认密码</label>
					<div class="layui-input-block">
						<input type="password" id="newPassword2" name="" lay-verify="title"
							autocomplete="off" placeholder="请再次输入管理员密码" class="layui-input">
					</div>
				</div>
				<div class="layui-form-item">
					<div class="layui-input-block">
						<button class="layui-btn" lay-submit="" type="button" onclick="submitForm()">立即提交</button>
						<button type="reset" class="layui-btn layui-btn-primary">重置</button>
					</div>
				</div>
			</form>
		</div>
		</div>
		<jsp:include page="/static/common/foot.jsp"></jsp:include>
	</div>
	<script>
		layui.use('element', function() {
			var element = layui.element; //导航的hover效果、二级菜单等功能，需要依赖element模块
			var $ = layui.jquery, element = layui.element; //Tab的切换功能，切换事件监听等，需要依赖element模块

			//监听导航点击
			element.on('nav(demo)', function(elem) {
				//console.log(elem)
				layer.msg(elem.text());
			});
		});
	</script>
</body>
</html>
