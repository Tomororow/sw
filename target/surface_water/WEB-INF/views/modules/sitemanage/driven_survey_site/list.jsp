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
   	<link rel="stylesheet" href="${ctxstc}/adapters/ztree/css/metroStyle/metroStyle.css" type="text/css">
	<script src="${ctxstc}/adapters/layui/layer/layer.js"></script>
	<link rel="stylesheet" href="https://unpkg.com/element-ui@1.4/lib/theme-default/index.css">
	<script type="text/javascript" src="${ctxstc}/js/vue.js"></script>
	<script src="https://unpkg.com/element-ui@1.4/lib/index.js"></script>
	<link href="${ctxstc}/css/selfdefault.css" type="text/css" rel="stylesheet"/>
	<style>
		.el-tree{border:none;background: none;}
		.ui-layout-column > .ui-splitbar{width:0px;}
	</style>
</head>
<body>
<form  action="${ctx}/cal_canal_info/list" method="post">
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
	<div class="down-main"  id="driven">
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
						<el-tree :data="treeMenus" accordion node-key="label" :default-expanded-keys="[nodeKey]"  :highlight-current="true"   @node-click="handleNodeClick"></el-tree>
					</ul> 
					
				</sidebar>
				
				<div class="center-back right-back" >
					<div class="container-fluid">
						<div class="info-center">
							<div class="page-header">
								<div class="pull-left">
									<h4>灌区信息化平台>站点管理>机井监测站管理</h4>
								</div>
							</div>
							
							<div class="search-box row" style="margin-bottom: 10px;">
								<div class="col-md-12">
									<div class="btn-group pull-left" role="group" aria-label="...">
										<button id="add_site_sluice_manage" style="display: block" data-toggle="modal" data-target="#myModal"   type="button" class="btn btn-default" >
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
									<div class="modal-dialog" style="width:50%">
										<div class="modal-content">
											<div class="modal-header">
												<button type="button" class="close" data-dismiss="modal" aria-hidden="true">&times;</button>
												<h4 class="modal-title" id="myModalLabel">新增xxx站信息</h4>
											</div>
											<div class="modal-body">
												在这里添加一些文本
											</div>
											<div class="modal-footer">
												<button type="button" class="btn btn-default" data-dismiss="modal">关闭
												</button>
												<button type="button" class="btn btn-primary">
													提交表单
												</button>
											</div>
										</div><!-- /.modal-content -->
									</div><!-- /.modal -->
								</div>
								<!--||||||||||||页面表格||||||||||||-->
								<template>
								<el-table :data="moistureList.slice((currentPage-1)*pagesize,currentPage*pagesize)" stripe  border style="width: 100%">
									<el-table-column type="expand"  >
							 			<template scope="scope">
											<el-form label-position="left" inline class="demo-table-expand">
												<el-form-item label="设备编码">
 													<span>{{scope.row.equipCoding}}</span>
												</el-form-item>
												<el-form-item label="SIM卡运营商">
 													<span>{{scope.row.simClipOperator}}</span>
												</el-form-item>
												<el-form-item label="修建时间">
 													<span>{{scope.row.buildTime}}</span>
												</el-form-item>
												<el-form-item label="监测站编码">
 													<span>{{scope.row.coding}}</span>
												</el-form-item>
												<el-form-item label="设备名称">
 													<span>{{scope.row.equipName}}</span>
												</el-form-item>
												<el-form-item label="行政区编码">
 													<span>{{scope.row.administrativeCoding}}</span>
												</el-form-item>
												
											</el-form>
   									 	</template>
									</el-table-column>
									<el-table-column label="监测站名称" align="center" show-overflow-tooltip prop="moistureName"></el-table-column>
									<el-table-column label="SIM卡号" align="center" show-overflow-tooltip prop="simClip"></el-table-column>
									<el-table-column label="经度" align="center" show-overflow-tooltip prop="longitude"></el-table-column>
									<el-table-column label="纬度" align="center" show-overflow-tooltip prop="latitude"></el-table-column>
									<el-table-column label="高程" align="center" show-overflow-tooltip prop="elevation"></el-table-column>
									<el-table-column label="创建时间" align="center" show-overflow-tooltip prop="createTime"></el-table-column>
									<el-table-column label="监测站地址" align="center" show-overflow-tooltip prop="moistureAddress"></el-table-column>
									<el-table-column label="操作" align="center" width="140px;" >
										<template slot-scope="scope">
											<el-button type="primary" id="tabCell" size="small" data-toggle="modal" data-target="#updateModal">修改</el-button>
    										<el-button type="warning" size="small" style="margin-left:0;">删除</el-button>
										</template>
									</el-table-column>
								</el-table>
								<el-pagination @size-change="handleSizeChange" @current-change="handleCurrentChange" :page-sizes="[10, 20, 30, 40]" :current-page.sync="currentPage" :page-size="pagesize" layout="total, prev, pager, next" :total="moistureList.length" align="right" style="margin-top:10px;"></el-pagination>
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
	</form>
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
	<script type="text/javascript" src="${ctxstc}/js/custom/sitemanage/driven_survey_site/driven_survey_site.js"></script>
</body>
</html>