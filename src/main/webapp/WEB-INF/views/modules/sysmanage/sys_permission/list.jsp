<%@ page language="java" contentType="text/html; charset=utf-8" pageEncoding="utf-8"%>
<%@ include file="/WEB-INF/views/base.jsp"%>

<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
	<meta http-equiv="Content-Type" content="text/html; charset=utf-8">
	<meta http-equiv="X-UA-Compatible" content="IE=Edge">
	<meta name="viewport" content="width=device-width, initial-scale=1,maximum-scale=1, user-scalable=no">
	<title>灌区信息化平台</title>
	<link type="text/css" rel="stylesheet" href="${ctxstc}/adapters/bootstrap/css/bootstrap.min.css" title="" />
	<link type="text/css" rel="stylesheet" href="${ctxstc}/css/body.css" title="" />
	<link type="text/css" rel="stylesheet" href="${ctxstc}/css/style.css" title="" />
	<link type="text/css" rel="stylesheet" href="${ctxstc}/css/dermadefault.css" title="blue" />
	<link type="text/css" rel="stylesheet" href="${ctxstc}/css/templatecss.css" title="" />
	<link type="text/css" rel="stylesheet" href="${ctxstc}/css/ui-layout.css" title="" /><!-- angular ui --->
	<link type="text/css" rel="stylesheet" href="${ctxstc}/css/custom/scroll.css" title="" /><!-- 滚动条样式 --->
	
	<script type="text/javascript" src="${ctxstc}/jquery/jquery-1.11.1.min.js"></script>
	
	<script type="text/javascript" src="${ctxstc}/jquery/jquery.cookie.js"></script>
	<script type="text/javascript" src="${ctxstc}/adapters/bootstrap/js/bootstrap.min.js"></script>
	<script type="text/javascript" src="${ctxstc}/adapters/bootstrap/js/bootstrap-paginator.js"></script>
	<script type="text/javascript" src="${ctxstc}/js/style.js"></script>
	<script type="text/javascript" src="${ctxstc}/js/angular.min.js"></script><!-- angular ui --->
	<script type="text/javascript" src="${ctxstc}/js/ui-layout.js"></script>
    <%-- <link rel="stylesheet" href="${ctxstc}/adapters/ztree/css/demo.css" type="text/css"> --%>
	<link rel="stylesheet" href="${ctxstc}/adapters/ztree/css/zTreeStyle/zTreeStyle.css" type="text/css">
	
	<script src="${ctxstc}/adapters/layui/layer/layer.js"></script>

	<style>
	  
		.topbar-nav-item a{color: red;}
		.topbar-nav-item a:hover{color: blue;}
		.table-header thead{color:#4b5261;font-weight:600;font-size: 15px }
	  </style>
</head>
<body >
<form  action="" method="post">
	<!-- 页面主体start -->
	<div class="down-main">
		
		<!-- 页面主体右侧内容start -->
		<div class="right-product right-full" style="/*margin-left:55px*/;">
			<section id="layout" ng-app="doc.ui-layout">
			<div ui-layout class="layout-mock">
				<ui-layout options="{ flow : 'column' }">
				<sidebar class="east-back left-back" >
					 <ul id="tree" class="nav nav-pills nav-stacked">
						<li><h4 style="margin-left:20px;margin-top:20px">权限管理</h4></li>
						<ul id="treeDemo" style="margin-left:15px;" class="ztree">
						</ul>
					</ul> 
				</sidebar>
				
				<div class="center-back right-back" >
					<div class="container-fluid">
						<div class="info-center">
							<div class="page-header">
								<div class="pull-left">
									<h4>灌区信息化平台>系统管理>权限管理>菜单管理</h4>
								</div>
							</div>
							
							<div class="search-box row">
								<div class="col-md-12">
				   					<div class="<%--btn-group--%> pull-left" role="group" aria-label="...">
										<button id="add_permission" type="button" class="btn btn-default" onclick="addPermission()" >
											<span class="glyphicon glyphicon-plus">
											</span>新增
										</button>
										
		<%--								<button id="edit_permission" type="button" class="btn btn-default" onclick="editPermission()" >
											<span class="glyphicon glyphicon-pencil"></span> 编辑
										</button>--%>
										<span id="delete_permission" />
										<span id="detail_permission" />
									
									</div>
								</div>
							</div>
							
							<div class="clearfix"></div>
							<div class="table-margin">
								<table class="table table-bordered table-header">
									<thead>
										<tr>
											<%--<td class="w5"><input type="checkbox" /></td>--%>
											<td class="w5">菜单编码</td>
											<td class="w5">菜单名称</td>
											<td class="w5">菜单层级</td>
											<td class="w5">菜单排序</td>
											<td class="w5">菜单链接</td>
											<%--<td class="w5">菜单图标</td>--%>
											<%--<td class="w5">是否菜单</td>--%>
											<td class="w5">创建时间</td>
											<td class="w5">上次修改时间</td>
											<%--<td class="w5">备注</td>--%>
											<td class="w5">操作</td>
										</tr>
									</thead>
									<tbody id="table_list">
										
									</tbody>
									
									<tfoot>
										<tr>
											<td colspan="12">
												<div class="pull-right">
													<div id="Paginator">
														<ul id="pageLimit"></ul>
													</div>
												</div>
											</td>
										</tr>
									</tfoot>
								</table>
							</div>
							
						</div>
					</div>
				</div>
				</ui-layout>
			</div>
			</section>
		</div>
		<!-- 页面主体右侧内容end -->
	</div>
	<!-- 页面主体end -->
	<!-- js引入 -->
	</form>
	<script type="text/javascript" src="${ctxstc}/js/footer.js"></script>
	<script type="text/javascript" src="${ctxstc}/js/custom/water_area_cook.js"></script>
	<script type="text/javascript" src="${ctxstc}/js/custom/permission/permission.js"></script>
	<script type="text/javascript" src="${ctxstc}/datepicker/WdatePicker.js "></script>
	<%-- <script type="text/javascript" src="${ctxstc}/adapters/ztree/js/jquery-1.4.4.min.js"></script> --%>
	<script type="text/javascript" src="${ctxstc}/adapters/ztree/js/jquery.ztree.core.js"></script>
	<script type="text/javascript" src="${ctxstc}/js/custom/permission/show_three_level_permission.js"></script>
	<%-- <script type="text/javascript" src="${ctxstc}/adapters/ztree/js/jquery.ztree.excheck.js"></script> --%>
	<script>
	var setting = {
			check: {
				enable: true
			},
			data: {
				simpleData: {
					enable: true
				}
			}
	        
		};
		
		var zNodes =[];
	
		function showNodes(threeLevelPermission){
			var zNode;
			<c:forEach items="${sysPermissionList}" var="sysPermission">
				var id   ="${sysPermission.id}";
				var pId  ="${sysPermission.parentMenuId}";
				var name ="${sysPermission.menuName}";
				var level="${sysPermission.menuLevel}";
				if(level==0||level==1){
					zNode={id:id, pId:pId, name:name,click:"start('${sysPermission.id}',1,"+level+",'"+threeLevelPermission+"');", open:true};
				}else{
					zNode={id:id, pId:pId, name:name,click:"start('${sysPermission.id}',1,"+level+",'"+threeLevelPermission+"');", open:false};
				}
				zNodes.push(zNode);
			</c:forEach>
		}
		
		$(document).ready(function(){
			
			//三级权限code数组============================================================
			var threeLevelPermission = [];
			//拿到三级权限的的列表
			<c:forEach items="${threeLevelPermissions}" var="sysPermission">
				var menuNameCode = "${sysPermission.menuNameCode}";
				//拿到页面三级权限对应的标签
				var tag = document.getElementById(menuNameCode);
				if(tag!=null){//如果有权限就将他显示
					tag.style.display="block";
					threeLevelPermission.push(menuNameCode);
				}
			</c:forEach>
			//start(1,threeLevelPermission);
			
			
			showNodes(threeLevelPermission);
			$.fn.zTree.init($("#treeDemo"), setting, zNodes);
			var permissionId = "${id}";
			//alert(permissionId);
			start(permissionId,1,0,threeLevelPermission);
			
			if(permissionId!=0){//第一磁进来不要删
				delCookie("permission_id");
			}
		});
		
		
	</script>
</body>
</html>