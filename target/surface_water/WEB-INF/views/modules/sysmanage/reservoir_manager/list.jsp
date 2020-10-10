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
				
				<div class="center-back right-back" >
					<div class="container-fluid">
						<div class="info-center">
							<div class="page-header">
								<div class="pull-left">
									<h4>灌区信息化平台>水系统管理>水库管理</h4>
								</div>
							</div>
							
							<div class="search-box row">
								<div class="col-md-12">
									<div class="btn-group pull-left" role="group" aria-label="...">
										<button id="add_reservoir" style="display: none" type="button" class="btn btn-default" onclick="addReservoir()" >
											<span class="glyphicon glyphicon-plus">
											</span>
											<a href="javascript:void(0)" >新增</a>
										</button>
										
										<button id="delete_reservoir" style="display: none" type="button" class="btn btn-default" onclick="doDelets()" >
											<span class="glyphicon glyphicon-trash"></span>删除
										</button>
										<span id="edit_reservoir" />
										<span id="detail_reservoir" />
									</div>
								</div>
							</div>
							
							<div class="clearfix"></div>
							<div class="table-margin">
								<table class="table table-bordered table-header">
									<thead>
										<tr>
											<td class="w5"><input type="checkbox" /></td>
											<td class="w10">水库编码</td>
											<td class="w10">水库名称</td>
											<td class="w10">联系人</td>
											<td class="w10">联系电话</td>
											<td class="w10">三级区名称(所属流域)</td>
											<td class="w10">工程级别</td>
											<td class="w10">站点设备编码(水位监测仪器)</td>
											<td class="w10">备注</td>
											<td class="w15">操作</td>
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
	<script type="text/javascript" src="${ctxstc}/datepicker/WdatePicker.js "></script>
	<script type="text/javascript" src="${ctxstc}/js/custom/permission/show_three_level_permission.js"></script>
	<script>
	//当前标签的状态值
	//setCookie("tagState", 0);
	//设置全局树目录最高级ID变量
	var pId;
	
	
	
	//树结构json数据
	var zNodes=[];
	//页面加载完执行
	function load(id){
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
	//	start(1,threeLevelPermission);
		//==========
		
		
		
		
		showNodes(threeLevelPermission); 
		//alert(1111);
		$.fn.zTree.init($("#treeDemo"), setting, zNodes);
		start(0,1,threeLevelPermission);
	};
	
	//添加渠道弹窗
	 function addReservoir(){
		 var id = getCookie ("currentNodeId");
		// alert(id);
		 delCookie("currentNodeId");
			 layer.open({
				 	 id: 'insert-reservoir-form'
			        ,type: 2 //此处以iframe举例
			        ,title: '新增水库站点'
			        ,area: ['900px', '700px']
			        ,shade: 0.8
			        ,maxmin: true
			        ,content: '${ctx}/reservoir/add_reservoir_page?id='+id
			        ,btn: ['确定', '关闭'] //只是为了演示
			        ,yes: function(){
			        	//子页面提交
			        	insertSubmit();
			        		//弹出添加成功的窗口
			        	layer.confirm('你的预测添加成功', {
			        		  btn: ['确定'] //按钮
			        		}, function(){
			        			
		        			document.forms[0].action="${ctx}/reservoir/list?state=41";
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
		 
	  };
	  //获取添加子页面的提交方法
	  function insertSubmit(){
		   var frameId=document.getElementById("insert-reservoir-form").getElementsByTagName("iframe")[0].id;
		   $('#'+frameId)[0].contentWindow.mySubmit();
	  }
	  
	 
	//============================================== 
	//导航树的配置
	var setting = {
            view: {
               // addHoverDom: addHoverDom,
               // removeHoverDom: removeHoverDom,
               // selectedMulti: false
            },
            check: {
               // enable: true
            },
            data: {
                simpleData: {
                    enable: true
                }
            },
            edit: {
               // enable: true
            }
	};
	//树结构json数据
	var zNodes=[];

	//拿到后台的json数据赋值给zNodes
	function showNodes(threeLevelPermission){
		var zNode;
		<c:forEach items="${sysWaterAreaList}" var="sysWaterArea">
			var id="${sysWaterArea.id}";
			var pId="${sysWaterArea.parentWaterareaId}";
			var name="${sysWaterArea.waterAreaName}";
			var level="${sysWaterArea.waterAreaLevel}";
			
				zNode={id:id, pId:pId, name:name,click:"start('${sysWaterArea.id}',1,'"+threeLevelPermission+"');", open:true};
			
			
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

	/**+
	id:点击树目录所触发的id
	page：分页的起始页
	table：相对路劲
	tab：所对应的标签
	*/
	//当点击某一级树目录触发
	function start(id,page,threeLevelPermission){
		
		//alert(2222);
		//alert(page);
		//将获取的id放到cook中
		if(id!=0){
			setCookie("currentNodeId",id);
		}
		//每次进来清除之前的查询结果
		$("#table_list").empty();
			$.ajax({
				url:"${ctx}/reservoir/page",
				data: {id:id,page:page},
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
											
											newTdTag1.appendChild(newInputTag);
										var newTdTag2 = document.createElement("td");
											newTdTag2.innerHTML=msg[i].deviceReservoirCode;
										var newTdTag3 = document.createElement("td");
											newTdTag3.innerHTML=msg[i].deviceReservoirName;
										
											var newTdTag4 = document.createElement("td");
											newTdTag4.innerHTML=msg[i].contactsPeople;
											var newTdTag5 = document.createElement("td");
											newTdTag5.innerHTML=msg[i].contentPhone;
											var newTdTag6 = document.createElement("td");
											newTdTag6.innerHTML=msg[i].threeLevelAreaName;
											var newTdTag7 = document.createElement("td");
											newTdTag7.innerHTML=msg[i].engineeringLevel;
											var newTdTag8 = document.createElement("td");
											newTdTag8.innerHTML=msg[i].sriDeviceNo;
										var newTdTag9 = document.createElement("td");
											newTdTag9.innerHTML=msg[i].sriRemark;
										
										var newTdTag10 = document.createElement("td");
												var sonid = JSON.stringify(msg[i].id);
											newTdTag10.innerHTML=showThreeLevelPermission(threeLevelPermission,sonid);//========
											newTrTag.appendChild(newTdTag1);
											newTrTag.appendChild(newTdTag2);
											newTrTag.appendChild(newTdTag3);
											newTrTag.appendChild(newTdTag4);
											newTrTag.appendChild(newTdTag5);
											newTrTag.appendChild(newTdTag6);
											newTrTag.appendChild(newTdTag7);
											newTrTag.appendChild(newTdTag8);
											newTrTag.appendChild(newTdTag9);
											newTrTag.appendChild(newTdTag10);
										currentTag.appendChild(newTrTag);
							}
					
				}
			});
			
			 $.post("${ctx}/reservoir/page_nav").success(function (response) {
				 
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
				        	//var id = getCookie ("currentNodeId");
				        	start(id,page,threeLevelPermission);
				        	
				        }
				    };
				    $('#pageLimit').bootstrapPaginator(options);
				}).error(function (response) {
				    alert("列表请求出错");
				});
		
	}
	
	//编辑
	function doEdit(id){
		layer.open({
		 	id: 'edit-form'
	        ,type: 2 //此处以iframe举例
	        ,title: '你编辑的渠道为'+id
	        ,area: ['1000px', '700px']
	        ,shade: 0.8
	        ,maxmin: true
	        ,content: '${ctx}/reservoir/edit_page?id='+id
	        ,btn: ['确定', '关闭'] //只是为了演示
	        ,yes: function(){
        	//子页面提交
        	editSubmit();
	        		//弹出添加成功的窗口
		        	layer.confirm('你的水库站点修改成功', {
		        		  btn: ['确定'] //按钮
		        		}, function(){
		        			
	        			document.forms[0].action="${ctx}/reservoir/list?state=41";
			    		document.forms[0].submit();
		        			
		        		  layer.msg('的确很重要', {icon: 1});
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
	
	 function editSubmit(){
		 	
		  //父页面控制子页面
		   var frameId=document.getElementById("edit-form").getElementsByTagName("iframe")[0].id;
		   $('#'+frameId)[0].contentWindow.mySubmit();
	  }
	 
	
	//照片点击事件显示照片=====================
	function showPhoto(a,canalPhotoimg){
		//alert(a);
		layer.open({
			  type: 1,
			  title: false,
			  closeBtn: 0,
			  area: ['900px', '600px'],
			  skin: 'layui-layer-nobg', //没有背景色
			  shadeClose: true,
			  content: '<img src= '+canalPhotoimg+'  width="900" height="600" alt="渠道照片" />'
		});
	}
	
	
	//水库单个删除
	function doDelete(id){
		//alert("hahah");
		$.ajax({
			url:"${ctx}/reservoir/delete",
			type: "post",
			data: {id:id},
			async: false,//非异步
			success: function(msg){
				
				if(msg==1){
					layer.confirm('删除成功', {
		        		  btn: ['确定'] //按钮
		        		}, function(){	
	      			document.forms[0].action="${ctx}/reservoir/list?state=41";
			    		document.forms[0].submit();
		        	});
				}
			}
		});
	}
	
	//水库批量删除
	function doDelets(){
	//	alert(111111111);
	 var sluiceIds = [];
	  $('input[name=selectedRow]:checked').each(function () {
		  //alert(222222);
		  sluiceIds.push($(this).val());
	  });
	  $.ajax({
			url:"${ctx}/reservoir/deletes",
			data: {sluiceIds:sluiceIds},
			type: "post",
			async: false,//非异步
			success: function(msg){
				if(msg==1){
					layer.confirm('删除成功', {
		        		  btn: ['确定'] //按钮
		        		}, function(){	
	      			document.forms[0].action="${ctx}/reservoir/list?state=41";
			    		document.forms[0].submit();
		        	});
				}
			}
		});
	}
	//水库全选和反选
	function doSelectSluiceAll(){
		$("input[name=selectedRow]").prop("checked", $("#selAll").is(":checked"));
	}
	</script>
</body>
</html>