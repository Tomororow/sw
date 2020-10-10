	<%@ page language="java" contentType="text/html; charset=utf-8" pageEncoding="utf-8"%>
<%@ include file="/WEB-INF/views/base.jsp"%>
<!--  实时数据ui-->
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
	<script type="text/javascript" src="${ctxstc}/js/moment.js"></script>
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
	
	<style>
		.el-tree{border:none;background: none;}
		.demo-table-expand {font-size: 0;}
		.demo-table-expand label {width: 140px;color: #99a9bf;}
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
   a:hover{cursor: pointer;}
   #trder tr:nth-child(1) td{border:solid 1px #a2a2a2;height:40px;text-align: center;width:110px;}
   #trder tr:nth-child(2) td{border:solid 1px #a2a2a2;height:40px;text-align: center;width:110px;}
   .el-popover__title{font-weight:600}
   #tierDcher .el-dialog--small{width:auto;min-width:20%;}
   /* 加载高亮设置 */
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
	<div class="down-main"  id="realTime" style="left:0;">
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
									<h4>灌区信息化平台>站点管理>动态数据管理</h4>
								</div>
							</div>
							<!-- <div id="tab" class="main left" >
			                <div class="main-left width-100" style="margin-top:0px"> -->
							<!-- <ul class="nav-tabs left" style="margin-bottom:10px;">
			                        <li id="li0" ><a title="TAB-1" href="javascript:void(0)" @click="ObjectSite('1')">水位站</a></li>
			                        <li id="li1" ><a title="TAB-2" href="javascript:void(0)" @click="ObjectSite('2')">闸门站</a></li>
			                        <li id="li2" ><a title="TAB-3" href="javascript:void(0)" @click="ObjectSite('3')">视频站</a></li>
			                        <li id="li3" ><a title="TAB-4" href="javascript:void(0)" onclick="showBuildingPage1()">渠道建筑物</a></li> 
			                    </ul> -->
							<!-- <div class="search-box row" style="margin-bottom: 10px;">
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
							</div>-->
							<!-- </div>
							</div> -->
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
								
								<div id="dataTable" style="position: absolute;right: 15%;top:68px;z-index:9999" v-if="type=='1'||type=='2'" v-show="isshow">
									<span style="font-size:15px;">站点类型：</span>
									<el-select v-model="deviceType" placeholder="请选择" clearable style="margin:0 10px 0 0;">
    									<el-option value="5" label="雷达水位站">雷达水位站</el-option>
    									<el-option value="8" label="明渠流量站">明渠流量站</el-option>
    								</el-select>
									<template>
									    <el-date-picker v-model="startTime" format="yyyy-MM-dd HH:mm:ss" type="datetime" placeholder="请选择开始时间" align="right"></el-date-picker>
									    <el-date-picker v-model="endTime" format="yyyy-MM-dd HH:mm:ss" type="datetime" placeholder="请选择结束时间"></el-date-picker>
									    <el-button size="medium" @click="selectDate(4)">历史数据查询</el-button>
									    <el-button size="medium" type="primary" @click="excelPortyu()" >报表导出</el-button>
									    <el-button  size="medium" type="primary" @click="backwater()"  icon="el-icon-back">返回</el-button>
									</template>
								</div>
								<!-- 水位站数据表格展示 -->
								<template>
									<el-tabs v-model="type"  @tab-click="ObjectSite" style="margin-top:10px;">
	                					<el-tab-pane label="水位站" name="1" v-if="switchTab==false">
									  		<el-table  :data="siteWaterList" key="siteWaterList" :default-sort = "{prop: 'amendTime', order: 'descending'}"  style="width: 100%" border stripe>
									          <el-table-column label="站点编码" show-overflow-tooltip align="center">
									          	<template scope="props">
    												<a slot="reference" v-if="props.row.swiDevicemodelCode==8" @click="handleClickTred(props.row)" class="el-icon-arrow-right" style="position: absolute;top: 30%;left: 15%;"></a>
									          		<span>{{props.row.deviveId}}</span>
									          	</template>
									          </el-table-column>
									          <el-table-column label="站点名称" prop="terminalName"  show-overflow-tooltip align="center"></el-table-column>
									          <el-table-column label="站点类型" prop="swiDevicemodelCode"  show-overflow-tooltip align="center">
									          <template scope="props">
									      		  	<span v-bind:style="{color:(props.row.swiDevicemodelCode==8?'#E6A23C':'')}">{{props.row.swiDevicemodelCode==5?'雷达水位站':'明渠流量站'}}</span>
									      		 </template>
									          </el-table-column>
									          <el-table-column label="设备状态" prop="type" show-overflow-tooltip width="100" align="center">
									          	<template scope="props">
									          		<span v-if="props.row.type=='1'" style="color:green;"><i class="el-icon-circle-check" ></i> 在线</span>
									          		<span v-if="props.row.type=='0'" style="color:red;"><i class="el-icon-circle-close" ></i> 离线</span>
									          	</template>
									          </el-table-column>
									          <el-table-column label="实时水位（m）" prop="waterLevel"  show-overflow-tooltip align="center"></el-table-column>
									          <el-table-column label="瞬时流速" prop="instantSpeed"  show-overflow-tooltip align="center"></el-table-column>
									          <el-table-column label="瞬时流量（m³/s）" prop="instantFlow"  show-overflow-tooltip align="center"></el-table-column>
									          <el-table-column label="累计流量（m³）" prop="totleFlow"  show-overflow-tooltip align="center"></el-table-column>
								 			  <el-table-column label="信息采集时间" prop="amendTime" show-overflow-tooltip align="center"></el-table-column>
								 			  <el-table-column label="历史数据查询" show-overflow-tooltip align="center" >
								 			  	<template scope="props">
								 			  		 <el-button @click="selecthdata(props.row)" icon="el-icon-search" size="small" type="text" ><i class="el-icon-search el-icon--right"></i>查询</el-button> 
									      		</template>
								 			  </el-table-column>
								 			</el-table>
											<el-pagination @size-change="handleSizeChange(pagesize1,1)" @current-change="handleCurrentChange(currentPage,1)"  :current-page.sync="currentPage" :page-size="pagesize1" layout="total, prev, pager, next" :total="sum" align="right"></el-pagination>
										</el-tab-pane>
										<el-tab-pane label="水位站" name="1" v-if="switchTab==true">
									  		<el-table   v-loading = "pictLoading" element-loading-background = "rgba(0, 0, 0, 0.8)" element-loading-text = "数据正在加载中,请稍后" element-loading-spinner = "el-icon-loading"
									  		:data="historicalList" key="historicalList" height="750"  :default-sort = "{prop: 'swdiCreateTime', order: 'descending'}" style="width: 100%" border>
									          <el-table-column label="站点编码" prop="devicewaterCode" show-overflow-tooltip align="center" ></el-table-column>
									          <el-table-column label="站点名称" prop="deviceWaterName"  show-overflow-tooltip align="center"></el-table-column>
									          <el-table-column label="站点类型" prop="swiDevicemodelCode"  show-overflow-tooltip align="center">
									          <template scope="props">
									      		  	<span v-if="props.row.swiDevicemodelCode=='8'" >明渠水位站 </span>
									          		<span v-if="props.row.swiDevicemodelCode=='5'" >雷达水位站</span>
									      		</template>
									          </el-table-column>
									          <el-table-column label="实时水位（m）" prop="waterLevel"  show-overflow-tooltip align="center"></el-table-column>
									          <el-table-column label="瞬时流速" prop="instantSpeed"  show-overflow-tooltip align="center"></el-table-column>
									          <el-table-column label="瞬时流量（m³/s）" prop="instantFlow"  show-overflow-tooltip align="center"></el-table-column>
									          <el-table-column label="累计流量（m³）" prop="totleFlow"  show-overflow-tooltip align="center"></el-table-column>
								 			  <el-table-column label="信息采集时间" prop="swdiCreateTime" show-overflow-tooltip align="center"></el-table-column>
								 			</el-table>
										</el-tab-pane>
									<el-tab-pane label="闸门站" name="2">
									<!-- 闸门站数据表格展示 -->
									  <el-table :data="siteSliue" :default-sort = "{prop: 'ssdiCollectTime', order: 'descending'}" style="width: 100%" border stripe>
									    <el-table-column type="expand">
									      <template scope="props">
									        <el-form label-position="left" inline class="demo-table-expand">
									          <el-form-item v-if="props.row.sluiceHeight1!=null" label="1#闸门开度（m）" >
									            <span>{{props.row.sluiceHeight1}}</span>
									          </el-form-item>
									          <el-form-item  v-if="props.row.gateLoad1!=null" label="1#闸门荷重" >
									            <span>{{props.row.gateLoad1}}</span>
									          </el-form-item>
									          <el-form-item v-if="props.row.sluiceHeight2!=null" label="2#闸门开度（m）" >
									            <span>{{props.row.sluiceHeight2}}</span>
									          </el-form-item>
									          <el-form-item v-if="props.row.gateLoad2!=null" label="2#闸门荷重" >
									            <span>{{props.row.gateLoad2}}</span>
									          </el-form-item>
									          <el-form-item v-if="props.row.sluiceHeight3!=null" label="3#闸门开度（m）" >
									            <span>{{props.row.sluiceHeight3}}</span>
									          </el-form-item>
									          <el-form-item v-if="props.row.gateLoad3!=null" label="3#闸门荷重" >
									            <span>{{props.row.gateLoad3}}</span>
									          </el-form-item>
									          <el-form-item v-if="props.row.sluiceHeight4!=null" label="4#闸门开度（m）" >
									            <span>{{props.row.sluiceHeight4}}</span>
									          </el-form-item>
									          <el-form-item v-if="props.row.gateLoad4!=null" label="4#闸门荷重">
									            <span>{{props.row.gateLoad4}}</span>
									          </el-form-item>
									          <el-form-item v-if="props.row.sluiceHeight5!=null" label="5#闸门开度（m）" >
									            <span>{{props.row.sluiceHeight5}}</span>
									          </el-form-item>
									          <el-form-item v-if="props.row.gateLoad5!=null"  label="5#闸门荷重" >
									            <span>{{props.row.gateLoad5}}</span>
									          </el-form-item>
									          <el-form-item v-if="props.row.sluiceHeight6!=null" label="6#闸门开度（m）" >
									            <span>{{props.row.sluiceHeight6}}</span>
									          </el-form-item>
									          <el-form-item v-if="props.row.gateLoad6!=null"  label="6#闸门荷重" >
									            <span>{{props.row.gateLoad6}}</span>
									          </el-form-item>
									         </el-form>
									        </template>
									      </el-table-column>
									       <el-table-column prop="devicesluiceCode" label="闸门站编码"  show-overflow-tooltip align="center" ></el-table-column>
									      <el-table-column prop="devicesluiceName" label="闸门站名称" :formatter="fromSliceName" show-overflow-tooltip align="center" ></el-table-column>
									      <el-table-column prop="ssdiCollectTime" label="采集时间" show-overflow-tooltip align="center" ></el-table-column>
									      <el-table-column prop="ssdiNetState" label="设备状态" show-overflow-tooltip align="center" >
									      	<template scope="props">
									      		<span v-if="props.row.ssdiNetState=='0'">离线</span>
									      		<span v-if="props.row.ssdiNetState=='1'">在线</span>
									      	</template>
									      </el-table-column>
									      <el-table-column prop="beforeWaterLevel" label="闸前水位（m）" show-overflow-tooltip align="center" ></el-table-column>
									      <el-table-column prop="afterWaterLevel" label="闸后水位（m）" show-overflow-tooltip align="center" ></el-table-column>
									      <el-table-column prop="sluiceInstantSpeed" label="瞬时流速（m/s）" show-overflow-tooltip align="center" ></el-table-column>
									      <el-table-column prop="sluiceInstantFlow" label="瞬时流量（m³/s）" show-overflow-tooltip align="center" ></el-table-column>
									    </el-table>
									    <el-pagination @size-change="handleSizeChange(pagesize2,2)" @current-change="handleCurrentChange(currentPage2,2)"  :current-page.sync="currentPage2" :page-size="pagesize2" layout="total, prev, pager, next" :total="sum" align="right"></el-pagination>
									  	</el-tab-pane>
									  	<el-tab-pane label="视频站" name="3" >
									          	<table v-for="siteVideo.slice((currentPage2-1)*pagesize2,currentPage2*pagesize2)">
									          		<tr>
														<td colspan="4" id="siteVideo"></td>
									          		</tr>
									          	</table>
									          	 <el-pagination @size-change="handleSizeChange(pagesize3,3)" @current-change="handleCurrentChange(currentPage3,3)"  :current-page.sync="currentPage3" :page-size="pagesize3" layout="total, prev, pager, next" :total="siteVideo.length" align="center"></el-pagination>
														<div id="dialog" title="Basic dialog">
									  	</el-tab-pane>
									  </el-tabs>
								</template>
								
								<!-- 历史数据form表单 -->
								<!-- <template>
									<el-table :data="historicalList"  height="250" :default-sort = "{prop: 'swdiCreateTime', order: 'descending'}" style="width: 80%" border stripe>
									          <el-table-column label="站点编码" prop="devicewaterCode" show-overflow-tooltip align="center" ></el-table-column>
									          <el-table-column label="站点名称" prop="deviceWaterName"  show-overflow-tooltip align="center"></el-table-column>
									          <el-table-column label="站点类型" prop="swiDevicemodelCode"  show-overflow-tooltip align="center">
									          <template scope="props">
									      		  	<span v-bind:style="{color:(props.row.swiDevicemodelCode==8?'#E6A23C':'')}">{{props.row.swiDevicemodelCode==5?'雷达水位站':'明渠流量站'}}</span>
									      		</template>
									          </el-table-column>
									          <el-table-column label="实时水位（m）" prop="waterLevel"  show-overflow-tooltip align="center"></el-table-column>
									          <el-table-column label="瞬时流速" prop="instantSpeed"  show-overflow-tooltip align="center"></el-table-column>
									          <el-table-column label="瞬时流量（m³/s）" prop="instantFlow"  show-overflow-tooltip align="center"></el-table-column>
									          <el-table-column label="累计流量（m³）" prop="totleFlow"  show-overflow-tooltip align="center"></el-table-column>
								 			  <el-table-column label="信息采集时间" prop="swdiCreateTime" show-overflow-tooltip align="center"></el-table-column>
								 			</el-table>
								</template> -->
							<el-dialog title="分层流速" id="tierDcher" :visible.sync="dialogVisible" :modal=false width="auto" top="30%">
								<span v-if="tieRow.tierNum==null||tieRow.tierNum==''" style="margin-left:45%;">暂无数据</span>
			          			<table id="trder" v-if="tieRow.tierNum>0">
			          				<tr style="background: #b5b5b56b">
			          					<td v-for="(trd,index) in tieRow.tierNum">第{{index+1}}层流速(m³/s)</td>
			          				</tr>
			          				<tr>
			          					<td v-for="(trd,index) in tieRow.tierNum">{{tieRow["trenChier"+(index+1)]}}</td>
			          				</tr>
			          			</table>
							</el-dialog>
							
							<div id="app" v-if="type=='3'">
								<el-card class="box-card"  shadow="always">
								  <div slot="header" class="clearfix">
								    <span style="font-size:14px;">云台操控盘</span>
								  </div>
								  <div v-for="o in 4" :key="o" class="text item" >
								   		<div id="inputVideo" align="left"></div>
								  </div>
								</el-card>
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
	<script type="text/javascript" src="${ctxstc}/js/custom/plan/real-time_supervision/real-time_supervision.js"></script>

	<script>
	$(document).ready(function(){
		//========================操控台动画=============================
		//--------------2018-5-4 liyue   操控云台--------------------
		 //请求云台控制
		    function ajaxConsole(iPTZIndex){
		    	$.ajax({
					url:"${ctx}/holder/Console",
					data: {direction:iPTZIndex},
					type: "post",
					async: false,//非异步
					success: function(msg){
						//alert(JSON.stringify(msg));
					}
				}); 
		    }
		    //操作云台
		     function mouseDownPTZControl(iPTZIndex) {
			   	if(iPTZIndex==2){//向左
			   		ajaxConsole(iPTZIndex);	
			   	}else if(iPTZIndex==3){//向右
			   		ajaxConsole(iPTZIndex);	
			   	}else if(iPTZIndex==4){//左上
			   		ajaxConsole(iPTZIndex);	
			   	}else if(iPTZIndex==5){//左下
			   		ajaxConsole(iPTZIndex);	
			   	}else if(iPTZIndex==6){//右上
			   		ajaxConsole(iPTZIndex);	
			   	}else if(iPTZIndex==7){//右下
			   		ajaxConsole(iPTZIndex);	
			   	}else if(iPTZIndex==0){//上
			   		ajaxConsole(iPTZIndex);	
			   	}else if(iPTZIndex==1){//下
			   		ajaxConsole(iPTZIndex);	
			   	}else if(iPTZIndex==8){//近焦
			   		ajaxConsole(iPTZIndex);	
			   	}else if(iPTZIndex==9){//远焦
			   		ajaxConsole(iPTZIndex);	
			   	}
		    }
		    
		 // 方向PTZ停止
		  function mouseUpPTZControl(iPTZIndex) {
			$.ajax({
				url:"${ctx}/holder/shutDownOperation",
				data: {direction:iPTZIndex},
				type: "post",
				async: false,//非异步
				success: function(msg){
					//alert(JSON.stringify(msg));
				}
			}); 
		  } 
		
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
		start("1211",1,threeLevelPermission,"${calCanalInfo.canalCode}");
		
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
		<c:forEach items="${calCanalInfoList}" var="calCanalInfo">
			var id   ="${calCanalInfo.id}";
			var pId  ="${calCanalInfo.canalParentId}";
			var name ="${calCanalInfo.canalName}";
			var level="${calCanalInfo.canallevelCode}";
			//if(level==0||level==1){
				zNode={id:id, pId:pId, name:name,click:"start('${calCanalInfo.id}',1,'"+threeLevelPermission+"','${calCanalInfo.canalCode}');", open:true};
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
</body>
</html>