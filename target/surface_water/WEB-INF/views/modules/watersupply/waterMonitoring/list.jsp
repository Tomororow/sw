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
	<link type="text/css" rel="stylesheet" href="${ctxstc}/css/custom/scroll.css" title="" />
	<link type="text/css" rel="stylesheet" href="${ctxstc}/adapters/ztree/css/zTreeStyle/zTreeStyle.css" /><!-- zTree -->
	<link type="text/css" rel="stylesheet" href="${ctxstc}/adapters/ztree/css/metroStyle/metroStyle.css">

	<script type="text/javascript" src="${ctxstc}/jquery/jquery-1.11.1.min.js"></script>
	<script type="text/javascript" src="${ctxstc}/jquery/jquery.cookie.js"></script>
	<script type="text/javascript" src="${ctxstc}/adapters/bootstrap/js/bootstrap.min.js"></script>
	<script type="text/javascript" src="${ctxstc}/adapters/bootstrap/js/bootstrap-paginator.js"></script>
	<script type="text/javascript" src="${ctxstc}/js/style.js"></script>
	<script type="text/javascript" src="${ctxstc}/js/angular.min.js"></script><!-- angular ui --->
	<script type="text/javascript" src="${ctxstc}/js/ui-layout.js"></script>
	<script type="text/javascript" src="${ctxstc}/adapters/ztree/js/jquery.ztree.core.js"></script><!-- zTree -->
	<script type="text/javascript" src="${ctxstc}/adapters/layui/layer/layer.js" merge="true"></script>
	<script type="text/javascript" src="${ctxstc}/jquery/jquery-form.js" ></script>
		<link rel="stylesheet" href="https://unpkg.com/element-ui@1.4/lib/theme-default/index.css">
	<script type="text/javascript" src="${ctxstc}/js/vue.js"></script>
	<script src="https://unpkg.com/element-ui@1.4/lib/index.js"></script>
	<link href="${ctxstc}/css/selfdefault.css" type="text/css" rel="stylesheet"/>
	<style type="text/css">
		.table-margin1 tbody tr,.table-margin2 tbody tr{height:30px;}
	</style>

