<%@ page language="java" contentType="text/html; charset=utf-8" pageEncoding="utf-8"%>
<%@ include file="/WEB-INF/views/base.jsp"%>

<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
	<meta http-equiv="Content-Type" content="text/html; charset=utf-8">
	<meta http-equiv="X-UA-Compatible" content="IE=Edge">
	<meta name="viewport" content="width=device-width, initial-scale=1,maximum-scale=1, user-scalable=no">
	<title>灌区信息化平台</title>
		<link type="text/css" rel="stylesheet" href="${ctxstc}/css/selfdefault.css" title="" />
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
	<script src="${ctxstc}/adapters/layui/layer/layer.js"></script>
	<script src="${ctxstc}/adapters/layui/layer/layer.js"></script>
<%-- 	<script type="text/javascript" src="${ctxstc}/js/vue.js"></script>
	<script src="${ctxstc}/adapters/elementui/1.4.3/index.js"></script>
	<link rel="stylesheet" href="${ctxstc}/adapters/elementui/1.4.3/theme-default/index.css"> --%>
	<script type="text/javascript" src="${ctxstc}/js/vue.js"></script>
	<script src="https://unpkg.com/element-ui@1.4/lib/index.js"></script>
	<link rel="stylesheet" href="https://unpkg.com/element-ui@1.4/lib/theme-default/index.css">

	<style type="text/css">
		#visFlow .el-dialog--small{width:60%}
		.topbar-nav-item a{color: red;}
		.topbar-nav-item a:hover{color: blue;}
		::-webkit-scrollbar{display:none;}
		.upload-demo .el-upload-list{display:none;}
		.el-table .info-row {background: #c9e5f5;}
  		.el-table .positive-row {background: #e2f0e4;}
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
	<div class="down-main" id="visFlow">
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
						<li><h4 style="margin-left:20px;margin-top:20px">站点管理</h2>
						<input id="labelText" type="text" readonly v-model="canclName" placeholder=" 请选择相关渠道" style="border-radius:2px;font-size:14px;width:80%;height:28px;margin-left: 20px;padding-left:5px;" /><!-- ExcelImport -->
						</li>
						<ul id="treeDemo" style="margin-left:15px;" class="ztree">
						</ul>
					</ul> 
				</sidebar>
				
				<div class="center-back right-back" >
					<div class="container-fluid">
						<div class="info-center">
							<div class="page-header">
								<div class="pull-left">
									<h4>灌区信息化平台>站点管理>水位站管理</h4>
								</div>
							</div>
							 
							<div class="search-box row" style="display:flex;">
								
								<!-- Excel导入数据 -->
								 <div style="margin-right: 20px;"><el-button onclick="add()" style="margin-left: 10px;height:33px;width:100px;" size="medium" type="success">新 增</el-button></div>
		                         <div id="excelPoi">
			                         <div id="excelFrom" style="display:inline">
			                         <span class="pull-left form-span" style="font-size:14px;margin-left: 10px;">水位流量关系表导入:</span>
			                         	 <input id="labelText" type="text" readonly v-model="ExcelText" placeholder="请先下载Excel模板" style="font-size:14px;text-indent:1em;display:inline;" /><!-- ExcelImport -->
				                         <el-upload class="upload-demo" :on-success="handleSuccess" :data="map" ref="upload" :on-change="handleChange" action="${ctx}/site_water_manage/excel_import" :auto-upload="false" style="display:inline;margin-left:-90px;">
											  <el-button id="labelForm" slot="trigger" size="small" >选取文件</el-button>&nbsp;&nbsp;>>>
											  <el-button id="#uploadExcel" style="margin-left: 10px;height:33px;" size="medium" type="primary" @click="submitUpload">点击上传</el-button>
	 									 </el-upload>
									 </div>
									 <div style="display:inline;position: absolute;right: 5%;top:8%" >
										 <el-button type="primary" style="height:34px;" @click="downloadExcel">下载Excel模板</el-button>
									 </div>
								</div>
							</div>
							<div class="clearfix"></div>
							<div class="table-margin">
								<table class="table table-bordered table-header">
									<thead>
										<tr>
											<td class="w10">站点名称</td>
											<td class="w10">站点编码</td>
											<td class="w10">站点类型</td>
											<td class="w10">建设时间</td>
											<td class="w10">站点卡号</td>
											<td class="w10">经度</td>
											<td class="w10">纬度</td>
											<td class="w10">操作</td>
										</tr>
									</thead>
									<tbody id="table_list">
										<tr v-for="tau in tabData">
											<td>{{tau.deviceWaterName}}</td>
											<td>{{tau.deviceWaterCode}}</td>
											<td v-bind:style="{color:(tau.swiDevicemodelCode==8?'#E6A23C':'')}">{{tau.swiDevicemodelCode=='5'?'雷达水位站':'明渠流量站'}}</td>
											<td>{{tau.swiBuildTime}}</td>
											<td>{{tau.swiSimcard}}</td>
											<td>{{tau.swiLongitude}}</td>
											<td>{{tau.swiLatitude}}</td>
											<td id="handle">
												<a href="javascript:void(0);" @click="doEdit(tau.id);">修改</a> | 
												<a href="javascript:void(0);" @click="doDelete(tau.id);">删除</a> | 
												<a href="javascript:void(0);" @click="doDetail(tau.id);">详情</a>
											</td>
										</tr>
									</tbody>
									<tfoot>
										<tr>
											<td colspan="10">
												<div class="pull-right">
													<el-pagination @size-change="handleZizeChange1" @current-change="handleZurrentChange"  :current-page.sync="currentZage" :page-size="pageZize" layout="total, prev, pager, next" :total="count" align="right"></el-pagination>
												</div>
												</td>
												</tr>
										
									</tfoot>
								</table>
							</div>
							<!-- ===========水位流量关系表修改 -->
								<div>
									<el-dialog  title="水位流量关系表" :visible.sync="dialogVisible" width="60%">
										<template>
 											 <el-table :data="calList.slice((currentPage-1)*pagesize,currentPage*pagesize)"  border :row-class-name="tableRowClassName" style="width: 100%">
 											 	<el-table-column prop="upperLimit" label="上限" align="center"></el-table-column>
 											 	<el-table-column prop="downerLimit" label="下限" align="center"></el-table-column>
 											 	<el-table-column prop="flow" label="流量" align="center"></el-table-column>
 											 	<el-table-column prop="createTime" label="创建日期" align="center"></el-table-column>
 											 	<el-table-column prop="updateTime" label="修改日期" align="center"></el-table-column>
 											 </el-table>
 											 <el-pagination @size-change="handleSizeChange" @current-change="handleSurrentChange" :page-sizes="[10, 20, 30, 40]" :current-page.sync="currentPage" :page-size="pagesize" layout="total, prev, pager, next" :total="calList.length" align="right" style="margin-top:10px;"></el-pagination>
 										</template>
									</el-dialog>
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
	<script type="text/javascript" src="${ctxstc}/js/custom/permission/show_three_level_permission.js"></script>
	<script type="text/javascript">
	var url ;
	for(var i=0;i<4;i++){
		  url=window.location.href.indexOf("/",url+1);
	}
	var localPath = window.location.href.substring(0,url);
		var visFlow = new Vue({
			el:'#visFlow',
			data:{
				tabData:[],//水位站的数据集合
				dialogVisible:false,
				calList:[],
				state:'0',
				count:0,
				currentPage:1,
				pagesize:'10',
				currentZage:1,
				pageZize:'10',
				isExcel:'',
				map:{},
				ExcelText:'',
				canclStu:{
					cancId:'',
					canclName:'',
					canclevl:'',
				},
				canclName:'',
			},
			methods:{
				tableRowClassName:function(row, index) {
			        if (index%2 !=0) {
			          return 'positive-row';
			        } 
			        return '';
			      },
				handleSizeChange:function(pagesize){
					var _this = this;
					_this.pagesize = pagesize;
				},
				handleSurrentChange:function(currentPage){
					var _this = this;
					_this.currentPage = currentPage;
				},
				handleZizeChange1:function(pagesize){
					var _this = this;
					_this.pageZize = pagesize;
				},
				handleZurrentChange:function(currentPage){
					var _this = this;
					debugger
					_this.currentZage = currentPage;
					start(_this.canclStu.cancId,_this.canclStu.canclName,_this.canclStu.canclevl,_this.currentZage,"");
				},
				submitUpload:function(){
					debugger
					 var _this = this;
					if(_this.ExcelText==""){
						_this.$message.error('请先选取文件');
					}else{
						if(_this.ExcelText!="水位流量关系表Excel模板.xls"&&_this.ExcelText!="水位流量关系表Excel模板.xlsx"){
							_this.$message.error('请选择模板Excel填入数据！');
						}else{
							if(_this.canclStu.canclName==""||_this.canclStu.canclevl==""){
								_this.$message.error('请先选择相关渠道');
							}else{
								if(_this.canclStu.canclevl!="2"){
									_this.$message.error('请选择具体渠道');
								}else{
									if(_this.isExcel == false){
										_this.$message.error('Excel文件格式错误，请选择正确格式的Excel文件!');
									}else{
										_this.map.waterId = _this.canclStu.cancId;
										_this.$refs.upload.submit();
									}
								}
							}
						}
						
					}
					
				},
				handleSuccess:function(response, file, fileList){
					debugger
					var _this = this;
					if(response=="success"){
						_this.state = '1';
						_this.canclStu = {};
						_this.canclName = "";
						_this.$message.success('数据导入成功!');
					}else if(response=="warn"){
						_this.$message.error('报表数据为空或格式不正确！');
					}
				},
				//下载Excel模板
				downloadExcel:function(){
					debugger
					var _this = this;
					window.location.href="${ctx}/site_water_manage/downLoadExcel";
				},
				handleChange:function(file, fileList){
					var _this = this;
					debugger
					const isExcel = (file.name.substring(file.name.lastIndexOf(".")+1)=="xlsx")||(file.name.substring(file.name.lastIndexOf(".")+1)=="xls");
			        if (!isExcel) {
			        	_this.$message.error('请选择正确格式的Excel文件!');
			        }else{
			        	if(_this.state==1){
			        		_this.ExcelText = "";
			        		_this.state = '0';
			        	}else{
			        		_this.ExcelText = file.name;
			        	}
			        	
			        }
			        _this.isExcel = isExcel;
			        return isExcel;
				},
			},
			created:function(){
				
			},
		});
		/*详情*/
		function doDetail(id){
			debugger
			$.post(localPath+"/site_water_manage/edit_page_data",{"id":id},function(data){
				visFlow.calList = data.data;
				if(visFlow.calList==null){
					layer.open({
						  title:"失败",
						  content: '未查询到该站的水位流量关系表',
						  shade: 0,//遮罩层
						  yes: function(index, layero){
							  parent.layer.close(inex);
							  }
						}); 
				}else{
					$(".ui-splitbar").css("background-color","rgba(0,0,0,0)");
					//.ui-splitbar{background-color: "red";}
					visFlow.dialogVisible=true;
				}
			});
		}
	</script>
	<script>
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
		$.fn.zTree.init($("#treeDemo"), setting, zNodes);
		
		var canalId2 = "${canalId}";
		var canalName = "${calCanalInfo.canalName}";
		start(canalId2,'0','&',1,threeLevelPermission);
		delCookie("canalId");
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
				zNode={id:id, pId:pId, name:name,click:"start('${calCanalInfo.canalCode}','${calCanalInfo.canalName}','${calCanalInfo.canallevelCode}',1,'"+threeLevelPermission+"');", open:true};
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
	function start(id,canalName,canalevl,page,threeLevelPermission){
		visFlow.canclStu.cancId = id;
		if(canalName!="0"){
			visFlow.canclStu.canclName = canalName;
			visFlow.canclStu.canclevl = canalevl;
			visFlow.canclName = canalName;
		}
		////alert(id);
		setCookie("id",id);
		//每次进来清除之前的查询结果
		//$("#table_list").empty();
		debugger
		$.ajax({
			url:"${ctx}/site_water_manage/page",
			data: {id:id,page:page},
			type: "post",
			async: true,//非异步
			success: function(msg){
				debugger
				visFlow.tabData = JSON.parse(msg).list;
				visFlow.count = JSON.parse(msg).count;
				
			}
		});
	}
	
	
	
	function add(){
		var id = getCookie("id");
		delCookie("id");
		if(visFlow.canclName==null||visFlow.canclName==""){
			alert("请先选择相关渠道");
		}else{
			//打开添加窗口
			//alert("111");
			 layer.open({
				 	id: 'add-waterSite-form'
			        ,type: 2 //此处以iframe举例
			        ,title: '为【'+visFlow.canclName+'】添加站点'
			        ,area: ['650px', '800px']
			        ,shade: 0.8
			        ,maxmin: true
			        ,content: '${ctx}/site_water_manage/add_page?id='+id
			        ,btn: ['确定', '关闭'] //只是为了演示
			        ,yes: function(){
			        	//子页面提交
			        	addWaterSiteSubmit();
			        	layer.confirm('你的预测添加成功', {
			        		  btn: ['确定'] //按钮
			        		}, function(){	
		        			document.forms[0].action="${ctx}/site_water_manage/list?state="+21;
				    		document.forms[0].submit();
			        		layer.msg('的确很重要', {icon: 1});
			        	});
			        }
			        ,btn2: function(){
			          layer.closeAll();
			        }
			        
			        ,zIndex: layer.zIndex //重点1
			        ,success: function(layero){
			        	//start(id,1,2);
			        	layer.setTop(layero); //重点2
			        }
			    });
		}
	}
	
	//水位站添加提交
	function addWaterSiteSubmit(){
	   var frameId=document.getElementById("add-waterSite-form").getElementsByTagName("iframe")[0].id;
	   $('#'+frameId)[0].contentWindow.mySubmit();
	   window.location.replace("${ctx}/site_water_manage/list?state="+21);
	 }
	
	
	
	//水位站编辑
	function doEdit(id){
		//alert(id);
		layer.open({
		 	id: 'edit-waterSite-form'
	        ,type: 2 //此处以iframe举例
	        ,title: '你编辑的渠道为'+id
	        ,area: ['650px', '800px']
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
	          window.parent.location.reload(); 
	        }
	        
	        ,zIndex: layer.zIndex //重点1
	        ,success: function(layero){
	        	//start(getCookie ("id"),1,2);
	          layer.setTop(layero); //重点2
	        }
	    });
	}
	//水位站编辑提交
	function editWaterSiteSubmit(){
		////alert("haha");
	   var frameId=document.getElementById("edit-waterSite-form").getElementsByTagName("iframe")[0].id;
	   $('#'+frameId)[0].contentWindow.mySubmit2();
	   window.location.replace("${ctx}/site_water_manage/list?state="+21);
	}
	
	//水位站单个删除
	function doDelete(id){
		////alert(id);
		//var pid = "";
		$.ajax({
			url:"${ctx}/site_water_manage/delete",
			type: "post",
			data: {id:id},
			async: false,//非异步
			success: function(msg){
				if(msg==1){
					//删除完后继续停留在照片标签内
					//start(getCookie ("id"),1,2);
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
	/* function doSpeedSiteEdit(id){
		////alert(id);
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
	} */
	//流速站编辑提交
	/* function editSpeedSiteSubmit(){
		////alert("haha");
	   var frameId=document.getElementById("edit-speedSite-form").getElementsByTagName("iframe")[0].id;
	   $('#'+frameId)[0].contentWindow.mySubmit2();
	} */
	
	//流速站单个删除
	/* function doSpeedSiteDelete(id){
		////alert(id);
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
	} */
	
	//流速站全选、全反选
	/* function doSelectSpeedSiteAll(){
		//jquery 1.6 前
		//$("input[name=selectedRow]").attr("checked", $("#selAll").is(":checked"));
		//prop jquery 1.6+建议使用
		$("input[name=selectedSpeedSiteRow]").prop("checked", $("#selSpeedSiteAll").is(":checked"));		
	} */
	
	
	//流量站编辑
	/* function doFlowrateSiteEdit(id){
		////alert(id);
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
	} */
	//流量站编辑提交
	/* function editFlowrateSiteSubmit(){
		////alert("haha");
	   var frameId=document.getElementById("edit-flowrateSite-form").getElementsByTagName("iframe")[0].id;
	   $('#'+frameId)[0].contentWindow.mySubmit2();
	} */
	
	//水位站单个删除
	function doFlowrateSiteDelete(id){
		////alert(id);
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
	/* function doSelectFlowrateSiteAll(){
		//jquery 1.6 前
		//$("input[name=selectedRow]").attr("checked", $("#selAll").is(":checked"));
		//prop jquery 1.6+建议使用
		$("input[name=selectedFlowrateSiteRow]").prop("checked", $("#selFlowrateSiteAll").is(":checked"));		
	} */
	
	
	
	
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
				  ////alert(222222);
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
				  ////alert(222222);
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
				  ////alert(222222);
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
		////alert(a);
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