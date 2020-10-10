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
	<script src="${ctxstc}/adapters/layui/layer/layer.js"></script>
	<script type="text/javascript" src="${ctxstc}/js/vue.js"></script>
	<link rel="stylesheet" href="${ctxstc}/js/element-ui/theme-chalk/index.css" type="text/css">
	<script type="text/javascript" src="${ctxstc}/js/element-ui/index.js"></script>
	<link type="text/css" rel="stylesheet" href="${ctxstc}/css/report_statis.css" title="" />
	<script rel="stylesheet" src="${ctxstc}/adapters/moment/moment.js"></script>
	<script type="text/javascript" src="${ctxstc}/js/echarts.min.js"></script>
	<style type="text/css">
		.el-table thead{color:#4b5261;font-weight:600;font-size: 15px }
		.el-table .positive-row {background: #e2f0e4;}
	</style>
</head>
<body>
<form  action="${ctx}/cal_canal_info/list" method="post">
	<!-- 页面主体start -->
	<div class="down-main" id="reportStatis" style="left:0;" >
		
		<!-- 页面主体右侧内容start -->
		<div class="right-product right-full">
			<section id="layout" ng-app="doc.ui-layout">
			<div ui-layout class="layout-mock">
				<ui-layout options="{ flow : 'column' }">
				
				<sidebar class="east-back left-back" >
					 <ul id="tree" class="nav nav-pills nav-stacked">
						<li><h4 style="margin-left:20px;margin-top:20px">渠道等级</h4></li>
						<li id="treeDemo" style="margin-left:15px;" class="ztree"></li>
					</ul> 
				</sidebar>
				
				<div class="center-back right-back" >
					<div class="container-fluid">
						<div class="info-center">
							<div class="page-header">
								<div class="pull-left">
									<h4>灌区信息化平台>报表分析>流量报表分析</h4>
								</div>
							</div>
							<div id="data_Average_Traffic" style="height:250px;width: 100%;">
							</div>
							<%--							<div id="data_Sum_Traffic" style="">
                                                        </div>--%>
							<div>
								<el-divider></el-divider>
							</div>
							<!-- <div class="clearfix"></div> -->
							<div id="dataTable" style="position: absolute;right: 10%;top:345px;" >
									<template>
									    <el-date-picker v-if="type=='1'" v-model="reportDay" type="date" placeholder="请选择报表日期" align="right"></el-date-picker>
									    <el-date-picker v-if="type=='2'" v-model="reportMonth" type="month" placeholder="请选择报表月份" align="right"></el-date-picker>
									    <%--<el-date-picker v-if="type=='3'" v-model="reportMonth" type="month" placeholder="请选择报表月份" align="right"></el-date-picker>--%>
									    <el-date-picker v-if="type=='3'" v-model="reportYear" type="year" placeholder="请选择报表年份" align="right"></el-date-picker>
									    <el-button size="medium" @click="selectDate(type,1)">点击查询</el-button>
									    <el-button size="medium" type="primary" @click="selectDate(type,2)" style="margin-left:30px;" :disabled="tableData.length==0">报表导出</el-button>
									</template>
							</div>
							<template>
								<el-tabs @tab-click="leftTabClick" tab-position="left" style="margin-top:5%;float: left;width: 10%" v-model="deviceType">
									<el-tab-pane label="雷达水位站" name="0"></el-tab-pane>
									<el-tab-pane label="明渠流量站" name="1"></el-tab-pane>
									<el-tab-pane label="雷达流速一体机" name="2"></el-tab-pane>
								</el-tabs>
							</template>
							<!-- 表格 -->
							<template>
								<el-tabs v-model="type"  @tab-click="topTabClick" style="float: left;width: 85%;margin-top: 2%" v-loading="loading" element-loading-text="数据加载中" element-loading-background="rgba(0, 0, 0, 0.8)">
									<el-tab-pane label="日报表" name="1">
										<el-table :data="(tableData || '').slice((currentPage-1)*pageSize,currentPage*pageSize)" header-align="center" border style="width: 100%">
											<el-table-column prop="waterName" label="渠道名称" align="center" ></el-table-column>
											<el-table-column prop="waterCode" label="渠道编码" align="center" ></el-table-column>
											<el-table-column prop="avgDayFlow" label="日均流量" align="center" ></el-table-column>
											<el-table-column prop="dayFlow" label="日引水量" align="center" ></el-table-column>
											<el-table-column prop="createTime" :formatter="dateFormat" label="查询时间" align="center"></el-table-column>
											<el-table-column label="详细查询" show-overflow-tooltip align="center" >
												<template scope="props">
													<el-button @click="detailReportQuery(props.row)" icon="el-icon-search" size="small" type="text" >查询</el-button>
												</template>
											</el-table-column>
										</el-table>
										<el-pagination @size-change="handleSizeChange" @current-change="handleCurrentChange"  :current-page.sync="currentPage" :page-size="pageSize" layout="total, prev, pager, next" :total="tableData!=null?tableData.length:0" align="right"></el-pagination>
									</el-tab-pane>
									<el-tab-pane label="月报表" name="2">
										<el-table :data="(tableData || '').slice((currentPage-1)*pageSize,currentPage*pageSize)"  border style="width: 100%">
											<el-table-column prop="waterName" label="渠道名称" align="center" ></el-table-column>
											<el-table-column prop="waterCode" label="渠道编码" align="center" ></el-table-column>
											<el-table-column prop="avgMonthFlow" label="月均流量" align="center" ></el-table-column>
											<el-table-column prop="monthFlow" label="月引水量" align="center" ></el-table-column>
											<el-table-column prop="createTime" :formatter="dateFormat" label="查询时间" align="center"></el-table-column>
											<el-table-column label="详细查询" show-overflow-tooltip align="center" >
												<template scope="props">
													<el-button @click="detailReportQuery(props.row)" icon="el-icon-search" size="small" type="text" >查询</el-button>
												</template>
											</el-table-column>
										</el-table>
										<el-pagination @size-change="handleSizeChange" @current-change="handleCurrentChange"  :current-page.sync="currentPage" :page-size="pageSize" layout="total, prev, pager, next" :total="tableData!=null?tableData.length:0" align="right"></el-pagination>
									</el-tab-pane>
									<el-tab-pane label="年报表" name="3">
										<el-table :data="(tableData || '').slice((currentPage-1)*pageSize,currentPage*pageSize)"  border style="width: 100%">
											<el-table-column prop="waterName" label="渠道名称" align="center" ></el-table-column>
											<el-table-column prop="waterCode" label="渠道编码" align="center" ></el-table-column>
											<el-table-column prop="avgYearFlow" label="年均流量" align="center" ></el-table-column>
											<el-table-column prop="yearFlow" label="年引水量" align="center" ></el-table-column>
											<el-table-column prop="createTime" :formatter="dateFormat" label="查询时间" align="center"></el-table-column>
											<el-table-column label="详细查询" show-overflow-tooltip align="center" >
												<template scope="props">
													<el-button @click="detailReportQuery(props.row)" icon="el-icon-search" size="small" type="text" >查询</el-button>
												</template>
											</el-table-column>
										</el-table>
										<el-pagination @size-change="handleSizeChange" @current-change="handleCurrentChange"  :current-page.sync="currentPage" :page-size="pageSize" layout="total, prev, pager, next" :total="tableData!=null?tableData.length:0" align="right"></el-pagination>
									</el-tab-pane>
								</el-tabs>
							</template>
							<%--详细查询dialog--%>
							<div>
								<el-dialog title="详细数据" :visible.sync="reportDialogModule.reportDialogVisible" @close="doCancel" width="70%" close-on-press-escape="false" close-on-click-modal="false">
									<template>
										<span style="font-weight:600">当前设备编码:{{reportDialogModule.rowDataInfo.waterCode}}</span>
										<el-date-picker v-if="type=='1'" v-model="reportDialogModule.queryStartTime" type="date" placeholder="请选择开始日期" clearable size="small" style="left: 49%;position: absolute"></el-date-picker>
										<el-date-picker v-else-if="type=='2'" v-model="reportDialogModule.queryStartTime" type="month" placeholder="请选择开始月份" clearable size="small" style="left: 49%;position: absolute"></el-date-picker>
										<el-date-picker v-else="type=='3'" v-model="reportDialogModule.queryStartTime" type="year" placeholder="请选择开始年份" clearable size="small" style="left: 49%;position: absolute"></el-date-picker>
										<el-date-picker v-if="type=='1'" v-model="reportDialogModule.queryEndTime"  type="date" placeholder="请选择结束日期" clearable size="small" style="left: 52%;position: relative;"></el-date-picker>
										<el-date-picker v-else-if="type=='2'" v-model="reportDialogModule.queryEndTime"  type="month" placeholder="请选择结束月份" clearable size="small" style="left: 52%;position: relative;"></el-date-picker>
										<el-date-picker v-else="type=='3'" v-model="reportDialogModule.queryEndTime"  type="year" placeholder="请选择结束年份" clearable size="small" style="left: 52%;position: relative;"></el-date-picker>
										<el-button size="small" @click="dialogTableDataClick" type="primary" icon="el-icon-search" style="left: 52%; position: relative">查询</el-button>
										<el-button size="small" type="primary" @click="dialogTableDataExport" icon="el-icon-share" style="left: 52%; position: relative">报表导出</el-button>
									</template>
									<template>
										<el-table :data="(reportDialogModule.dialogTableData || '').slice((reportDialogModule.dialogCurrentPage-1)*reportDialogModule.dialogPageSize,reportDialogModule.dialogCurrentPage*reportDialogModule.dialogPageSize)"
												  border :row-class-name="tableRowClassName" style="width: 100%; margin-top:5px" v-loading="loading">
											<el-table-column type="index"></el-table-column>
											<template v-if="type == '1'">
												<el-table-column label="流量(m³/s)" prop="instantFlow" show-overflow-tooltip align="center"></el-table-column>
												<el-table-column label="创建时间" prop="swdiCreateTime" show-overflow-tooltip align="center" :formatter="dateFormat2"></el-table-column>
											</template>
											<template v-if="type == '2'">
												<el-table-column label="年" prop="inYear" show-overflow-tooltip align="center"></el-table-column>
												<el-table-column label="月" prop="inMonth" show-overflow-tooltip align="center"></el-table-column>
												<el-table-column label="日" prop="inDay" show-overflow-tooltip align="center"></el-table-column>
												<el-table-column label="流量(m³/s)" prop="dayFlow" show-overflow-tooltip align="center"></el-table-column>
												<el-table-column label="创建时间" prop="createTime" show-overflow-tooltip align="center" :formatter="dateFormat2"></el-table-column>
											</template>
											<template v-if="type == '3'">
												<el-table-column label="年" prop="inYear" show-overflow-tooltip align="center"></el-table-column>
												<el-table-column label="月" prop="inMonth" show-overflow-tooltip align="center"></el-table-column>
												<el-table-column label="流量(m³/s)" prop="monthFlow" show-overflow-tooltip align="center"></el-table-column>
												<el-table-column label="创建时间" prop="createTime" show-overflow-tooltip align="center" :formatter="dateFormat2"></el-table-column>
											</template>
										</el-table>
										<el-pagination @size-change="handleDialogSizeChange" @current-change="handleDialogCurrentChange" :page-sizes="[10, 20, 30, 40]" :current-page.sync="reportDialogModule.dialogCurrentPage"
													   :page-size="reportDialogModule.dialogPageSize" layout="total, prev, pager, next" :total="reportDialogModule.dialogTableData.length" align="right" style="margin-top:10px;"></el-pagination>
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
	<script type="text/javascript" src="${ctxstc}/js/custom/province_city/distpicker.data.js"></script>
	<script type="text/javascript" src="${ctxstc}/js/custom/province_city/distpicker.js"></script>
	<script type="text/javascript" src="${ctxstc}/js/custom/province_city/main.js"></script>
	<script type="text/javascript" src="${ctxstc}/js/footer.js"></script>
	<script type="text/javascript" src="${ctxstc}/js/custom/water_area_cook.js"></script>
	<script type="text/javascript" src="${ctxstc}/datepicker/WdatePicker.js "></script>
	<script type="text/javascript" src="${ctxstc}/js/custom/plan/report_statis/report_statis.js"></script>
	<script type="text/javascript">
	/*$(document).ready(function(){
		//三级权限code数组============================================================
			debugger
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
		//start("","",threeLevelPermission);
		delCookie("canalId2");
		
	});
	var setting = {
		view: {
			selectedMulti: false,
		},
		data: {
			simpleData: {
				enable: true
			}
		},
		callback: {}
	};
	var zNodes=[];
	function showNodes(threeLevelPermission){
		var zNode;
		<c:forEach items="${calCanalInfoList}" var="calCanalInfo">
			var id   ="${calCanalInfo.id}";
			var pId  ="${calCanalInfo.canalParentId}";
			var name ="${calCanalInfo.canalName}";
			var level="${calCanalInfo.canallevelCode}";
			if(level==0||level==1){
				zNode={id:id, pId:pId, name:name,click:"start('${calCanalInfo.id}','${calCanalInfo.canalCode}','"+threeLevelPermission+"');", open:true};
			}else{
				zNode={id:id, pId:pId, name:name,click:"start('${calCanalInfo.id}','${calCanalInfo.canalCode}','2');", open:false};
			}
			zNodes.push(zNode);
		</c:forEach>
	}*/
	</script>
</body>
</html>