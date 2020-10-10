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
    <%--<script type="text/javascript" src="${ctxstc}/adapters/ztree/js/jquery.ztree.excheck.js"></script>--%>
    <script type="text/javascript" src="${ctxstc}/adapters/ztree/js/jquery.ztree.exedit.js"></script>
	
	 <script src="${ctxstc}/adapters/layui/layer/layer.js"></script>

	<script type="text/javascript" src="${ctxstc}/js/vue.js"></script>
	<link rel="stylesheet" href="${ctxstc}/js/element-ui/theme-chalk/index.css" type="text/css">
	<script type="text/javascript" src="${ctxstc}/js/element-ui/index.js"></script>
	<style>
	  
		.topbar-nav-item a{color: red;}
		.topbar-nav-item a:hover{color: blue;}
		
		
		::-webkit-scrollbar{
  		display:none;
		}
		.table-header thead{color:#4b5261;font-weight:600;font-size: 15px }
	  </style>
</head>
<body>
	<form  action="${ctx}/cal_canal_info/list" method="post">
	<!-- 页面主体start -->
	<div class="down-main" id="scroll">
		<!-- 页面主体右侧内容start -->
		<div class="right-product right-full" style="/*margin-left:55px*/;">
			<section id="layout" ng-app="doc.ui-layout">
			<div ui-layout class="layout-mock">
				<ui-layout options="{ flow : 'column' }">
				
				<sidebar class="east-back left-back" >
					<ul id="tree" class="nav nav-pills nav-stacked">
						<li><h4 style="margin-left: 10px;">渠道等级</h4></li>
						<li id="treeDemo" class="ztree"></li>
					</ul>
				</sidebar>
				
				<div class="center-back right-back" >
					<div class="container-fluid">
						<div class="info-center">
							<div class="page-header">
								<div class="pull-left">
									<h4>灌区信息化平台>智慧灌溉>智慧配水</h4>
								</div>
							</div>
							
							<div class="search-box row">
								<div class="col-md-12">
									<div class="<%--btn-group--%> pull-left" role="group" aria-label="...">
										<button type="button" class="btn btn-default" onclick="addWaterPlan()" >
											<span class="glyphicon glyphicon-plus">
											</span>新建配水计划
										</button>
										
<%--										<button type="button" class="btn btn-default">
											<span class="glyphicon glyphicon-trash"></span>删除配水计划
										</button>--%>
										
										<div class="form-group">
			                              <span class="pull-left form-span">---年份:</span>
			                              <select class="form-control" onchange="yearChange(this[selectedIndex].value);">
			                              		<option>请选择</option>
<%--			                              		<c:forEach items="${needWaterReportList}" var="needWaterReport" >
				                                	<option>${needWaterReport.year}</optio>
			                                	</c:forEach>--%>
											  <option v-for="item in yearList" v-text="item"></option>
			                              </select>
			                         </div>
									</div>
									
								</div>
							</div>
							
							<div class="clearfix"></div>
							<div class="table-margin">
								<table class="table table-bordered table-header">
									<thead>
											<tr>
												<td class="w5"><input type="checkbox" /></td>
												<td class="w5" rowspan="3">配水年份</td>
												<td class="w5" rowspan="3">所属河道</td>
												<td class="w5" rowspan="3">水权面积</td>
												<td class="w5" rowspan="3">实配面积</td>
												<td class="w5" rowspan="3">配水人</td>
												<td class="w5" rowspan="3">配水日期</td>
												<td class="w5" rowspan="3">操作</td>
											</tr>	
									</thead>
									<tbody id="table_list">
										
									</tbody>
									
									<tfoot>
										<tr>
											<td colspan="22">
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
	<script type="text/javascript" src="${ctxstc}/js/custom/plan/water_plan_new.js"></script>
	<script type="text/javascript" src="${ctxstc}/datepicker/WdatePicker.js "></script>
	<script>
	var zNodes=[];
/*	function load(){
		
		
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
		
		
		showNodes();
		$.fn.zTree.init($("#treeDemo"), setting, zNodes);
		
		var canalId2 = "${canalId}";
		start(canalId2,1);
		// delCookie("canalId");
	}*/
	
	//导航树的配置
	/*var setting = {
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
	};*/
	
	//树结构json数据
	var zNodes=[];
	
	//树结构json数据
	

	//拿到后台的json数据赋值给zNodes
	function showNodes(){
		var zNode;
		<c:forEach items="${calCanalInfoList}" var="calCanalInfo">
			var id   ="${calCanalInfo.id}";
			var pId  ="${calCanalInfo.canalParentId}";
			var name ="${calCanalInfo.canalName}";
			var level="${calCanalInfo.canallevelCode}";
			if(level<3){
				zNode={id:id, pId:pId, name:name,click:"start('${calCanalInfo.canalCode}',1);", open:true};
				zNodes.push(zNode);
			}
			
			/* if(level==0||level==1){
				zNode={id:id, pId:pId, name:name,click:"start('${calCanalInfo.id}',1);", open:true};
			}else{
				zNode={id:id, pId:pId, name:name,click:"start('${calCanalInfo.id}',1);", open:false};
			}
			zNodes.push(zNode); */
		</c:forEach>
	}
	
	var newCount = 1;
	function addHoverDom(treeId, treeNode) {
		//alert(treeId+"122222222222222222222222")
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