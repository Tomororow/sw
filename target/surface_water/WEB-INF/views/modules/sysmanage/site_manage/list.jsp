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

	<link rel="stylesheet" href="${ctxstc}/adapters/ztree/css/zTreeStyle/zTreeStyle.css" type="text/css">
	
	<script type="text/javascript" src="${ctxstc}/adapters/ztree/js/jquery.ztree.core.js"></script>
	
    <link rel="stylesheet" href="${ctxstc}/adapters/ztree/css/metroStyle/metroStyle.css" type="text/css">
    <script type="text/javascript" src="${ctxstc}/adapters/ztree/js/jquery.ztree.excheck.js"></script>
    <script type="text/javascript" src="${ctxstc}/adapters/ztree/js/jquery.ztree.exedit.js"></script>
	
	<script src="${ctxstc}/adapters/layui/layer/layer.js"></script>

	<style type="text/css">
		.topbar-nav-item a{color: red;}
		.topbar-nav-item a:hover{color: blue;}
		.ztree li a.level0 {width:200px;height: 30px; text-align: center; display:block; background-color: #42515F; border:1px silver solid;}
		.ztree li a.level0.cur {background-color: #66A3D2; }
		.ztree li a.level0 span {display: block; color: white; padding-top:3px; font-size:14px; font-weight: bold;word-spacing: 2px;}
		.ztree li a.level0 span.button {float:right; margin-left: 10px; visibility: visible;display:none;}
		.ztree li span.button.switch.level0 {display:none;}
	</style>
</head>
<body >
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
	<div class="down-main">
		<!-- 页面主体左侧菜单导航start -->
		<div class="left-main left-full" id="scroll" >
			<div class="sidebar-fold">
				<span class="glyphicon glyphicon-menu-hamburger"></span>
			</div>
			<!-- 菜单内容导航start -->
			<div class="subNavBox">
				<!-- 电子地图start -->
				<div id="one_map" class="sBox">
					<div class="subNav sublist-up">
						<span class="title-icon glyphicon glyphicon-chevron-up"></span>
						<span class="sublist-title">电子地图</span>
					</div>
					<ul class="navContent" style="display:none">
						<li two_map_page>
							<div class="showtitle" style="width:100px;">
								<img src="${ctxstc}/images/leftico05.png" /> 电子地图
							</div>
							<a href="">
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
							<a href="${ctx}/rainDynamicInfo/monitorChart">
								<span class="sublist-icon glyphicon"><img src="${ctxstc}/images/leftico06.png" /></span>
								<span class="sub-title">雨量站监控</span>
							</a>
						</li>
						
						<li>
							<div class="showtitle" style="width:100px;">
								<img src="${ctxstc}/images/leftico07.png" /> 水位站监控
							</div>
							<a href="${ctx}/site_water_dynamic_info/list">
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
							<a href="${ctx}/video/getCameraList">
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
				<div id="one_plan" class="sBox">
					<div class="subNav sublist-up">
						<span class="title-icon glyphicon glyphicon-chevron-up"></span>
						<span class="sublist-title">智能决策配水</span>
					</div>
					<ul class="navContent" style="display:none">
						<li id="two_come_water">
							<div class="showtitle" style="width:100px;">
								<img src="${ctxstc}/images/leftico03.png" /> 水库来水预测
							</div>
							<a href="${ctx}/ten/list">
								<span class="sublist-icon glyphicon"><img src="${ctxstc}/images/leftico03.png" /></span>
								<span class="sub-title">水库来水预测</span>
							</a>
						</li>
						
						<li id="two_neew_water">
							<div class="showtitle" style="width:100px;">
								<img src="${ctxstc}/images/leftico15.png" />需水提报
							</div>
							<a href="${ctx}/need_water/list">
								<span class="sublist-icon glyphicon"><img src="${ctxstc}/images/leftico15.png" /></span>
								<span class="sub-title">需水提报</span>
							</a>
						</li>
					
						<li id="two_need_plan">
							<div class="showtitle" style="width:100px;">
								<img src="${ctxstc}/images/leftico01.png" /> 灌溉配水计划
							</div>
							<a href="${ctx}/plan/list">
								<span class="sublist-icon glyphicon"><img src="${ctxstc}/images/leftico01.png" /></span>
								<span class="sub-title">灌溉配水计划</span>
							</a>
						</li>
						
						<li>
							<div class="showtitle" style="width:100px;">
								<img src="${ctxstc}/images/leftico10.png" /> 农作物类型管理
							</div>
							<a href="${ctx}/crops/list">
								<span class="sublist-icon glyphicon"><img src="${ctxstc}/images/leftico10.png" /></span>
								<span class="sub-title">农作物类型管理</span>
							</a>
						</li>
						
						<li>
							<div class="showtitle" style="width:100px;">
								<img src="${ctxstc}/images/leftico30.png" /> 土地类型管理
							</div>
							<a href="${ctx}/soils/list">
								<span class="sublist-icon glyphicon"><img src="${ctxstc}/images/leftico30.png" /></span>
								<span class="sub-title">土地类型管理</span>
							</a>
						</li>
						
						<li>
							<div class="showtitle" style="width:100px;">
								<img src="${ctxstc}/images/leftico20.png" /> 农作物生长周期
							</div>
							<a href="${ctx}/cropsCycle/list">
								<span class="sublist-icon glyphicon"><img src="${ctxstc}/images/leftico20.png" /></span>
								<span class="sub-title">农作物生长周期</span>
							</a>
						</li>
						
						<li id="two_soil_page">
							<div class="showtitle" style="width:100px;">
								<img src="${ctxstc}/images/leftico01.png" /> 土地管理
							</div>
							<a href="${ctx}/consumer_soil/list">
								<span class="sublist-icon glyphicon"><img src="${ctxstc}/images/leftico01.png" /></span>
								<span class="sub-title">土地管理</span>
							</a>
						</li>
						
						<li id="two_wateruser_page">
							<div class="showtitle" style="width:100px;">
								<img src="${ctxstc}/images/leftico22.png" /> 配水户信息
							</div>
							<a href="${ctx}/water_user/list">
								<span class="sublist-icon glyphicon"><img src="${ctxstc}/images/leftico22.png" /></span>
								<span class="sub-title">配水户信息</span>
							</a>
						</li>
						
						<li>
							<div class="showtitle" style="width:100px;">
								<img src="${ctxstc}/images/leftico04.png" />水库水位库容关系
							</div>
							<a href="${ctx}/reservoir_capacity/list">
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
							<a href="${ctx}/sysArea/pageList">
								<span class="sublist-icon glyphicon"><img src="${ctxstc}/images/leftico22.png" /></span>
								<span class="sub-title">行政区域</span>
							</a>
						</li>
						
						<li >
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
							<a href="${ctx}/role/list">
								<span class="sublist-icon glyphicon"><img src="${ctxstc}/images/leftico24.png" /></span>
								<span class="sub-title">角色管理</span>
							</a>
						</li>
						
						<li>
							<div class="showtitle" style="width:100px;">
								<img src="${ctxstc}/images/leftico25.png" /> 用户管理
							</div>
							<a href="${ctx}/user/list">
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
							<a href="${ctx}/cal_canal_info/list">
								<span class="sublist-icon glyphicon"><img src="${ctxstc}/images/leftico27.png" /></span>
								<span class="sub-title">渠道管理</span>
							</a>
						</li>
						
						<li class="active">
							<div class="showtitle" style="width:100px;">
								<img src="${ctxstc}/images/leftico28.png" /> 站点管理
							</div>
							<a href="${ctx}/site_rain_manage/list">
								<span class="sublist-icon glyphicon"><img src="${ctxstc}/images/leftico28.png" /></span>
								<span class="sub-title">站点管理</span>
							</a>
						</li>
						
						<li>
							<div class="showtitle" style="width:100px;">
								<img src="${ctxstc}/images/leftico08.png" /> 水库管理
							</div>
							<a href="${ctx}/reservoir/list">
								<span class="sublist-icon glyphicon"><img src="${ctxstc}/images/leftico08.png" /></span>
								<span class="sub-title">水库管理</span>
							</a>
						</li>
						
						<li>
							<div class="showtitle" style="width:100px;">
								<img src="${ctxstc}/images/leftico32.png" /> 基础参数管理
							</div>
							<a href="${ctx}/base_param/canal_material">
								<span class="sublist-icon glyphicon"><img src="${ctxstc}/images/leftico32.png" /></span>
								<span class="sub-title">基础参数管理</span>
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
					 <ul id="tree" class="nav nav-pills nav-stacked">
						<li><h4 style="margin-left: 10px;">站点管理</h2>
						</li>
						<ul id="treeDemo" class="ztree">
						</ul>
					</ul> 
				</sidebar>
				
				<div class="center-back right-back" >
					<div class="container-fluid">
						<div class="info-center">
							<div class="page-header">
								<div class="pull-left">
									<h4>灌区信息化平台>水系统管理>站点管理</h4>
								</div>
							</div>
							
							<div class="search-box row">
								<div class="col-md-12">
									<div class="btn-group pull-left" role="group" aria-label="...">
										<button type="button" class="btn btn-default" onclick="add()" >
											<span class="glyphicon glyphicon-plus">
											</span>
											<a href="javascript:void(0)" >新增</a>
										</button>
										
										<button type="button" class="btn btn-default" onclick="deletes()">
											<span class="glyphicon glyphicon-trash"></span>删除
										</button>
									</div>
								</div>
							</div>
							
							<div class="clearfix"></div>
							<div class="table-margin">
								<table class="table table-bordered table-header">
									<thead >
										<tr id="title">
											
										</tr>
									</thead>
									<tbody id="table_list">
										
									</tbody>
									
									<tfoot>
										<tr>
											<td colspan="10">
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
	</form>
	<!-- js引入 -->
	<script type="text/javascript" src="${ctxstc}/js/footer.js"></script>
	<script type="text/javascript" src="${ctxstc}/js/custom/water_area_cook.js"></script>
	<script type="text/javascript" src="${ctxstc}/jsp/water_site.jsp" type="text/javascript"></script>
	<script type="text/javascript" src="${ctxstc}/jsp/sluice_site.jsp" type="text/javascript"></script>
	<script type="text/javascript" src="${ctxstc}/jsp/speed_site.jsp" type="text/javascript"></script>
	<script type="text/javascript" src="${ctxstc}/jsp/flowrate_site.jsp" type="text/javascript"></script>
	<script type="text/javascript" src="${ctxstc}/datepicker/WdatePicker.js "></script>
	<script>
	var curMenu = null, zTree_Menu = null;
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
			beforeClick: this.beforeClick,
			onClick: this.onClick
		}
	};
	
	
	var zNodes=[];
	var zNode;
	function showNodes(){
		zNodes.push({ id:1, pId:0, name:"雨量站", open:false});
		<c:forEach items="${sysWaterAreaList}" var="sysWaterArea">
			var id="${sysWaterArea.id}";
			if("${sysWaterArea.parentWaterareaId}"==""){
				var pId=1;
			}else{
				var pId="${sysWaterArea.parentWaterareaId}";
			}
			var name="${sysWaterArea.waterAreaName}";
			var level="${sysWaterArea.waterAreaLevel}";
			if(level==0||level==1){
				//start的参数 1：所选的id，2:   3：站点系统代码0,1,2,3,4
				zNode={id:id, pId:pId, name:name,click:"start('${sysWaterArea.id}',1,1);", open:true};
			}else{
				zNode={id:id, pId:pId, name:name,click:"start('${sysWaterArea.id}',1,1);", open:false};
			}
			zNodes.push(zNode);
		</c:forEach>
			//alert(JSON.stringify(zNodes));
			zNodes.push({ id:2, pId:0, name:"水位站"});
		
		<c:forEach items="${calCanalInfoList}" var="calCanalInfo">
			var id   ="${calCanalInfo.id}";
			
			if("${calCanalInfo.canalParentId}"==""){
				var pId=2;
			}else{
				var pId="${calCanalInfo.canalParentId}";
			}
			var name ="${calCanalInfo.canalName}";
			var level="${calCanalInfo.canallevelCode}";
			if(level==0||level==1){
				zNode={id:id, pId:pId, name:name,click:"start('${calCanalInfo.id}',1,2);", open:true};
			}else{
				zNode={id:id, pId:pId, name:name,click:"start('${calCanalInfo.id}',1,2);", open:false};
			}
			zNodes.push(zNode);
		</c:forEach>
		
		
		zNodes.push({ id:3, pId:0, name:"流速站"});
		
		<c:forEach items="${calCanalInfoList}" var="calCanalInfo">
			var id   ="${calCanalInfo.id}"+0;
			
			if("${calCanalInfo.canalParentId}"==""){
				var pId=3;
			}else{
				var pId="${calCanalInfo.canalParentId}"+0;
			}
			var name ="${calCanalInfo.canalName}";
			var level="${calCanalInfo.canallevelCode}";
			if(level==0||level==1){
				zNode={id:id, pId:pId, name:name,click:"start('${calCanalInfo.id}',1,3);", open:true};
			}else{
				zNode={id:id, pId:pId, name:name,click:"start('${calCanalInfo.id}',1,3);", open:false};
			}
			zNodes.push(zNode);
		</c:forEach>
		
		
		zNodes.push({ id:4, pId:0, name:"流量站"});
		
		<c:forEach items="${calCanalInfoList}" var="calCanalInfo">
			var id   ="${calCanalInfo.id}"+1;
			
			if("${calCanalInfo.canalParentId}"==""){
				var pId=4;
			}else{
				var pId="${calCanalInfo.canalParentId}"+1;
			}
			var name ="${calCanalInfo.canalName}";
			var level="${calCanalInfo.canallevelCode}";
			if(level==0||level==1){
				zNode={id:id, pId:pId, name:name,click:"start('${calCanalInfo.id}',1,4);", open:true};
			}else{
				zNode={id:id, pId:pId, name:name,click:"start('${calCanalInfo.id}',1,4);", open:false};
			}
			zNodes.push(zNode);
		</c:forEach>
		
		zNodes.push({ id:5, pId:0, name:"闸门站"});
		
		<c:forEach items="${calCanalInfoList}" var="calCanalInfo">
			var id   ="${calCanalInfo.id}"+2;
			
			if("${calCanalInfo.canalParentId}"==""){
				var pId=5;
			}else{
				var pId="${calCanalInfo.canalParentId}"+2;
			}
			var name ="${calCanalInfo.canalName}";
			var level="${calCanalInfo.canallevelCode}";
			if(level==0||level==1){
				zNode={id:id, pId:pId, name:name,click:"start('${calCanalInfo.id}',1,5);", open:true};
			}else{
				zNode={id:id, pId:pId, name:name,click:"start('${calCanalInfo.id}',1,5);", open:false};
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
	        return false;
	    });
	};
	function removeHoverDom(treeId, treeNode) {
	    $("#addBtn_"+treeNode.tId).unbind().remove();
	};
	
	function beforeClick(treeId, node) {
		if (node.isParent) {
			if (node.level === 0) {
				var pNode = curMenu;
				while (pNode && pNode.level !==0) {
					pNode = pNode.getParentNode();
				}
				if (pNode !== node) {
					var a = $("#" + pNode.tId + "_a");
					a.removeClass("cur");
					zTree_Menu.expandNode(pNode, false);
				}
				a = $("#" + node.tId + "_a");
				a.addClass("cur");

				var isOpen = false;
				for (var i=0,l=node.children.length; i<l; i++) {
					if(node.children[i].open) {
						isOpen = true;
						break;
					}
				}
				if (isOpen) {
					zTree_Menu.expandNode(node, true);
					curMenu = node;
				} else {
					zTree_Menu.expandNode(node.children[0].isParent?node.children[0]:node, true);
					curMenu = node.children[0];
				}
			} else {
				zTree_Menu.expandNode(node);
			}
		}
		return !node.isParent;
	}
	function onClick(e, treeId, node) {
		
	}
	$(document).ready(function(){ 
		showNodes();
		$.fn.zTree.init($("#treeDemo"), setting, zNodes);
		zTree_Menu = $.fn.zTree.getZTreeObj("treeDemo");
		curMenu = zTree_Menu.getNodes()[0].children[0].children[0];
		zTree_Menu.selectNode(curMenu);
		var a = $("#" + zTree_Menu.getNodes()[0].tId + "_a");
		a.addClass("cur");
		
	});
	
	function start(id,page,siteNo){
		//alert(id);
		setCookie("id",id);
		setCookie("siteNo",siteNo);
		//每次进来清除之前的查询结果
		$("#table_list").empty();
		$("#title").empty();
		switch (siteNo) {
		case 1:
			alert("1");
			
			break;
		case 2:
			//alert(id);
			$.ajax({
				url:"${ctx}/site_water_manage/page",
				data: {id:id,page:page},
				type: "post",
				async: false,//非异步
				success: function(msg){
					//alert(JSON.stringify(msg));
					showWaterSiteTitle();
					showWaterSiteData(msg);
				}
			});
			paging("${ctx}/site_water_manage/page_nav",id,page,2);
			break;
		case 3:
			//alert("3");
			$.ajax({
				url:"${ctx}/site_speed_manage/page",
				data: {id:id,page:page},
				type: "post",
				async: false,//非异步
				success: function(msg){
					//alert(JSON.stringify(msg));
					showSpeedSiteTitle();
					showSpeedSiteData(msg);
				}
			});
			paging("${ctx}/site_speed_manage/page_nav",id,page,3);
			break;
		case 4:
			//alert("4");
			$.ajax({
				url:"${ctx}/site_flowrate_manage/page",
				data: {id:id,page:page},
				type: "post",
				async: false,//非异步
				success: function(msg){
					//alert(JSON.stringify(msg));
					showFlowrateSiteTitle();
					showFlowrateSiteData(msg);
				}
			});
			paging("${ctx}/site_flowrate_manage/page_nav",id,page,4);
			break;
		default:
			
			break;
		}
		
	}
	
	//分页方法
	function paging(url,id,page,siteNo){
		 $.post(url).success(function (response) {
		// alert(555);
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
		        	//alert(JSON.stringify(page));
		        	//var id= getCookie ("id");
		        	start(id,page,siteNo);
		        }
		    };
		    $('#pageLimit').bootstrapPaginator(options);
		}).error(function (response) {
		    alert("列表请求出错");
		});
	}
	
	
	
	
	
	function add(){
		//alert("hah");
		var id = getCookie ("id");
		var siteNo = getCookie ("siteNo");
		
		//alert(id);
		//alert(siteNo);
		switch (siteNo) {
		case "1":
			break;
		case "2"://添加水位站
			//alert("aaaa");
			layer.open({
			 	id: 'add-waterSite-form'
		        ,type: 2 //此处以iframe举例
		        ,title: '你添加建筑物的渠道为'+id
		        ,area: ['900px', '500px']
		        ,shade: 0.8
		        ,maxmin: true
		        ,content: '${ctx}/site_water_manage/add_page?id='+id
		        ,btn: ['确定', '关闭'] //只是为了演示
		        ,yes: function(){
		        	addWaterSiteSubmit();
		        }
		        ,btn2: function(){
		          layer.closeAll();
		        }
		        ,zIndex: layer.zIndex //重点1
		        ,success: function(layero){
		        	
		          start(id,1,2);
		          layer.setTop(layero); //重点2
		        }
		    });
			break;
		case "3":
			layer.open({
			 	id: 'add-speedSite-form'
		        ,type: 2 //此处以iframe举例
		        ,title: '你添加建筑物的渠道为'+id
		        ,area: ['900px', '500px']
		        ,shade: 0.8
		        ,maxmin: true
		        ,content: '${ctx}/site_speed_manage/add_page?id='+id
		        ,btn: ['确定', '关闭'] //只是为了演示
		        ,yes: function(){
		        	addSpeedSiteSubmit();
		        }
		        ,btn2: function(){
		          layer.closeAll();
		        }
		        ,zIndex: layer.zIndex //重点1
		        ,success: function(layero){
		        	
		          start(id,1,3);
		          layer.setTop(layero); //重点2
		        }
		    });
			break;
		case "4":
			layer.open({
			 	id: 'add-flowrateSite-form'
		        ,type: 2 //此处以iframe举例
		        ,title: '你添加建筑物的渠道为'+id
		        ,area: ['900px', '500px']
		        ,shade: 0.8
		        ,maxmin: true
		        ,content: '${ctx}/site_flowrate_manage/add_page?id='+id
		        ,btn: ['确定', '关闭'] //只是为了演示
		        ,yes: function(){
		        	addFlowrateSiteSubmit();
		        }
		        ,btn2: function(){
		          layer.closeAll();
		        }
		        ,zIndex: layer.zIndex //重点1
		        ,success: function(layero){
		        	
		          start(id,1,4);
		          layer.setTop(layero); //重点2
		        }
		    });
			break;
		default:
			break;
		}
	}
	//水位站添加提交
	function addWaterSiteSubmit(){
	   var frameId=document.getElementById("add-waterSite-form").getElementsByTagName("iframe")[0].id;
	   $('#'+frameId)[0].contentWindow.mySubmit();
	 }
	//流速站添加提交
	function addSpeedSiteSubmit(){
	   var frameId=document.getElementById("add-speedSite-form").getElementsByTagName("iframe")[0].id;
	   $('#'+frameId)[0].contentWindow.mySubmit();
	 }
	//流量站添加提交
	function addFlowrateSiteSubmit(){
	   var frameId=document.getElementById("add-flowrateSite-form").getElementsByTagName("iframe")[0].id;
	   $('#'+frameId)[0].contentWindow.mySubmit();
	 }
	
	
	//水位站编辑
	function doWaterSiteEdit(id){
		//alert(id);
		layer.open({
		 	id: 'edit-waterSite-form'
	        ,type: 2 //此处以iframe举例
	        ,title: '你编辑的渠道为'+id
	        ,area: ['1000px', '550px']
	        ,shade: 0.8
	        ,maxmin: true
	        ,content: '${ctx}/site_water_manage/edit_page?id='+id
	        ,btn: ['确定', '关闭'] //只是为了演示
	        ,yes: function(){
        	//子页面提交
        		editWaterSiteSubmit();
	        }
	        ,btn2: function(){
	          layer.closeAll();
	        }
	        
	        ,zIndex: layer.zIndex //重点1
	        ,success: function(layero){
	        	start(getCookie ("id"),1,2);
	          layer.setTop(layero); //重点2
	        }
	    });
	}
	//水位站编辑提交
	function editWaterSiteSubmit(){
		//alert("haha");
	   var frameId=document.getElementById("edit-waterSite-form").getElementsByTagName("iframe")[0].id;
	   $('#'+frameId)[0].contentWindow.mySubmit2();
	}
	
	//水位站单个删除
	function doWaterSiteDelete(id){
		//alert(id);
		//var pid = "";
		$.ajax({
			url:"${ctx}/site_water_manage/delete",
			type: "post",
			data: {id:id},
			async: false,//非异步
			success: function(msg){
				if(msg==1){
					//删除完后继续停留在照片标签内
					start(getCookie ("id"),1,2);
				}
			}
		});
	}
	
	//水位站全选、全反选
	function doSelectWaterSiteAll(){
		//jquery 1.6 前
		//$("input[name=selectedRow]").attr("checked", $("#selAll").is(":checked"));
		//prop jquery 1.6+建议使用
		$("input[name=selectedWaterSiteRow]").prop("checked", $("#selWaterSiteAll").is(":checked"));		
	}
	
	
	//流速站编辑
	function doSpeedSiteEdit(id){
		//alert(id);
		layer.open({
		 	id: 'edit-speedSite-form'
	        ,type: 2 //此处以iframe举例
	        ,title: '你编辑的渠道为'+id
	        ,area: ['1000px', '550px']
	        ,shade: 0.8
	        ,maxmin: true
	        ,content: '${ctx}/site_speed_manage/edit_page?id='+id
	        ,btn: ['确定', '关闭'] //只是为了演示
	        ,yes: function(){
        	//子页面提交
        		editSpeedSiteSubmit();
	        }
	        ,btn2: function(){
	          layer.closeAll();
	        }
	        
	        ,zIndex: layer.zIndex //重点1
	        ,success: function(layero){
	        	start(getCookie ("id"),1,3);
	          layer.setTop(layero); //重点2
	        }
	    });
	}
	//流速站编辑提交
	function editSpeedSiteSubmit(){
		//alert("haha");
	   var frameId=document.getElementById("edit-speedSite-form").getElementsByTagName("iframe")[0].id;
	   $('#'+frameId)[0].contentWindow.mySubmit2();
	}
	
	//流速站单个删除
	function doSpeedSiteDelete(id){
		//alert(id);
		//var pid = "";
		$.ajax({
			url:"${ctx}/site_speed_manage/delete",
			type: "post",
			data: {id:id},
			async: false,//非异步
			success: function(msg){
				if(msg==1){
					//删除完后继续停留在照片标签内
					start(getCookie ("id"),1,3);
				}
			}
		});
	}
	
	//流速站全选、全反选
	function doSelectSpeedSiteAll(){
		//jquery 1.6 前
		//$("input[name=selectedRow]").attr("checked", $("#selAll").is(":checked"));
		//prop jquery 1.6+建议使用
		$("input[name=selectedSpeedSiteRow]").prop("checked", $("#selSpeedSiteAll").is(":checked"));		
	}
	
	
	//流量站编辑
	function doFlowrateSiteEdit(id){
		//alert(id);
		layer.open({
		 	id: 'edit-flowrateSite-form'
	        ,type: 2 //此处以iframe举例
	        ,title: '你编辑的渠道为'+id
	        ,area: ['1000px', '550px']
	        ,shade: 0.8
	        ,maxmin: true
	        ,content: '${ctx}/site_flowrate_manage/edit_page?id='+id
	        ,btn: ['确定', '关闭'] //只是为了演示
	        ,yes: function(){
        	//子页面提交
        		editFlowrateSiteSubmit();
	        }
	        ,btn2: function(){
	          layer.closeAll();
	        }
	        
	        ,zIndex: layer.zIndex //重点1
	        ,success: function(layero){
	        	start(getCookie ("id"),1,4);
	          layer.setTop(layero); //重点2
	        }
	    });
	}
	//流量站编辑提交
	function editFlowrateSiteSubmit(){
		//alert("haha");
	   var frameId=document.getElementById("edit-flowrateSite-form").getElementsByTagName("iframe")[0].id;
	   $('#'+frameId)[0].contentWindow.mySubmit2();
	}
	
	//水位站单个删除
	function doFlowrateSiteDelete(id){
		//alert(id);
		//var pid = "";
		$.ajax({
			url:"${ctx}/site_flowrate_manage/delete",
			type: "post",
			data: {id:id},
			async: false,//非异步
			success: function(msg){
				if(msg==1){
					//删除完后继续停留在照片标签内
					start(getCookie ("id"),1,4);
				}
			}
		});
	}
	
	//流速站全选、全反选
	function doSelectFlowrateSiteAll(){
		//jquery 1.6 前
		//$("input[name=selectedRow]").attr("checked", $("#selAll").is(":checked"));
		//prop jquery 1.6+建议使用
		$("input[name=selectedFlowrateSiteRow]").prop("checked", $("#selFlowrateSiteAll").is(":checked"));		
	}
	
	
	
	
	//站点批量删除
	function deletes(){
		var siteNo = getCookie ("siteNo");
		
		switch (siteNo) {
		case "1":
			
			break;
		case "2":
			//传水位站id数组
			var ids = [];
			  $('input[name=selectedWaterSiteRow]:checked').each(function () {
				  ids.push($(this).val());
			  });
			  $.ajax({
					url:"${ctx}/site_water_manage/deletes",
					data: {ids:ids},
					type: "post",
					async: false,//非异步
					success: function(msg){
						if(msg==ids.length){
							start(getCookie ("id"),1,2);
						}
					}
				});
			break;
			
		case "3":
			var ids = [];
			  $('input[name=selectedSpeedSiteRow]:checked').each(function () {
				  ids.push($(this).val());
			  });
			  $.ajax({
					url:"${ctx}/site_speed_manage/deletes",
					data: {ids:ids},
					type: "post",
					async: false,//非异步
					success: function(msg){
						if(msg==ids.length){
							start(getCookie ("id"),1,3);
						}
					}
				});
			break;
		case "4":
			var ids = [];
			  $('input[name=selectedFlowrateSiteRow]:checked').each(function () {
				  ids.push($(this).val());
			  });
			  $.ajax({
					url:"${ctx}/site_flowrate_manage/deletes",
					data: {ids:ids},
					type: "post",
					async: false,//非异步
					success: function(msg){
						if(msg==ids.length){
							start(getCookie ("id"),1,4);
						}
					}
				});
			
			break;

		default:
			break;
		}
	}
	
	
	//照片点击事件显示照片=====================
	function showPhoto(a,img){
		//alert(a);
		layer.open({
			  type: 1,
			  title: false,
			  closeBtn: 0,
			  area: ['900px', '600px'],
			  skin: 'layui-layer-nobg', //没有背景色
			  shadeClose: true,
			  content: '<img src= '+img+'  width="900" height="600" alt="渠道照片" />'
		});
	}
	
	
	</script>
</body>
</html>