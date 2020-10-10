<%@ page language="java" contentType="text/html; charset=utf-8" pageEncoding="utf-8"%>
<%@ include file="/WEB-INF/views/base.jsp"%>

<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
	<meta http-equiv="Content-Type" content="text/html; charset=utf-8">
	<meta http-equiv="X-UA-Compatible" content="IE=Edge">
	<meta name="viewport" content="width=device-width, initial-scale=1,maximum-scale=1, user-scalable=no">
	<title>灌区信息化平台</title>
	<link type="text/css" rel="stylesheet" href="${ctxstc}/adapters/bootstrap/css/Copy of bootstrap.min.css" title="" />
	<link type="text/css" rel="stylesheet" href="${ctxstc}/css/body.css" title="" />
	<link type="text/css" rel="stylesheet" href="${ctxstc}/adapters/bootstrap/css/style.css" title="" />
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
	<link rel="stylesheet" href="${ctxstc}/adapters/ztree/css/zTreeStyle/zTreeStyle.css" type="text/css">
	<script type="text/javascript" src="${ctxstc}/adapters/ztree/js/jquery.ztree.core.js"></script>
    <link rel="stylesheet" href="${ctxstc}/adapters/ztree/css/metroStyle/metroStyle.css" type="text/css">
    <script type="text/javascript" src="${ctxstc}/adapters/ztree/js/jquery.ztree.excheck.js"></script>
    <script type="text/javascript" src="${ctxstc}/adapters/ztree/js/jquery.ztree.exedit.js"></script>
	<script src="${ctxstc}/adapters/layui/layer/layer.js"></script>
	<script src="https://open.ys7.com/sdk/js/1.3/ezuikit.js"></script>
	<script type="text/javascript" src="http://resource.bcevod.com/player/cyberplayer.js"></script>
	<link rel="stylesheet" href="https://unpkg.com/element-ui@1.4/lib/theme-default/index.css">
	<script type="text/javascript" src="${ctxstc}/js/vue.js"></script>
	<script src="https://unpkg.com/element-ui@1.4/lib/index.js"></script> 
	<style>
		.el-tree{border:none;background: none;}
		.ui-layout-column > .ui-splitbar{width:0px;}
	</style>
