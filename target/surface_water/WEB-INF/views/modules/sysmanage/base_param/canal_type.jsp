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
	
	 <script src="${ctxstc}/adapters/layui/layer/layer.js" merge="true"></script>

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
				<div class="center-back right-back" >
					<div class="container-fluid">
						<div class="info-center">
							<div class="page-header">
								<div class="pull-left">
									<h4>灌区信息化平台>系统管理>基础参数管理>渠道类型管理</h4>
								</div>
							</div>
							
							<div class="search-box row">
								<div class="col-md-12">
									<div class="btn-group pull-left"  role="group" aria-label="...">
										<button id="add_canal_type" style="display: none" type="button" class="btn btn-default" onclick="addCanalType()">
											<span class="glyphicon glyphicon-plus">
											</span>新增
										</button>
										
										<button id="delete_canal_type" style="display: none"  type="button" class="btn btn-default" onclick="doDeletes()">
											<span  class="glyphicon glyphicon-trash"></span>删除
										</button>
										<span id="edit_canal_type"/>
										<span id="detail_canal_type" />
									</div>
								</div>
							</div>
							
							<div class="clearfix"></div>
							<div class="table-margin">
								<table class="table table-bordered table-header">
									<thead>
										<tr>
											<td><input type="checkbox" id="selAll" onclick="doSelectAll()" /></td>
											<td class="w15">渠道类型编码</td>
											<td class="w15">名称</td>
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
	<script type="text/javascript" src="${ctxstc}/js/custom/permission/show_three_level_permission.js"></script>
	<script>
	 window.onload = function () {
		//三级权限code数组============================================================
			var threeLevelPermission = [];
			//拿到三级权限的的列表
			<c:forEach items="${threeLevelPermissions}" var="sysPermission">
				var menuNameCode = "${sysPermission.menuNameCode}";
				//
				//拿到页面三级权限对应的标签
				var tag = document.getElementById(menuNameCode);
				if(tag!= null){//如果有权限就将他显示
					tag.style.display="block";
					threeLevelPermission.push(menuNameCode);
				}
				
			</c:forEach>
			
			//初始加载
			start(1,threeLevelPermission);
     };
     function start(page,threeLevelPermission){
 		$("#table_list").empty();
 			$.ajax({
 				url:"${ctx}/base_param/canal_type_page",
 				data: {page:page},
 				type: "post",
 				async: false,//非异步
 				success: function(msg){
 					////alert(JSON.stringify(msg) );
 					var table = msg;
 						//动态建立渠道列表
 							for(var i=0;i<msg.length;i++){
 								var currentTag = document.getElementById("table_list");
 									var newTrTag = document.createElement("tr");
 										var newTdTag1 = document.createElement("td");
 											var newInputTag = document.createElement("input");
 											newInputTag.setAttribute("type", "checkbox");
 											newInputTag.setAttribute("name", "selectedRow");
											newInputTag.setAttribute("value", msg[i].id);
 											newTdTag1.appendChild(newInputTag);
 											
 										var newTdTag2 = document.createElement("td");
 											newTdTag2.innerHTML=msg[i].canalTypeCode;
 										var newTdTag3 = document.createElement("td");
 											newTdTag3.innerHTML=msg[i].canalTypeName;
 										var newTdTag4 = document.createElement("td");
 											newTdTag4.innerHTML=msg[i].cctCreateTime;
 										var newTdTag5 = document.createElement("td");
 											newTdTag5.innerHTML=msg[i].cctEditTime;
 										var newTdTag6 = document.createElement("td");
 											newTdTag6.innerHTML=msg[i].cctRemark;
 										
 										var newTdTag7 = document.createElement("td");
 												var id = JSON.stringify(msg[i].id);
 											newTdTag7.innerHTML=showThreeLevelPermission(threeLevelPermission,id);
 											newTrTag.appendChild(newTdTag1);
 											newTrTag.appendChild(newTdTag2);
 											newTrTag.appendChild(newTdTag3);
 											newTrTag.appendChild(newTdTag4);
 											newTrTag.appendChild(newTdTag5);
 											newTrTag.appendChild(newTdTag6);
 											newTrTag.appendChild(newTdTag7);
 										currentTag.appendChild(newTrTag);
 							}
 					
 				}
 			});
 			
 			 $.post("${ctx}/base_param/canal_type_page_nav").success(function (response) {
 				 
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
 				        	start(page,threeLevelPermission);
 				        	
 				        }
 				    };
 				    $('#pageLimit').bootstrapPaginator(options);
 				}).error(function (response) {
 				    //alert("列表请求出错");
 				});
 			
     }
	
	
	
	
	function addCanalType(){
		////alert("asdf");
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
	        				'<form  action="" method="post">'+
				       		 	'唯一编码：<input type="text" name="canalTypeCode" value="" style="color:black;"/><br><br>'+
				        		'名____称：<input type="text" name="canalTypeName" value="" style="color:black;"/><br><br>'+
				        		'备____注：<input type="text" name="cctRemark" value="" style="color:black;"/>'+
			        		'</form>'+
		       		 '</div>'
	        ,btn2: function(){
	        	document.forms[0].action="${ctx}/base_param/add_canal_type";
				document.forms[0].submit();
	        }
	  });
	}
	
	function doEdit(id){
		$.ajax({
				url:"${ctx}/base_param/canal_type_edit_message",
				data: {id:id},
				type: "post",
				async: false,//非异步
				success: function(msg){
					
					////alert(JSON.stringify(msg));
					//弹出编辑框==========
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
					        				'<form  action="" method="post">'+
					        					'<input hidden="hidden" type="text" name="id" value="'+msg.id+'" style="color:black;"/>'+
								       		 	'唯一编码：<input type="text" name="canalTypeCode" value="'+msg.canalTypeCode+'" style="color:black;"/><br><br>'+
								        		'名____称：<input type="text" name="canalTypeName" value="'+msg.canalTypeName+'" style="color:black;"/><br><br>'+
								        		'备____注：<input type="text" name="cctRemark" value="'+msg.cctRemark+'" style="color:black;"/>'+
							        		'</form>'+
						       		 '</div>'
					        ,btn2: function(){
					        	document.forms[0].action="${ctx}/base_param/edit_canal_type";
								document.forms[0].submit();
					        }
					  });
				}
			});
				
	     }
	
	//单个删除
	function doDelete(id){
		////alert(id);
		$.ajax({
			url:"${ctx}/base_param/delete_type_byid",
			data: {id:id},
			type: "post",
			async: false,//非异步
			success: function(msg){
				////alert(JSON.stringify(msg));
				if(msg==1){
					start(1,threeLevelPermission);
				}
			}
		});
	}
	//批量删除
	function doDeletes(){
		////alert("asdfasdf");
		var ids = [];
		  $('input[name=selectedRow]:checked').each(function () {
			  ids.push($(this).val());
		  });
		  $.ajax({
				url:"${ctx}/base_param/delete_types",
				data: {ids:ids},
				type: "post",
				async: false,//非异步
				success: function(msg){
					////alert(JSON.stringify(msg));
					if(msg==ids.length){
						start(1,threeLevelPermission);
					}
				}
			});
	}
	function doSelectAll(){
		$("input[name=selectedRow]").prop("checked", $("#selAll").is(":checked"));
	}
	
	
	</script>
</body>
</html>