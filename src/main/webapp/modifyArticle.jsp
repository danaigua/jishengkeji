<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<html>
<head>
<meta charset="UTF-8">
<title>极盛科技后台管理系统</title>
<link rel="stylesheet" href="${pageContext.request.contextPath}/static/layui-v2.5.0/layui/css/layui.css" media="all">
<link rel="stylesheet" href="${pageContext.request.contextPath}/static/css/style.css">
<script src="${pageContext.request.contextPath}/static/layui-v2.5.0/layui/layui.js" charset="utf-8"></script>
<script src="${pageContext.request.contextPath}/static/jquery/jquery.min.js"></script>
<script type="text/javascript" charset="utf-8" src="${pageContext.request.contextPath}/static/utf8-jsp/ueditor.all.min.js"> </script>


<!-- 配置文件 -->
<script type="text/javascript" src="${pageContext.request.contextPath}/static/utf8-jsp/ueditor.config.js"></script>
<!-- 编辑器源码文件 -->
<script type="text/javascript"src="${pageContext.request.contextPath}/static/utf8-jsp/ueditor.all.js"></script>
</head>
<body>
	<div class="layui-layout layui-layout-admin">
		<jsp:include page="/static/common/head.jsp"></jsp:include>
		<jsp:include page="/static/common/menu.jsp"></jsp:include>
		<div class="layui-body articleEditor">
			<form class="layui-form" action="${pageContext.request.contextPath}/article/changeArticle.do" enctype="multipart/form-data" method="post">
				<div class="layui-form-item">
					
					<div class="layui-inline">
						<label class="layui-form-label">图片</label>
						<div class="layui-input-inline ">
							<input type="file" name="pic"
								class="layui-input">
						</div>
					</div>
					<div class="layui-inline">
						<div class="layui-input-block">
							<input type="text" autocomplete="off" placeholder="如果需要请在此处重新设置图片" size="40" readonly="readonly"
								class="layui-input">
							<input type="hidden" name="id" value="${article.id}">
						</div>
					</div>
				</div>
				<div class="editor">
					<!-- 加载编辑器的容器 -->
					<script id="editor"
						style="width: 800px; height: 500px; margin-left: 30px;"
						name="articleInfo" type="text/plain">
						${article.articleInfo}
    				</script>
				</div>
				<div class="layui-form-item">
					<div class="layui-input-block">
						<button class="layui-btn" lay-submit="" type="submit"
							lay-filter="demo1">立即提交</button>
						<button type="reset" class="layui-btn layui-btn-primary">重置</button>
					</div>
				</div>
			</form>
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
	<!-- 实例化编辑器 -->
	<script type="text/javascript">
		var ue = UE.getEditor('editor');
	</script>
</body>
</html>
