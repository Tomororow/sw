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
	<link rel="stylesheet" href="${ctxstc}/css/demo.css" type="text/css">
	<link rel="stylesheet" href="https://unpkg.com/element-ui@1.4/lib/theme-default/index.css">
	<script type="text/javascript" src="${ctxstc}/js/vue.js"></script>
	<script src="https://unpkg.com/element-ui@1.4/lib/index.js"></script> 
	<!-- 2018-5-04 关于摄像头视频的插件 -->
	<script src="${ctxstc}/js/ezuikit.js"></script>
	<script type="text/javascript" src="${ctxstc}/js/cyberplayer.js"></script>
	<link rel="stylesheet" href="${ctxstc}/css/demo.css" type="text/css">
	<script rel="stylesheet" src="${ctxstc}/adapters/moment/moment.js"></script>
	<style>
		.el-tree{border:none;background: none;}
		.demo-table-expand {font-size: 0;}
		.demo-table-expand label {width: 120px;color: #99a9bf;}
		.demo-table-expand .el-form-item {margin-right: 0;margin-bottom: 0;width: 25%;}
		.el-tabs__item.is-active{color:#20a0ff;background: #d1dbe5;border-radius:3px;}
		.el-row {
    margin-bottom: 20px;
    &:last-child {
      margin-bottom: 0;
    }
  }
  .el-col {
    border-radius: 4px;
  }
  .bg-purple-dark {
    background: #99a9bf;
  }
  .bg-purple {
    background: #d3dce6;
  }
  .bg-purple-light {
    background: #e5e9f2;
  }
  .grid-content {
    border-radius: 4px;
    min-height: 36px;
    height:200px;
  }
   .jwplayer{float:left;margin:20px;} 
   #inputVideo div{/* float:left; */margin:0 10% 0 5%;font-size:14px;}
   #app{width:10%;position: fixed;top:200px;right:15px;}
   #app .el-card__body{padding:0px;}
   #inputVideo label:hover{cursor: pointer;}
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
	<div class="down-main"  id="scroller" style="left:0;">
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
				<div class="center-back right-back" >
					<div class="container-fluid">
						<div class="info-center">
							<div class="page-header">
								<div class="pull-left">
									<h4>灌区信息化平台>数据统计>报表统计</h4>
								</div>
							</div>
						
								 
								<!-- <div id="dataTable" style="position: absolute;right: 20%;top:68px;z-index:9999" v-if="type=='1'||type=='2'">
									<template>
									    <el-date-picker v-model="startTime" format="yyyy-MM-dd" type="datetime" placeholder="请选择开始时间" align="right"></el-date-picker>
									    <el-date-picker v-model="endTime" format="yyyy-MM-dd" type="datetime" placeholder="请选择开始时间"></el-date-picker>
									    <el-button size="medium" @click="selectDate">点击查询</el-button>
									</template>
									
								</div> -->
								<div id="dataTable" style="margin:5px;display:inline;" align="right" >
									<template>
										 <el-date-picker v-model="reportYear" type="year" placeholder="请选择查询年份" align="right"></el-date-picker>
										 <el-button size="medium" @click="selectDate()">点击查询</el-button>
									</template>
								</div>
								<el-button type="primary" size="medium" style="margin:5px;display:inline;" @click="exportExcel();">导出</el-button>
							  <template>
								<el-table :data="swiList.slice((currentPage-1)*pagesize,currentPage*pagesize)" stripe  border width="1000px;">
									<el-table-column label="渠道名称" align="center" show-overflow-tooltip prop="waterName"></el-table-column>
									<el-table-column label="时间" align="center" show-overflow-tooltip>
										<el-table-column label="一月" align="center" show-overflow-tooltip prop="january"></el-table-column>	
										<el-table-column label="二月" align="center" show-overflow-tooltip prop="february"></el-table-column>	
										<el-table-column label="三月" align="center" show-overflow-tooltip prop="march"></el-table-column>	
										<el-table-column label="四月" align="center" show-overflow-tooltip prop="april"></el-table-column>	
										<el-table-column label="五月" align="center" show-overflow-tooltip prop="may"></el-table-column>	
										<el-table-column label="六月" align="center" show-overflow-tooltip prop="june"></el-table-column>	
										<el-table-column label="七月" align="center" show-overflow-tooltip prop="july"></el-table-column>	
										<el-table-column label="八月" align="center" show-overflow-tooltip prop="august"></el-table-column>	
										<el-table-column label="九月" align="center" show-overflow-tooltip prop="september"></el-table-column>	
										<el-table-column label="十月" align="center" show-overflow-tooltip prop="october"></el-table-column>	
										<el-table-column label="十一月" align="center" show-overflow-tooltip prop="november"></el-table-column>	
										<el-table-column label="十二月" align="center" show-overflow-tooltip prop="december"></el-table-column>	
										<el-table-column label="全年" align="center" :formatter="formatData"  show-overflow-tooltip prop="sum"></el-table-column>	
									</el-table-column>							
								</el-table>
								<el-pagination @size-change="handleSizeChange" @current-change="handleCurrentChange"  :current-page.sync="currentPage" :page-size="pagesize" layout="total, prev, pager, next" :total="swiList.length" align="right"></el-pagination>
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
	<script type="text/javascript" src="${ctxstc}/js/custom/site/data_sheet/data_sheet.js "></script>
</body>
</html>






