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

	<style>
	  
		.topbar-nav-item a{color: red;}
		.topbar-nav-item a:hover{color: blue;}
		
		
		::-webkit-scrollbar{
  		display:none;
		}
	  
	  </style>
</head>
<body onload="load()">
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
						<li><h4 style="margin-left: 10px;">渠道等级</h4>
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
									<h4>灌区信息化平台>智能决策配水>土地管理</h4>
								</div>
							</div>
							
							<div class="search-box row">
								<div class="col-md-12">
									<div class="btn-group pull-left" role="group" aria-label="...">
										<button id="add_consumer_soil" style="display: none" type="button" class="btn btn-default" onclick="addSoil()" >
											<span class="glyphicon glyphicon-plus">
											</span>新增
										</button>
										
										<button id="delete_consumer_soil"style="display: none" type="button" class="btn btn-default" onclick="deleteCanalMaterials()">
											<span class="glyphicon glyphicon-trash"></span>删除
										</button>
										<span id="edit_consumer_soil" />
										<span id="detail_consumer_soil" />
									</div>
									
								</div>
							</div>
							
							<div class="clearfix"></div>
							<div class="table-margin">
								<table class="table table-bordered table-header">
									<thead>
										<tr>
											<td class="w5"><input type="checkbox" id="selAll"  onclick="doSelectAll()"/></td>
											<td class="w10">土地名称</td>
											<td class="w10">所属用户</td>
											<td class="w10">所属渠道</td>
											<td class="w10">土地类型</td>
											<td class="w10">土地面积</td>
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
	<script type="text/javascript" src="${ctxstc}/js/custom/plan/ten.jsp"></script>
	<script type="text/javascript" src="${ctxstc}/datepicker/WdatePicker.js "></script>
	<script type="text/javascript" src="${ctxstc}/js/custom/permission/show_three_level_permission.js"></script>
	<script>
	var zNodes=[];
	function load(){
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
		var canalId2 = "${canalId}";
		start(canalId2,1,threeLevelPermission);
		delCookie("canalId");
	}
	
	//导航树的配置
	var setting = {
            view: {
                
                selectedMulti: false
            },
            check: {
                //enable: true
            },
            data: {
                simpleData: {
                    enable: true
                }
            },
            edit: {
                //enable: true
            }
	};
	
	//树结构json数据
	var zNodes=[];
	
	//树结构json数据
	

	//拿到后台的json数据赋值给zNodes
	function showNodes(threeLevelPermission){
		var zNode;
		<c:forEach items="${calCanalInfoList}" var="calCanalInfo">
			var id   ="${calCanalInfo.id}";
			var pId  ="${calCanalInfo.canalParentId}";
			var name ="${calCanalInfo.canalName}";
			var level="${calCanalInfo.canallevelCode}";
			zNode={id:id, pId:pId, name:name,click:"start('${calCanalInfo.canalCode}',1,'"+threeLevelPermission+"');", open:true};
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
	
	
	function start(canalId,page,threeLevelPermission){
		//alert(canalId );
		setCookie("canalId", canalId);
		
		$("#table_list").empty();
		$.ajax({
			url:"${ctx}/consumer_soil/page",
			data: {canalId:canalId,page:page},
			type: "post",
			async: false,//非异步
			success: function(msg){
				//alert(JSON.stringify(msg) );
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
										newTdTag2.innerHTML=msg[i].soilName;
									var newTdTag3 = document.createElement("td");
									
										newTdTag3.innerHTML=msg[i].consumerId;
									
									var newTdTag4 = document.createElement("td");
										newTdTag4.innerHTML=msg[i].canalCode;
										
									var newTdTag5 = document.createElement("td");
										newTdTag5.innerHTML=msg[i].soilTypeCode;
									var newTdTag6 = document.createElement("td");
										newTdTag6.innerHTML=msg[i].soilArea;	
									var newTdTag7 = document.createElement("td");
										newTdTag7.innerHTML=msg[i].remake;	
									var newTdTag8 = document.createElement("td");
											var sonid = JSON.stringify(msg[i].id);
										newTdTag8.innerHTML=showThreeLevelPermission(threeLevelPermission,sonid);
										newTrTag.appendChild(newTdTag1);
										newTrTag.appendChild(newTdTag2);
										newTrTag.appendChild(newTdTag3);
										newTrTag.appendChild(newTdTag4);
										newTrTag.appendChild(newTdTag5);
										newTrTag.appendChild(newTdTag6);
										newTrTag.appendChild(newTdTag7);
										newTrTag.appendChild(newTdTag8);
									currentTag.appendChild(newTrTag);
				}
				
			}
		});
		
		 $.post("${ctx}/consumer_soil/page_nav").success(function (response) {
			// alert("11");
			 var pageNum = response.pageNum;
			 //alert("33");
				var pages = response.pages;
				//alert("44");
				var size = response.size;
				//alert("55");
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
			        	//alert("22");
			        	//alert(JSON.stringify(page));
			        	//var id = getCookie ("canalId");
			        	start(canalId,page,threeLevelPermission);
			        	
			        }
			    };
			    $('#pageLimit').bootstrapPaginator(options);
			}).error(function (response) {
			});
	}
	
	//新增需水报表
	function addSoil(){
		var canalId = getCookie("canalId");
		//alert(canalId);
		delCookie("canalId");
		if(canalId==null||canalId==""){
			layer.alert('请先选择渠道！', {icon: 0});
		}else{
			//打开添加窗口
		//	alert("111");
			 layer.open({
				 	id: 'insert-soil-form'
			        ,type: 2 //此处以iframe举例
			        ,title: '你的需水渠道为'+canalId
			        ,area: ['740px', '600px']
			        ,shade: 0.8
			        ,maxmin: true
			        ,content: '${ctx}/consumer_soil/add_page?canalId='+canalId
			        ,btn: ['确定', '关闭'] //只是为了演示
			        ,yes: function(){
			        	//子页面提交
			        	insertSubmit();
			        	layer.confirm('你的预测添加成功', {
			        		  btn: ['确定'] //按钮
			        		}, function(){	
		        			document.forms[0].action="${ctx}/consumer_soil/list?state=37";
				    		document.forms[0].submit();
			        		//layer.msg('的确很重要', {icon: 1})
			        	});
			        }
			        ,btn2: function(){
				          layer.closeAll();
			        }
			        ,zIndex: layer.zIndex //重点1
			        ,success: function(layero){
			        	layer.setTop(layero); //重点2
			        }
			    });
		}
	}
	
	 function insertSubmit(){
		   var frameId=document.getElementById("insert-soil-form").getElementsByTagName("iframe")[0].id;
		   $('#'+frameId)[0].contentWindow.mySubmit();
	  }
	 
	//编辑
		function doEdit(id){
			//alert(sonid);
			layer.open({
			 	id: 'edit-soil-form'
		        ,type: 2 //此处以iframe举例
		        ,title: '编辑用户信息'
		        ,area: ['700px', '600px']
		        ,shade: 0.8
		        ,maxmin: true
		        ,content: '${ctx}/consumer_soil/edit_page?id='+id
		        ,btn: ['确定', '关闭'] //只是为了演示
		        ,yes: function(){
	        	//子页面提交
	        		editSluiceSiteSubmit();
	        		layer.confirm('你的预测编辑成功', {
		        		  btn: ['确定'] //按钮
		        		}, function(){	
	      			document.forms[0].action="${ctx}/consumer_soil/list?state=37";
			    		document.forms[0].submit();
		        	});
		        }
		        ,btn2: function(){
		          layer.closeAll();
		        }
		        
		        ,zIndex: layer.zIndex //重点1
		        ,success: function(layero){
		        	//start(getCookie ("${areaId}"),1);
		          layer.setTop(layero); //重点2
		        }
		    });
		}
		//编辑提交
		function editSluiceSiteSubmit(){
			////alert("haha");
		   var frameId=document.getElementById("edit-soil-form").getElementsByTagName("iframe")[0].id;
		   $('#'+frameId)[0].contentWindow.mySubmit();
		}
		
		//删除
		function doDelete(id){
			$.ajax({
				url:"${ctx}/consumer_soil/delete",
				type: "post",
				data: {id:id},
				async: false,//非异步
				success: function(msg){
					if(msg==1){
						layer.confirm('删除成功', {
			        		  btn: ['确定'] //按钮
			        		}, function(){	
		      			document.forms[0].action="${ctx}/consumer_soil/list?state=37";
				    		document.forms[0].submit();
			        	});
					}
				}
			});
			
		}
		//批量删除
		function deleteCanalMaterials(){
			//alert("asdfasdf");
			var ids = [];
			  $('input[name=selectedRow]:checked').each(function () {
				  ids.push($(this).val());
			  });
			  $.ajax({
					url:"${ctx}/consumer_soil/deletes",
					data: {ids:ids},
					type: "post",
					async: false,//非异步
					success: function(msg){
						//alert(JSON.stringify(msg));
						if(msg==ids.length){
						//	start(1);
							layer.confirm('删除成功', {
				        		  btn: ['确定'] //按钮
				        		}, function(){	
			      			document.forms[0].action="${ctx}/water_user/list?state=37";
					    		document.forms[0].submit();
				        	});
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