</head>
<body>
<%-- <form  action="${ctx}/cal_canal_info/list" method="post"> --%>
	<!-- 页面头部start -->
	<nav class="nav navbar-default navbar-mystyle navbar-fixed-top">
	<div class="navbar-header">
		<button class="navbar-toggle" data-toggle="collapse" data-target=".navbar-collapse">
			<span class="icon-bar"></span>
			<span class="icon-bar"></span>
			<span class="icon-bar"></span>
		</button>
		<a class="navbar-brand mystyle-brand"><span class="glyphicon glyphicon-home"></span></a>
	</div>
	
	<div class="collapse navbar-collapse">
		<!-- 头部左侧导航start -->
		<ul class="nav navbar-nav">
			<li class="li-border"><a class="mystyle-color" href="#">管理控制台</a></li>
			<li class="dropdown li-border">
				<!-- 下拉框选项 -->
				<a href="#" class="dropdown-toggle mystyle-color" data-toggle="dropdown">项目导航<span class="caret"></span></a>
				<div class="dropdown-menu topbar-nav-list">
					<!-- 项目一导航start -->
					<div class="topbar-nav-col">
						<div class="topbar-nav-item">
							<p class="topbar-nav-item-title">机井灌溉云平台</p>
							<ul>
								<li>
									<a href="#">
										<span class="glyphicon glyphicon-road"></span>
										<span class="">实时监测</span>
									</a>
								</li>
								<li>
									<a href="#">
										<span class="glyphicon glyphicon-picture"></span>
										<span class="">水权管理</span>
									</a>
								</li>
								<li>
									<a href="#">
										<span class="glyphicon glyphicon-gift"></span>
										<span class="">收费管理</span>
									</a>
								</li>
							</ul>
						</div>
					</div>
					<!-- 项目一导航end -->
					
					<!-- 项目二导航start -->
					<div class="topbar-nav-col">
						<div class="topbar-nav-item">
							<p class="topbar-nav-item-title">地表水灌溉系统</p>
							<ul>
								<li>
									<a href="">
										<span class="glyphicon glyphicon-road"></span>
										<span class="">电子地图</span>
									</a>
								</li>
								<li>
									<a href="#">
										<span class="glyphicon glyphicon-picture"></span>
										<span class="">雨水情监控</span>
									</a>
								</li>
								<li>
									<a href="#">
										<span class="glyphicon glyphicon-gift"></span>
										<span class="">视频图像</span>
									</a>
								</li>
							</ul>
						</div>
					</div>
					<!-- 项目二导航end -->
					
					<!-- 项目三导航start -->
					<div class="topbar-nav-col">
						<div class="topbar-nav-item">
							<p class="topbar-nav-item-title">山洪灾害预警平台</p>
							<ul>
								<li>
									<a href="#">
										<span class="glyphicon glyphicon-road"></span>
										<span class="">气象国土</span>
									</a>
								</li>
								<li>
									<a href="#">
										<span class="glyphicon glyphicon-picture"></span>
										<span class="">预警发布</span>
									</a>
								</li>
							</ul>
						</div>
					</div>
					<!-- 项目三导航end -->
				</div>
			</li>
		</ul>
		<!-- 头部左侧导航end -->
		
		<!-- 头部右侧导航start -->
		<ul class="nav navbar-nav pull-right">
			<li class="dropdown li-border">
				<a href="#" class="dropdown-toggle mystyle-color" data-toggle="dropdown">james<span class="caret"></span></a>
				<ul class="dropdown-menu">
					<li><a href="#">退出</a></li>
				</ul>
			</li>
		</ul>
		<!-- 头部右侧导航end -->
	</div>
	</nav>
	<!-- 页面头部end -->

	<!-- 页面主体start -->
	<div class="down-main"  id="waterSer">
		<!-- 页面主体左侧菜单导航start -->
		 <div class="left-main left-full" id="scroll">
			<div class="sidebar-fold">
				<span class="glyphicon glyphicon-menu-hamburger"></span>
			</div>
			<!-- 菜单内容导航start -->
			<div class="subNavBox">
				<!-- 电子地图start -->
					<c:forEach items="${sysPermissionVOList}" var="sysPermissionVO">
					<c:choose>
            			<c:when test="${sysPermissionVO.sysChildsPermissions != null && sysPermissionVO.sysChildsPermissions.size()>0}">
            				<div id="one_map" class="sBox" style="display:${sysPermissionVO.isMable == 0 ? 'block' : 'none' }" >
								<div class="subNav sublist-${sysPermissionVO.menuCode == oneMenuCode ? 'down' : 'up' }">
										<span class="title-icon glyphicon glyphicon-chevron-${sysPermissionVO.menuCode == oneMenuCode ? 'down' : 'up' }"></span>
										<span class="sublist-title">${sysPermissionVO.menuName}</span>
								</div>
								<ul class="navContent" style="display:${sysPermissionVO.menuCode == oneMenuCode ? 'block' : 'none' }">
									 <c:forEach items="${sysPermissionVO.sysChildsPermissions}" var="childsPermission">
										<li class="${childsPermission.menuCode == twoMenuCode ? 'active' : '' }" id="${childsPermission.id}">
											<div class="showtitle" style="width:100px;">
												<img src="${ctxstc}/images/leftico05.png" />${childsPermission.menuName}
											</div>
											<a href="${childsPermission.menuHref}">
												<span class="sublist-icon glyphicon"><img src="${ctxstc}/images/leftico05.png" /></span>
												<span class="sub-title">${childsPermission.menuName}</span>
											</a>
										</li>
									</c:forEach>
								</ul>
						   </div>
				 		</c:when >
         		   </c:choose>
         		  </c:forEach>
				<!-- 系统管理end -->
			</div>
			<!-- 菜单内容导航end -->
		</div>
		<!-- 页面主体左侧菜单导航end -->
		
		<!-- 页面主体右侧内容start -->
		<div class="right-product right-full">
			<section id="layout" ng-app="doc.ui-layout">
			<div ui-layout class="layout-mock">
				<ui-layout options="{ flow : 'column' }">
				
				<sidebar class="east-back left-back" >
					 <ul id="tree" class="nav nav-pills nav-stacked">
						<li><h4 style="margin-left:20px;margin-top:20px">站点管理</h2></li>
						<!--Element组件树形控件-->
						<ul id="treeDemo" style="margin-left:15px;" class="ztree"></ul>
					</ul> 
					
				</sidebar>
				
				<div class="center-back right-back" >
					<div class="container-fluid">
						<div class="info-center">
							<div class="page-header">
								<div class="pull-left">
									<h4>灌区信息化平台>站点管理>用水户树结构</h4>
								</div>
							</div>
							
							<div class="search-box row" style="margin-bottom: 10px;">
								<div class="col-md-12">
									<div class="btn-group pull-left" role="group" aria-label="...">
										<button id="add_site_sluice_manage" style="display: block" data-toggle="modal" data-target="#myModal"   type="button" class="btn btn-default" @click="addFrom" >
											<span class="glyphicon glyphicon-plus"></span>新增
										</button>
										<button id="delete_site_sluice_manage" style="display: none"  type="button" class="btn btn-default" onclick="deletes()">
											<span class="glyphicon glyphicon-trash"></span>删除
										</button>
										<span id="edit_site_sluice_manage" />
										<span id="detail_site_sluice_manage" />
									</div>
								</div>
							</div> 
			
							<!--||||||||||||新增||||||||||||-->
								 <div class="modal fade" id="myModal" tabindex="-1" role="dialog" aria-labelledby="myModalLabel" aria-hidden="true">
									<div class="modal-dialog" style="width:20%">
										<div class="modal-content">
											<div class="modal-header">
												<button type="button" class="close" data-dismiss="modal" aria-hidden="true">&times;</button>
												<h4 class="modal-title" id="myModalLabel">新增用水户树结构信息</h4>
											</div>
											<div class="modal-body" align="center">
												<el-form ref="waterUser" :rules = "rules"  :inline="true" :model="waterUser" >
	  												<el-form-item label="树名称" prop="treeName" >
	    												<el-input v-model="waterUser.treeName"></el-input>
	  												</el-form-item>
	  												<el-form-item label="树编码" prop="treeCode" >
	    												<el-input id="twoTable" v-model="waterUser.treeCode"></el-input>
	  												</el-form-item>
	  												<!-- <el-form-item label="树等级" prop="treeLevel" style="margin-left:15px;">
	    												<el-input v-model="waterUser.treeLevel"></el-input>
	  												</el-form-item> -->
	  												<el-form-item label="备注" prop="treeRemark" style="margin-left:30px;">
	    												<el-input v-model="waterUser.treeRemark"></el-input>
	  												</el-form-item>
											</div>
											<div class="modal-footer">
												<button type="button" class="btn btn-default" data-dismiss="modal">关闭</button>
												<button type="button" class="btn btn-primary" @click="submiTree('waterUser')">提交</button>
											</div>
										</div><!-- /.modal-content -->
									</div><!-- /.modal -->
								</div>
								<!--||||||||||||修改||||||||||||-->
								<div class="modal fade" id="updateModal" tabindex="-1" role="dialog" aria-labelledby="myModalLabel" aria-hidden="true">
									<div class="modal-dialog" style="width:30%">
										<div class="modal-content">
											<div class="modal-header">
												<button type="button" class="close" data-dismiss="modal" aria-hidden="true">&times;</button>
												<h4 class="modal-title" id="myModalLabel">新增用水户树结构信息</h4>
											</div>
											<div class="modal-body" align="center">
												<el-form   :inline="true" :model="UpdateUser" >
	  												<el-form-item label="树名称" prop="treeName" >
	    												<el-input v-model="UpdateUser.treeName"></el-input>
	  												</el-form-item>
	  												<el-form-item label="树编码" prop="treeCode" >
	    												<el-input id="twoTable" v-model="UpdateUser.treeCode"></el-input>
	  												</el-form-item>
	  												<el-form-item label="树等级" prop="treeLevel">
	    												<el-input v-model="UpdateUser.treeLevel"></el-input>
	  												</el-form-item>
	  												<el-form-item label="父级id" prop="parentLevelId" >
	    												<el-input v-model="UpdateUser.parentLevelId"></el-input>
	  												</el-form-item>
	  												<el-form-item label="备注" prop="treeRemark" style="margin-right:245px;">
	    												<el-input v-model="UpdateUser.treeRemark"></el-input>
	  												</el-form-item>
											</div>
											<div class="modal-footer">
												<button type="button" class="btn btn-default" data-dismiss="modal">关闭</button>
												<button type="button" class="btn btn-primary" @click="updateTree">提交</button>
											</div>
										</div><!-- /.modal-content -->
									</div><!-- /.modal -->
								</div>
								<template>
  									<el-table  :data="waterList.slice((currentPage-1)*pagesize,currentPage*pagesize)" border stripe style="width: 100%">
    									<el-table-column label="树id" prop="id" show-overflow-tooltip align="center"></el-table-column>
    									<el-table-column label="树名称" prop="treeName" show-overflow-tooltip align="center"></el-table-column>
    									<el-table-column label="树编码" prop="treeCode" show-overflow-tooltip align="center"></el-table-column>
    									<el-table-column label="树等级" prop="treeLevel" show-overflow-tooltip align="center"></el-table-column>
    									<el-table-column label="父级id" prop="parentLevelId" show-overflow-tooltip align="center"></el-table-column>
    									<el-table-column label="创建时间" prop="creationTime" show-overflow-tooltip align="center"></el-table-column>
    									<el-table-column label="修改时间" prop="updationTime" show-overflow-tooltip align="center"></el-table-column>
    									<el-table-column label="备注" prop="treeRemark" show-overflow-tooltip align="center"></el-table-column>
    									<el-table-column label="操作"  show-overflow-tooltip align="center">
    										<template scope="scope">
    											<el-button type="success" @click="updateFrom(scope.row)" size="small" data-toggle="modal" data-target="#updateModal" >修改</el-button>
    											<el-button type="warning" @click="deteleFrom(scope.$index,scope.row,waterList)" size="small">删除</el-button>
    										</template>
    									</el-table-column>
    								</el-table>
    								<el-pagination @size-change="handleSizeChange" @current-change="handleCurrentChange"  :current-page.sync="currentPage" :page-size="pagesize" layout="total, prev, pager, next" :total="waterList.length" align="right"></el-pagination>
    							</template>
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
	<!-- </form> -->
	<!-- js引入 -->
	<script type="text/javascript" src="${ctxstc}/js/custom/province_city/distpicker.data.js"></script>
	<script type="text/javascript" src="${ctxstc}/js/custom/province_city/distpicker.js"></script>
	<script type="text/javascript" src="${ctxstc}/js/custom/province_city/main.js"></script>
	<script type="text/javascript" src="${ctxstc}/js/footer.js"></script>
	<script type="text/javascript" src="${ctxstc}/js/custom/water_area_cook.js"></script>
	<script type="text/javascript" src="${ctxstc}/jsp/water_site.jsp" type="text/javascript"></script>
	<script type="text/javascript" src="${ctxstc}/jsp/sluice_site.jsp" type="text/javascript"></script>
	<script type="text/javascript" src="${ctxstc}/jsp/speed_site.jsp" type="text/javascript"></script>
	<script type="text/javascript" src="${ctxstc}/jsp/flowrate_site.jsp" type="text/javascript"></script>
	<script type="text/javascript" src="${ctxstc}/datepicker/WdatePicker.js "></script>
	<script type="text/javascript" src="${ctxstc}/js/custom/plan/water_tree_user/water_tree_user.js"></script>
