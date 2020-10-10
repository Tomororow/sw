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
	<script type="text/javascript" src="${ctxstc}/js/echarts.min.js" ></script><!-- echart图表 -->

</head>
<body>
	<form  action="video/getVideoSiteList">
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
	<div class="down-main">
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
				
				<!-- 左侧树菜单start -->
				<sidebar class="east-back left-back">
					<ul class="nav nav-pills nav-stacked">
						<li><h4 style="margin-top: 20px; margin-left:20px;">站点所属区域</h4></li>
						<li id="canalZtree" class="ztree" style="margin-left:30px;"></li>
					</ul>
				</sidebar>
				<!-- 左侧树菜单end  -->
				
				<div class="center-back right-back">
					<div class="container-fluid">
						<div class="info-center">
							<div class="page-header">
								<div class="pull-left">
									<h4>灌区信息化平台>站点视频>视频站信息管理</h4>
								</div>
							</div>
							
							<div class="btn-group pull-left" role="group" aria-label="...">
										<button id="add_video" style="display: none" type="button" class="btn btn-default" onclick="addVideosInfo()" >
											<span class="glyphicon glyphicon-plus">
											</span>新增
										</button>
										
										<button id="delete_video" style="display: none" type="button" class="btn btn-default" onclick="delVideosInfo()">
											<span class="glyphicon glyphicon-trash"></span>删除
										</button>
										
										<span id="edit_video" />
										<span id="detail_video" />
										
									</div>
							
							<div class="table-margin">
								<table class="table table-bordered table-header">
									<thead>
										<tr>
											<td class="w5"><input type="checkbox" id="selVideosAll" onclick="checkVideosAll()"/></td>
											<td class="w10">站点编码</td>
											<td class="w20">站点名称</td>
											<td class="w10">设备类型</td>
											<td class="w15">设备照片</td>
											<td class="w17">站点详细地址</td>
											<td class="w10">建设时间</td>
											<td class="w13">操作</td>
										</tr>
									</thead>
									
									<tbody id="videoSiteList">
									
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

	<!--弹窗添加或修改内容必备的代码-->
	<div id="show">
	    <iframe id="popup" name="popup" marginwidth=0 width="100%" frameBorder=0 scrolling=yes></iframe>
	</div>
	</form>
	<!-- js引入 -->
	<script type="text/javascript" src="${ctxstc}/js/custom/video_site.js"></script>
	<script type="text/javascript" src="${ctxstc}/js/footer.js"></script>
	<script type="text/javascript" src="${ctxstc}/js/custom/water_area_cook.js"></script>
	<script type="text/javascript" src="${ctxstc}/jsp/water_site.jsp" type="text/javascript"></script>
	<script type="text/javascript" src="${ctxstc}/jsp/sluice_site.jsp" type="text/javascript"></script>
	<script type="text/javascript" src="${ctxstc}/jsp/speed_site.jsp" type="text/javascript"></script>
	<script type="text/javascript" src="${ctxstc}/jsp/flowrate_site.jsp" type="text/javascript"></script>
	<script type="text/javascript" src="${ctxstc}/datepicker/WdatePicker.js "></script>
	<script type="text/javascript" src="${ctxstc}/js/custom/permission/show_three_level_permission.js"></script>
	<script type="text/javascript">
		
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
			$.fn.zTree.init($("#canalZtree"), setting, zNodes);
			
			var canalId2 = "${canalId}";
			start(canalId2,1,threeLevelPermission);
			delCookie("canalCode");
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
					zNode={id:id, pId:pId, name:name,click:"start('${calCanalInfo.canalCode}',1,'"+threeLevelPermission+"');", open:true};
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