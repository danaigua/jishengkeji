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
			<div class="articleTable">
				<table class="layui-hide" id="test" lay-filter="test"></table>
			</div>
		</div>
		<jsp:include page="/static/common/foot.jsp"></jsp:include>
	</div>
	<script type="text/html" id="barDemo">
  		<a class="layui-btn layui-btn-danger layui-btn-xs" lay-event="del">删除</a>
		<a class="layui-btn layui-btn-xs" lay-event="updateInfo">修改内容</a>
	</script>
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
				url : '/jishengkeji/article/list.do',
				toolbar : true,
				title : '文章数据表',
				totalRow : true,
				cols : [ [ {
					field : 'id',
					title : 'ID',
					width : 80,
					fixed : 'left',
					unresize : true,
					sort : true,
					totalRowText : '合计行'
				}, {
					field : 'articleTitle',
					title : '标题',
					width : 200,
					edit : 'text'
				}, {
					field : 'articleAuthor',
					title : '作者',
					width : 100,
					edit : 'text'
				}, {
					field : 'simpleArticleInfo',
					title : '简要信息',
					width : 500,
					edit : 'text'
				}, {
					field : 'articleWest',
					title : '权重',
					width : 80,
					edit : 'text',
					sort : true
				}, {
					field : 'articleTime',
					title : '创建时间',
					width : 100,
					totalRow : true
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
						$.post("/jishengkeji/article/delete.do", {
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
				if (obj.event === 'updateInfo') {
					window.location.href="http://localhost:8080/jishengkeji/article/findArticle.do?id=" + data.id; 
				}
			});
			table.on('edit(test)', function(obj) {
				var value = obj.value, data = obj.data, field = obj.field;
				$.post("/jishengkeji/article/update.do", {
					updateid : data.id,
					updatefield : field,
					updatevalue : value
				}, function(ret) {
					if (ret.code == 1) {
						layer.msg('[ID: ' + data.id + ']' + field + '字段更改为：'
								+ value);
					} else {
						layer.msg('[ID: ' + data.id + ']' + field + '字段更改为：'
								+ value);
					}
				})
			})
		});
	</script>
</body>
</html>