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
    <link type="text/css" rel="stylesheet" href="${ctxstc}/css/selfdefault.css" title="" />
    <link rel="stylesheet" href="https://unpkg.com/element-ui@1.4/lib/theme-default/index.css">
	<script type="text/javascript" src="${ctxstc}/js/vue.js"></script>
	<script src="https://unpkg.com/element-ui@1.4/lib/index.js"></script>
	 <script src="${ctxstc}/adapters/layui/layer/layer.js"></script>
	<style>
	  
		.topbar-nav-item a{color: red;}
		.topbar-nav-item a:hover{color: blue;}
		::-webkit-scrollbar{display:none;}
		.upload-demo .el-upload-list{display:none;}
	  
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
						<li><h4 style="margin-left: 10px;">水管区域等级</h4>
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
									<h4>灌区信息化平台>智能决策配水>需水提报</h4>
								</div>
							</div>
							
							<div class="search-box row">
								<div class="col-md-12">
									<div class="btn-group pull-left" role="group" aria-label="...">
										<button type="button" id="add_need_water" style="display: none" class="btn btn-default" onclick="addNeedWater()" >
											<span class="glyphicon glyphicon-plus">
											</span>提报计划
										</button>
										
										<button id="delete_need_water" style="display: none"  type="button" class="btn btn-default">
											<span class="glyphicon glyphicon-trash"></span>删除计划
										</button>
										<span id="edit_need_water"/>
										<span id="detail_need_water" />
									</div>
									<div class="form-group">
			                              <span class="pull-left form-span">---年份:</span>
			                              <select class="form-control" onchange="yearChange(this[selectedIndex].value);">
			                              		<option>请选择</option>
			                              		<c:forEach items="${needWaterReportList}" var="needWaterReport" varStatus="status" >
												         <c:choose> 
												           <c:when test="${status.index==0}">
												                <option value="${needWaterReport.year}"  selected>${needWaterReport.year}</option>
												           </c:when>
												           <c:otherwise>
												                <option value="${needWaterReport.year}">${needWaterReport.year}</option>
												           </c:otherwise>
												        </c:choose> 
			                                	</c:forEach>
			                              </select>
			                         </div>
			                         <!-- Excel导入数据 -->
			                         <div id="excelPoi">
				                         <div id="excelFrom" style="display:inline">
				                         	 <input id="labelText" type="text" style="font-size:14px;text-indent:1em;display:inline;" /><!-- ExcelImport -->
					                         <el-upload class="upload-demo" :on-success="handleSuccess" ref="upload" :data="map" :on-change="handleChange" action="${ctx}/need_water/excel_import" :auto-upload="false" style="display:inline;margin-left:-90px;">
												  <el-button id="labelForm" slot="trigger" size="small" >选取文件</el-button>&nbsp;&nbsp;>>>
												  <el-button id="#uploadExcel" style="margin-left: 10px;height:33px;" size="medium" type="primary" @click="submitUpload">点击上传</el-button>
		 									 </el-upload>
	 									</div>
	 									<div style="display:inline;position: absolute;right: 5%" >
	 										<el-button type="primary" style="height:34px;" @click="downloadExcel">下载Excel模板</el-button>
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
											<td class="w10">表单编号</td>
											<!-- <td class="w10">判定面积</td> -->
											<td class="w10">土质</td>
											<td class="w10">作物类型</td>
											<td class="w10">提报面积</td>
											<td class="w10">年份</td>
											<td class="w10">提报人</td>
											<td class="w10">电话</td>
											<td class="w10">操作</td>
										</tr>
									</thead>
									<tbody id="table_list">
										
									</tbody>
									
									<tfoot>
										<tr>
											<td colspan="2">提报总亩数</td>
											<td id="totalArea" colspan="8"></td>
									    </tr>
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
	var excelPoi = new Vue({
		el:'#excelPoi',
		data:{
			isExcel:'',
			map:{},
		},
		methods:{
			submitUpload:function(){
				debugger
				 var _this = this;
				if(_this.isExcel == false){
					_this.$message.error('Excel文件格式错误，请选择正确格式的Excel文件!');
				}else{
					_this.map.code =JSON.stringify(code);
					_this.$refs.upload.submit();
				}
				
			},
			handleSuccess:function(response, file, fileList){
				debugger
				var _this = this;
				if(response=="success"){
					_this.$message.success('Excel文件上传成功!');
				}else{
					_this.$message.error("第"+(Number(response)+3)+"行,第1列表格为空或填写不规范，请重新审查提交！");
				}
			},
			//下载Excel模板
			downloadExcel:function(){
				debugger
				var _this = this;
				window.location.href="${ctx}/need_water/downLoadExcel";
				
			},
			handleChange:function(file, fileList){
				var _this = this;
				debugger
				const isExcel = (file.name.substring(file.name.lastIndexOf(".")+1)=="xlsx")||(file.name.substring(file.name.lastIndexOf(".")+1)=="xls");
		        if (!isExcel) {
		        	_this.$message.error('请选择正确格式的Excel文件!');
		        }
		        $("#labelText").val(file.name);
		        _this.isExcel = isExcel;
		        return isExcel;
			},
		},
		created:function(){
		var _this = this;
		},
	});
	var zNodes=[];
	var threeLevelPermission = [];
	function load(id){
		//三级权限code数组============================================================
		
		
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
		
		
		setCookie("year", ${year});
		//start()
		
		per=threeLevelPermission;
		
		showNodes(threeLevelPermission);
		$.fn.zTree.init($("#treeDemo"), setting, zNodes);
		
		
		//var canalId = getCookie("canalId");
		///if(canalId!=null){
		//	start(canalId,1);
		//}else{
			var canalId2 = "${canalId}";
			
			var myDate = new Date();//获取系统当前时间
			var myYear =myDate.getFullYear(); //获取完整的年份(4位,1970-????)
			setCookie("year",myYear);
			start(canalId2,1,threeLevelPermission);
			debugger
			//yearChange(myYear);
			//alert(myDate.getFullYear());
			delCookie("canalId");
		//}
		
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
	//拿到后台的json数据赋值给zNodes
	function showNodes(threeLevelPermission){
		var zNode;
		<c:forEach items="${calCanalInfoList}" var="calCanalInfo">
			var id   ="${calCanalInfo.id}";
			var pId  ="${calCanalInfo.canalParentId}";
			var name ="${calCanalInfo.canalName}";
			var level="${calCanalInfo.canallevelCode}";
				zNode={id:id, pId:pId, name:name,click:"start('${calCanalInfo.canalCode}',1,'"+threeLevelPermission+"','${calCanalInfo.canalCode}');", open:true};
			zNodes.push(zNode);
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
	
	var code;
	function start(canalId,page,threeLevelPermission,Tcode){
		/* if(Tcode==null||Tcode==""){
			$("#excelFrom").hide();
		}else{
			$("#excelFrom").show();
			
		} */
		code = Tcode;
		debugger
		setCookie("canalId", canalId);
		var year = getCookie("year");
		
		document.getElementById("totalArea").innerHTML="";
		$("#table_list").empty();
		/*$("#totalArea"). */
		$.ajax({
			url:"${ctx}/need_water/total_area",
			data: {canalId:canalId,year:year},
			type: "post",
			async: false,//非异步
			success: function(msg){
				if(msg!=""){
					var totalArea=document.getElementById("totalArea");
					totalArea.innerHTML=msg+"亩";
					$.ajax({
						url:"${ctx}/need_water/page",
						data: {canalId:canalId,page:page,year:year},
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
													newTdTag2.innerHTML=msg[i].reportNo;
												/* var newTdTag3 = document.createElement("td");
													newTdTag3.innerHTML=msg[i].canalDecisionArea; */
												
												var newTdTag3 = document.createElement("td");
												    var soilType = msg[i].soilType;
													newTdTag3.innerHTML=soilType;
												var newTdTag4 = document.createElement("td");
													newTdTag4.innerHTML=msg[i].cropsType;
												var newTdTag5 = document.createElement("td");
													newTdTag5.innerHTML=msg[i].area;	
													
												var newTdTag6 = document.createElement("td");
													newTdTag6.innerHTML=msg[i].year;
												var newTdTag7 = document.createElement("td");
													newTdTag7.innerHTML=msg[i].reportPeopleName;
												var newTdTag8 = document.createElement("td");
													newTdTag8.innerHTML=msg[i].phoneNumber;	
													
												
												var newTdTag11 = document.createElement("td");
														var sonid = JSON.stringify(msg[i].id);
														if(msg[i].reportPeopleName!=null){
															newTdTag11.innerHTML=showThreeLevelPermission(threeLevelPermission,sonid);
														}else{
															newTdTag11.innerHTML=="";
														}
													newTrTag.appendChild(newTdTag1);
													newTrTag.appendChild(newTdTag2);
													newTrTag.appendChild(newTdTag3);
													newTrTag.appendChild(newTdTag4);
													newTrTag.appendChild(newTdTag5);
													newTrTag.appendChild(newTdTag6);
													newTrTag.appendChild(newTdTag7);
													newTrTag.appendChild(newTdTag8);
													/* newTrTag.appendChild(newTdTag9); */
													newTrTag.appendChild(newTdTag11);
												currentTag.appendChild(newTrTag);
									}
							
						}
					});
					
					 $.post("${ctx}/need_water/page_nav").success(function (response) {
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
						    alert("列表请求出错");
						});
				}
			}
			
		})
		
		
	}
	
	//新增需水报表
	function addNeedWater(){
		var canalId = getCookie("canalId");
		//alert(canalId);
		delCookie("canalId");
		if(canalId==null||canalId==""){
			layer.alert('请先选择提报渠道！', {icon: 0});
		}else{
			//打开添加窗口
			//alert("111");
			 layer.open({
				 	id: 'insert-need-water-form'
			        ,type: 2 //此处以iframe举例
			        ,title: '新增需水报表'
			        ,area: ['680px', '440px']
			        ,shade: 0.8
			        ,maxmin: true
			        ,content: '${ctx}/need_water/add_need_water_page?canalId='+canalId
			        ,btn: ['确定', '关闭'] //只是为了演示
			        ,yes: function(){
			        	//子页面提交
			        	insertSubmit();
			        	layer.confirm('你的预测添加成功', {
			        		  btn: ['确定'] //按钮
			        		}, function(){
			        			
		        			document.forms[0].action="${ctx}/need_water/list?state=32";
				    		document.forms[0].submit();
			        		layer.msg('的确很重要', {icon: 1})
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
	
	//修改需水报表
	function doEdit(id){
		//	alert(id);
			layer.open({
			 	id: 'edit-need-water-form'
		        ,type: 2 //此处以iframe举例
		        ,title: '修改需水报表'
		        ,area: ['680px', '440px']
		        ,shade: 0.8
		        ,maxmin: true
		        ,content: '${ctx}/need_water/edit_need_water_page?id='+id
		        ,btn: ['确定', '关闭'] //只是为了演示
		        ,yes: function(){
	        	//子页面提交
	        		editSluiceSiteSubmit();
	        		layer.confirm('你的预测编辑成功', {
		        		  btn: ['确定'] //按钮
		        		}, function(){
	      				document.forms[0].action="${ctx}/need_water/list?state=32";
			    		document.forms[0].submit();
		        	} );
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
			//alert("44444444444444444444");
		   var frameId=document.getElementById("edit-need-water-form").getElementsByTagName("iframe")[0].id;
		   $('#'+frameId)[0].contentWindow.mySubmit();
		}
	
	
	 function insertSubmit(){
		   var frameId=document.getElementById("insert-need-water-form").getElementsByTagName("iframe")[0].id;
		   $('#'+frameId)[0].contentWindow.mySubmit();
	  }
	 //查询条件改变
	 function yearChange(year){
		 setCookie("year", year);
		 var canalId = getCookie("canalId");
		 start(canalId,1,threeLevelPermission);
	 }
	 
	</script>
</body>
</html>