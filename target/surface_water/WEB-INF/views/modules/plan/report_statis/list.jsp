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
	<script src="${ctxstc}/adapters/layui/layer/layer.js"></script>
<!-- 	<link rel="stylesheet" href="https://unpkg.com/element-ui@1.4/lib/theme-default/index.css"> -->
	<script type="text/javascript" src="${ctxstc}/js/vue.js"></script>
	<!-- <script src="https://unpkg.com/element-ui@1.4/lib/index.js"></script> -->
	<script src="${ctxstc}/adapters/elementui/1.4.3/index.js"></script>
	<link rel="stylesheet" href="${ctxstc}/adapters/elementui/1.4.3/theme-default/index.css">
	<link type="text/css" rel="stylesheet" href="${ctxstc}/css/report_statis.css" title="" />
	<script rel="stylesheet" src="${ctxstc}/adapters/moment/moment.js"></script>
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
	<div class="down-main" id="reportStatis" style="left:0;">
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
						<ul id="treeDemo" style="margin-left:15px;" class="ztree"></ul>
					</ul> 
				</sidebar>
				
				<div class="center-back right-back" >
					<div class="container-fluid">
						<div class="info-center">
							<div class="page-header">
								<div class="pull-left">
									<h4>灌区信息化平台>数据分析>报表统计</h4>
								</div>
							</div>
							
							<!-- <div class="search-box row" style="margin-bottom: 10px;">
								<div class="col-md-12">
									<div class="btn-group pull-left" role="group" aria-label="...">
										<button id="add_site_sluice_manage" style="display: block"   type="button" class="btn btn-default" v-on:click="showTreeForm" >
											<span class="glyphicon glyphicon-plus"></span>新增
										</button>
										<button id="delete_site_sluice_manage" style="display: none"  type="button" class="btn btn-default" onclick="deletes()">
											<span class="glyphicon glyphicon-trash"></span>删除
										</button>
										<span id="edit_site_sluice_manage" />
										<span id="detail_site_sluice_manage" />
									</div>
								</div>
							</div>  -->
							
							<!-- <div class="clearfix"></div> -->
							<div id="dataTable" style="position: absolute;right: 20%;top:68px;z-index:9999" >
									<template>
									    <el-date-picker v-if="type=='1'" v-model="reportDay"  value-format="yyyy-MM-dd"  type="date" placeholder="请选择报表日期" align="right"></el-date-picker>
									    <el-date-picker v-if="type=='2'" v-model="reportMonth" type="month" placeholder="请选择报表月份" align="right"></el-date-picker>
									    <el-date-picker v-if="type=='3'" v-model="reportYear" type="year" placeholder="请选择报表年份" align="right"></el-date-picker>
									    <el-button size="medium" @click="selectDate(type,1)">点击查询</el-button>
									    <el-button size="medium" type="primary" @click="selectDate(type,2)" style="margin-left:30px;">报表导出</el-button>
									</template>
							</div>
							<!-- 表格 -->
								 <template>
									<el-tabs v-model="type"  @tab-click="ObjectSite" style="margin-top:10px;">
	                					<el-tab-pane label="日报表" name="1">
	                						<el-table :data="tableData" header-align="center" border style="width: 100%">
											    <el-table-column prop="canclName" label="渠道名称" align="center" ></el-table-column>
											    <el-table-column prop="canclCode" label="渠道编码" align="center" ></el-table-column>
											    <el-table-column prop="avgFlow" label="日均流量" align="center" ></el-table-column>
											    <el-table-column prop="sumFlow" label="日引水量" align="center" ></el-table-column>
											    <el-table-column prop="deviceState" label="设备状态" align="center"></el-table-column>
											    <el-table-column prop="CreateTime" :formatter="dateFormat" label="查询时间" align="center"></el-table-column>
											</el-table>
	                					</el-tab-pane>
	                					<el-tab-pane label="月报表" name="2">
	                						<el-table :data="tableData"  border style="width: 100%">
											   <el-table-column prop="canclName" label="渠道名称" align="center" ></el-table-column>
											    <el-table-column prop="canclCode" label="渠道编码" align="center" ></el-table-column>
											    <el-table-column prop="avgFlow" label="月均流量" align="center" ></el-table-column>
											    <el-table-column prop="sumFlow" label="月引水量" align="center" ></el-table-column>
											    <el-table-column prop="deviceState" label="设备状态" align="center"></el-table-column>
											    <el-table-column prop="CreateTime" :formatter="dateFormat" label="查询时间" align="center"></el-table-column>
											</el-table>
	                					</el-tab-pane>
	                					<el-tab-pane label="年报表" name="3">
	                						<el-table :data="tableData"  border style="width: 100%">
											    <el-table-column prop="canclName" label="渠道名称" align="center" ></el-table-column>
											    <el-table-column prop="canclCode" label="渠道编码" align="center" ></el-table-column>
											    <el-table-column prop="avgFlow" label="月均流量" align="center" ></el-table-column>
											    <el-table-column prop="sumFlow" label="月引水量" align="center" ></el-table-column>
											    <el-table-column prop="deviceState" label="设备状态" align="center"></el-table-column>
											    <el-table-column prop="CreateTime" :formatter="dateFormat" label="查询时间" align="center"></el-table-column>
											</el-table>
	                					</el-tab-pane>
	                				</el-tabs>
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
	<script type="text/javascript" src="${ctxstc}/datepicker/WdatePicker.js "></script>
	<script type="text/javascript" src="${ctxstc}/js/custom/plan/report_statis/report_statis.js"></script>
	<script type="text/javascript">
	$(document).ready(function(){
		//三级权限code数组============================================================
			debugger
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
		var canalId2 = "${canalId}";
		//start("","",threeLevelPermission);
		delCookie("canalId2");
		
	});
	var setting = {
		view: {
			selectedMulti: false,
		},
		data: {
			simpleData: {
				enable: true
			}
		},
		callback: {}
	};
	var zNodes=[];
	function showNodes(threeLevelPermission){
		var zNode;
		<c:forEach items="${calCanalInfoList}" var="calCanalInfo">
			var id   ="${calCanalInfo.id}";
			var pId  ="${calCanalInfo.canalParentId}";
			var name ="${calCanalInfo.canalName}";
			var level="${calCanalInfo.canallevelCode}";
			if(level==0||level==1){
				zNode={id:id, pId:pId, name:name,click:"start('${calCanalInfo.id}','${calCanalInfo.canalCode}','"+threeLevelPermission+"');", open:true};
			}else{
				zNode={id:id, pId:pId, name:name,click:"start('${calCanalInfo.id}','${calCanalInfo.canalCode}','2');", open:false};
			}
			zNodes.push(zNode);
		</c:forEach>
	}
	</script>
</body>
</html>