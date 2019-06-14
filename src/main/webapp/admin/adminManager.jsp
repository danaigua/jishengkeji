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
<body>
	<div class="layui-layout layui-layout-admin">
		<jsp:include page="/static/common/head.jsp"></jsp:include>
		<jsp:include page="/static/common/menu.jsp"></jsp:include>
		<div class="layui-body articleEditor">
		<div class="addAdmin">
			<form class="layui-form"
				action="${pageContext.request.contextPath}/admin1/add.do"
				enctype="multipart/form-data" method="post">
				<div class="layui-form-item">
					<label class="layui-form-label">管理员名称</label>
					<div class="layui-input-block">
						<input type="text" name="adminName" lay-verify="title"
							autocomplete="off" placeholder="请输入管理员名称" class="layui-input">
					</div>
					<label class="layui-form-label">管理员密码</label>
					<div class="layui-input-block">
						<input type="password" name="adminPassword" lay-verify="title"
							autocomplete="off" placeholder="请输入管理员密码" class="layui-input">
					</div>
					<label class="layui-form-label">确认密码</label>
					<div class="layui-input-block">
						<input type="password" name="" lay-verify="title"
							autocomplete="off" placeholder="请再次输入管理员密码" class="layui-input">
					</div>
				</div>
				<div class="layui-form-item">
					<div class="layui-input-block">
						<button class="layui-btn" lay-submit="" type="submit">立即提交</button>
						<button type="reset" class="layui-btn layui-btn-primary">重置</button>
					</div>
				</div>
			</form>
		</div>
			<table class="layui-hide" id="test" lay-filter="test"></table>
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
		<script type="text/html" id="barDemo">
  		<a class="layui-btn layui-btn-danger layui-btn-xs" lay-event="del">删除</a>
	</script>
	<script>
		layui.use('table', function() {
			var table = layui.table;

			table.render({
				elem : '#test',
				url : '/jishengkeji/admin1/list.do',
				toolbar : true,
				title : '管理员管理表',
				cols : [ [ {
					field : 'adminName',
					title : '管理员姓名',
					width : 200,
					fixed : 'left',
					edit : 'text'
				}, {
					field : 'adminPassword',
					title : '密码',
					width : 500,
				}, {
					field : 'uuid',
					title : '唯一识别码',
					width : 200,
				}, {
					field : 'id',
					title : 'ID',
					width : 150,
				}, {
					fixed : 'right',
					title : '操作',
					toolbar : '#barDemo',
					width : 150
				} ] ],
				page : true,
				response : {
					statusCode : 0
				//重新规定成功的状态码为 200，table 组件默认为 0
				},
			});
			//监听行工具事件
			table.on('tool(test)', function(obj) {
				var data = obj.data;
				//console.log(obj)
				if (obj.event === 'del') {
					layer.confirm('真的删除这条数据吗', function(index) {
						$.post("/jishengkeji/admin1/delete.do", {
							id : data.id
						}, function(ret) {
							if (ret.code == 1) {
								layer.msg('删除成功', function() {
									obj.del();
									layer.close(index);
								});
							} else {
								layer.alert('删除成功', function() {
									layer.close(index);
									window.location.reload();
								})
							}
						})
					});
				}
			});
			table.on('edit(test)', function(obj) {
				var value = obj.value, data = obj.data, field = obj.field;
				$.post("/jishengkeji/admin1/update.do", {updateid : data.id,updatefield : field,updatevalue : value}, function(ret) {
					if (ret.code == 1) {
						layer.msg('[ID: ' + data.id + ']' + field + '字段更改为：'+ value);
					} else {
						layer.msg('[ID: ' + data.id + ']' + field + '字段更改为：'+ value);
					}
				})
			})
		});
	</script>
</body>
</html>
