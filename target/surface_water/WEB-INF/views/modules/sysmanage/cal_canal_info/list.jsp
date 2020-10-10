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

	<!--  
	<link rel="stylesheet" href="${ctxstc}/adapters/ztree/css/demo.css" type="text/css">-->
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
		<div class="right-product right-full" style="/*margin-left:55px*/;">
			<section id="layout" ng-app="doc.ui-layout">
			<div ui-layout class="layout-mock">
				<ui-layout options="{ flow : 'column' }">
				
				
				<sidebar class="east-back left-back" >
					<ul id="tree" class="nav nav-pills nav-stacked">
						<li><h3 style="margin-left: 10px;">渠道等级</h3>
						</li>
						<ul id="treeDemo" class="ztree">
						</ul>
					</ul>
				</sidebar>
				<div class="center-back right-back">
			        <div class="container-fluid">
			          <div class="info-center">
			            <div class="page-header">
			              	<div class="pull-left">
			                	<h4>灌区信息化平台>水系统管理>渠道管理</h4>      
			            	</div>
			            </div> 
			            <!-- <div class="clearfix"></div> -->
			            
			            
			              <div id="tab" class="main left" >
			                <div class="main-left width-100" style="margin-top:0px">
			                    
			                    <!-- tab头 -->
			                    <ul class="nav-tabs left">
			                        <li id="li0" ><a title="TAB-1" href="javascript:void(0)" onclick="showCanalPage()">渠道管理</a></li>
			                        <li id="li1" ><a title="TAB-2" href="javascript:void(0)" onclick="showPhotoPage1()">渠道照片</a></li>
			                        <li id="li2" ><a title="TAB-3" href="javascript:void(0)" onclick="showSluicePage1()">渠道闸门</a></li>
			                        <li id="li3" ><a title="TAB-4" href="javascript:void(0)" onclick="showBuildingPage1()">渠道建筑物</a></li> 
			                    </ul>
			                    <!-- tab对应主体 TAB-1 -->
			                    <div id="TAB-1" class="width left min-tab2" style="width: ">
			                    	<div class="search-box row" style="width: 100%;">
										<div class="col-md-12">
											<div class="btn-group pull-left" role="group" aria-label="...">
												<button id="add_canal" style="display: none" type="button" class="btn btn-default" onclick='addCanal()'>
													<span class="glyphicon glyphicon-plus"></span>
													新增
												</button>
												<button id="delete_canal" style="display: none" type="button" class="btn btn-default" >
													<span class="glyphicon glyphicon-trash"></span>删除
												</button>
												<span id="edit_canal" />
												<span id="detail_canal" />
											</div>
										</div>
									</div>
										
									<div class="clearfix"></div>
									<div class="table-margin">
										<table class="table table-bordered table-header">
											<thead id="table_head">
												<tr>
													<td class="w5"><input type="checkbox" /></td>
													
													<td class="w10">行政区编码</td>
													<td class="w10">水管区编码</td>
													<td class="w10">渠道编码</td>
													<td class="w10">渠道名称</td>
													<td class="w10">地址</td>
													<td class="w10">备注</td>
													<td class="w10">操作</td>
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
			                    <!-- tab对应主体 TAB-2 -->
			                    <div id="TAB-2" class="width left min-tab">
			                        <div class="search-box row" style="width: 100%;">
										<div class="col-md-12">
											<div class="btn-group pull-left" role="group" aria-label="...">
												<button id="add_canal1" style="display: none" type="button" class="btn btn-default" onclick="addCanalPhoto()">
													<span class="glyphicon glyphicon-plus"></span>
													新增
												</button>
												<button id="delete_canal1" style="display: none" type="button" class="btn btn-default" onclick="deleteAllPhoto()">
													<span class="glyphicon glyphicon-trash"></span>删除
												</button>
												<span id="edit_canal1" />
												<span id="detail_canal1" />
												
											</div>
										</div>
									</div>
									<div class="clearfix"></div>
									<div class="table-margin">
										<table class="table table-bordered table-header">
											<thead id="photo_table_head">
												<tr>
													<td class="w10"><input type="checkbox" id="selPhotoAll" onclick="doSelectPhotoAll()" /></td>
													<td class="w30">所属渠道</td>
													<td class="w15">照片</td>
													<td class="w35">备注</td>
													<td class="w10">操作</td>
												</tr>
											</thead>
											<tbody id="table_photo_list">
											</tbody>
											<tfoot>
												<tr>
													<td colspan="10">
														<div class="pull-right">
															<div id="Paginator">
																<ul id="pageLimit2"></ul>
															</div>
														</div>
													</td>
												</tr>
											</tfoot>
										</table>
									</div>
			                    </div>
			                    <!-- tab对应主体 TAB-3 -->
			                    <div id="TAB-3" class="width left min-tab">
			                    	             <div class="search-box row" style="width: 100%;">
										<div class="col-md-12">
											<div class="btn-group pull-left" role="group" aria-label="...">
												<button id="add_canal2" style="display: none" type="button" class="btn btn-default" onclick="addCanalSluice()">
													<span class="glyphicon glyphicon-plus"></span>
													新增
												</button>
												<button id="delete_canal2" style="display: none" type="button" class="btn btn-default" onclick="deleteAllSluice()">
													<span class="glyphicon glyphicon-trash"></span>删除
												</button>
												
												<span id="edit_canal2" />
												<span id="detail_canal2" />
											</div>
										</div>
									</div>
									<div class="clearfix"></div>
									<div class="table-margin">
										<table class="table table-bordered table-header">
											<thead id="sluice_table_head">
												<tr>
													<td class="w5"><input type="checkbox" id="selSluiceAll" onclick="doSelectSluiceAll()" /></td>
													<td class="w10">所属渠道</td>
													<td class="w10">闸门编号</td>
													<td class="w5" >照片       </td>
													<td class="w10">照片编号</td>
													<td class="w10">闸门类型</td>
													<td class="w15">修建时间</td>
													<td class="w15">维修时间</td>
													<td class="w10">备注</td>
													<td class="w15">操作</td>
												</tr>
											</thead>
											<tbody id="table_sluice_list">
											</tbody>
											<tfoot>
												<tr>
													<td colspan="11">
														<div class="pull-right">
															<div id="Paginator">
																<ul id="pageLimit3"></ul>
															</div>
														</div>
													</td>
												</tr>
											</tfoot>
										</table>
									</div>
			                    </div>
			                    <!-- tab对应主体 TAB-4 -->
			                    <div id="TAB-4" class="width left min-tab">
			                       <div class="search-box row" style="width: 100%;">
										<div class="col-md-12">
											<div class="btn-group pull-left" role="group" aria-label="...">
												<button id="add_canal3" style="display: none" type="button" class="btn btn-default" onclick="addCanalBuilding()">
													<span class="glyphicon glyphicon-plus"></span>
													新增
												</button>
												<button id="delete_canal3" style="display: none" type="button" class="btn btn-default" onclick="deleteAllBuilding()">
													<span class="glyphicon glyphicon-trash"></span>删除
												</button>
												
												<span id="edit_canal3" />
												<span id="detail_canal3" />
											</div>
										</div>
									</div>
									<div class="clearfix"></div>
									<div class="table-margin">
										<table class="table table-bordered table-header">
											<thead id="photo_table_head">
												<tr>
													<td class="w5"><input type="checkbox" id="selBuildingAll" onclick="doSelectBuildingAll()" /></td>
													<td class="w10">所属渠道</td>
													<td class="w10">建筑编号</td>
													<td class="w5">照片</td>
													<td class="w10">照片编号</td>
													<td class="w10">建筑名称</td>
													<td class="w10">建筑类型</td>
													<td class="w15">修建时间</td>
													<td class="w15">维修时间</td>
													<td class="w10">备注</td>
													<td class="w15">操作</td>
												</tr>
											</thead>
											<tbody id="table_building_list">
											</tbody>
											<tfoot>
												<tr>
													<td colspan="11">
														<div class="pull-right">
															<div id="Paginator">
																<ul id="pageLimit4"></ul>
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
	<script type="text/javascript" src="${ctxstc}/js/custom/canal/canal.js"></script>
	<script type="text/javascript" src="${ctxstc}/js/custom/canal/canal_photo.js"></script>
	<script type="text/javascript" src="${ctxstc}/js/custom/canal/canal_building.js"></script>
	<script type="text/javascript" src="${ctxstc}/js/custom/canal/canal_sluice.js"></script>
	<%-- <script type="text/javascript" src="${ctxstc}/jsp/canal/canal.jsp"></script> --%>
	<script type="text/javascript" src="${ctxstc}/datepicker/WdatePicker.js "></script>
	<script type="text/javascript" src="${ctxstc}/js/custom/permission/show_three_level_permission.js"></script>
	<script>
	
	//当前标签的状态值
	//setCookie("tagState", 0);
	//设置全局树目录最高级ID变量
	//树结构json数据
	var zNodes=[];
	var canalId;
	//页面加载完执行
	function load(id){
		//==修改tab  css内联样式==================
		var tab = document.getElementById("tab");
		tab.setAttribute("style", "width:100%");
		//======================================
		setCookie("tagState", 0);
		//alert(getCookie("tagState"));	
		//根据cooki里面的tagState状态值来确定显示的那个标签页
		switch (getCookie("tagState")) {
		case '0':
			//alert(1111);
			var tagLi0 = document.getElementById("li0");
			var tagLi1 = document.getElementById("li1");
			//var tagLi2 = document.getElementById("li2");
			var tagLi3 = document.getElementById("li3");
				tagLi0.setAttribute("class", "active");
				tagLi1.setAttribute("class", "");
				//tagLi2.setAttribute("class", "");
				tagLi3.setAttribute("class", "");
			break;
		case '1':
			var tagLi0 = document.getElementById("li0");
			var tagLi1 = document.getElementById("li1");
			var tagLi0 = document.getElementById("li2");
			var tagLi1 = document.getElementById("li3");
				tagLi0.setAttribute("class", "");
				tagLi1.setAttribute("class", "active");
				tagLi2.setAttribute("class", "");
				tagLi3.setAttribute("class", "");
			break;
		case '2':
			var tagLi0 = document.getElementById("li0");
			var tagLi1 = document.getElementById("li1");
			var tagLi0 = document.getElementById("li2");
			var tagLi1 = document.getElementById("li3");
				tagLi0.setAttribute("class", "");
				tagLi1.setAttribute("class", "");
				tagLi2.setAttribute("class", "active");
				tagLi3.setAttribute("class", "");
			break;
		case '3':
			var tagLi0 = document.getElementById("li0");
			var tagLi1 = document.getElementById("li1");
			//var tagLi2 = document.getElementById("li2");
			var tagLi3 = document.getElementById("li3");
				tagLi0.setAttribute("class", "");
				tagLi1.setAttribute("class", "");
				//tagLi2.setAttribute("class", "");
				tagLi3.setAttribute("class", "active");
		default:
			break;
		}
		
		
		
		
		
		
		//【三级权限code数组】start============================================================
		var threeLevelPermission = [];
		//拿到三级权限的的列表
		<c:forEach items="${threeLevelPermissions}" var="sysPermission">
			var menuNameCode = "${sysPermission.menuNameCode}";
			//拿到页面三级权限对应的标签
			var tag = document.getElementById(menuNameCode);
			var tag1 = document.getElementById(menuNameCode+"1");
			var tag2 = document.getElementById(menuNameCode+"2");
			var tag3 = document.getElementById(menuNameCode+"3");
			if(tag!=null){//如果有权限就将他显示
				tag.style.display="block";
				tag1.style.display="block";
				tag2.style.display="block";
				tag3.style.display="block";
				threeLevelPermission.push(menuNameCode);
			}
		</c:forEach>
		//【】结束=================================================================================
		//树目录数据方法
		showNodes(threeLevelPermission); 
		setCookie("threeLevelPermission", threeLevelPermission);
		$.fn.zTree.init($("#treeDemo"), setting, zNodes);	
		//拿到权限内最高级渠道
		canalId = "${canalId}";
		setCookie("tagState",0);
		start(canalId,1,threeLevelPermission);
		
		if(canalId!=0){//第一磁进来不要删
			delCookie("canalId");
		}
	};
	//导航树的配置
	var setting = {
            view: {
            },
            check: {
            },
            data: {
                simpleData: {
                    enable: true
                }
            },
            edit: {
            }
	};
	//树结构json数据
	var zNodes=[];

	//拿到后台的json数据赋值给zNodes
	function showNodes(threeLevelPermission){
		var zNode;
		<c:forEach items="${calCanalInfoList}" var="calCanalInfo">
			var id   ="${calCanalInfo.id}";
			var pId  ="${calCanalInfo.canalParentId}";
			var name ="${calCanalInfo.canalName}";
			var level="${calCanalInfo.canallevelCode}";
			zNode={id:id, pId:pId, name:name,click:"start('${calCanalInfo.id}',1,'"+threeLevelPermission+"')", open:true};
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
	</script>
</body>
</html>