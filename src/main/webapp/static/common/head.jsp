<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!--[if lt IE 9]>
  <script src="https://cdn.staticfile.org/html5shiv/r29/html5.min.js"></script>
  <script src="https://cdn.staticfile.org/respond.js/1.4.2/respond.min.js"></script>
<![endif]-->
<div class="layui-header header header-demo">
	<div class="my">
		<div class="layui-col-xs2">
			<div class="grid-demo grid-demo-bg1 my">济圣科技</div>
		</div>
		<div class="layui-col-xs8">
			<div class="grid-demo">
			后台管理系统
			</div>
		</div> 
		<div class="layui-col-xs2">
			<div class="grid-demo">
				<div>
					<div class="headPic">
						<ul class="layui-nav headul"  lay-unselect="">
							<li class="layui-nav-item"><a href="javascript:;"><img src="//t.cn/RCzsdCq" class="layui-nav-img"><p class="adminName">${currentAdmin.adminName}</p></a>
								<dl class="layui-nav-child">
									<dd>
										<a href="${pageContext.request.contextPath}/admin/modifyAdmin.jsp">修改密码</a>
									</dd>
									<dd>
										<a href="/jishengkeji/admin1/layout.do">退出</a>
									</dd>
								</dl></li>
						</ul>
					</div>
				</div>
			</div>
		</div>
	</div>
</div>
