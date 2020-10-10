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


	<link rel="stylesheet" href="${ctxstc}/adapters/ztree/css/demo.css" type="text/css">
	<link rel="stylesheet" href="${ctxstc}/adapters/ztree/css/zTreeStyle/zTreeStyle.css" type="text/css">
	
	<script type="text/javascript" src="${ctxstc}/adapters/ztree/js/jquery.ztree.core.js"></script>
	
    <link rel="stylesheet" href="${ctxstc}/adapters/ztree/css/metroStyle/metroStyle.css" type="text/css">
    <script type="text/javascript" src="${ctxstc}/adapters/ztree/js/jquery.ztree.excheck.js"></script>
    <script type="text/javascript" src="${ctxstc}/adapters/ztree/js/jquery.ztree.exedit.js"></script>
	
	 <script src="${ctxstc}/adapters/layui/layer/layer.js"></script>

	<style>
	  
		.topbar-nav-item a{color: red;}
		.topbar-nav-item a:hover{color: blue;}
	  
	  </style>
</head>
<body onload="load('')">
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
	<div class="down-main">
		<!-- 页面主体左侧菜单导航start -->
		<div class="left-main left-full" id="scroll" >
			<div class="sidebar-fold">
				<span class="glyphicon glyphicon-menu-hamburger"></span>
			</div>
			<!-- 菜单内容导航start -->
			<div class="subNavBox">
				<!-- 电子地图start -->
				<div class="sBox">
					<div class="subNav sublist-up">
						<span class="title-icon glyphicon glyphicon-chevron-up"></span>
						<span class="sublist-title">电子地图</span>
					</div>
					<ul class="navContent" style="display:none">
						<li>
							<div class="showtitle" style="width:100px;">
								<img src="${ctxstc}/images/leftico05.png" /> 电子地图
							</div>
							<a href="#">
								<span class="sublist-icon glyphicon"><img src="${ctxstc}/images/leftico05.png" /></span>
								<span class="sub-title">电子地图</span>
							</a>
						</li>
					</ul>
				</div>
				<!-- 电子地图end -->
				
				<!-- 雨水情监控start -->
				<div class="sBox">
					<div class="subNav sublist-up">
						<span class="title-icon glyphicon glyphicon-chevron-up"></span>
						<span class="sublist-title">雨水情监控</span>
					</div>
					<ul class="navContent" style="display:none">
						<li>
							<div class="showtitle" style="width:100px;">
								<img src="${ctxstc}/images/leftico06.png" /> 雨量站监控
							</div>
							<a href="#">
								<span class="sublist-icon glyphicon"><img src="${ctxstc}/images/leftico06.png" /></span>
								<span class="sub-title">雨量站监控</span>
							</a>
						</li>
						
						<li>
							<div class="showtitle" style="width:100px;">
								<img src="${ctxstc}/images/leftico07.png" /> 水位站监控
							</div>
							<a href="#">
								<span class="sublist-icon glyphicon"><img src="${ctxstc}/images/leftico07.png" /></span>
								<span class="sub-title">水位站监控</span>
							</a>
						</li>
						
						<li>
							<div class="showtitle" style="width:100px;">
								<img src="${ctxstc}/images/leftico09.png" /> 闸门站监控
							</div>
							<a href="#">
								<span class="sublist-icon glyphicon"><img src="${ctxstc}/images/leftico09.png" /></span>
								<span class="sub-title">闸门站监控</span>
							</a>
						</li>
						
						<li>
							<div class="showtitle" style="width:100px;">
								<img src="${ctxstc}/images/leftico08.png" /> 水库监控
							</div>
							<a href="#">
								<span class="sublist-icon glyphicon"><img src="${ctxstc}/images/leftico08.png" /></span>
								<span class="sub-title">水库监控</span>
							</a>
						</li>
					</ul>
				</div>
				<!-- 雨水情监控end -->
				
				<!-- 视频图像start -->
				<div class="sBox">
					<div class="subNav sublist-up">
						<span class="title-icon glyphicon glyphicon-chevron-up"></span>
						<span class="sublist-title">视频图像</span>
					</div>
					<ul class="navContent" style="display:none">
						<li>
							<div class="showtitle" style="width:100px;">
								<img src="${ctxstc}/images/leftico13.png" /> 站点视频
							</div>
							<a href="#">
								<span class="sublist-icon glyphicon"><img src="${ctxstc}/images/leftico13.png" /></span>
								<span class="sub-title">站点视频</span>
							</a>
						</li>
						
						<li>
							<div class="showtitle" style="width:100px;">
								<img src="${ctxstc}/images/leftico14.png" /> 视频站信息
							</div>
							<a href="#">
								<span class="sublist-icon glyphicon"><img src="${ctxstc}/images/leftico14.png" /></span>
								<span class="sub-title">视频站信息</span>
							</a>
						</li>
					</ul>
				</div>
				<!-- 视频图像end -->
				
				<!-- 智能决策配水start -->
				<div class="sBox">
					<div class="subNav sublist-up">
						<span class="title-icon glyphicon glyphicon-chevron-up"></span>
						<span class="sublist-title">智能决策配水</span>
					</div>
					<ul class="navContent" style="display:none">
						<li>
							<div class="showtitle" style="width:100px;">
								<img src="${ctxstc}/images/leftico03.png" /> 水库来水预测
							</div>
							<a href="#">
								<span class="sublist-icon glyphicon"><img src="${ctxstc}/images/leftico03.png" /></span>
								<span class="sub-title">水库来水预测</span>
							</a>
						</li>
						
						<li>
							<div class="showtitle" style="width:100px;">
								<img src="${ctxstc}/images/leftico15.png" /> 农作物需水模型
							</div>
							<a href="#">
								<span class="sublist-icon glyphicon"><img src="${ctxstc}/images/leftico15.png" /></span>
								<span class="sub-title">农作物需水模型</span>
							</a>
						</li>
						
						<li>
							<div class="showtitle" style="width:100px;">
								<img src="${ctxstc}/images/leftico31.png" /> 智能决策
							</div>
							<a href="#">
								<span class="sublist-icon glyphicon"><img src="${ctxstc}/images/leftico31.png" /></span>
								<span class="sub-title">智能决策</span>
							</a>
						</li>
						
						<li>
							<div class="showtitle" style="width:100px;">
								<img src="${ctxstc}/images/leftico01.png" /> 灌溉配水计划
							</div>
							<a href="#">
								<span class="sublist-icon glyphicon"><img src="${ctxstc}/images/leftico01.png" /></span>
								<span class="sub-title">灌溉配水计划</span>
							</a>
						</li>
						
						<li>
							<div class="showtitle" style="width:100px;">
								<img src="${ctxstc}/images/leftico18.png" /> 水费管理
							</div>
							<a href="#">
								<span class="sublist-icon glyphicon"><img src="${ctxstc}/images/leftico18.png" /></span>
								<span class="sub-title">水费管理</span>
							</a>
						</li>
						
						<li>
							<div class="showtitle" style="width:100px;">
								<img src="${ctxstc}/images/leftico22.png" /> 配水户信息
							</div>
							<a href="#">
								<span class="sublist-icon glyphicon"><img src="${ctxstc}/images/leftico22.png" /></span>
								<span class="sub-title">配水户信息</span>
							</a>
						</li>
						
						<li>
							<div class="showtitle" style="width:100px;">
								<img src="${ctxstc}/images/leftico04.png" />水库水位库容关系
							</div>
							<a href="#">
								<span class="sublist-icon glyphicon"><img src="${ctxstc}/images/leftico04.png" /></span>
								<span class="sub-title">水库水位库容关系表</span>
							</a>
						</li>
						
						<li>
							<div class="showtitle" style="width:100px;">
								<img src="${ctxstc}/images/leftico23.png" /> 水库水位库容历史记录
							</div>
							<a href="#">
								<span class="sublist-icon glyphicon"><img src="${ctxstc}/images/leftico23.png" /></span>
								<span class="sub-title">水库水位库容历史记录信息</span>
							</a>
						</li>
					</ul>
				</div>
				<!-- 智能决策配水end -->
			
				<!-- 故障告警分析start -->
				<div class="sBox">
					<div class="subNav sublist-up">
						<span class="title-icon glyphicon glyphicon-chevron-up"></span>
						<span class="sublist-title">故障告警分析</span>
					</div>
					<ul class="navContent" style="display:none">
						<li>
							<div class="showtitle" style="width:100px;">
								<img src="${ctxstc}/images/leftico01.png" /> 故障信息
							</div>
							<a href="#">
								<span class="sublist-icon glyphicon"><img src="${ctxstc}/images/leftico01.png" /></span>
								<span class="sub-title">故障信息</span>
							</a>
						</li>
						
						<li>
							<div class="showtitle" style="width:100px;">
								<img src="${ctxstc}/images/leftico03.png" /> 故障处理
							</div>
							<a href="#">
								<span class="sublist-icon glyphicon"><img src="${ctxstc}/images/leftico03.png" /></span>
								<span class="sub-title">故障处理</span>
							</a>
						</li>
						
						<li>
							<div class="showtitle" style="width:100px;">
								<img src="${ctxstc}/images/leftico02.png" /> 报警信息
							</div>
							<a href="#">
								<span class="sublist-icon glyphicon"><img src="${ctxstc}/images/leftico02.png" /></span>
								<span class="sub-title">报警信息</span>
							</a>
						</li>
					</ul>
				</div>
				<!-- 故障告警分析end -->
			
				<!-- 系统管理start -->
				<div class="sBox">
					<div class="subNav sublist-down">
						<span class="title-icon glyphicon glyphicon-chevron-down"></span>
						<span class="sublist-title">系统管理</span>
					</div>
					<ul class="navContent" style="display:block">
						<li >
							<div class="showtitle" style="width:100px;">
								<img src="${ctxstc}/images/leftico22.png" /> 行政区域
							</div>
							<a href="#">
								<span class="sublist-icon glyphicon"><img src="${ctxstc}/images/leftico22.png" /></span>
								<span class="sub-title">行政区域</span>
							</a>
						</li>
						
						<li class="active">
							<div class="showtitle" style="width:100px;">
								<img src="${ctxstc}/images/leftico23.png" /> 水管区域
							</div>
							<a href="${ctx}/sys_water_area/list">
								<span class="sublist-icon glyphicon"><img src="${ctxstc}/images/leftico23.png" /></span>
								<span class="sub-title">水管区域</span>
							</a>
						</li>
						
						<li>
							<div class="showtitle" style="width:100px;">
								<img src="${ctxstc}/images/leftico24.png" /> 角色管理
							</div>
							<a href="#">
								<span class="sublist-icon glyphicon"><img src="${ctxstc}/images/leftico24.png" /></span>
								<span class="sub-title">角色管理</span>
							</a>
						</li>
						
						<li>
							<div class="showtitle" style="width:100px;">
								<img src="${ctxstc}/images/leftico25.png" /> 用户管理
							</div>
							<a href="#">
								<span class="sublist-icon glyphicon"><img src="${ctxstc}/images/leftico25.png" /></span>
								<span class="sub-title">用户管理</span>
							</a>
						</li>
						
						<li>
							<div class="showtitle" style="width:100px;">
								<img src="${ctxstc}/images/leftico25.png" /> 权限管理
							</div>
							<a href="${ctx}/permission/list">
								<span class="sublist-icon glyphicon"><img src="${ctxstc}/images/leftico25.png" /></span>
								<span class="sub-title">权限管理</span>
							</a>
						</li>
						
						<li>
							<div class="showtitle" style="width:100px;">
								<img src="${ctxstc}/images/leftico27.png" /> 渠道管理
							</div>
							<a href="#">
								<span class="sublist-icon glyphicon"><img src="${ctxstc}/images/leftico27.png" /></span>
								<span class="sub-title">渠道管理</span>
							</a>
						</li>
						
						<li>
							<div class="showtitle" style="width:100px;">
								<img src="${ctxstc}/images/leftico28.png" /> 站点管理
							</div>
							<a href="#">
								<span class="sublist-icon glyphicon"><img src="${ctxstc}/images/leftico28.png" /></span>
								<span class="sub-title">站点管理</span>
							</a>
						</li>
						
						<li>
							<div class="showtitle" style="width:100px;">
								<img src="${ctxstc}/images/leftico8.png" /> 水库管理
							</div>
							<a href="#">
								<span class="sublist-icon glyphicon"><img src="${ctxstc}/images/leftico8.png" /></span>
								<span class="sub-title">水库管理</span>
							</a>
						</li>
						
						<li>
							<div class="showtitle" style="width:100px;">
								<img src="${ctxstc}/images/leftico10.png" /> 农作物管理
							</div>
							<a href="#">
								<span class="sublist-icon glyphicon"><img src="${ctxstc}/images/leftico10.png" /></span>
								<span class="sub-title">农作物管理</span>
							</a>
						</li>
						
						<li>
							<div class="showtitle" style="width:100px;">
								<img src="${ctxstc}/images/leftico30.png" /> 土地管理
							</div>
							<a href="#">
								<span class="sublist-icon glyphicon"><img src="${ctxstc}/images/leftico30.png" /></span>
								<span class="sub-title">土地管理</span>
							</a>
						</li>
						
						<li>
							<div class="showtitle" style="width:100px;">
								<img src="${ctxstc}/images/leftico20.png" /> 农作物生长周期
							</div>
							<a href="#">
								<span class="sublist-icon glyphicon"><img src="${ctxstc}/images/leftico20.png" /></span>
								<span class="sub-title">农作物生长周期</span>
							</a>
						</li>
						
						<li>
							<div class="showtitle" style="width:100px;">
								<img src="${ctxstc}/images/leftico29.png" /> 日志记录
							</div>
							<a href="#">
								<span class="sublist-icon glyphicon"><img src="${ctxstc}/images/leftico29.png" /></span>
								<span class="sub-title">日志记录</span>
							</a>
						</li>
						
						<li>
							<div class="showtitle" style="width:100px;">
								<img src="${ctxstc}/images/leftico26.png" /> 短信模板
							</div>
							<a href="#">
								<span class="sublist-icon glyphicon"><img src="${ctxstc}/images/leftico26.png" /></span>
								<span class="sub-title">短信模板</span>
							</a>
						</li>
						
						<li>
							<div class="showtitle" style="width:100px;">
								<img src="${ctxstc}/images/leftico32.png" /> 基础参数管理
							</div>
							<a href="#">
								<span class="sublist-icon glyphicon"><img src="${ctxstc}/images/leftico32.png" /></span>
								<span class="sub-title">基础参数管理</span>
							</a>
						</li>
						
						<li>
							<div class="showtitle" style="width:100px;">
								<img src="${ctxstc}/images/leftico31.png" /> 监测数据库管理
							</div>
							<a href="#">
								<span class="sublist-icon glyphicon"><img src="${ctxstc}/images/leftico31.png" /></span>
								<span class="sub-title">监测数据库管理</span>
							</a>
						</li>
						
						<li>
							<div class="showtitle" style="width:100px;">
								<img src="${ctxstc}/images/leftico02.png" /> 通知公告
							</div>
							<a href="#">
								<span class="sublist-icon glyphicon"><img src="${ctxstc}/images/leftico02.png" /></span>
								<span class="sub-title">通知公告</span>
							</a>
						</li>
					</ul>
				</div>
				<!-- 系统管理end -->
			</div>
			<!-- 菜单内容导航end -->
		</div>
		<!-- 页面主体左侧菜单导航end -->
		
		<!-- 页面主体右侧内容start -->
		<div class="right-product right-full" style="/*margin-left:55px*/;">
			<section id="layout" ng-app="doc.ui-layout">
			<div ui-layout class="layout-mock">
				<ui-layout options="{ flow : 'column' }">
				
				<sidebar class="east-back left-back" >
					<ul class="nav nav-pills nav-stacked">
						<li class="active"><a href="#">雨量站管理</a></li>
						<li><a href="#">水位站管理</a></li>
						<li><a href="#">闸门站管理</a></li>
					</ul>
				</sidebar>
				
				<div class="center-back right-back" >
					<div class="container-fluid">
						<div class="info-center">
							<div class="page-header">
								<div class="pull-left">
									<h4>灌区信息化平台>水系统管理>水管区域</h4>
								</div>
							</div>
							
							<div class="search-box row">
								<div class="col-md-12">
									<div class="btn-group pull-left" role="group" aria-label="...">
										<button type="button" class="btn btn-default">
											<span class="glyphicon glyphicon-plus">
											</span>
											<a href="javascript:void(0)" onclick="addWaterArea()">新增</a>
										</button>
										
										<button type="button" class="btn btn-default">
											<span class="glyphicon glyphicon-pencil"></span>编辑
										</button>
										
										<button type="button" class="btn btn-default">
											<span class="glyphicon glyphicon-trash"></span>删除
										</button>
									</div>
								</div>
							</div>
							
							<div class="clearfix"></div>
							<div class="table-margin">
								<table class="table table-bordered table-header">
									<thead>
										<tr>
											<td><input type="checkbox" /></td>
											<td class="w15">水管区域编码</td>
											<td class="w15">水管区域名称</td>
											<td class="w15">水管区域级别</td>
											<td class="w15">添加时间</td>
											<td class="w15">上次编辑时间</td>
											<td class="w15">备注</td>
											<td class="w15">操作</td>
										</tr>
									</thead>
									<tbody id="table_list">
										
									</tbody>
									
									<tfoot>
										<tr>
											<td colspan="8">
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
	<script type="text/javascript" src="${ctxstc}/js/footer.js"></script>
	<script type="text/javascript" src="${ctxstc}/js/custom/water_area_cook.js"></script>
	<script>
	//树结构json数据
	var zNodes=[];
	
	function load(id){
		alert(id);
		if(id==""){
			//var pId="";
			$.ajax({
				url:"${ctx}/sys_water_area/pId",
				type: "post",
				async: false,//非异步
				success: function(msg){
					
					//alert(msg);
					id=msg;
					
				}
			});
		}
		
		showNodes(); 
		$.fn.zTree.init($("#treeDemo"), setting, zNodes);
		
		start(id,1);
	};
	//添加区域弹窗
	 function addWaterArea(){
		 var id = getCookie ("currentNodeId");
		 delCookie("currentNodeId");
		 if(id!=null&&id!=""){
			 layer.open({
			        type: 1
			        ,title: false //不显示标题栏
			        ,closeBtn: false
			        ,area: '300px;'
			        ,shade: 0.8
			        ,id: 'LAY_layuipro' //设定一个id，防止重复弹出
			        ,btn: ['考虑一下', '我已确定']
			        ,btnAlign: 'c'
			        ,moveType: 1 //拖拽模式，0或者1
			        ,content: '<div style="padding: 30px; line-height: 22px; background-color: #393D49; color: #fff; font-weight: 300;">'+
			      					'新增区域-->'+'所属区域id<br>'+id+
			        
			        				'<form action="" method="post">'+
			        					'<input hidden="hidden" type="text" name="parentWaterareaId" value="'+id+'" style="color:black;"/>'+
						       		 	'区域编码：<input type="text" name="waterAreaCode" value="" style="color:black;"/><br>'+
						        		'区域名称：<input type="text" name="waterAreaName" value="" style="color:black;"/><br>'+
						        		'备____注：<input type="text" name="swaRemark" value="" style="color:black;"/>'+
					        		'</form>'+
				       		 '</div>'
			        ,btn2: function(){
		       			document.forms[0].action="${ctx}/sys_water_area/add";
		       			document.forms[0].submit();
			        }
			  });
		 }else{
			 layer.open({
			        type: 1
			        ,title: false //不显示标题栏
			        ,closeBtn: false
			        ,area: '300px;'
			        ,shade: 0.8
			        ,id: 'LAY_layuipro' //设定一个id，防止重复弹出
			        ,btn: ['考虑一下', '我已确定']
			        ,btnAlign: 'c'
			        ,moveType: 1 //拖拽模式，0或者1
			        ,content: '<div style="padding: 30px; line-height: 22px; background-color: #393D49; color: #fff; font-weight: 300;">'+
			      					'新增区域-->'+'所建区域为最高级'+
			        
			        				'<form action="" method="post">'+
			        					
						       		 	'区域编码：<input type="text" name="waterAreaCode" value="" style="color:black;"/><br>'+
						        		'区域名称：<input type="text" name="waterAreaName" value="" style="color:black;"/><br>'+
						        		'备____注：<input type="text" name="swaRemark" value="" style="color:black;"/>'+
					        		'</form>'+
				       		 '</div>'
			        ,btn2: function(){
		       			document.forms[0].action="${ctx}/sys_water_area/add";
		       			document.forms[0].submit();
			        }
			  });
			 
		 }
		  
	  };
	
	//导航树的配置
	var setting = {
            view: {
                addHoverDom: addHoverDom,
                removeHoverDom: removeHoverDom,
                selectedMulti: false
            },
            check: {
                enable: true
            },
            data: {
                simpleData: {
                    enable: true
                }
            },
            edit: {
                enable: true
            }
	};
	
	//树结构json数据
	var zNodes=[];

	//拿到后台的json数据赋值给zNodes
	function showNodes(){
		var zNode;
		<c:forEach items="${sysWaterAreaList}" var="sysWaterArea">
			var id="${sysWaterArea.id}";
			var pId="${sysWaterArea.parentWaterareaId}";
			var name="${sysWaterArea.waterAreaName}";
			var level="${sysWaterArea.waterAreaLevel}";
			if(level==0||level==1){
				zNode={id:id, pId:pId, name:name,click:"start('${sysWaterArea.id}',1);", open:true};
			}else{
				zNode={id:id, pId:pId, name:name,click:"start('${sysWaterArea.id}',1);", open:false};
			}
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
	        //alert(100+newCount);
	       // zTree.addNodes(treeNode, {id:(100 + newCount), pId:treeNode.id, name:"new node"+ (newCount++),click:"hello()"});
	        return false;
	    });
	};
	function removeHoverDom(treeId, treeNode) {
	    $("#addBtn_"+treeNode.tId).unbind().remove();
	};

	//当点击某一级树目录触发
	function start(id,page){
		alert(page);
		//将获取的id放到cook中
		setCookie("currentNodeId",id,1);
		//每次进来清除之前的查询结果
		$("#table_list").empty();
		$.ajax({
			url:"${ctx}/sys_water_area/page",
			data: {id:id,page:page},
			type: "post",
			async: false,//非异步
			success: function(msg){
				alert(JSON.stringify(msg) );
				var table = msg;
				
				for(var i=0;i<msg.length;i++){
					var currentTag = document.getElementById("table_list");
						var newTrTag = document.createElement("tr");
							var newTdTag1 = document.createElement("td");
								var newInputTag = document.createElement("input");
								newInputTag.setAttribute("type", "checkbox");
								
								newTdTag1.appendChild(newInputTag);
							var newTdTag2 = document.createElement("td");
								newTdTag2.innerHTML=msg[i].waterAreaCode;
							var newTdTag3 = document.createElement("td");
								newTdTag3.innerHTML=msg[i].waterAreaName;
							var newTdTag4 = document.createElement("td");
								newTdTag4.innerHTML=msg[i].waterAreaLevel;
							//var newTdTag5 = document.createElement("td");
							//	newTdTag5.innerHTML=msg[i].parentWaterareaId;
							var newTdTag6 = document.createElement("td");
								newTdTag6.innerHTML=msg[i].swaCreateTime;
							var newTdTag7 = document.createElement("td");
								newTdTag7.innerHTML=msg[i].swaEditTime;
							var newTdTag8 = document.createElement("td");
								newTdTag8.innerHTML=msg[i].swaRemark;
							var newTdTag9 = document.createElement("td");
								//var newATag = document.createElement("a");
									var sonid = JSON.stringify(msg[i].id);
									//newATag.setAttribute("href", "javascript\:doEdit("+sonid+")");
									//newATag.innerHTML="修改";
									//newTdTag9.appendChild(newATag);
									
									//var newATag = document.createElement("a");
									//var sonid = JSON.stringify(msg[i].id);
									//newATag.innerHTML="修改";
									//newTdTag9.appendChild(newATag);
								
								newTdTag9.innerHTML="<a href='javascript\:doEdit("+sonid+")'>修改</a>|<a href='javascript\:doDelete("+sonid+")'>删除</a>"
								
								
								
								newTrTag.appendChild(newTdTag1);
								newTrTag.appendChild(newTdTag2);
								newTrTag.appendChild(newTdTag3);
								newTrTag.appendChild(newTdTag4);
								//newTrTag.appendChild(newTdTag5);
								newTrTag.appendChild(newTdTag6);
								newTrTag.appendChild(newTdTag7);
								newTrTag.appendChild(newTdTag8);
								newTrTag.appendChild(newTdTag9);
							currentTag.appendChild(newTrTag);
				
				}
				
			}
		});
		
		 $.post("${ctx}/sys_water_area/page_nav").success(function (response) {
			 alert(JSON.stringify(response));
			    var pageNum = response.pageNum;
				var pages = response.pages;
				var size = response.size;
			    /* bootstrap分页样式设置 */
			    var options = {
			    	size:"small",
			    	alignment:"right",
			    	/* 当前页数 */
			        currentPage: pageNum,
			        /* 总页数  总条数除以每页条数  能整除总页数为商  不能整除商+1页  作为分页总页数  */
			        totalPages: pages,
			        /* 每页条数 */
			        numberOfPages:size,
			        /* bootstrap版本指定 */
			        bootstrapMajorVersion:3,
			        /* 样式设置 分页导航条 */
			        itemTexts: function (type, page, current) {
			            switch (type) {
			                case "first":
			                    return "首页";
			                case "prev":
			                    return "上一页";
			                case "next":
			                    return "下一页";
			                case "last":
			                    return "末页";
			                case "page":
			                    return page;
			            }
			        },
			        onPageClicked: function(event, originalEvent, type, page){
			        	alert(JSON.stringify(page));
			        	var id = getCookie ("currentNodeId");
			        	start(id,page);
			        	
			        }
			    };
			    $('#pageLimit').bootstrapPaginator(options);
			}).error(function (response) {
			    alert("列表请求出错");
			});
		
	}
	
	//编辑
	function doEdit(id){
		alert(id);
		var waterArea;
		alert(id+"222");
		//回显信息
		$.ajax({
			url:"${ctx}/sys_water_area/ajax_findWaterArea",
			type: "post",
			data: {id:id},
			async: false,//非异步
			success: function(msg){
				alert(id+"222");
				waterArea=msg;
			}
		});
		
		
		
		layer.open({
	        type: 1
	        ,title: false //不显示标题栏
	        ,closeBtn: false
	        ,area: '300px;'
	        ,shade: 0.8
	        ,id: 'LAY_layuipro' //设定一个id，防止重复弹出
	        ,btn: ['考虑一下', '确定']
	        ,btnAlign: 'c'
	        ,moveType: 1 //拖拽模式，0或者1
	        ,content: '<div style="padding: 30px; line-height: 22px; background-color: #393D49; color: #fff; font-weight: 300;">'+
	      					'编辑-->'+
	        
	        				'<form  action="${ctx}/sys_water_area/edit" method="post">'+
	        					'<input hidden="hidden" type="text" name="id" value="'+waterArea.id+'" style="color:black;"/>'+
				       		 	'区域编码：<input type="text" name="waterAreaCode" value="'+waterArea.waterAreaCode+'" style="color:black;"/><br>'+
				        		'区域名称：<input type="text" name="waterAreaName" value="'+waterArea.waterAreaName+'" style="color:black;"/><br>'+
				        		'区域级别：<input type="text" name="waterAreaLevel" value="'+waterArea.waterAreaLevel+'" style="color:black;"/><br>'+
				        		'创建时间：<input type="text" name="swaCreateTime" value="'+waterArea.swaCreateTime+'" style="color:black;"/><br>'+
				        		'父级的ID：<input type="text" name="parentWaterareaId" value="'+waterArea.parentWaterareaId+'" style="color:black;"/><br>'+
				        		'备____注：<input type="text" name="swaRemark" value="'+waterArea.swaRemark+'" style="color:black;"/>'+
				        		
				        		'<input type="submit"  value="提交" style="color:black;"/>'+
			        		'</form>'+
		       		 '</div>'
	        ,btn2: function(){
	        	
	        	//document.getElementById("edit").action="${ctx}/sys_water_area/edit";
       			//document.forms[1].action="${ctx}/sys_water_area/edit";
       			//document.getElementById("edit").submit();
	        }
	  });
	}
	
	
	//删除
	function doDelete(id){
		alert(id);
		//var pid = "";
		$.ajax({
			url:"${ctx}/sys_water_area/delete_byid",
			type: "post",
			data: {id:id},
			async: false,//非异步
			success: function(msg){
				//load(msg);
				start(msg,1);
			}
		});
		
	}
	
	
	</script>
</body>
</html>