</head>
<body >
<form  action="" method="post">
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
									<a href="#">
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
	<div class="down-main" id="monitoring">
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
				
				<!--2018/4/10 liyue  -->
				<sidebar class="east-back left-back" >
					<ul id="tree" class="nav nav-pills nav-stacked">
						<li><h4 style="margin-left: 10px;">行政区域等级</h4></li>
						<el-tree :data="treeMenus" accordion node-key="label" :default-expanded-keys="[nodeKey]"  :highlight-current="true"   @node-click="handleNodeClick"></el-tree>
						</ul>
					</ul>
				</sidebar>
				
				<div class="center-back right-back">
					<div class="container-fluid">
						<div class="info-center">
							<div class="page-header">
								<div class="pull-left">
									<h4>灌区信息化平台>智慧供水>供水监控</h4>
								</div>
							</div>
							
							<div class="search-box row">
								<div class="col-md-12">
									<div class="btn-group pull-left" role="group" aria-label="...">
										<button id="add_soil_type" style="display: none" type="button" class="btn btn-default" onclick="addSoilType()">
											<span class="glyphicon glyphicon-plus"></span>新增
										</button>
									
										<button id="delete_soil_type" style="display: none" type="button" class="btn btn-default" onclick="delSoilsInfo()">
											<span class="glyphicon glyphicon-trash"></span>删除
										</button>
										<span id="edit_soil_type" />
										<span id="detail_soil_type" />
										
										
									</div>
								</div>
							</div>
							
							<div class="clearfix"></div>
							<div class="table-margin1">
							<table class="table table-bordered table-header"  border="1" style="width:100%;font-size:14px;">
								<thead>
								  <tr>
								    <td rowspan="2"><div align="center">水厂名称</div></td>
								    <td rowspan="2"><div align="center">水厂进水量（m³）</div></td>
								    <td rowspan="2"><div align="center">水厂出水流量（m³）</div></td>
								    <td colspan="3"><div align="center">水池水位（cm）</div></td>
								    <td colspan="5"><div align="center">水质</div></td>
								    <td rowspan="2"><div align="center">水厂出水压力（pa）</div></td>
								  </tr>
								  <tr>
								    <td><div align="center">1#水池</div></td>
								    <td><div align="center">2#水池</div></td>
								    <td><div align="center">3#水池</div></td>
								    <td><div align="center">ph</div></td>
								    <td><div align="center">溶氧</div></td>
								    <td><div align="center">温度（℃）</div></td>
								    <td><div align="center">电导率</div></td>
								    <td><div align="center">浊度</div></td>
								  </tr>
								 </thead>
								 <tbody>
								  <tr>
								    <td><div align="center">海潮坝水厂</div></td>
								    <td><div align="center">2476.4万</div></td>
								    <td><div align="center">800</div></td>
								    <td><div align="center">100</div></td>
								    <td>&nbsp;200</td>
								    <td>&nbsp;105</td>
								    <td><div align="center"></div>6.5</td>
								    <td>&nbsp;15</td>
								    <td>&nbsp;10</td>
								    <td>&nbsp;1.3</td>
								    <td>&nbsp;3</td>
								    <td><div align="center"></div>1220</td>
								  </tr>
								  <tr>
								    <td><div align="center">大堵麻水厂</div></td>
								    <td><div align="center">2076.4万</div></td>
								    <td><div align="center">1000</div></td>
								    <td><div align="center">200</div></td>
								    <td>&nbsp;210</td>
								    <td>&nbsp;115</td>
								    <td><div align="center"></div>5.5</td>
								    <td>&nbsp;12</td>
								    <td>&nbsp;10</td>
								    <td>&nbsp;1.5</td>
								    <td>&nbsp;2</td>
								    <td><div align="center"></div>1300</td>
								  </tr>
								  <tr>
								    <td><div align="center">小堵麻厂</div></td>
								    <td><div align="center">2280.4万</div></td>
								    <td><div align="center">1800</div></td>
								    <td><div align="center">800</div></td>
								    <td>&nbsp;190</td>
								    <td>&nbsp;130</td>
								    <td><div align="center"></div>6.5</td>
								    <td>&nbsp;15</td>
								    <td>&nbsp;10</td>
								    <td>&nbsp;1.3</td>
								    <td>&nbsp;3</td>
								    <td><div align="center"></div>1320</td>
								  </tr>
								  <tr>
								    <td><div align="center">南古水厂</div></td>
								    <td><div align="center">2430.4万</div></td>
								    <td><div align="center">1200</div></td>
								    <td><div align="center">140</div></td>
								    <td>&nbsp;240</td>
								    <td>&nbsp;105</td>
								    <td><div align="center"></div>6.2</td>
								    <td>&nbsp;15</td>
								    <td>&nbsp;12</td>
								    <td>&nbsp;1.4</td>
								    <td>&nbsp;2</td>
								    <td><div align="center"></div>1000</td>
								  </tr>
								  <tr>
								    <td><div align="center">五坝水厂</div></td>
								    <td><div align="center">2076.4万</div></td>
								    <td><div align="center">800</div></td>
								    <td><div align="center">100</div></td>
								    <td>&nbsp;200</td>
								    <td>&nbsp;105</td>
								    <td><div align="center"></div>6.5</td>
								    <td>&nbsp;15</td>
								    <td>&nbsp;10</td>
								    <td>&nbsp;1.3</td>
								    <td>&nbsp;3</td>
								    <td><div align="center"></div>1420</td>
								  </tr>
								  <tr>
								    <td><div align="center">西寨水厂</div></td>
								    <td><div align="center">2000.4万</div></td>
								    <td><div align="center">800</div></td>
								    <td><div align="center">100</div></td>
								    <td>&nbsp;230</td>
								    <td>&nbsp;125</td>
								    <td><div align="center"></div>6.5</td>
								    <td>&nbsp;15</td>
								    <td>&nbsp;10</td>
								    <td>&nbsp;1.3</td>
								    <td>&nbsp;3</td>
								    <td><div align="center"></div>1500</td>
								  </tr>
								  <tr>
								    <td><div align="center">龙山水厂</div></td>
								    <td><div align="center">2276.4万</div></td>
								    <td><div align="center">800</div></td>
								    <td><div align="center">100</div></td>
								    <td>&nbsp;200</td>
								    <td>&nbsp;105</td>
								    <td><div align="center"></div>6.5</td>
								    <td>&nbsp;15</td>
								    <td>&nbsp;10</td>
								    <td>&nbsp;1.3</td>
								    <td>&nbsp;3</td>
								    <td><div align="center"></div>1420</td>
								  </tr>
								  <tr>
								    <td><div align="center">六坝水厂</div></td>
								    <td><div align="center">2356.4万</div></td>
								    <td><div align="center">800</div></td>
								    <td><div align="center">100</div></td>
								    <td>&nbsp;250</td>
								    <td>&nbsp;105</td>
								    <td><div align="center"></div>6.5</td>
								    <td>&nbsp;15</td>
								    <td>&nbsp;10</td>
								    <td>&nbsp;1.3</td>
								    <td>&nbsp;3</td>
								    <td><div align="center"></div>1680</td>
								  </tr>
								  <tr>
								    <td><div align="center">三堡水厂</div></td>
								    <td><div align="center">2486.4万</div></td>
								    <td><div align="center">800</div></td>
								    <td><div align="center">100</div></td>
								    <td>&nbsp;200</td>
								    <td>&nbsp;105</td>
								    <td><div align="center"></div>5.5</td>
								    <td>&nbsp;15</td>
								    <td>&nbsp;10</td>
								    <td>&nbsp;1.3</td>
								    <td>&nbsp;3</td>
								    <td><div align="center"></div>1720</td>
								  </tr>
								  </tbody>
								</table>
							</div>
									
							<div class="table-margin2" style="display:none;">
								<table  border="1" class="table table-bordered table-header" cellspacing="0" style="width:100%;font-size:14px;">
									<thead>
									  <tr>
									    <td rowspan="2"><div align="center">{{name}}</div></td>
									    <td rowspan="2"><div align="center">瞬时流量（m³）</div></td>
									    <td rowspan="2"><div align="center">管网压力（Mpa）</div></td>
									    <td colspan="3"><div align="center">设备</div></td>
									    <td rowspan="2"><div align="center">累计流量（m³）</div></td>
									  </tr>
									  <tr>
									    <td><div align="center">GPIS</div></td>
									    <td><div align="center">电池电量（%）</div></td>
									    <td><div align="center">最后统计时间</div></td>
									  </tr>
									  </thead>
									  <tbody>
									  <tr>
									    <td><div align="center"></div>李钱村</td>
									    <td><div align="center"></div>500</td>
									    <td><div align="center"></div>3.3</td>
									    <td><div align="center"></div>在线</td>
									    <td>&nbsp;50</td>
									    <td>&nbsp;2018-05-11</td>
									    <td><div align="center"></div>20000</td>
									  </tr>
									  <tr>
									    <td><div align="center"></div>双营村</td>
									    <td><div align="center"></div>400</td>
									    <td><div align="center"></div>3.0</td>
									    <td><div align="center"></div>在线</td>
									    <td>&nbsp;55</td>
									    <td>&nbsp;2018-05-11</td>
									    <td><div align="center"></div>21000</td>
									  </tr>
									  <tr>
									    <td><div align="center"></div>刘庄村</td>
									   <td><div align="center"></div>500</td>
									    <td><div align="center"></div>3.5</td>
									    <td><div align="center"></div>在线</td>
									    <td>&nbsp;55</td>
									    <td>&nbsp;2018-05-11</td>
									    <td><div align="center"></div>20500</td>
									  </tr>
									  <tr>
									    <td><div align="center"></div>涌泉村</td>
									    <td><div align="center"></div>500</td>
									    <td><div align="center"></div>2.5</td>
									    <td><div align="center"></div>在线</td>
									    <td>&nbsp;70</td>
									    <td>&nbsp;2018-05-11</td>
									    <td><div align="center"></div>1000</td>
									  </tr>
									  <tr>
									    <td><div align="center"></div>十昼夜</td>
									    <td><div align="center"></div>500</td>
									    <td><div align="center"></div>3.3</td>
									    <td><div align="center"></div>在线</td>
									    <td>&nbsp;60</td>
									    <td>&nbsp;2018-05-11</td>
									    <td><div align="center"></div>20000</td>
									  </tr>
									  <tr>
									    <td><div align="center"></div>张满村</td>
									   <td><div align="center"></div>400</td>
									    <td><div align="center"></div>3.3</td>
									    <td><div align="center"></div>在线</td>
									    <td>&nbsp;40</td>
									    <td>&nbsp;2018-05-11</td>
									    <td><div align="center"></div>23000</td>
									  </tr>
									  <tr>
									    <td><div align="center"></div>白庙村</td>
									    <td><div align="center"></div>500</td>
									    <td><div align="center"></div>3.2</td>
									    <td><div align="center"></div>在线</td>
									    <td>&nbsp;56</td>
									    <td>&nbsp;2018-05-11</td>
									    <td><div align="center"></div>15000</td>
									  </tr>
									  <tr>
									    <td><div align="center"></div>武城村</td>
									   <td><div align="center"></div>500</td>
									    <td><div align="center"></div>3.7</td>
									    <td><div align="center"></div>在线</td>
									    <td>&nbsp;60</td>
									    <td>&nbsp;2018-05-11</td>
									    <td><div align="center"></div>20000</td>
									  </tr>
									  </tbody>
									</table>
							</div>
							<div class="table-margin3" style="display:none;">
								<table  border="1" class="table table-bordered table-header" cellspacing="0" style="width:100%;font-size:14px;">
									<thead>
									  <tr>
									    <td rowspan="2"><div align="center">{{name}}</div></td>
									    <td rowspan="2"><div align="center">瞬时流量（m³）</div></td>
									    <td rowspan="2"><div align="center">管网压力（pa）</div></td>
									    <td colspan="3"><div align="center">设备</div></td>
									    <td rowspan="2"><div align="center">累计流量（m³）</div></td>
									  </tr>
									  <tr>
									    <td><div align="center">GPIS</div></td>
									    <td><div align="center">电池电量（%）</div></td>
									    <td><div align="center">最后统计时间</div></td>
									  </tr>
									  </thead>
									  <tbody>
									  <tr>
									    <td><div align="center"></div>张勇</td>
									    <td><div align="center"></div></td>
									    <td><div align="center"></div></td>
									    <td><div align="center"></div>在线</td>
									    <td>&nbsp;60</td>
									    <td>&nbsp;2018-04-12</td>
									    <td><div align="center"></div>200</td>
									  </tr>
									  <tr>
									    <td><div align="center"></div>王宝山</td>
									    <td><div align="center"></div></td>
									    <td><div align="center"></div></td>
									    <td><div align="center"></div>在线</td>
									    <td>&nbsp;50</td>
									    <td>&nbsp;2018-04-12</td>
									    <td><div align="center"></div>300</td>
									  </tr>
									  <tr>
									    <td><div align="center"></div>刘俊</td>
									    <td><div align="center"></div></td>
									    <td><div align="center"></div></td>
									    <td><div align="center"></div>在线</td>
									   <td>&nbsp;45</td>
									    <td>&nbsp;2018-04-12</td>
									    <td><div align="center"></div>300</td>
									  </tr>
									  <tr>
									    <td><div align="center"></div>张一涵</td>
									    <td><div align="center"></div></td>
									    <td><div align="center"></div></td>
									    <td><div align="center"></div>在线</td>
									    <td>&nbsp;60</td>
									    <td>&nbsp;2018-04-12</td>
									    <td><div align="center"></div>200</td>
									  </tr>
									  <tr>
									    <td><div align="center"></div>王跃华</td>
									    <td><div align="center"></div></td>
									    <td><div align="center"></div></td>
									    <td><div align="center"></div>在线</td>
									    <td>&nbsp;60</td>
									    <td>&nbsp;2018-04-12</td>
									    <td><div align="center"></div>350</td>
									  </tr>
									  <tr>
									    <td><div align="center"></div>滕安国</td>
									    <td><div align="center"></div></td>
									    <td><div align="center"></div></td>
									    <td><div align="center"></div>在线</td>
									    <td>&nbsp;65</td>
									    <td>&nbsp;2018-04-12</td>
									    <td><div align="center"></div>300</td>
									  </tr>
									  <tr>
									    <td><div align="center"></div>李毅峰</td>
									    <td><div align="center"></div></td>
									    <td><div align="center"></div></td>
									    <td><div align="center"></div>在线</td>
									   <td>&nbsp;55</td>
									    <td>&nbsp;2018-04-12</td>
									    <td><div align="center"></div>250</td>
									  </tr>
									  <tr>
									    <td><div align="center"></div>赵志军</td>
									    <td><div align="center"></div></td>
									    <td><div align="center"></div></td>
									    <td><div align="center"></div>在线</td>
									    <td>&nbsp;60</td>
									    <td>&nbsp;2018-04-12</td>
									    <td><div align="center"></div>300</td>
									  </tr>
									  <tr>
									    <td><div align="center"></div>单文森</td>
									    <td><div align="center"></div></td>
									    <td><div align="center"></div></td>
									    <td><div align="center"></div>在线</td>
									    <td>&nbsp;65</td>
									    <td>&nbsp;2018-04-12</td>
									    <td><div align="center"></div>200</td>
									  </tr>
									  </tbody>
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

	<!--弹窗添加或修改内容必备的代码-->
	<div id="show">
	    <iframe id="popup" name="popup" marginwidth=0 width="100%" frameBorder=0 scrolling=yes></iframe>
	</div>
</form>	
	<!-- js引入 -->
	<%-- <script type="text/javascript" src="${ctxstc}/js/custom/soils.js"></script> --%>
	<script type="text/javascript" src="${ctxstc}/js/footer.js"></script>
	<script type="text/javascript" src="${ctxstc}/js/custom/water_area_cook.js"></script>
	<script type="text/javascript" src="${ctxstc}/js/custom/permission/show_three_level_permission.js"></script>
	<script type="text/javascript" src="${ctxstc}/js/custom/watersupply/waterMonitoring/water_monitoring.js"></script>
	

</body>
</html>