</body>
<script type="text/javascript">
	$(function(){
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
		
		showNodes(threeLevelPermission);
		$.fn.zTree.init($("#treeDemo"), setting, zNodes);
		/* start("1211",1,threeLevelPermission,"${calCanalInfo.canalCode}"); */
		
	});
	var setting = {
			view: {
				//showLine: true,
				selectedMulti: false,
				//dblClickExpand: false
			},
			data: {
				simpleData: {
					enable: true
				}
			},
			callback: {
				//onNodeCreated: this.onNodeCreated,
				////beforeClick: this.beforeClick,
				//onClick: this.onClick
			}
		};
		
		var zNodes=[];
		function showNodes(threeLevelPermission){
			var zNode;
			<c:forEach items="${waterUserList}" var="waterUser">
				var id   ="${waterUser.id}";
				var pId  ="${waterUser.parentLevelId}";
				var name ="${waterUser.treeName}";
				var level="${waterUser.treeLevel}";
				//if(level==0||level==1){
					zNode={id:id, pId:pId, name:name,click:"start('${waterUser.id}',1,'"+threeLevelPermission+"','${waterUser.treeLevel}');", open:true};
				//}else{
				//	zNode={id:id, pId:pId, name:name,click:"start('${calCanalInfo.id}',1);", open:false};
				//}
				zNodes.push(zNode);
			</c:forEach>
		}
		
		var newCount = 1;
		function addHoverDom(treeId, treeNode) {
		    var sObj = $("#" + treeNode.tId + "_span");
		    if (treeNode.editNameFlag || $("#addBtn_"+treeNode.tId).length>0) return;
		    var addStr = "<span class='button add' id='addBtn_" + treeNode.tId
		        + "' title='add node' onfocus='this.blur();'></span>";
		    sObj.after(addStr);
		    var btn = $("#addBtn_"+treeNode.tId);
		    if (btn) btn.bind("click", function(){
		    	addWaterArea();
		        var zTree = $.fn.zTree.getZTreeObj("treeDemo");
		       // zTree.addNodes(treeNode, {id:(100 + newCount), pId:treeNode.id, name:"new node"+ (newCount++),click:"hello()"});
		        return false;
		    });
		};
		function removeHoverDom(treeId, treeNode) {
		    $("#addBtn_"+treeNode.tId).unbind().remove();
		};
		
		
</script>
</html>