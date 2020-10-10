<%@ page language="java" import="java.util.*" pageEncoding="utf-8"%>
<%@ include file="/WEB-INF/views/base.jsp"%>

<!DOCTYPE html>
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8">
	<meta http-equiv="X-UA-Compatible" content="IE=Edge">
	<meta name="viewport" content="width=device-width, initial-scale=1,maximum-scale=1, user-scalable=no">
	<title>行政区域列表页</title>
		<script src="http://code.jquery.com/jquery-1.8.2.min.js"></script>
    <script type="text/javascript" src="http://api.map.baidu.com/api?v=3.0&ak=BqBbhtroCdoQtxOj1yxrr8NPvPlkMKst"></script>
    <script type="text/javascript" src="http://api.map.baidu.com/library/AreaRestriction/1.2/src/AreaRestriction_min.js"></script>
	<link type="text/css" rel="stylesheet" href="${ctxstc}/adapters/bootstrap/css/Copy of bootstrap.min.css" title="" />
	<link type="text/css" rel="stylesheet" href="${ctxstc}/css/body.css" title="" />
	<link type="text/css" rel="stylesheet" href="${ctxstc}/css/style.css" title="" />
	<link type="text/css" rel="stylesheet" href="${ctxstc}/css/dermadefault.css" title="blue" />
	<link type="text/css" rel="stylesheet" href="${ctxstc}/css/dermagreen.css" title="green" disabled="disabled"/>
	<link type="text/css" rel="stylesheet" href="${ctxstc}/css/dermaorange.css" title="orange" disabled="disabled"/>
	<link type="text/css" rel="stylesheet" href="${ctxstc}/css/templatecss.css" title="" />
	<link type="text/css" rel="stylesheet" href="${ctxstc}/css/ui-layout.css" title="" /><!-- angular ui --->
	<link type="text/css" rel="stylesheet" href="${ctxstc}/css/custom/scroll.css" title="" /><!-- 滚动条样式 --->
	<script type="text/javascript" src="${ctxstc}/jquery/jquery.cookie.js"></script>
	<script type="text/javascript" src="${ctxstc}/adapters/bootstrap/js/bootstrap.min.js"></script>
	<script type="text/javascript" src="${ctxstc}/adapters/bootstrap/js/bootstrap-paginator.js"></script>
	<script type="text/javascript" src="${ctxstc}/js/style.js"></script>
	<script type="text/javascript" src="${ctxstc}/js/angular.min.js"></script><!-- angular ui --->
	<script type="text/javascript" src="${ctxstc}/js/ui-layout.js"></script>
	 
	<link rel="stylesheet" href="${ctxstc}/adapters/layui/css/layui.css" type="text/css">
	<link rel="stylesheet" href="${ctxstc}/adapters/layui/layer/mobile/need/layer.css" type="text/css">
	
	<script type="text/javascript" src="${ctxstc}/adapters/layui/layui.js"></script>
	
	<link rel="stylesheet" href="${ctxstc}/adapters/ztree/css/zTreeStyle/zTreeStyle.css" type="text/css">
	<link rel="stylesheet" href="${ctxstc}/css/map_msg/map_msg.css" type="text/css">
	
	
	<!-- tips -->
	<link rel="stylesheet" href="${ctxstc}/adapters/tips/css/tipso.min.css" type="text/css">
	
	
	<script type="text/javascript" src="${ctxstc}/adapters/ztree/js/jquery.ztree.core.js"></script>
	
    <script type="text/javascript" src="${ctxstc}/adapters/ztree/js/jquery.ztree.excheck.js"></script>
    <script type="text/javascript" src="${ctxstc}/adapters/ztree/js/jquery.ztree.exedit.js"></script>
    <script type="text/javascript" src="${ctxstc}/js/ezuikit.js"></script>
	<script src="${ctxstc}/adapters/layui/layer/layer.js"></script>
	
	
	<!-- 2018-5-04 关于摄像头视频的插件 -->
	<script src="https://open.ys7.com/sdk/js/1.3/ezuikit.js"></script>
	<script type="text/javascript" src="http://resource.bcevod.com/player/cyberplayer.js"></script>
	<link rel="stylesheet" href="${ctxstc}/css/demo.css" type="text/css">
	<!-- <script>
			document.write("<link type='text/css' href='${ctxstc}/css/demo.css?version=" + new Date().getTime() + "' rel='stylesheet' />");
	</script> -->
	
  	<style>
  
	.topbar-nav-item a{color: red;}
	.topbar-nav-item a:hover{color: blue;}
	video{max-width: 1200px; width: 400px; height: 200px;}

  </style>
  
  
  <script src="${ctxstc}/Cesium/Build/Cesium/Cesium.js"></script>
  <link rel="stylesheet" href="${ctxstc}/Cesium/Build/Cesium/Widgets/widgets.css" type="text/css">
  <link rel="stylesheet" href="${ctxstc}/css/custom/movie.css" type="text/css">
  
  <link rel="stylesheet" href="${ctxstc}/css/custom/map_canal.css" type="text/css">
   <link rel="stylesheet" href="${ctxstc}/css/custom/map_sluice.css" type="text/css">
   <link rel="stylesheet" href="${ctxstc}/css/custom/map_sluice_water.css" type="text/css">
  <link rel="stylesheet" href="${ctxstc}/css/custom/map_top_site.css" type="text/css">
  <link rel="stylesheet" href="${ctxstc}/css/custom/map_reservoir.css" type="text/css">
  <link rel="stylesheet" href="${ctxstc}/css/custom/map_well.css" type="text/css">
  <link rel="stylesheet" href="${ctxstc}/css/custom/map_rain.css" type="text/css">
  <link rel="stylesheet" href="${ctxstc}/css/custom/map_site_msg.css" type="text/css">
  <link rel="stylesheet" href="${ctxstc}/css/custom/map_rain_site_msg.css" type="text/css">
  <link rel="stylesheet" href="${ctxstc}/css/custom/map_reservoir_site_msg.css" type="text/css">
  <link rel="stylesheet" href="${ctxstc}/css/custom/map_sluice_site_msg.css" type="text/css">
  <link rel="stylesheet" href="${ctxstc}/swiper/css/swiper.min.css">
  <style>
   .center-back{padding-left: 0px;}
	.container-fluid {
		padding-right: 0px;
	    padding-left: 0px;
	    margin-right: auto;
	    margin-left: auto;
	    height:100%;
	}
	  body {
          width: 100%; height: 100%; margin: 0; padding: 0; overflow: hidden;
      }
	
      #ha,#map,#a,#cesiumContainer {
          width: 100%; height: 100%; margin: 0; padding: 0; overflow: hidden;
      }
   	 .map_button1{filter:alpha(Opacity=80);-moz-opacity:0.7;opacity: 0.7;width:33px; height:130px;  background:black; border-top-right-radius:10px;border-bottom-right-radius:10px; color:#fff; font-weight:bold; font-size:14px; text-align:center; margin-top:72px; top:0px; position:absolute; left:0px; padding-top:17px; cursor:pointer}
  	 .map_button1:hover{background:rgba(255,153,0,0.5);}
  	 
  	  .map_button2{filter:alpha(Opacity=80);-moz-opacity:0.7;opacity: 0.7;width:33px; height:70px;  background:black; border-top-right-radius:10px;border-bottom-right-radius:10px; color:#fff; font-weight:bold; font-size:14px; text-align:center; margin-top:179px; top:0px; position:absolute; left:0px; padding-top:17px; cursor:pointer}
  	  .map_button2:hover{background:rgba(255,153,0,0.5);}
  	 
  	  .map_button3{filter:alpha(Opacity=80);-moz-opacity:0.7;opacity: 0.7;width:33px; height:130px;  background:black; border-top-right-radius:10px;border-bottom-right-radius:10px; color:#fff; font-weight:bold; font-size:14px; text-align:center; margin-top:251px; top:0px; position:absolute; left:0px; padding-top:17px; cursor:pointer}
  	  .map_button3:hover{background:rgba(255,153,0,0.5);}
  	  
  	   .map_button4{filter:alpha(Opacity=80);-moz-opacity:0.7;opacity: 0.7;width:33px; height:105px;  background:black; border-top-right-radius:10px;border-bottom-right-radius:10px; color:#fff; font-weight:bold; font-size:14px; text-align:center; margin-top:358px; top:0px; position:absolute; left:0px; padding-top:17px; cursor:pointer}
  	  .map_button4:hover{background:rgba(255,153,0,0.5);}
  	  
  	   .map_button5{filter:alpha(Opacity=80);-moz-opacity:0.7;opacity: 0.7;width:33px; height:105px;  background:black; border-top-right-radius:10px;border-bottom-right-radius:10px; color:#fff; font-weight:bold; font-size:14px; text-align:center; margin-top:465px; top:0px; position:absolute; left:0px; padding-top:17px; cursor:pointer}
  	  .map_button5:hover{background:rgba(255,153,0,0.5);}
  	 	/* 视频站 */
  	   .map_video{filter:alpha(Opacity=80);-moz-opacity:0.7;opacity: 0.7;width:80px; height:25px; letter-spacing:2px; line-height:25px; background:black;border-radius:0 0 10px 10px; color:#fff; font-weight:bold; font-size:14px; text-align:center; top:0px; position:absolute; left:280px;  cursor:pointer}
  	   .map_video:hover{background:rgba(255,153,0,0.5);}
  	   /* 水质检测站 */
  	   .map_water{filter:alpha(Opacity=80);-moz-opacity:0.7;opacity: 0.7;width:80px; height:25px; letter-spacing:2px; line-height:25px; background:black;border-radius:0 0 10px 10px; margin-left:8px; color:#fff; font-weight:bold; font-size:14px; text-align:center; top:0px; position:absolute; left:363px;  cursor:pointer}
  	   .map_water:hover{background:rgba(255,153,0,0.5);}
  	   /* 气象站 */
  	   .map_monitor{filter:alpha(Opacity=80);-moz-opacity:0.7;opacity: 0.7;width:80px; height:25px; letter-spacing:2px; line-height:25px; background:black;border-radius:0 0 10px 10px; margin-left:16px; color:#fff; font-weight:bold; font-size:14px; text-align:center; top:0px; position:absolute; left:446px;  cursor:pointer}
  	   .map_monitor:hover{background:rgba(255,153,0,0.5);}
  	   /* 墒情站 */
  	   .map_moisture{filter:alpha(Opacity=80);-moz-opacity:0.7;opacity: 0.7;width:80px; height:25px; letter-spacing:2px; line-height:25px; background:black;border-radius:0 0 10px 10px; margin-left:24px; color:#fff; font-weight:bold; font-size:14px; text-align:center; top:0px; position:absolute; left:529px;  cursor:pointer}
  	   .map_moisture:hover{background:rgba(255,153,0,0.5);}
  	   /* 蒸发站 */
  	   .map_evaporate{filter:alpha(Opacity=80);-moz-opacity:0.7;opacity: 0.7;width:80px; height:25px; letter-spacing:2px; line-height:25px; background:black;border-radius:0 0 10px 10px; margin-left:32px; color:#fff; font-weight:bold; font-size:14px; text-align:center; top:0px; position:absolute; left:612px;  cursor:pointer}
  	   .map_evaporate:hover{background:rgba(255,153,0,0.5);}
  	  /* 流量站 */
  	   .map_stream{filter:alpha(Opacity=80);-moz-opacity:0.7;opacity: 0.7;width:80px; height:25px; letter-spacing:2px; line-height:25px; background:black;border-radius:0 0 10px 10px; margin-left:40px; color:#fff; font-weight:bold; font-size:14px; text-align:center; top:0px; position:absolute; left:695px;  cursor:pointer}
  	   .map_stream:hover{background:rgba(255,153,0,0.5);}
  	   /* 压力站 */
  	   .map_pressure{filter:alpha(Opacity=80);-moz-opacity:0.7;opacity: 0.7;width:80px; height:25px; letter-spacing:2px; line-height:25px; background:black;border-radius:0 0 10px 10px; margin-left:48px; color:#fff; font-weight:bold; font-size:14px; text-align:center; top:0px; position:absolute; left:778px;  cursor:pointer}
  	   .map_pressure:hover{background:rgba(255,153,0,0.5);}
  	   /* 机井监测站 */
  	   .map_driven{filter:alpha(Opacity=80);-moz-opacity:0.7;opacity: 0.7;width:80px; height:25px; letter-spacing:2px; line-height:25px; background:black;border-radius:0 0 10px 10px; margin-left:56px; color:#fff; font-weight:bold; font-size:14px; text-align:center; top:0px; position:absolute; left:861px;  cursor:pointer}
  	   .map_driven:hover{background:rgba(255,153,0,0.5);}
  	/* 地图切换开关 */
  		.map_switch{width:70px; height:33px;  line-height:33px; background:black; margin-left:56px; color:#fff; font-size:14px; text-align:center; top:8px; position:absolute; right:17%;  cursor:pointer;border-radius:4px;;opacity:0.9;background-color: cornflowerblue}
  	 	.map_switch:hover{width:70px; height:33px;  line-height:33px; background:black; margin-left:56px; color:dodgerblue; font-size:14px; text-align:center; top:8px; position:absolute; right:17%;  cursor:pointer;border-radius:4px;opacity:0.9;background:#ccc}
  	 	.map_switchs{width:90px; height:33px;  line-height:33px; background:black; margin-left:56px; color:#fff; font-size:14px; text-align:center; top:8px; position:absolute; right:10%;  cursor:pointer;border-radius:4px;opacity:0.9;}
  	  	.map_switchs:hover{width:90px; height:33px;  line-height:33px; background:black; margin-left:56px; color:dodgerblue; font-size:14px; text-align:center; top:8px; position:absolute; right:10%;  cursor:pointer;border-radius:4px;opacity:0.9;background:#ccc}
  	  .video{width:33px; height:112px;  border-top-right-radius:10px;border-bottom-right-radius:10px; color:#fff; font-weight:bold; font-size:14px; text-align:center; margin-top:68px; top:50%; position:absolute; right:640px; bottom:640px; padding-top:17px; cursor:pointer}
  </style>
</head>
<body class="tundra">
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
								<li >
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
			<li class="li-border">
				<a href="#" class="mystyle-color">
					<span class="glyphicon glyphicon-bell"></span>
					<span class="topbar-num">0</span>
				</a>
			</li>
			
			<li class="li-border dropdown">
				<a href="#" class="mystyle-color" data-toggle="dropdown">
					<span class="glyphicon glyphicon-search"></span>搜索
				</a>
				<div class="dropdown-menu search-dropdown">
					<div class="input-group">
						<input type="text" class="form-control">
						<span class="input-group-btn">
							<button type="button" class="btn btn-default">搜索</button>
						</span>
					</div>
				</div>
			</li>
			
			<li class="dropdown li-border">
				<a href="#" class="dropdown-toggle mystyle-color" data-toggle="dropdown">${sysUser.userName }<span class="caret"></span></a>
				<ul class="dropdown-menu">
					<li><a href="#">退出</a></li>
				</ul>
			</li>
			
			<li class="dropdown">
				<a href="#" class="dropdown-toggle mystyle-color" data-toggle="dropdown">换肤<span class="caret"></span></a>
				<ul class="dropdown-menu changecolor">
					<li id="blue"><a href="#">蓝色</a></li>
					<li class="divider"></li>
					<li id="green"><a href="#">绿色</a></li>
					<li class="divider"></li>
					<li id="orange"><a href="#">橙色</a></li>
				</ul>
			</li>
		</ul>
		<!-- 头部右侧导航end -->
	</div>
</nav>
<div class="down-main" id="electronic">
  <div class="left-main left-off" id="scroll">
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
  <div  class="right-product right-off">
  <section id="layout" ng-app="doc.ui-layout">
    <div ui-layout id="ha" class="layout-mock"> 
        <!---rightcontent---->    
        <div id="a" class="center-back right-back">
	        <div class="container-fluid">
		        <div id="map">
					<div id="cesiumContainer">
					</div>
					<!--=========渠道菜单===============-->
					<div class="map_button1" onclick="showCanal()">
						雷<br/>达<br/>水<br/>位<br/>站
					</div>
					<div id="righteject_canal"  >
						<strong class="rightejecttit_canal" ><span></span></strong>
		   				<div class="rightejectcon_canal">
		 						<ul id="tree" class="nav nav-pills nav-stacked">
									<ul class="layui-nav layui-nav-tree" lay-filter="test" style="background-color:rgba(41,48,56,0);">
								  		<li class="layui-nav-item layui-nav-itemed" style="background-color:rgba(41,48,56,0);">
								    	<a href="javascript:;">渠道列表</a>
								    	</li>
								    </ul>
									<ul id="treeDemo" class="ztree">
									</ul>
								</ul>
		    			</div>
					</div>
								
					<!--==========水库菜单=============  -->	
					<!-- <div class="map_button2" onclick="showReservoir()">
						明<br/>渠<br/>流<br/>量<br/>站
					</div> -->
					<div id="righteject_reservoir"  >
						<strong class="rightejecttit_reservoir" ><span></span></strong>
		   				<div class="rightejectcon_reservoir">
		   						<ul class="layui-nav layui-nav-tree" lay-filter="test" style="background-color:rgba(41,48,56,0);">
								  <li class="layui-nav-item layui-nav-itemed" style="background-color:rgba(41,48,56,0);">
								    <a href="javascript:;">水库列表</a>
								    <dl class="layui-nav-child" >
								    	<dd ><a href="javascript:show(0,0);">全部水库</a></dd>
								    	<c:forEach items="${siteReservoirInfolist}" var="siteReservoirInfo" >
								    	 	<dd ><a href="javascript:show('${siteReservoirInfo.id}','${siteReservoirInfo.deviceReservoirCode}');">${siteReservoirInfo.deviceReservoirName}</a></dd>
										</c:forEach>
								    </dl>
								  </li>
								</ul>
		   					
		    			</div>
					</div>
					<!--==========雨量菜单=============-->
					<div class="map_button3" onclick="showRainSite()">
						明<br/>渠<br/>流<br/>量<br/>站
					</div>
					<div id="righteject_rain"  >
						<strong class="rightejecttit_rain" ><span></span></strong>
		   				<div class="rightejectcon_rain">
		 					<ul id="tree" class="nav nav-pills nav-stacked">
									<ul class="layui-nav layui-nav-tree" lay-filter="test" style="background-color:rgba(41,48,56,0);">
								  		<li class="layui-nav-item layui-nav-itemed" style="background-color:rgba(41,48,56,0);">
								    	<a href="javascript:;">行政列表</a>
								    	</li>
								    </ul>
									<ul id="treeDemo2" class="ztree">
									</ul>
								</ul>
		    			</div>
					</div>
					<!--==========闸门菜单=============-->
					<!-- <div class="map_button4" onclick="showSluiceSite()">
						闸<br/>门<br/>站
					</div> -->
					<div id="righteject_sluice"  >
						<strong class="rightejecttit_sluice" ><span></span></strong>
		   				<div class="rightejectcon_sluice">
		 					<ul id="tree" class="nav nav-pills nav-stacked">
									<ul class="layui-nav layui-nav-tree" lay-filter="test" style="background-color:rgba(41,48,56,0);">
								  		<li class="layui-nav-item layui-nav-itemed" style="background-color:rgba(41,48,56,0);">
								    	<a href="javascript:;">行政列表</a>
								    	</li>
								    </ul>
									<ul id="treeDemo3" class="ztree">
									</ul>
								</ul>
		    			</div>
					</div>
					<!--==========水厂菜单=============-->
					<!--  <div class="map_button5" onclick="showWaterSite()">
						供<br/>水<br/>站
					</div> -->
					<div id="righteject_water"  >
						<strong class="rightejectthis_water" ><span></span></strong>
		   				<div class="righteject_water">
		 					<ul id="tree" class="nav nav-pills nav-stacked">
									<ul class="layui-nav layui-nav-tree" lay-filter="test" style="background-color:rgba(41,48,56,0);">
								  		<li class="layui-nav-item layui-nav-itemed" style="background-color:rgba(41,48,56,0);">
								    	<a href="javascript:;">行政列表</a>
								    	</li>
								    </ul>
									<ul id="treeDemo4" class="ztree">
									</ul>
								</ul>
		    			</div>
					</div>
					
					<!--==========视频站=============-->
						<div class="map_video" onclick="videoSite()">视频站</div>
						<div id="right_video">
						<strong class="right_video" ><span></span></strong>
		   				<div class="right_video_div">
		 					<ul id="tree" class="nav nav-pills nav-stacked">
									<ul class="layui-nav layui-nav-tree" lay-filter="test" style="background-color:rgba(41,48,56,0);">
								  		<li class="layui-nav-item layui-nav-itemed" style="background-color:rgba(41,48,56,0);">
								    	<a href="javascript:;">行政列表</a>
								    	</li>
								    </ul>
									<ul id="treeDemo5" class="ztree">
									</ul>
								</ul>
		    			</div>
					</div>
						
					<!--==========水质监测站=============-->
						<div class="map_water">水质监测</div>
						
					<!--==========气象站=============-->
						<div class="map_monitor">气象站</div>
						
					<!--==========墒情站=============-->
						<div class="map_moisture">墒情站</div>
						
					<!--==========蒸发站=============-->
						<div class="map_evaporate">蒸发站</div>
						
					<!--==========流量站=============-->
						<div class="map_stream">流量站</div>
						
					<!--==========压力站=============-->
						<div class="map_pressure">压力站</div>
						
					<!--==========机井监测=============-->
						<div class="map_driven">机井监测</div>
						<!--==========地图切换=============-->
<!-- 					<div>
						<div class="map_switch">
							<span onclick="mapSwitch(0);return false;">百度地图</span>
						</div>
						<div class="map_switchs">
							<span onclick="mapSwitch(1);return false;">Google地图</span>
						</div>
					</div> -->
						
								
					<!--==========雨量站信息=============-->
					<div id="righteject_rain_site"  >
						<strong class="rightejecttit_rain_site" ><span></span></strong>
		   				<div class="rightejectcon_rain_site" >
						 	<div style="height: 30px;border-bottom: 1px solid #ff9900;line-height: 30px;">
		 						<span style="padding: 0px 10px;line-height: 25px;">
		 							<img src="${ctxstc}/images/map/position.png" height="20px">
		 						</span>
		 						<span style="padding: 0px 10px;line-height: 25px;">
		 							<span style="color:#fff">当前位置:</span>
		 							<span id="rain_site_current_location" style="color:#fff"></span>
		 						</span>
		 						<span style="width: 50px;text-align: center;cursor: pointer;position: absolute;right: 10px">
		 							<img src="${ctxstc}/images/map/x.png" height="20px" onclick="canalRainMsg()">
		 						</span>
		 					</div>				
		   					<div class="swiper-container detail-swiper swiper-container-horizontal">	
				 				<div class="swiper-wrapper" id="b-siwper-detail" style="height: 300px;transform: translate3d(0px, 0px, 0px); transition-duration: 600ms;" >
				 					<div class="swiper-slide all-color" style="transform: translate3d(0px, 0px, 0px); transition-duration: 600ms;" >
	 									<div class="content content-1">
	 										<div class="">
	 											<div class="col-xs-12 content-box">
	 												<div class="basic-arrow" >
	 													<div class="basic basic-info" >
	 														<span class="b-info-arrow" style="color: #ff9900;">>>></span>
	 														<span class="b-info-name" id="one_msg" style="">实时雨量</span>
	 													</div>
	 													<div class="basic basic-change" style="float: right" id="b-info" >
	 														<span class="basic-change-img hover" id="bs-info">
																<img src="${ctxstc}/images/map/enlarge.png" height="20px">		 														
	 														</span>
	 													</div>
	 													<div class="b-content ei-content">
	 														<p class="b-brief" style="margin: 0 0 10px"></p>
	 														<div class="col-xs-12" style="height: 200px;width: 100%;line-height: 200px;text-align: center;">
	 															<!-- <div id="rainChart" width="50%" height="100%" style="float: left;"></div> -->
	 															<!-- <div id="current_site_water_table" style="margin-left:0px;margin-top:0px;height: 100%;width:100%"></div> -->
	 															<!-- <span>实时流量</span> -->
	 															
	 															<div id="current_site_rain_table" style=" margin-left:0px;margin-top:-40px;height: 300px;width:100%"></div>
	 														</div>
	 														<p></p>
	 													</div>
	 												</div>
	 											</div>
	 										</div>
	 									</div>
	 									<div class="content content-1">
	 										<div class="">
	 											<div class="col-xs-12 content-box">
	 												<div class="basic-arrow" >
	 													<div class="basic basic-info" >
	 														<span class="b-info-arrow" style="color: #ff9900;">>>></span>
	 														<span class="b-info-name" id="two_msg" style="">累积雨量</span>
	 													</div>
	 													<div class="basic basic-change" style="float: right" id="b-info" >
	 														<span class="basic-change-img hover" id="bs-info">
																<img src="${ctxstc}/images/map/enlarge.png" height="20px">		 														
	 														</span>
	 													</div>
	 													<div class="b-content ei-content">
	 														<p class="b-brief" style="margin: 0 0 10px"></p>
	 														<div class="col-xs-12" style="height: 200px;width: 100%;line-height: 200px;text-align: center;">
	 															<div id="current_site_total_rain_table" style=" margin-left:0px;margin-top:-40px;height: 300px;width:100%"></div>
	 														</div>
	 														<p></p>
	 													</div>
	 												</div>
	 											</div>
	 										</div>
	 									</div>
	 								
				 					</div>
				 					<div class="swiper-slide all-color" style="transform: translate3d(0px, 0px, 0px); transition-duration: 600ms;" >
	 										<div class="content content-1">
	 										<div class="">
	 											<div class="col-xs-12 content-box" style="border-right: 0px solid #ccc;">
	 												<div class="basic-arrow" >
	 													<div class="basic basic-info" >
	 														<span class="b-info-arrow" style="color: #ff9900;">>>></span>
	 														<span class="b-info-name" id="two_msg" style="">站点信息</span>
	 													</div>
	 													<div class="basic basic-change" style="float: right" id="b-info" >
	 														<span class="basic-change-img hover" id="bs-info">
																<img src="${ctxstc}/images/map/enlarge.png" height="20px">		 														
	 														</span>
	 													</div>
	 													<div class="b-content ei-content">
	 														<p class="b-brief" style="margin: 0 0 10px"></p>
	 														<div class="col-xs-12" style="height: 200px;width: 100%;line-height: 200px;">
	 															<table id="siteRainMsgText" border="0" cellspacing="50px" style="font-weight:normal;margin-left:30px;line-height: 20px; border-collapse:separate; border-spacing:0px 10px;">
	 																<tr>
	 																	<td>站点名称：</td><td id="deviceRainName"></td>
	 																</tr>
	 																<tr>
	 																	<td>站点编码：</td><td id="deviceRainCode"></td>
	 																</tr>
	 																<tr>
	 																	<td>建站时间：</td><td id="sriBuildTime"></td>
	 																</tr>
	 																<tr>
	 																	<td>站点地址：</td><td id="sriAddr"></td>
	 																</tr>
	 															</table>
	 														</div>
	 														<p></p>
	 													</div>
	 												</div>
	 											</div>
	 										</div>
	 									</div>
	 									<div class="content content-1">
	 										<div class="">
	 											<div class="col-xs-12 content-box">
	 												<div class="basic-arrow" >
	 													<div class="basic basic-info" >
	 														<span class="b-info-arrow" style="color: #ff9900;">>>></span>
	 														<span class="b-info-name" id="two_msg" style="">实时水量</span>
	 													</div>
	 													<div class="basic basic-change" style="float: right" id="b-info" >
	 														<span class="basic-change-img hover" id="bs-info">
																<img src="${ctxstc}/images/map/enlarge.png" height="20px">		 														
	 														</span>
	 													</div>
	 													<div class="b-content ei-content">
	 														<p class="b-brief" style="margin: 0 0 10px"></p>
	 														<div class="col-xs-12" style="height: 200px;width: 100%;line-height: 200px;text-align: center;">
	 															<div id="reservoir_table" style=" margin-left:0px;margin-top:0px;height: 100%;width:100%"></div>
	 														</div>
	 														<p></p>
	 													</div>
	 												</div>
	 											</div>
	 										</div>
	 									</div>
	 									<div class="content content-1">
	 										<div class="">
	 											<div class="col-xs-12 content-box" style="border-right: 0px solid #ccc;">
	 												<div class="basic-arrow" >
	 													<div class="basic basic-info" >
	 														<span class="b-info-arrow" style="color: #ff9900;">>>></span>
	 														<span class="b-info-name" id="two_msg" style="">实时流量</span>
	 													</div>
	 													<div class="basic basic-change" style="float: right" id="b-info" >
	 														<span class="basic-change-img hover" id="bs-info">
																<img src="${ctxstc}/images/map/enlarge.png" height="20px">		 														
	 														</span>
	 													</div>
	 													<div class="b-content ei-content">
	 														<p class="b-brief" style="margin: 0 0 10px"></p>
	 														<div class="col-xs-12" style="height: 200px;width: 100%;line-height: 200px;text-align: center;">
	 															<div id="reservoir_table" style=" margin-left:0px;margin-top:0px;height: 100%;width:100%"></div>
	 														</div>
	 														<p></p>
	 													</div>
	 												</div>
	 											</div>
	 										</div>
	 									</div>
				 					</div>
				 				</div>
				 				<div class="swiper-button-next"></div>
  								<div class="swiper-button-prev"></div>
				 			</div>
		 				</div> 
		    		</div>
		    		
		    		<!--==========水库信息=============-->
					<div id="righteject_reservoir_site"  >
						<strong class="rightejecttit_reservoir_site" ><span></span></strong>
		   				<div class="rightejectcon_reservoir_site" >
						 	<div style="height: 30px;border-bottom: 1px solid #ff9900;line-height: 30px;">
		 						<span style="padding: 0px 10px;line-height: 25px;">
		 							<img src="${ctxstc}/images/map/position.png" height="20px">
		 						</span>
		 						<span style="padding: 0px 10px;line-height: 25px;">
		 							<span style="color:#fff">当前位置:</span>
		 							<span id="reservoir_site_current_location" style="color:#fff"></span>
		 						</span>
		 						<span style="width: 50px;text-align: center;cursor: pointer;position: absolute;right: 10px">
		 							<img src="${ctxstc}/images/map/x.png" height="20px" onclick="canalReservoirMsg()">
		 						</span>
		 					</div>				
		   					<div class="swiper-container detail-swiper swiper-container-horizontal">	
				 				<div class="swiper-wrapper" id="b-siwper-detail" style="height: 300px;transform: translate3d(0px, 0px, 0px); transition-duration: 600ms;" >
				 					<div class="swiper-slide all-color" style="transform: translate3d(0px, 0px, 0px); transition-duration: 600ms;" >
	 									<div class="content content-1">
	 										<div class="">
	 											<div class="col-xs-12 content-box">
	 												<div class="basic-arrow" >
	 													<div class="basic basic-info" >
	 														<span class="b-info-arrow" style="color: #ff9900;">>>></span>
	 														<span class="b-info-name" id="one_msg" style="">实时水位</span>
	 													</div>
	 													<div class="basic basic-change" style="float: right" id="b-info" >
	 														<span class="basic-change-img hover" id="bs-info">
																<img src="${ctxstc}/images/map/enlarge.png" height="20px">		 														
	 														</span>
	 													</div>
	 													<div class="b-content ei-content">
	 														<p class="b-brief" style="margin: 0 0 10px"></p>
	 														<div class="col-xs-12" style="height: 300px;width: 100%;line-height: 200px;text-align: center;">
	 															<%-- <iframe src="${ctx}/map/current_reservoir_height_table"  frameborder="no" width="100%" height="100%" style="float: left;"></iframe> --%>
	 															<!-- <div id="current_site_water_table" style="margin-left:0px;margin-top:0px;height: 100%;width:100%"></div> -->
	 															<!-- <span>实时流量</span> -->
	 														</div>
	 														<p></p>
	 													</div>
	 												</div>
	 											</div>
	 										</div>
	 									</div>
	 									<div class="content content-1">
	 										<div class="">
	 											<div class="col-xs-12 content-box">
	 												<div class="basic-arrow" >
	 													<div class="basic basic-info" >
	 														<span class="b-info-arrow" style="color: #ff9900;">>>></span>
	 														<span class="b-info-name" id="two_msg" style="">实时库容</span>
	 													</div>
	 													<div class="basic basic-change" style="float: right" id="b-info" >
	 														<span class="basic-change-img hover" id="bs-info">
																<img src="${ctxstc}/images/map/enlarge.png" height="20px">		 														
	 														</span>
	 													</div>
	 													<div class="b-content ei-content">
	 														<p class="b-brief" style="margin: 0 0 10px"></p>
	 														<div class="col-xs-12" style="height:300px;width: 100%;line-height: 300px;text-align: center;">
	 															<%-- <iframe src="${ctx}/map/current_reservoir_capatity_table"  frameborder="no" width="100%" height="100%" style="float: left;"></iframe> --%>
	 															
	 														</div>
	 														<p></p>
	 													</div>
	 												</div>
	 											</div>
	 										</div>
	 									</div>
	 									<div class="content content-1">
	 										<div class="">
	 											<div class="col-xs-12 content-box" style="border-right: 0px solid #ccc;">
	 												<div class="basic-arrow" >
	 													<div class="basic basic-info" >
	 														<span class="b-info-arrow" style="color: #ff9900;">>>></span>
	 														<span class="b-info-name" id="two_msg" style="">水库水位库容关系</span>
	 													</div>
	 													<div class="basic basic-change" style="float: right" id="b-info" >
	 														<span class="basic-change-img hover" id="bs-info">
																<img src="${ctxstc}/images/map/enlarge.png" height="20px">		 														
	 														</span>
	 													</div>
	 													<div class="b-content ei-content">
	 														<p class="b-brief" style="margin: 0 0 10px"></p>
	 														<div class="col-xs-12" style="height: 200px;width: 100%;line-height: 200px;text-align: center;">
	 															<div id="reservoir_height_capacity_table" style=" margin-left:0px;margin-top:-40px;height: 300px;width:100%"></div>
	 															
	 														</div>
	 														<p></p>
	 													</div>
	 												</div>
	 											</div>
	 										</div>
	 									</div>
				 					</div>
				 					<div class="swiper-slide all-color" style="transform: translate3d(0px, 0px, 0px); transition-duration: 600ms;" >
	 									<div class="content content-1">
	 										<div class="">
	 											<div class="col-xs-12 content-box">
	 												<div class="basic-arrow" >
	 													<div class="basic basic-info" >
	 														<span class="b-info-arrow" style="color: #ff9900;">>>></span>
	 														<span class="b-info-name" id="one_msg" style="">水库信息</span>
	 													</div>
	 													<div class="basic basic-change" style="float: right" id="b-info" >
	 														<span class="basic-change-img hover" id="bs-info">
																<img src="${ctxstc}/images/map/enlarge.png" height="20px">		 														
	 														</span>
	 													</div>
	 													<div class="b-content ei-content">
	 														<p class="b-brief" style="margin: 0 0 10px"></p>
	 														<div class="col-xs-12" style="height: 200px;width: 100%;line-height: 200px;text-align: center;">
	 															<table id="siteWaterMsgText" border="0" cellspacing="50px" style="font-weight:normal;margin-left:30px;line-height: 20px; border-collapse:separate; border-spacing:0px 10px;">
	 																<tr>
	 																	<td>水库名称：</td><td id="deviceReservoirName"></td>
	 																</tr>
	 																<tr>
	 																	<td>水库编码：</td><td id="deviceReservoirCode"></td>
	 																</tr>
	 																<tr>
	 																	<td>建设时间：</td><td id="sriReservoirBuildTime"></td>
	 																</tr>
	 																<tr>
	 																	<td>水库地址：</td><td id="sriReservoirAddr"></td>
	 																</tr>
	 															</table>
	 														</div>
	 														<p></p>
	 													</div>
	 												</div>
	 											</div>
	 										</div>
	 									</div>
	 									<div class="content content-1">
	 										<div class="">
	 											<div class="col-xs-12 content-box">
	 												<div class="basic-arrow" >
	 													<div class="basic basic-info" >
	 														<span class="b-info-arrow" style="color: #ff9900;">>>></span>
	 														<span class="b-info-name" id="two_msg" style="">实时流量</span>
	 													</div>
	 													<div class="basic basic-change" style="float: right" id="b-info" >
	 														<span class="basic-change-img hover" id="bs-info">
																<img src="${ctxstc}/images/map/enlarge.png" height="20px">		 														
	 														</span>
	 													</div>
	 													<div class="b-content ei-content">
	 														<p class="b-brief" style="margin: 0 0 10px"></p>
	 														<div class="col-xs-12" style="height: 200px;width: 100%;line-height: 200px;text-align: center;">
	 															<div id="reservoir_table" style=" margin-left:0px;margin-top:0px;height: 100%;width:100%"></div>
	 														</div>
	 														<p></p>
	 													</div>
	 												</div>
	 											</div>
	 										</div>
	 									</div>
	 									<div class="content content-1">
	 										<div class="">
	 											<div class="col-xs-12 content-box" style="border-right: 0px solid #ccc;">
	 												<div class="basic-arrow" >
	 													<div class="basic basic-info" >
	 														<span class="b-info-arrow" style="color: #ff9900;">>>></span>
	 														<span class="b-info-name" id="two_msg" style="">实时流量</span>
	 													</div>
	 													<div class="basic basic-change" style="float: right" id="b-info" >
	 														<span class="basic-change-img hover" id="bs-info">
																<img src="${ctxstc}/images/map/enlarge.png" height="20px">		 														
	 														</span>
	 													</div>
	 													<div class="b-content ei-content">
	 														<p class="b-brief" style="margin: 0 0 10px"></p>
	 														<div class="col-xs-12" style="height: 200px;width: 100%;line-height: 200px;text-align: center;">
	 															<div id="reservoir_table" style=" margin-left:0px;margin-top:0px;height: 100%;width:100%"></div>
	 														</div>
	 														<p></p>
	 													</div>
	 												</div>
	 											</div>
	 										</div>
	 									</div>
				 					</div>
				 				</div>
				 				<div class="swiper-button-next"></div>
  									<div class="swiper-button-prev"></div>
				 			</div>
		 				</div> 
		    		</div>
		    		
		    		<!--==========水位站信息=============-->
					<div id="righteject_site"  >
						<strong class="rightejecttit_site" ><span></span></strong>
		   				<div class="rightejectcon_site" >
						 	<div style="height: 30px;border-bottom: 1px solid #ff9900;line-height: 30px;">
		 						<span style="padding: 0px 10px;line-height: 25px;">
		 							<img src="${ctxstc}/images/map/position.png" height="20px">
		 						</span>
		 						<span style="padding: 0px 10px;line-height: 25px;">
		 							<span style="color:#fff">当前位置:</span>
		 							<span id="water_site_current_location" style="color:#fff"></span>
		 						</span>
		 						<span style="width: 50px;text-align: center;cursor: pointer;position: absolute;right: 10px">
		 							<img src="${ctxstc}/images/map/x.png" height="20px" onclick="canalWaterMsg()">
		 						</span>
		 					</div>				
		   					<div class="swiper-container detail-swiper swiper-container-horizontal">	
				 				<div class="swiper-wrapper" id="b-siwper-detail" style="height: 300px;transform: translate3d(0px, 0px, 0px); transition-duration: 600ms;" >
				 					<div class="swiper-slide all-color" style="transform: translate3d(0px, 0px, 0px); transition-duration: 600ms;" >
	 									<div class="content content-1">
	 										<div class="">
	 											<div class="col-xs-12 content-box">
	 												<div class="basic-arrow" >
	 													<div class="basic basic-info" >
	 														<span class="b-info-arrow" style="color: #ff9900;">>>></span>
	 														<span class="b-info-name" id="one_msg" style="">水位站信息</span>
	 													</div>
	 													<div class="basic basic-info" style="float: left;margin-left: 400px" >
	 														<span class="b-info-arrow" style="color: #ff9900;">>>></span>
	 														<span class="b-info-name" id="one_msg" style="">实时水位</span>
	 													</div>
	 													<div  class="basic basic-change" style="float: right" id="b-info" >
	 														<span class="basic-change-img hover" id="bs-info">
																<img src="${ctxstc}/images/map/enlarge.png" height="20px">		 														
	 														</span>
	 													</div>
	 													<div class="b-content ei-content">
	 														<p class="b-brief" style="margin: 0 0 10px"></p>
	 														<div class="col-xs-12" style="height:300px;width: 100%;line-height: 300px;text-align: center;">
	 														 <div  style="float: left; width:45%;height:100%;border-right:1px solid #ccc;margin-top:10px;">
		 														<table id="siteWaterMsgText" border="0" cellspacing="50px" style="font-weight:normal;margin-left:30px;line-height: 20px; border-collapse:separate; border-spacing:10px 15px;">
		 																<tr>
		 																	<td style="margin-right:30px;">站点名称：</td><td id="deviceWaterName"></td>
		 																</tr>
		 																<tr>
		 																	<td>站点编码：</td><td id="deviceWaterCode"></td>
		 																</tr>
		 																<tr>
		 																	<td>建站时间：</td><td id="swiBuildTime"></td>
		 																</tr>
		 																<tr>
		 																	<td>站点地址：</td><td id="swiAddr"></td>
		 																</tr>
		 															</table>
		 														</div>
		 														<!-- 动态添加水位站实时水位数据 -->
																<div id="water_iframe" style="float:left;width:55%;height:100%;"></div>
	 														</div>
	 														<p></p>
	 													</div>
	 												</div>
	 											</div>
	 										</div>
	 									</div>
	 									<div class="content content-1">
	 										<div class="">
	 											<div class="col-xs-12 content-box">
	 												<div class="basic-arrow" >
	 													<div class="basic basic-info" >
	 														<span class="b-info-arrow" style="color: #ff9900;">>>></span>
	 														<span class="b-info-name" id="one_msg" style="">实时水量</span>
	 													</div>
	 													<div class="basic basic-info" style="float: left;margin-left: 400px" >
	 														<span class="b-info-arrow" style="color: #ff9900;">>>></span>
	 														<span class="b-info-name" id="one_msg" style="">累积水量</span>
	 													</div>
	 													<div id="flow_detail" data-tipso="点击查看详细信息" class="basic basic-change" style="float: right" id="b-info" >
	 														<span class="basic-change-img hover" id="bs-info">
																<img src="${ctxstc}/images/map/enlarge.png" height="20px">		 														
	 														</span>
	 													</div>
	 													<div class="b-content ei-content" style="width: 950px;">
	 														<p class="b-brief" style="margin: 0 0 10px"></p>
	 														<div class="col-xs-12" style="height: 300px;width: 100%;line-height: 300px;text-align: center;">
	 														<!-- 动态添加实时流量和累计流量模块 -->
	 														<div id="flow_iframe" style="float:left;width:46%;height:100%;"></div>
	 														
	 														<div id="addFlow_iframe" style="float:left;width:54%;height:100%;"></div>
	 														
	 														</div>
	 														<p></p>
	 													</div>
	 												</div>
	 											</div>
	 										</div>
	 									</div>
				 					</div>
				 					<div class="swiper-slide all-color" style="transform: translate3d(0px, 0px, 0px); transition-duration: 600ms;" >
	 									<div class="content content-1">
	 										<div class="">
	 											<div class="col-xs-12 content-box">
	 												<div class="basic-arrow" >
	 													<div class="basic basic-info" >
	 														<span class="b-info-arrow" style="color: #ff9900;">>>></span>
	 														<span class="b-info-name" id="one_msg" style="">水位站信息</span>
	 													</div>
	 													<div class="basic basic-change" style="float: right" id="b-info" >
	 														<span class="basic-change-img hover" id="bs-info">
																<img src="${ctxstc}/images/map/enlarge.png" height="20px">		 														
	 														</span>
	 													</div>
	 													<div class="b-content ei-content">
	 														<p class="b-brief" style="margin: 0 0 10px"></p>
	 														<div class="col-xs-12" style="height: 200px;width: 100%;line-height: 200px;text-align: center;">
	 															<table id="siteWaterMsgText" border="0" cellspacing="50px" style="font-weight:normal;margin-left:30px;line-height: 20px; border-collapse:separate; border-spacing:0px 10px;">
	 																<tr>
	 																	<td>站点名称：</td><td id="deviceWaterName_two"></td>
	 																</tr>
	 																<tr>
	 																	<td>站点编码：</td><td id="deviceWaterCode_two"></td>
	 																</tr>
	 																<tr>
	 																	<td>建站时间：</td><td id="swiBuildTime_two"></td>
	 																</tr>
	 																<tr>
	 																	<td>站点地址：</td><td id="swiAddr_two"></td>
	 																</tr>
	 															</table>
	 														</div>
	 														<p></p>
	 													</div>
	 												</div>
	 											</div>
	 										</div>
	 									</div>
	 									<div class="content content-1">
	 										<div class="">
	 											<div class="col-xs-12 content-box">
	 												<div class="basic-arrow" >
	 													<div class="basic basic-info" >
	 														<span class="b-info-arrow" style="color: #ff9900;">>>></span>
	 														<span class="b-info-name" id="two_msg" style="">实时监控</span>
	 													</div>
	 													<div class="basic basic-change" style="float: right" id="b-info" >
	 														<span class="basic-change-img hover" id="bs-info">
																<img src="${ctxstc}/images/map/enlarge.png" height="20px">		 														
	 														</span>
	 													</div>
	 													<div class="b-content ei-content">
	 														<p class="b-brief" style="margin: 0 0 10px"></p>
	 														<div class="col-xs-12" style="height: 200px;">
	 														
	 															<!-- <div style="float: left; ">
																	<video id="myPlayer" poster="" controls playsInline webkit-playsinline autoplay>
																	    <source src="rtmp://rtmp.open.ys7.com/openlive/5751be60123c4ba39b59b80f4bb6c6e7" type="" />
																	    <source src="http://hls.open.ys7.com/openlive/5751be60123c4ba39b59b80f4bb6c6e7.m3u8" type="application/x-mpegURL" />
																	</video>
																</div> -->
																
																<!-- <div >
																	<video id="myPlayer2" poster="" controls playsInline webkit-playsinline autoplay >
																	    <source src="rtmp://rtmp.open.ys7.com/openlive/29dc8da8a2c145ac926b626810d2c41a" type="" />
																	    <source src="http://hls.open.ys7.com/openlive/29dc8da8a2c145ac926b626810d2c41a.m3u8" type="application/x-mpegURL" />
																	</video>
																</div> -->
																<div id="playercontainer1" style="float:right;"></div>
																<div style="float:right; margin-top: -200px;margin-right: -10px">
																	<legend style="color:#F8F8FF;">云台控制</legend>
																			<div>
																					<input type="button" id="ZuoShang" class="btn" value="左上" onmousedown="mouseDownPTZControl(4,accesstoken,equipmentSequence,deviceChannelNumber);" onmouseup="mouseUpPTZControl(4,accesstoken,equipmentSequence,deviceChannelNumber);" />
																					<input type="button" class="btn" value="上" onmousedown="mouseDownPTZControl(0,accesstoken,equipmentSequence,deviceChannelNumber);" onmouseup="mouseUpPTZControl(0,accesstoken,equipmentSequence,deviceChannelNumber);" />
																					<input type="button" class="btn" value="右上" onmousedown="mouseDownPTZControl(6,accesstoken,equipmentSequence,deviceChannelNumber);" onmouseup="mouseUpPTZControl(6,accesstoken,equipmentSequence,deviceChannelNumber);" />		
																			</div>
																			<div>
																					<input type="button" class="btn" value="左" onmousedown="mouseDownPTZControl(2,accesstoken,equipmentSequence,deviceChannelNumber);" onmouseup="mouseUpPTZControl(2,accesstoken,equipmentSequence,deviceChannelNumber);" />&nbsp;&nbsp;
																					<input type="button" class="btn" value="自动" onclick="mouseDownPTZControl(9,accesstoken,equipmentSequence,deviceChannelNumber);"  onmouseup="mouseUpPTZControl(9,accesstoken,equipmentSequence,deviceChannelNumber);"/>&nbsp;&nbsp;
																					<input type="button" class="btn" value="右" onmousedown="mouseDownPTZControl(3,accesstoken,equipmentSequence,deviceChannelNumber);" onmouseup="mouseUpPTZControl(3,accesstoken,equipmentSequence,deviceChannelNumber);" />
																				
																			</div>
																			<div>
																					<input type="button" class="btn" value="左下" onmousedown="mouseDownPTZControl(5,accesstoken,equipmentSequence,deviceChannelNumber);" onmouseup="mouseUpPTZControl(5,accesstoken,equipmentSequence,deviceChannelNumber);" />
																					<input type="button" class="btn" value="下" onmousedown="mouseDownPTZControl(1,accesstoken,equipmentSequence,deviceChannelNumber);" onmouseup="mouseUpPTZControl(1,accesstoken,equipmentSequence,deviceChannelNumber);" />
																					<input type="button" class="btn" value="右下" onmousedown="mouseDownPTZControl(7,accesstoken,equipmentSequence,deviceChannelNumber);" onmouseup="mouseUpPTZControl(7,accesstoken,equipmentSequence,deviceChannelNumber);" />
																			</div>
																			<div>
																					&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<input type="button" class="btn" value="近" onmousedown="mouseDownPTZControl(8,accesstoken,equipmentSequence,deviceChannelNumber);" onmouseup="mouseUpPTZControl(8,accesstoken,equipmentSequence,deviceChannelNumber);" />&nbsp;&nbsp;&nbsp;
																					<input type="button" class="btn" value="远" onmousedown="mouseDownPTZControl(9,accesstoken,equipmentSequence,deviceChannelNumber);" onmouseup="mouseUpPTZControl(9,accesstoken,equipmentSequence,deviceChannelNumber);" />
																			</div>
																   
																</div>
	 														</div>
	 														<p></p>
	 													</div>
	 												</div>
	 											</div>
	 										</div>
	 									</div>
	 									<div class="content content-1">
	 										<div class="">
	 											<div class="col-xs-12 content-box" style="border-right: 0px solid #ccc;">
	 												<div class="basic-arrow" >
	 													<div class="basic basic-info" >
	 														<span class="b-info-arrow" style="color: #ff9900;">>>></span>
	 														<span class="b-info-name" id="two_msg" style="">实时流量</span>
	 													</div>
	 													<div class="basic basic-change" style="float: right" id="b-info" >
	 														<span class="basic-change-img hover" id="bs-info">
																<img src="${ctxstc}/images/map/enlarge.png" height="20px">		 														
	 														</span>
	 													</div>
	 													<div class="b-content ei-content">
	 														<p class="b-brief" style="margin: 0 0 10px"></p>
	 														<div class="col-xs-12" style="height: 200px;width: 100%;line-height: 200px;text-align: center;">
	 															<div id="reservoir_table" style=" margin-left:0px;margin-top:0px;height: 100%;width:100%"></div>
	 														</div>
	 														<p></p>
	 													</div>
	 												</div>
	 											</div>
	 										</div>
	 									</div>
				 					</div>
				 				</div>
				 				<div class="swiper-button-next"></div>
  									<div class="swiper-button-prev"></div>
				 			</div>
		 				</div> 
		    		</div>
		    		<!--==================================================================闸门站信息==================================================================-->
					<div id="righteject_sluice_site"  >
						<strong class="rightejecttit_sluice_site" ><span></span></strong>
		   				<div class="rightejectcon_sluice_site" >
						 	<div style="height: 30px;border-bottom: 1px solid #ff9900;line-height: 30px;">
		 						<span style="padding: 0px 10px;line-height: 25px;">
		 							<img src="${ctxstc}/images/map/position.png" height="20px">
		 						</span>
		 						<span style="padding: 0px 10px;line-height: 25px;">
		 							<span style="color:#fff">当前位置:</span>
		 							<span id="sluice_site_current_location" style="color:#fff"></span>
		 						</span>
		 						<span style="width: 50px;text-align: center;cursor: pointer;position: absolute;right: 10px">
		 							<img src="${ctxstc}/images/map/x.png" height="20px" onclick="canalSluiceMsg()">
		 						</span>
		 					</div>				
		   					<div class="swiper-container detail-swiper swiper-container-horizontal">	
				 				<div class="swiper-wrapper" id="b-siwper-detail" style="height: 300px;transform: translate3d(0px, 0px, 0px); transition-duration: 600ms;" >
				 					<div class="swiper-slide all-color" style="transform: translate3d(0px, 0px, 0px); transition-duration: 600ms;" >
	 									<div class="content content-1">
	 										<div class="">
	 											<div class="col-xs-12 content-box">
	 												<div class="basic-arrow" >
	 													<div class="basic basic-info" >
	 														<span class="b-info-arrow" style="color: #ff9900;">>>></span>
	 														<span class="b-info-name" id="one_msg" style="">闸门开度</span>
	 													</div>
	 													<div class="basic basic-info" style="float: left;margin-left: 400px" >
	 														<span class="b-info-arrow" style="color: #ff9900;">>>></span>
	 														<span class="b-info-name" id="one_msg" style="">实时水位</span>
	 													</div>
	 													<div  class="basic basic-change" style="float: right" id="b-info" >
	 														<span class="basic-change-img hover" id="bs-info">
																<img src="${ctxstc}/images/map/enlarge.png" height="20px">		 														
	 														</span>
	 													</div>
	 													<div class="b-content ei-content">
	 														<p class="b-brief" style="margin: 0 0 10px"></p>
	 														<div class="col-xs-12" style="height:300px;width: 100%;line-height: 300px;text-align: center;">
	 														 <div  style="float: left; width:50%;height:100%;border-right:1px solid #ccc;margin-top:10px;">
		 														<table id="siteWaterMsgText" border="0" cellspacing="10px" style="font-weight:normal;margin-left:30px;line-height:0px; border-collapse:separate; border-spacing:40px 20px;">
		 																<tr>
		 																	<td style="margin-right:15px;">闸门名称</td>
		 																	<td style="margin-right:15px;">闸门开度(cm)</td>
		 																	<td>闸门荷重(t)</td>
		 																</tr>
		 																<tr v-if="sulices.sluiceHeight1!=null&&sulices.sluiceHeight1!=0">
		 																	<td>1号闸门</td>
		 																	<td>{{sulices.sluiceHeight1/10}}</td>
		 																	<td>{{sulices.gateLoad1}}</td>
		 																</tr>
		 																<tr v-if="sulices.sluiceHeight2!=null&&sulices.sluiceHeight2!=0">
		 																	<td>2号闸门</td>
		 																	<td>{{sulices.sluiceHeight2/10}}</td>
		 																	<td>{{sulices.gateLoad2}}</td>
		 																</tr>
		 																<tr v-if="sulices.sluiceHeight3!=null&&sulices.sluiceHeight3!=0">
		 																	<td>3号闸门</td>
		 																	<td>{{sulices.sluiceHeight3/10}}</td>
		 																	<td>{{sulices.gateLoad3}}</td>
		 																</tr>
		 																<tr v-if="sulices.sluiceHeight4!=null&&sulices.sluiceHeight4!=0">
		 																	<td>4号闸门</td>
		 																	<td>{{sulices.sluiceHeight4/10}}</td>
		 																	<td>{{sulices.gateLoad4}}</td>
		 																</tr>
		 																<tr v-if="sulices.sluiceHeight5!=null&&sulices.sluiceHeight5!=0">
		 																	<td>5号闸门</td>
		 																	<td>{{sulices.sluiceHeight5/10}}</td>
		 																	<td>{{sulices.gateLoad5}}</td>
		 																</tr>
		 																<tr v-if="sulices.sluiceHeight6!=null&&sulices.sluiceHeight6!=0">
		 																	<td>6号闸门</td>
		 																	<td>{{sulices.sluiceHeight6/10}}</td>
		 																	<td>{{sulices.gateLoad6}}</td>
		 																</tr>
		 															</table>
		 														</div>
	 															 <%--  <iframe src="${ctx}/map/current_sulice_water_table"  frameborder="no" width="50%" height="100%" style="float: left;"></iframe>  --%>
	 														</div>
	 														<p></p>
	 													</div>
	 												</div>
	 											</div>
	 										</div>
	 									</div>
	 									<div class="content content-1">
	 										<div class="">
	 											<div class="col-xs-12 content-box">
	 												<div class="basic-arrow" >
	 													<div class="basic basic-info" >
	 														<span class="b-info-arrow" style="color: #ff9900;">>>></span>
	 														<span class="b-info-name" id="one_msg" style="">实时流量</span>
	 													</div>
	 													<div class="basic basic-info" style="float: left;margin-left: 400px" >
	 														<span class="b-info-arrow" style="color: #ff9900;">>>></span>
	 														<span class="b-info-name" id="one_msg" style="">累积流量</span>
	 													</div>
	 													<div id="flow_detail" data-tipso="点击查看详细信息" class="basic basic-change" style="float: right" id="b-info" >
	 														<span class="basic-change-img hover" id="bs-info">
																<img src="${ctxstc}/images/map/enlarge.png" height="20px">		 														
	 														</span>
	 													</div>
	 													<div class="b-content ei-content">
	 														<p class="b-brief" style="margin: 0 0 10px"></p>
	 														<div class="col-xs-12" style="height: 300px;width: 100%;line-height: 300px;text-align: center;">
	 															<%-- <iframe src="${ctx}/map/current_sulice_flow_table"  frameborder="no" width="50%" height="100%" style="float: left;border-right:solid 0.5px #FFFFFF;"></iframe> 
	 															<iframe src="${ctx}/map/current_sulice_totle_flow_table"  frameborder="no" width="50%" height="100%" style="float: left;"></iframe> --%>
	 														</div>
	 														<p></p>
	 													</div>
	 												</div>
	 											</div>
	 										</div>
	 									</div>
				 					</div>
				 					<div class="swiper-slide all-color" style="transform: translate3d(0px, 0px, 0px); transition-duration: 600ms;" >
	 									<div class="content content-1">
	 										<div class="">
	 											<div class="col-xs-12 content-box">
	 												<div class="basic-arrow" >
	 													<div class="basic basic-info" >
	 														<span class="b-info-arrow" style="color: #ff9900;">>>></span>
	 														<span class="b-info-name" id="one_msg" style="">水位站信息</span>
	 													</div>
	 													<div class="basic basic-change" style="float: right" id="b-info" >
	 														<span class="basic-change-img hover" id="bs-info">
																<img src="${ctxstc}/images/map/enlarge.png" height="20px">		 														
	 														</span>
	 													</div>
	 													<div class="b-content ei-content">
	 														<p class="b-brief" style="margin: 0 0 10px"></p>
	 														<div class="col-xs-12" style="height: 200px;width: 100%;line-height: 200px;text-align: center;">
	 															<table id="siteWaterMsgText" border="0" cellspacing="50px" style="font-weight:normal;margin-left:30px;line-height: 20px; border-collapse:separate; border-spacing:0px 10px;">
	 																<tr>
	 																	<td>站点名称：</td><td id="deviceWaterName"></td>
	 																</tr>
	 																<tr>
	 																	<td>站点编码：</td><td id="deviceWaterCode"></td>
	 																</tr>
	 																<tr>
	 																	<td>建站时间：</td><td id="swiBuildTime"></td>
	 																</tr>
	 																<tr>
	 																	<td>站点地址：</td><td id="swiAddr"></td>
	 																</tr>
	 															</table>
	 														</div>
	 														<p></p>
	 													</div>
	 												</div>
	 											</div>
	 										</div>
	 									</div>
	 									<div class="content content-1">
	 										<div class="">
	 											<div class="col-xs-12 content-box">
	 												<div class="basic-arrow" >
	 													<div class="basic basic-info" >
	 														<span class="b-info-arrow" style="color: #ff9900;">>>></span>
	 														<span class="b-info-name" id="two_msg" style="">实时流量</span>
	 													</div>
	 													<div class="basic basic-change" style="float: right" id="b-info" >
	 														<span class="basic-change-img hover" id="bs-info">
																<img src="${ctxstc}/images/map/enlarge.png" height="20px">		 														
	 														</span>
	 													</div>
	 													<div class="b-content ei-content">
	 														<p class="b-brief" style="margin: 0 0 10px"></p>
	 														<div class="col-xs-12" style="height: 200px;width: 100%;line-height: 200px;text-align: center;">
	 														
	 															<!-- <div style="float: left; ">
																	<video id="myPlayer" poster="" controls playsInline webkit-playsinline autoplay>
																	    <source src="rtmp://rtmp.open.ys7.com/openlive/5751be60123c4ba39b59b80f4bb6c6e7" type="" />
																	    <source src="http://hls.open.ys7.com/openlive/5751be60123c4ba39b59b80f4bb6c6e7.m3u8" type="application/x-mpegURL" />
																	</video>
																</div> -->
																
																<div >
																	<video id="myPlayer2" poster="" controls playsInline webkit-playsinline autoplay >
																	    <source src="rtmp://rtmp.open.ys7.com/openlive/29dc8da8a2c145ac926b626810d2c41a" type="" />
																	    <source src="http://hls.open.ys7.com/openlive/29dc8da8a2c145ac926b626810d2c41a.m3u8" type="application/x-mpegURL" />
																	</video>
																</div>
	 														</div>
	 														<p></p>
	 													</div>
	 												</div>
	 											</div>
	 										</div>
	 									</div>
	 									<div class="content content-1">
	 										<div class="">
	 											<div class="col-xs-12 content-box" style="border-right: 0px solid #ccc;">
	 												<div class="basic-arrow" >
	 													<div class="basic basic-info" >
	 														<span class="b-info-arrow" style="color: #ff9900;">>>></span>
	 														<span class="b-info-name" id="two_msg" style="">实时流量</span>
	 													</div>
	 													<div class="basic basic-change" style="float: right" id="b-info" >
	 														<span class="basic-change-img hover" id="bs-info">
																<img src="${ctxstc}/images/map/enlarge.png" height="20px">		 														
	 														</span>
	 													</div>
	 													<div class="b-content ei-content">
	 														<p class="b-brief" style="margin: 0 0 10px"></p>
	 														<div class="col-xs-12" style="height: 200px;width: 100%;line-height: 200px;text-align: center;">
	 															<div id="reservoir_table" style=" margin-left:0px;margin-top:0px;height: 100%;width:100%"></div>
	 														</div>
	 														<p></p>
	 													</div>
	 												</div>
	 											</div>
	 										</div>
	 									</div>
				 					</div>
				 				</div>
				 				<div class="swiper-button-next"></div>
  									<div class="swiper-button-prev"></div>
				 			</div>
		 				</div> 
		    		</div>
		    		<!--=========水厂信息 ============= -->
		    		 <div id="righteject_site_site"  >
						<strong class="rightejecttit_site_site" ><span></span></strong>
		   				<div class="rightejectcon_site_site" >
						 	<div style="height: 30px;border-bottom: 1px solid #ff9900;line-height: 30px;">
		 						<span style="padding: 0px 10px;line-height: 25px;">
		 							<img src="${ctxstc}/images/map/position.png" height="20px">
		 						</span>
		 						<span style="padding: 0px 10px;line-height: 25px;">
		 							<span style="color:#fff">当前位置:</span>
		 							<span id="water_site" style="color:#fff"></span>
		 						</span>
		 						<span style="width: 50px;text-align: center;cursor: pointer;position: absolute;right: 10px">
		 							<img src="${ctxstc}/images/map/x.png" height="20px" onclick="siteWaterMsg()">
		 						</span>
		 					</div>				
		   					<div class="swiper-container detail-swiper swiper-container-horizontal">	
				 				<div class="swiper-wrapper" id="b-siwper-detail" style="height: 300px;transform: translate3d(0px, 0px, 0px); transition-duration: 600ms;" >
				 					<div class="swiper-slide all-color" style="transform: translate3d(0px, 0px, 0px); transition-duration: 600ms;" >
	 									<div class="content content-1">
	 										<div class="">
	 											<div class="col-xs-12 content-box">
	 												<div class="basic-arrow" >
	 													<div class="basic basic-info" >
	 														<span class="b-info-arrow" style="color: #ff9900;">>>></span>
	 														<span class="b-info-name" id="one_msg" style="">设备信息</span>
	 													</div>
	 													<div class="basic basic-info" style="float: left;margin-left: 400px" >
	 														<span class="b-info-arrow" style="color: #ff9900;">>>></span>
	 														<span class="b-info-name" id="one_msg" style="">流量信息</span>
	 													</div>
	 													<div  class="basic basic-change" style="float: right" id="b-info" >
	 														<span class="basic-change-img hover" id="bs-info">
																<img src="${ctxstc}/images/map/enlarge.png" height="20px">		 														
	 														</span>
	 													</div>
	 													<div class="b-content ei-content">
	 														<p class="b-brief" style="margin: 0 0 10px"></p>
	 														<div class="col-xs-12" style="height:300px;width: 100%;line-height: 300px;text-align: center;">
	 															 <%--  <iframe src="${ctx}/map/current_water_height_table" name="current_water_height_table" frameborder="no" width="50%" height="100%" style="float: left;"></iframe>
	 															
	 															 <iframe src="${ctx}/map/current_water_surface_height_table"  frameborder="no" width="50%" height="100%" style="float: left;"></iframe>     --%>
	 															 
	 															
	 															 <div style="width:50%; height:100%;float:left; border-right: solid 1px #ffffff">
	 															 	<table id="siteWaterMsgText" border="0" cellspacing="50px" style="font-weight:normal;margin-left:30px;line-height: 20px; border-collapse:separate; border-spacing:0px 10px;">
		 																<tr>
		 																	<td>水厂名称：</td><td id="deviceWaterName">海潮坝水厂</td>
		 																</tr>
		 																<tr>
		 																	<td>水厂编码：</td><td id="deviceWaterCode">622256325</td>
		 																</tr>
		 																<tr>
		 																	<td>建站时间：</td><td id="swiBuildTime">1996年11月</td>
		 																</tr>
		 																<tr>
		 																	<td>站点地址：</td><td id="swiAddr">甘肃省张掖市民乐县顺化乡窑沟村</td>
		 																</tr>
	 																</table>
	 															
	 															 </div>
	 															  <!-- </div style="width:50%; height:100%;float:left;">
	 															 
	 															 <div> -->
	 															 		<%-- <iframe src="${ctx}/map/water_surface_height_table"  frameborder="no" width="50%" height="100%" style="float: left;"></iframe>     --%>
	 															 
	 														</div>
	 														<p></p>
	 													</div>
	 												</div>
	 											</div>
	 										</div>
	 									</div>
	 									<div class="content content-1">
	 										<div class="">
	 											<div class="col-xs-12 content-box">
	 												<div class="basic-arrow" >
	 													<div class="basic basic-info" >
	 														<span class="b-info-arrow" style="color: #ff9900;">>>></span>
	 														<span class="b-info-name" id="one_msg" style="">液位信息</span>
	 													</div>
	 													<div class="basic basic-info" style="float: left;margin-left: 400px" >
	 														<span class="b-info-arrow" style="color: #ff9900;">>>></span>
	 														<span class="b-info-name" id="one_msg" style="">压力信息</span>
	 													</div>
	 													<div id="flow_detail" data-tipso="点击查看详细信息" class="basic basic-change" style="float: right" id="b-info" >
	 														<span class="basic-change-img hover" id="bs-info">
																<img src="${ctxstc}/images/map/enlarge.png" height="20px">		 														
	 														</span>
	 													</div>
	 													<div class="b-content ei-content">
	 														<p class="b-brief" style="margin: 0 0 10px"></p>
	 														<div class="col-xs-12" style="height: 300px;width: 100%;line-height: 300px;text-align: center;">
	 														 	<%--   <iframe src="${ctx}/map/water_flow_table"  frameborder="no" width="50%" height="100%" style="float: left;"></iframe> 
	 															<!-- 实时雨情折线图 -->
																
	 															<iframe src="${ctx}/map/water_pressure_height_table"  frameborder="no" width="50%" height="100%" style="float: left;"></iframe>    --%>
	 														 
	 														 </div>
	 														<p></p>
	 													</div>
	 												</div>
	 											</div>
	 										</div>
	 									</div>
				 					</div>
				 				</div>
				 			<div class="swiper-button-next"></div>
  							<div class="swiper-button-prev"></div>
		 				</div> 
		    		</div> 
		    		
					<!--=========水厂支点信息 ============= -->
		    		<%--  <div id="righteject_pivot">
						<strong class="righteje_site_site"><span></span></strong>
		   				<div class="rightejec_site_site">
						 	<div style="height: 30px;border-bottom: 1px solid #ff9900;line-height: 30px;">
		 						<span style="padding: 0px 10px;line-height: 25px;">
		 							<img src="${ctxstc}/images/map/position.png" height="20px">
		 						</span>
		 						<span style="padding: 0px 10px;line-height: 25px;">
		 							<span style="color:#fff">当前位置:</span>
		 							<span id="water_pivot" style="color:#fff"></span>
		 						</span>
		 						<span style="width: 50px;text-align: center;cursor: pointer;position: absolute;right: 10px">
		 							<img src="${ctxstc}/images/map/x.png" height="20px" onclick="siteWaterPivot()">
		 						</span>
		 					</div>				
		   					<div class="swiper-container detail-swiper swiper-container-horizontal">	
				 				<div class="swiper-wrapper" id="b-siwper-detail" style="height: 300px;transform: translate3d(0px, 0px, 0px); transition-duration: 600ms;" >
				 					<div class="swiper-slide all-color" style="transform: translate3d(0px, 0px, 0px); transition-duration: 600ms;" >
	 									<div class="content content-1">
	 										<div class="">
	 											<div class="col-xs-12 content-box">
	 												<div class="basic-arrow" >
	 													<div class="basic basic-info" >
	 														<span class="b-info-arrow" style="color: #ff9900;">>>></span>
	 														<span class="b-info-name" id="one_msg" style="">设备信息</span>
	 													</div>
	 													<div class="basic basic-info" style="float: left;margin-left: 400px" >
	 														<span class="b-info-arrow" style="color: #ff9900;">>>></span>
	 														<span class="b-info-name" id="one_msg" style="">流量信息</span>
	 													</div>
	 													<div  class="basic basic-change" style="float: right" id="b-info" >
	 														<span class="basic-change-img hover" id="bs-info">
																<img src="${ctxstc}/images/map/enlarge.png" height="20px">		 														
	 														</span>
	 													</div>
	 													<div class="b-content ei-content">
	 														<p class="b-brief" style="margin: 0 0 10px"></p>
	 														<div class="col-xs-12" style="height:300px;width: 100%;line-height: 300px;text-align: center;">
	 															  <iframe src="${ctx}/map/current_water_height_table" name="current_water_height_table" frameborder="no" width="50%" height="100%" style="float: left;"></iframe>
	 															
	 															 <iframe src="${ctx}/map/current_water_surface_height_table"  frameborder="no" width="50%" height="100%" style="float: left;"></iframe>    
	 															 
	 															
	 															 <div style="width:50%; height:100%;float:left; border-right: solid 1px #ffffff">
	 															 	<table id="siteWaterMsgText" border="0" cellspacing="50px" style="font-weight:normal;margin-left:30px;line-height: 20px; border-collapse:separate; border-spacing:0px 10px;">
		 																<tr>
		 																	<td>减压井名称：</td><td id="deviceWaterName">友爱减压井</td>
		 																</tr>
		 																<tr>
		 																	<td>水厂编码：</td><td id="deviceWaterCode">54298122154</td>
		 																</tr>
		 																<tr>
		 																	<td>建站时间：</td><td id="swiBuildTime">2000年5月</td>
		 																</tr>
		 																<tr>
		 																	<td>站点地址：</td><td id="swiAddr">甘肃省张掖市民乐县友爱村</td>
		 																</tr>
	 																</table>
	 															
	 															 </div>
	 															  <!-- </div style="width:50%; height:100%;float:left;">
	 															 
	 															 <div> -->
	 															 		<iframe src="${ctx}/map/water_surface_height_table"  frameborder="no" width="50%" height="100%" style="float: left;"></iframe>    
	 															 
	 														</div>
	 														<p></p>
	 													</div>
	 												</div>
	 											</div>
	 										</div>
	 									</div>
	 									<div class="content content-1">
	 										<div class="">
	 											<div class="col-xs-12 content-box">
	 												<div class="basic-arrow" >
	 													<div class="basic basic-info" >
	 														<span class="b-info-arrow" style="color: #ff9900;">>>></span>
	 														<span class="b-info-name" id="one_msg" style="">液位信息</span>
	 													</div>
	 													<div class="basic basic-info" style="float: left;margin-left: 400px" >
	 														<span class="b-info-arrow" style="color: #ff9900;">>>></span>
	 														<span class="b-info-name" id="one_msg" style="">压力信息</span>
	 													</div>
	 													<div id="flow_detail" data-tipso="点击查看详细信息" class="basic basic-change" style="float: right" id="b-info" >
	 														<span class="basic-change-img hover" id="bs-info">
																<img src="${ctxstc}/images/map/enlarge.png" height="20px">		 														
	 														</span>
	 													</div>
	 													<div class="b-content ei-content">
	 														<p class="b-brief" style="margin: 0 0 10px"></p>
	 														<div class="col-xs-12" style="height: 300px;width: 100%;line-height: 300px;text-align: center;">
	 														 	  <iframe src="${ctx}/map/water_flow_table"  frameborder="no" width="50%" height="100%" style="float: left;"></iframe> 
	 															<!-- 实时雨情折线图 -->
																
	 															<iframe src="${ctx}/map/water_pressure_height_table"  frameborder="no" width="50%" height="100%" style="float: left;"></iframe>   
	 														 
	 														 </div>
	 														<p></p>
	 													</div>
	 												</div>
	 											</div>
	 										</div>
	 									</div>
				 					</div>
				 				</div>
				 				<div class="swiper-button-next"></div>
  								<div class="swiper-button-prev"></div> 
				 			</div>
		 				</div> 
		    		</div> --%>
					
				</div>
	         </div>
           </div>
   	     </div>
   	   </div>
     </section>   
  </div>
</div>

<!--弹窗添加或修改内容必备的代码-->
<script src="${ctxstc}/js/footer.js"></script>
<script src="${ctxstc}/jsp/baiDuMap.jsp"></script>
<script src="${ctxstc}/js/custom/map_menu.jsp"></script>
<script src="${ctxstc}/js/custom/water_area_cook.js"></script>

<script type="text/javascript" src="http://echarts.baidu.com/gallery/vendors/echarts/echarts.min.js"></script>
<script type="text/javascript" src="http://echarts.baidu.com/gallery/vendors/echarts-gl/echarts-gl.min.js"></script>
<script type="text/javascript" src="http://echarts.baidu.com/gallery/vendors/echarts-stat/ecStat.min.js"></script>
<script type="text/javascript" src="http://echarts.baidu.com/gallery/vendors/echarts/extension/dataTool.min.js"></script>
<script type="text/javascript" src="http://echarts.baidu.com/gallery/vendors/echarts/map/js/china.js"></script>
<script type="text/javascript" src="http://echarts.baidu.com/gallery/vendors/echarts/map/js/world.js"></script>
<script type="text/javascript" src="http://api.map.baidu.com/api?v=3.0&ak=BqBbhtroCdoQtxOj1yxrr8NPvPlkMKst"></script>
<script type="text/javascript" src="http://echarts.baidu.com/gallery/vendors/echarts/extension/bmap.min.js"></script>
<script type="text/javascript" src="http://echarts.baidu.com/gallery/vendors/simplex.js"></script>
<script type="text/javascript" src="${ctxstc}/jsp/table2.jsp"></script>

<script type="text/javascript" src="${ctxstc}/jsp/current_water_height_table.jsp"></script>
<script type="text/javascript" src="${ctxstc}/jsp/current_water_surface_height_table.jsp"></script> 

<script type="text/javascript" src="${ctxstc}/jsp/site_water/map_site_water.jsp"></script>
<script type="text/javascript" src="${ctxstc}/js/map/jzMap3D.js"></script>
<script type="text/javascript" src="${ctxstc}/js/map/map_baidu_water.js"></script>

<script type="text/javascript" src="${ctxstc}/js/map/map_baidu_menu.js"></script>

<script type="text/javascript" src="${ctxstc}/swiper/js/swiper.js"></script>
<script type="text/javascript" src="${ctxstc}/swiper/js/swiper.min.js"></script>
<script type="text/javascript" src="${ctxstc}/js/map/map_rain_monitor.js"></script>
<!-- tips -->
<script type="text/javascript" src="${ctxstc}/adapters/tips/js/tipso.min.js"></script>

<script type="text/javascript" src="http://echarts.baidu.com/gallery/vendors/echarts/echarts.min.js"></script>
<script type="text/javascript" src="http://echarts.baidu.com/gallery/vendors/echarts-gl/echarts-gl.min.js"></script>
<script type="text/javascript" src="http://echarts.baidu.com/gallery/vendors/echarts-stat/ecStat.min.js"></script>
<script type="text/javascript" src="http://echarts.baidu.com/gallery/vendors/echarts/extension/dataTool.min.js"></script>
<script type="text/javascript" src="http://echarts.baidu.com/gallery/vendors/echarts/map/js/china.js"></script>
<script type="text/javascript" src="http://echarts.baidu.com/gallery/vendors/echarts/map/js/world.js"></script>
<script type="text/javascript" src="http://api.map.baidu.com/api?v=3.0&ak=BqBbhtroCdoQtxOj1yxrr8NPvPlkMKst"></script>
<script type="text/javascript" src="http://echarts.baidu.com/gallery/vendors/echarts/extension/bmap.min.js"></script>
<script type="text/javascript" src="http://echarts.baidu.com/gallery/vendors/simplex.js"></script>


<script type="text/javascript" src="${ctxstc}/js/codebase/webVideoCtrl.js"></script>
 <script type="text/javascript" src="${ctxstc}/js/demo123.js"></script> 

<script>
function mapSwitch(type){
	//1:google地图  2：百度地图
/* 	if(type=="1"){
		window.location.href="http://localhost:8080/surface_water/map/bai_map?state=11";
	} */
}
  var accesstoken="";
  var equipmentSequence="";
  var deviceChannelNumber="";
function getPlayer(id){
	//alert(id);
	$.ajax({
		url:"${ctx}/video/getSiteVideoInfoByCalCanalInfoId",
		type: "post",
		data: {id:id},
		async: false,//非异步
		success: function(msg){
			//alert(JSON.stringify(msg));
			accesstoken=msg.accesstoken;
			equipmentSequence=msg.equipmentSequence;
			deviceChannelNumber = msg.deviceChannelNumber;
			var player = cyberplayer("playercontainer1").setup({
			    width: 380,
			    height: 220,
			    autostart: true,
			    stretching: "uniform",
			    volume: 100,
			    controls: true,
			    playlist: [
			        {
			            sources: [
			                {			//http://hls.open.ys7.com/openlive/4438fe77f6b94cf6a3ecd819663e1c42.m3u8
			                    file: msg.ezopenHdLive, // 资源1 支持mp4, hls, flv等常用视频格式
			                    label: "高清" // 标签
			                },
			                {
			                    file: msg.ezopenLive, // 资源2 必须与资源1格式和时长一致！
			                    label: "标清"
			                }
			            ]
			        }
			    ],
			    ak: "1d075bbb10254a489cc3298cdddda527" // 公有云平台注册即可获得accessKey
			});
		}
	});
	
	//alert(accesstoken);

}


//--------------2018-5-4 liyue   操控云台--------------------
 //请求云台控制(云台控制需要传到后台的参数，基本的上、下、左、右--iPTZIndex，设备通道号，设备序列号，accessToken)
   function ajaxConsole(iPTZIndex,accesstoken,equipmentSequence,deviceChannelNumber){
	  // alert(deviceChannelNumber);
   	$.ajax({
			//url:"${ctx}/holder/Console?direction="+iPTZIndex+"&accessToken="+accesstoken,
			url:"${ctx}/holder/Console",
			data: {direction:iPTZIndex,accessToken:accesstoken,deviceSerial:equipmentSequence,channelNo:deviceChannelNumber},
			type: "post",
			async: false,//非异步
			success: function(msg){
				//alert(JSON.stringify(msg));
			}
		}); 
   }
   //操作云台
    function mouseDownPTZControl(iPTZIndex,accesstoken,equipmentSequence,deviceChannelNumber) {
	  // aa=accesstoken;
	   	if(iPTZIndex==2){//向左
	   		ajaxConsole(iPTZIndex,accesstoken,equipmentSequence,deviceChannelNumber);	
	   	}else if(iPTZIndex==3){//向右
	   		ajaxConsole(iPTZIndex,accesstoken,equipmentSequence,deviceChannelNumber);	
	   	}else if(iPTZIndex==4){//左上
	   		ajaxConsole(iPTZIndex,accesstoken,equipmentSequence,deviceChannelNumber);	
	   	}else if(iPTZIndex==5){//左下
	   		ajaxConsole(iPTZIndex,accesstoken,equipmentSequence,deviceChannelNumber);	
	   	}else if(iPTZIndex==6){//右上
	   		ajaxConsole(iPTZIndex,accesstoken,equipmentSequence,deviceChannelNumber);	
	   	}else if(iPTZIndex==7){//右下
	   		ajaxConsole(iPTZIndex,accesstoken,equipmentSequence,deviceChannelNumber);	
	   	}else if(iPTZIndex==0){//上
	   		ajaxConsole(iPTZIndex,accesstoken,equipmentSequence,deviceChannelNumber);	
	   	}else if(iPTZIndex==1){//下
	   		ajaxConsole(iPTZIndex,accesstoken,equipmentSequence,deviceChannelNumber);	
	   	}else if(iPTZIndex==8){//近焦
	   		ajaxConsole(iPTZIndex,accesstoken,equipmentSequence,deviceChannelNumber);	
	   	}else if(iPTZIndex==9){//远焦
	   		ajaxConsole(iPTZIndex,accesstoken,equipmentSequence,deviceChannelNumber);	
	   	}
   }
   
// 方向PTZ停止
function mouseUpPTZControl(iPTZIndex,accesstoken,equipmentSequence,deviceChannelNumber) {
		 $.ajax({
				url:"${ctx}/holder/shutDownOperation",
				data: {direction:iPTZIndex,accessToken:accesstoken,deviceSerial:equipmentSequence,channelNo:deviceChannelNumber},
				type: "post",
				async: false,//非异步
				success: function(msg){
					//alert(JSON.stringify(msg));
				}
			}); 
		 
 }
 
//----------------------------------
$(function(){
	window.location.reload;
});
//----------------------------------
var player = new EZUIPlayer('myPlayer2');

var swiper = new Swiper('.swiper-container', {
    navigation: {
      nextEl: '.swiper-button-next',
      prevEl: '.swiper-button-prev',
    },
  });

layui.use('element', function(){
	  var element = layui.element; //导航的hover效果、二级菜单等功能，需要依赖element模块
	  
	  //监听导航点击
	  element.on('nav(demo)', function(elem){
	    //console.log(elem)
	    layer.msg(elem.text());
	  });
	});



	//树结构json数据
	var zNodes=[];
	//页面加载完调用
	$(document).ready(function(){
		showNodes();
		showNodes2();
		showNodes3();
		showNodes4();
		showNodes5();
		$.fn.zTree.init($("#treeDemo"), setting, zNodes);
		$.fn.zTree.init($("#treeDemo2"), setting, zNodes2);
		$.fn.zTree.init($("#treeDemo3"), setting, zNodes3);
		$.fn.zTree.init($("#treeDemo4"), setting, zNodes4);
		$.fn.zTree.init($("#treeDemo5"), setting, zNodes5);
 		
		
			$('#flow_detail').tipso({
				useTitle: false,
				background: '#ff9900'
				//font-color:'black'
			});
		
	});

//导航树的配置
var setting = {
        view: {
        	selectedMulti: false,
        	fontCss : {color:"white","font-size": "0px"}
        },
        data: {
            simpleData: {
                enable: true
            }
        },
};

var zNodes=[];
var zNodes2=[];
var zNodes3=[];
var zNodes4=[];
var zNodes5=[];
//拿到后台的json数据赋值给zNodes
function showNodes(){
	var zNode;
	<c:forEach items="${calCanalInfoList}" var="calCanalInfo">
		var id   ="${calCanalInfo.id}";
		var pId  ="${calCanalInfo.canalParentId}";
		var name ="${calCanalInfo.canalName}";
		var level="${calCanalInfo.canallevelCode}";
		zNode={id:id, pId:pId, name:name,click:"start('${calCanalInfo.canalCode}',5);", open:true};
		zNodes.push(zNode);
	</c:forEach>
}

//拿到后台的json数据赋值给zNodes
/* function showNodes2(){
	var zNode2;
	<c:forEach items="${sysAreaList}" var="sysArea">
		var id="${sysArea.id}";
		var pId="${sysArea.parentAreaId}";
		var name="${sysArea.areaName}";
		var level="${sysArea.areaLevel}";
			zNode2={id:id, pId:pId, name:name,click:"start('${sysArea.id}');", open:true};
			zNodes2.push(zNode2);
	</c:forEach>
} */
function showNodes2(){
	var zNode2;
	<c:forEach items="${calCanalInfoList}" var="calCanalInfo">
	var id   ="${calCanalInfo.id}";
	var pId  ="${calCanalInfo.canalParentId}";
	var name ="${calCanalInfo.canalName}";
	var level="${calCanalInfo.canallevelCode}";
		zNode2={id:id, pId:pId, name:name,click:"start('${calCanalInfo.canalCode}',8);", open:true};
		zNodes2.push(zNode2);
	</c:forEach>
}

//拿到后台的json数据赋值给zNodes
function showNodes3(){
	var zNode3;
	<c:forEach items="${calCanalInfoList}" var="calCanalInfo">
		var id   ="${calCanalInfo.id}";
		var pId  ="${calCanalInfo.canalParentId}";
		var name ="${calCanalInfo.canalName}";
		var level="${calCanalInfo.canallevelCode}";
		zNode3={id:id, pId:pId, name:name,click:"startSluice('${calCanalInfo.id}');", open:true};
		zNodes3.push(zNode3);
	</c:forEach>
}

//拿到后台的json数据赋值给zNodes
function showNodes4(){
	var zNode4;
	<c:forEach items="${sysAreaList}" var="sysArea">
	var id="${sysArea.id}";
	var pId="${sysArea.parentAreaId}";
	var name="${sysArea.areaName}";
	var level="${sysArea.areaLevel}";
	zNode4={id:id, pId:pId, name:name,click:"startWater('${sysArea.id}');", open:true};
	zNodes4.push(zNode4);
	</c:forEach>
}
//拿到后台的json数据赋值给zNodes5
function showNodes5(){
	var zNode5;
	<c:forEach items="${sysAreaList}" var="sysArea">
		var id="${sysArea.id}";
		var pId="${sysArea.parentAreaId}";
		var name="${sysArea.areaName}";
		var level="${sysArea.areaLevel}";
			zNode5={id:id, pId:pId, name:name,click:"videoArea('${sysArea.id}');", open:true};
			zNodes5.push(zNode5); 
	</c:forEach>
}

function removeHoverDom(treeId, treeNode) {
    $("#addBtn_"+treeNode.tId).unbind().remove();
};






</script>
</body>
</html>
