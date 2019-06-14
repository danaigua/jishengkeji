<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<html>
<head>
<meta charset="UTF-8">
<title>极盛科技后台管理系统</title>
<link rel="stylesheet"
	href="${pageContext.request.contextPath}/static/layui-v2.5.0/layui/css/layui.css"
	media="all">
<script src="${pageContext.request.contextPath}/static/layui-v2.5.0/layui/layui.js" charset="utf-8"></script>
<link rel="stylesheet"
	href="${pageContext.request.contextPath}/static/css/style.css">
</head>
<body>
	<div class="layui-layout layui-layout-admin">
		<jsp:include page="/static/common/head.jsp"></jsp:include>
		<jsp:include page="/static/common/menu.jsp"></jsp:include>
		<div class="layui-body articleEditor">
			<div class="articleTable">
				<table class="layui-hide" id="test" lay-filter="test"></table>
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
	<script>
		layui.use('table', function() {
			var table = layui.table;

			table.render({
				elem : '#test',
				url : '/jishengkeji/relation/list.do',
				toolbar : true,
				title : '文章数据表',
				totalRow : true,
				cols : [ [ {
					field : 'name',
					title : '姓名',
					width : 200,
					fixed : 'left',
					unresize : true,
					sort : true,
					totalRowText : '合计行'
				}, {
					field : 'telephone',
					title : '电话',
					width : 200,
					edit : 'text'
				}, {
					field : 'email',
					title : '邮箱',
					width : 200,
					edit : 'text'
				}, {
					field : 'desc',
					title : '备注',
					width : 600,
					edit : 'text'
				} ] ],
				page : true,
				response : {
					statusCode : 0
				//重新规定成功的状态码为 200，table 组件默认为 0
				},
			});
		});
	</script>
</body>
</html>