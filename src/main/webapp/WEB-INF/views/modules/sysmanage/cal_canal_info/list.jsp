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
	  
	  </style>
</head>
<body>
	<form  action="${ctx}/cal_canal_info/list" method="post">
	<!-- 页面主体start -->
	<div class="down-main" id="canal">
		
		<!-- 页面主体右侧内容start -->
		<div class="right-product right-full" style="/*margin-left:55px*/;">
			<section id="layout" ng-app="doc.ui-layout">
			<div ui-layout class="layout-mock">
				<ui-layout options="{ flow : 'column' }">
				
				
				<sidebar class="east-back left-back" >
					<ul id="tree" class="nav nav-pills nav-stacked">
						<li><h3 style="margin-left: 10px;">渠道等级</h3>
						</li>
						<li id="treeDemo" class="ztree">
						</li>
					</ul>
				</sidebar>
				<div class="center-back right-back">
			        <div class="container-fluid">
			          <div class="info-center">
			            <div class="page-header">
			              	<div class="pull-left">
			                	<h4>灌区信息化平台>系统管理>渠道管理</h4>
			            	</div>
			            </div> 
			            <!-- <div class="clearfix"></div> -->
			              <div>
			                <div  style="margin-top:0px">
								<template>
									<el-tabs v-model="type" @tab-click="handleClick" style="width: 100%">
										<el-tab-pane label="渠道管理" name="1">
                                            <el-button @click="addchannel()" style="margin: 0px 0px 10px 0px;height:33px;width:100px;" size="medium" type="success" data-toggle="modal" data-target="#myModal" icon="el-icon-plus">新 增</el-button>
											<el-table  :data="channellist.slice((currentPage-1)*pagesize,currentPage*pagesize)"  border :row-class-name="tableRowClassName"  style="width: 100%" border stripe :header-cell-style="{color:'#333',fontFamily:'MicrosoftYaHeiUI',fontSize:'15px',fontWeight:900}"
													   :row-style="{fontSize:'12px',color:'#666',fontFamily:'MicrosoftYaHeiUI'}">
												<%--<el-table-column type="selection" width="65" show-overflow-tooltip align="center"></el-table-column>--%>
												<el-table-column label="渠道名称" prop="canalName"  show-overflow-tooltip align="center"></el-table-column>
												<el-table-column label="渠道编码" prop="canalCode"  show-overflow-tooltip align="center"></el-table-column>
												<el-table-column label="所在行政区" prop="aname"  show-overflow-tooltip align="center"></el-table-column>
												<el-table-column label="所在水管区" prop="wname"  show-overflow-tooltip align="center"></el-table-column>
											<%--	<el-table-column label="照片" prop="syswaterareaCode"  show-overflow-tooltip align="center">
													<template scope="props">
														<p v-if="scope.row.sfgh=='1'"></p>
														<p v-if="scope.row.sfgh=='2'">暂无照片</p>
													</template>
												</el-table-column>--%>
												<el-table-column label="地址" prop="canalAddr" show-overflow-tooltip align="center"></el-table-column>
												<el-table-column label="备注" prop="cciRemark" show-overflow-tooltip align="center"></el-table-column>
												<el-table-column label="操作" show-overflow-tooltip align="center" >
													<template scope="props">
														<el-button @click="doEdit(props.row)" icon="el-icon-setting" size="small" type="text" >修改</el-button>
														<el-button @click="doDelete(props.row)" icon="el-icon-delete" size="small" type="text" >删除</el-button>
													</template>
												</el-table-column>
											</el-table>
											<el-pagination @size-change="handleSizeChange" @current-change="handleCurrentChange" :page-sizes="[10, 20, 30, 40]" :current-page.sync="currentPage" :page-size="pagesize" layout="total, prev, pager, next" :total="channellist.length" align="right" style="margin-top:10px;"></el-pagination>
										</el-tab-pane>
										<%--<el-tab-pane label="渠道照片" name="2">
											<el-button @click="addchannel()" style="margin-left: 10px;height:33px;width:100px;" size="medium" type="success" data-toggle="modal" data-target="#myModal" icon="el-icon-plus">新 增</el-button>
											<el-table  :data="photolist.slice((currentPage-1)*pagesize,currentPage*pagesize)"  border :row-class-name="tableRowClassName"  style="width: 100%" border stripe :header-cell-style="{color:'#333',fontFamily:'MicrosoftYaHeiUI',fontSize:'14px',fontWeight:900}"
													   :row-style="{fontSize:'12px',color:'#666',fontFamily:'MicrosoftYaHeiUI'}">
												<el-table-column label="渠道名称" prop="canalName"  show-overflow-tooltip align="center"></el-table-column>
												<el-table-column label="渠道编码" prop="canalCode"  show-overflow-tooltip align="center"></el-table-column>
												<el-table-column label="所在行政区编码" prop="sysareaCode"  show-overflow-tooltip align="center"></el-table-column>
												<el-table-column label="所在水管区编码" prop="syswaterareaCode"  show-overflow-tooltip align="center"></el-table-column>
												<el-table-column label="照片" prop="canalPhotoimg" show-overflow-tooltip align="center" @click="showPhoto()"></el-table-column>
												<el-table-column label="备注" prop="ccphotoRemark" show-overflow-tooltip align="center"></el-table-column>
												<el-table-column label="操作" show-overflow-tooltip align="center" >
													<template scope="props">
														<el-button @click="doEdit(props.row)" icon="el-icon-setting" size="small" type="text" >修改</el-button>
														<el-button @click="doDelete(props.row)" icon="el-icon-delete" size="small" type="text" >删除</el-button>
													</template>
												</el-table-column>
											</el-table>
											<el-pagination @size-change="handleSizeChange" @current-change="handleCurrentChange" :page-sizes="[10, 20, 30, 40]" :current-page.sync="currentPage" :page-size="pagesize" layout="total, prev, pager, next" :total="photolist.length" align="right" style="margin-top:10px;"></el-pagination>
										</el-tab-pane>--%>
									<%--	<el-tab-pane label="渠道闸门" name="3">
											<el-button @click="addchannel()" style="margin-left: 10px;height:33px;width:100px;" size="medium" type="success" data-toggle="modal" data-target="#myModal" icon="el-icon-plus">新 增</el-button>
											<el-table  :data="slucelist.slice((currentPage-1)*pagesize,currentPage*pagesize)"  border :row-class-name="tableRowClassName"  style="width: 100%" border stripe :header-cell-style="{color:'#333',fontFamily:'MicrosoftYaHeiUI',fontSize:'14px',fontWeight:900}"
													   :row-style="{fontSize:'12px',color:'#666',fontFamily:'MicrosoftYaHeiUI'}">
												<el-table-column label="所属渠道" prop="canalName"  show-overflow-tooltip align="center"></el-table-column>
												<el-table-column label="闸门编码" prop="sluiceCode"  show-overflow-tooltip align="center"></el-table-column>
												<el-table-column label="照片" prop="sluicePhoto"  show-overflow-tooltip align="center"></el-table-column>
												<el-table-column label="照片编号" prop="sluicePhotoNo"  show-overflow-tooltip align="center"></el-table-column>
												<el-table-column label="闸门类型" prop="sluiceType" show-overflow-tooltip align="center"></el-table-column>
												<el-table-column label="修建时间" prop="sluiceBuildTime" show-overflow-tooltip align="center"></el-table-column>
												<el-table-column label="维修时间" prop="sluiceRepairTime" show-overflow-tooltip align="center"></el-table-column>
												<el-table-column label="备注" prop="ccsulRemark" show-overflow-tooltip align="center"></el-table-column>
												<el-table-column label="操作" show-overflow-tooltip align="center" >
													<template scope="props">
														<el-button @click="doEdit(props.row)" icon="el-icon-setting" size="small" type="text" >修改</el-button>
														<el-button @click="doDelete(props.row)" icon="el-icon-delete" size="small" type="text" >删除</el-button>
													</template>
												</el-table-column>
											</el-table>
											<el-pagination @size-change="handleSizeChange" @current-change="handleCurrentChange" :page-sizes="[10, 20, 30, 40]" :current-page.sync="currentPage" :page-size="pagesize" layout="total, prev, pager, next" :total="slucelist.length" align="right" style="margin-top:10px;"></el-pagination>
										</el-tab-pane>--%>
										<el-tab-pane label="渠道建筑物" name="4">
											<el-button @click="addchannel()" style="margin: 0px 0px 10px 0px;height:33px;width:100px;" size="medium" type="success" data-toggle="modal" data-target="#myModal" icon="el-icon-plus">新 增</el-button>
											<el-table  :data="buildinglist.slice((currentPage-1)*pagesize,currentPage*pagesize)"  border :row-class-name="tableRowClassName"  style="width: 100%" border stripe :header-cell-style="{color:'#333',fontFamily:'MicrosoftYaHeiUI',fontSize:'15px',fontWeight:900}"
													   :row-style="{fontSize:'12px',color:'#666',fontFamily:'MicrosoftYaHeiUI'}">
												<el-table-column label="所属渠道" prop="canalName"  show-overflow-tooltip align="center"></el-table-column>
												<el-table-column label="建筑编号" prop="buildingCode"  show-overflow-tooltip align="center"></el-table-column>
												<el-table-column label="建筑名称" prop="buildingName"  show-overflow-tooltip align="center"></el-table-column>
												<el-table-column label="建筑类型" prop="buildingType"  show-overflow-tooltip align="center"></el-table-column>
												<el-table-column label="照片" prop="buildingPhoto"  show-overflow-tooltip align="center">
													<template scope="scope">
														<div @click="updateImage(scope.row);" @click="dialogVisible = true">
															<el-image style="height: 50px" :src="(imagePath)+(scope.row.buildingPhoto)" fit="contain"></el-image>
														</div>
													</template>
												</el-table-column>
												<el-table-column label="照片编号" prop="buildingPhotoNo"  show-overflow-tooltip align="center"></el-table-column>
												<el-table-column label="修建时间" prop="buildingBuildTime" show-overflow-tooltip align="center"></el-table-column>
												<el-table-column label="维修时间" prop="buildingRepairTime" show-overflow-tooltip align="center"></el-table-column>
												<el-table-column label="备注" prop="ccbremark" show-overflow-tooltip align="center"></el-table-column>
												<el-table-column label="操作" show-overflow-tooltip align="center" >
													<template scope="props">
														<el-button @click="doEdit(props.row)" icon="el-icon-setting" size="small" type="text" >修改</el-button>
														<el-button @click="doDelete(props.row)" icon="el-icon-delete" size="small" type="text" >删除</el-button>
													</template>
												</el-table-column>
											</el-table>
											<el-pagination @size-change="handleSizeChange" @current-change="handleCurrentChange" :page-sizes="[10, 20, 30, 40]" :current-page.sync="currentPage" :page-size="pagesize" layout="total, prev, pager, next" :total="buildinglist.length" align="right" style="margin-top:10px;"></el-pagination>
											<!-- 修改图片 -->
											<el-dialog title="修改图片" :modal-append-to-body="false"  :visible.sync="dialogVisible" width="30%">
												<el-upload class="upload-demo" :data="map" :on-success="onSuccess" :on-error="onError" :action="canalBuildingUpdateImageUrl" <%--:on-change="imageChange"--%>  list-type="picture">
													<el-button slot="trigger" size="small" type="primary" id="selece">开始上传</el-button>
													<div slot="tip" class="el-upload__tip">只能上传jpg/png文件，且不超过500kb</div>
												</el-upload>
											</el-dialog>
										</el-tab-pane>
									</el-tabs>
								</template>

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
	// var zNodes=[];
	// var canalId;
	//页面加载完执行
	/*function load(id){
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
	};*/
	//导航树的配置
	/*var setting = {
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
	};*/
	//树结构json数据
	// var zNodes=[];

	//拿到后台的json数据赋值给zNodes
	/*function showNodes(threeLevelPermission){
		var zNode;
		<c:forEach items="${calCanalInfoList}" var="calCanalInfo">
			var id   ="${calCanalInfo.id}";
			var pId  ="${calCanalInfo.canalParentId}";
			var name ="${calCanalInfo.canalName}";
			var level="${calCanalInfo.canallevelCode}";
			zNode={id:id, pId:pId, name:name,click:"start('${calCanalInfo.id}',1,'"+threeLevelPermission+"')", open:true};
			zNodes.push(zNode);
		</c:forEach>
	}*/
	
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