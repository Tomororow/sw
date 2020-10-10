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
	<script type="text/javascript" src="${ctxstc}/adapters/ztree/js/jquery.ztree.core.js"></script>
	<link type="text/css" rel="stylesheet" href="${ctxstc}/adapters/ztree/css/zTreeStyle/zTreeStyle.css" /><!-- zTree -->
	<link type="text/css" rel="stylesheet" href="${ctxstc}/adapters/ztree/css/metroStyle/metroStyle.css">
    <script type="text/javascript" src="${ctxstc}/js/vue.js"></script>
    <link rel="stylesheet" href="${ctxstc}/js/element-ui/theme-chalk/index.css" type="text/css">
    <script type="text/javascript" src="${ctxstc}/js/element-ui/index.js"></script>
    <script rel="stylesheet" src="${ctxstc}/adapters/moment/moment.js"></script>
	<script src="${ctxstc}/adapters/layui/layer/layer.js"></script>

	<style type="text/css">
		#visFlow .el-dialog--small{width:60%}
		.topbar-nav-item a{color: red;}
		.topbar-nav-item a:hover{color: blue;}
		::-webkit-scrollbar{display:none;}
		.upload-demo .el-upload-list{display:none;}
		.el-table .info-row {background: #c9e5f5;}
  		.el-table .positive-row {background: #e2f0e4;}

		.demo-table-expand label {width: 130px;color: #99a9bf;}
		.el-table thead{color:#4b5261;font-weight:600;font-size: 15px }
		.imagesWater .el-form-item__content{width:480px;}
	</style>
</head>
<body >
	<form  action="${ctx}/cal_canal_info/list" method="post">
	<!-- 页面主体start -->
	<div class="down-main" id="visFlow">
		<!-- 页面主体右侧内容start -->
		<div class="right-product right-full" style="/*margin-left:55px*/;">
			<section id="layout" ng-app="doc.ui-layout">
			<div ui-layout class="layout-mock">
				<ui-layout options="{ flow : 'column' }">

				<sidebar class="east-back left-back" >

					 <ul class="nav nav-pills nav-stacked" v-if="treeFlag=='1'">
						<li><h4 style="margin-left:20px;margin-top:20px">渠道等级</h4>
						<%--<input id="labelText" type="text" readonly v-model="canclName" placeholder=" 请选择相关渠道" style="border-radius:2px;font-size:14px;width:80%;height:28px;margin-left: 20px;padding-left:5px;" /><!-- ExcelImport -->--%>
						</li>
						<%--<ul id="treeDemo" style="margin-left:15px;" class="ztree"></ul>--%>
						<li id="treeDemo" style="margin-left:15px;" class="ztree" v-if="treeFlag=='1'"></li>
					</ul>
					<ul class="nav nav-pills nav-stacked" v-if="treeFlag=='2'">
						<li><h4 style="margin-top: 20px; margin-left:20px;">行政区域</h4></li>
						<li id="areaZtree" class="ztree" style="margin-left:20px;" v-if="treeFlag=='2'"></li>
					</ul>
				</sidebar>

				<div class="center-back right-back" >
					<div class="container-fluid">
						<div class="info-center">
							<div class="page-header">
								<div class="pull-left">
									<h4>灌区信息化平台>系统管理>站点管理</h4>
								</div>
							</div>

							<div class="search-box row" style="display:flex;">

								<!-- Excel导入数据 -->
								 <div style="margin-right: 20px;">
									 <el-button @click="doAdd()" style="margin-left: 10px;height:33px;width:100px;" size="medium" type="success" data-toggle="modal" data-target="#myModal" >新 增</el-button>
								 </div>
		                         <div id="excelPoi" v-if="activeName=='first'">
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
								<%--Tabs标签追加--%>
								<template>
									<el-tabs v-model="activeName" @tab-click="handleChangeTabs" type="card">
										<%--水位流量站--%>
										<el-tab-pane label="水位流量站" name="first">
											<el-table :data="(tabData || '').slice((currentPage-1)*pagesize,currentPage*pagesize)" @row-click="uploadWaterSiteClick" highlight-current-row stripe border width="100%" size="small" >
                                                <el-table-column type="expand" show-overflow-tooltip>
                                                    <template scope="scope">
                                                        <el-form label-position="left" inline class="demo-table-expand">
                                                            <el-form-item label="在线状态">
                                                                <span v-if="scope.row.type===1">在线</span>
                                                                <span v-if="scope.row.type===0">离线</span>
                                                            </el-form-item>
                                                            <el-form-item label="站点空高">
                                                                <span>{{scope.row.siteDepth}}</span>
                                                            </el-form-item>
                                                            <el-form-item label="渠底高程">
                                                                <span>{{scope.row.siteCanalBottomHeight}}</span>
                                                            </el-form-item>
                                                            <el-form-item label="死水位">
                                                                <span>{{scope.row.swiDeadWaterLevel}}</span>
                                                            </el-form-item>
                                                            <el-form-item label="计量期开始" :formatter="dateFormat">
                                                                <span>{{scope.row.swiMeasureUpperTime}}</span>
                                                            </el-form-item>
                                                            <el-form-item label="计量期结束" :formatter="dateFormat">
                                                                <span>{{scope.row.swiMeasureLowerTime}}</span>
                                                            </el-form-item>
                                                        </el-form>
                                                    </template>
                                                </el-table-column>
												<el-table-column label="站点名称" align="center" show-overflow-tooltip prop="deviceWaterName"></el-table-column>
												<el-table-column label="站点编码" align="center" show-overflow-tooltip prop="deviceWaterCode"></el-table-column>
												<el-table-column label="站点类型" align="center" show-overflow-tooltip prop="swiDevicemodelCode">
													<template slot-scope="{row: {swiDevicemodelCode}}">
														<span v-if="+swiDevicemodelCode===5">雷达水位站</span>
														<span v-if="+swiDevicemodelCode===8">明渠流量站</span>
														<span v-if="+swiDevicemodelCode===12">雷达流速一体计</span>
													</template>
												</el-table-column>
												<el-table-column label="站点卡号" align="center" show-overflow-tooltip prop="swiSimcard"></el-table-column>
												<el-table-column label="经度" align="center" show-overflow-tooltip prop="swiLongitude"></el-table-column>
												<el-table-column label="纬度" align="center" show-overflow-tooltip prop="swiLatitude"></el-table-column>
												<el-table-column label="建设时间" align="center" show-overflow-tooltip prop="swiBuildTime" :formatter="dateFormat"></el-table-column>
												<el-table-column label="操作" align="center" show-overflow-tooltip prop="">
													<template slot-scope="scope">
														<el-button type="text" size="small" @click="doEdit(scope.row)">修改</el-button>
														<el-button type="text" size="small" @click="doDelete(scope.row)">删除</el-button>
														<el-button type="text" size="small" @click="doDetail(scope.row)">详情</el-button>
													</template>
												</el-table-column>
											</el-table>
											<el-pagination @size-change="handleSizeChange" @current-change="handleCurrentChange"  :current-page.sync="currentPage" :page-size="pagesize" layout="total, prev, pager, next" :total="tabData!=null?tabData.length:0" align="right"></el-pagination>
										</el-tab-pane>

										<%--明渠流量站--%>
										<el-tab-pane label="明渠流量站" name="second">
											<el-table :data="(lightCanalData || '').slice((currentPage-1)*pagesize,currentPage*pagesize)" stripe border width="100%" size="small" >
                                                <el-table-column type="expand" show-overflow-tooltip>
                                                    <template scope="scope">
                                                        <el-form label-position="left" inline class="demo-table-expand">
                                                            <el-form-item label="在线状态">
                                                                <span v-if="scope.row.type===1">在线</span>
                                                                <span v-if="scope.row.type===0">离线</span>
                                                            </el-form-item>
                                                            <el-form-item label="实时水位(m)">
                                                                <span>{{scope.row.waterLevel}}</span>
                                                            </el-form-item>
                                                            <el-form-item label="瞬时流量(m3/s)">
                                                                <span>{{scope.row.instantFlow}}</span>
                                                            </el-form-item>
                                                            <el-form-item label="累计流量(m3/s)">
                                                                <span>{{scope.row.totleFlow}}</span>
                                                            </el-form-item>
                                                            <el-form-item label="瞬时流速(m/s)">
                                                                <span>{{scope.row.instantSpeend}}</span>
                                                            </el-form-item>
                                                            <el-form-item label="第一层流速(m/s)">
                                                                <span>{{scope.row.trenChier1}}</span>
                                                            </el-form-item>
                                                            <el-form-item label="第二层流速(m/s)">
                                                                <span>{{scope.row.trenChier2}}</span>
                                                            </el-form-item>
                                                            <el-form-item label="第三层流速(m/s)">
                                                                <span>{{scope.row.trenChier3}}</span>
                                                            </el-form-item>
                                                            <el-form-item label="第四层流速(m/s)">
                                                                <span>{{scope.row.trenChier4}}</span>
                                                            </el-form-item>
                                                        </el-form>
                                                    </template>
                                                </el-table-column>
												<el-table-column label="站点名称" align="center" show-overflow-tooltip prop="deviceWaterName"></el-table-column>
												<el-table-column label="站点编码" align="center" show-overflow-tooltip prop="deviceWaterCode"></el-table-column>
												<el-table-column label="站点卡号" align="center" show-overflow-tooltip prop="swiSimcard"></el-table-column>
												<el-table-column label="经度" align="center" show-overflow-tooltip prop="swiLongitude"></el-table-column>
												<el-table-column label="纬度" align="center" show-overflow-tooltip prop="swiLatitude"></el-table-column>
												<el-table-column label="建设时间" align="center" show-overflow-tooltip prop="swiBuildTime" :formatter="dateFormat"></el-table-column>
												<el-table-column label="操作" align="center" show-overflow-tooltip prop="">
													<template slot-scope="scope">
														<el-button type="text" size="small" @click="doEdit(scope.row)">修改</el-button>
														<el-button type="text" size="small" @click="doDelete(scope.row)">删除</el-button>
														<%--<el-button type="text" size="small" @click="doDetail(scope.row)">详情</el-button>--%>
													</template>
												</el-table-column>
											</el-table>
											<el-pagination @size-change="handleSizeChange" @current-change="handleCurrentChange"  :current-page.sync="currentPage" :page-size="pagesize" layout="total, prev, pager, next" :total="lightCanalData!=null?lightCanalData.length:0" align="right"></el-pagination>
										</el-tab-pane>

										<%--视频站--%>
										<el-tab-pane label="视频站" name="third">
											<el-table :data="(videoData || '').slice((currentPage-1)*pagesize,currentPage*pagesize)" stripe border width="100%" size="small" >
												<el-table-column label="站点名称" align="center" show-overflow-tooltip prop="deviceVideoName"></el-table-column>
												<el-table-column label="站点编码" align="center" show-overflow-tooltip prop="deviceVideoCode"></el-table-column>
												<el-table-column label="设备类型" align="center" show-overflow-tooltip prop="devicemodelName"></el-table-column>
		<%--										<el-table-column label="设备照片" align="center" show-overflow-tooltip prop="sviPhotoBefore">
													<template scope="scope">
														<a href="javascript:void(0);">
															<img v-bind:src="(imagePath)+(scope.row.sviPhotoBefore)" v-on:click="updateImage(scope.row);" @click="dialogVisible = true" style="width:30px;height:30px;"/>
														</a>
&lt;%&ndash;                                                        <div @click="updateImage(scope.row);" @click="dialogVisible = true">
                                                            <el-image style="height: 50px" :src="(imagePath)+(scope.row.sviPhotoBefore)" fit="contain"></el-image>
                                                        </div>&ndash;%&gt;
													</template>
												</el-table-column>--%>
												<el-table-column label="站点详细地址" align="center" show-overflow-tooltip prop="sviAddr"></el-table-column>
												<el-table-column label="建设时间" align="center" show-overflow-tooltip prop="sviBuildTime" :formatter="dateFormat"></el-table-column>
												<el-table-column label="操作" align="center" show-overflow-tooltip prop="">
													<template slot-scope="scope">
														<el-button type="text" size="small" @click="doEdit(scope.row)" @click="editDialogVisible=true">修改</el-button>
														<el-button type="text" size="small" @click="doDelete(scope.row)">删除</el-button>
														<%--<el-button type="text" size="small" @click="">详情</el-button>--%>
													</template>
												</el-table-column>
											</el-table>
											<el-pagination @size-change="handleSizeChange" @current-change="handleCurrentChange"  :current-page.sync="currentPage" :page-size="pagesize" layout="total, prev, pager, next" :total="videoData!=null?videoData.length:0" align="right"></el-pagination>
											<!-- 修改图片 -->
											<%--<el-dialog title="修改图片" :modal-append-to-body="false"  :visible.sync="dialogVisible" width="30%" v-if="activeName=='third'">
												<el-upload class="upload-demo" :data="map" :on-success="onSuccess" :on-error="onError" :action="videoSiteUpdateImageUrl" :on-change="imageChange"  list-type="picture">
													<el-button slot="trigger" size="small" type="primary" id="selece">开始上传</el-button>
													<div slot="tip" class="el-upload__tip">只能上传jpg/png文件，且不超过500kb</div>
												</el-upload>
											</el-dialog>--%>
										</el-tab-pane>

										<%--闸门站--%>
										<el-tab-pane label="闸门站" name="fourth">
											<el-table :data="sluiceData.slice((currentPage-1)*pagesize,currentPage*pagesize)" stripe border width="100%" size="small" highlight-current-row @expand-change="handleConnectionSearch"
													  :expand-row-keys="expands" :row-key='getRowKeys'>
												<el-table-column type="expand">
													<template scope="props">
														<el-button @click="doAddSluiceGate(props.row)" style="margin: -15px auto 4px auto;" size="mini" type="success" data-toggle="modal" data-target="#mySluiceModalAdd" >添加</el-button>
														<el-table :data="props.row.siteSluiceGateInfoList" border size="medium" fit :header-cell-style="{background:'#f0f9eb'}">
															<el-table-column label="闸门编码" prop="ssgiSluiceGateCode" show-overflow-tooltip align="center"></el-table-column>
															<el-table-column label="闸门名称" prop="ssgiSluiceGateName" show-overflow-tooltip align="center" width="230px"></el-table-column>
															<el-table-column label="闸门宽度" prop="ssgiSluiceWidth" show-overflow-tooltip align="center"></el-table-column>
															<el-table-column label="闸门高度" prop="ssgiSluiceHeight" show-overflow-tooltip align="center"></el-table-column>
															<el-table-column label="闸门重量" prop="ssgiSluiceWeight" show-overflow-tooltip align="center"></el-table-column>
															<el-table-column  label="启闭类型" prop="sluiceTypeName" show-overflow-tooltip align="center"></el-table-column>
															<el-table-column  label="闸门电动机功率" prop="ssgiSluiceMotorPower" show-overflow-tooltip align="center"></el-table-column>
															<el-table-column  label="创建时间" prop="ssgiCreateTime" show-overflow-tooltip align="center" :formatter="dateFormat"></el-table-column>
															<el-table-column label="操作" align="center" show-overflow-tooltip prop="">
																<template slot-scope="scope">
																	<el-button type="text" size="small" data-toggle="modal" data-target="#mySluiceModalEdit" @click="doSluiceGateEdit(scope.row)">修改</el-button>
																	<el-button type="text" size="small" @click="doSluiceGateDelete(scope.row)">删除</el-button>
																</template>
															</el-table-column>
														</el-table>
													</template>
												</el-table-column>
												<el-table-column label="站点名称" align="center" show-overflow-tooltip prop="deviceSluiceName"></el-table-column>
												<el-table-column label="站点编码" align="center" show-overflow-tooltip prop="deviceSluiceCode"></el-table-column>
												<el-table-column label="经度" align="center" show-overflow-tooltip prop="ssiLongitude"></el-table-column>
												<el-table-column label="纬度" align="center" show-overflow-tooltip prop="ssiLatitude"></el-table-column>
												<el-table-column label="SIM卡号" align="center" show-overflow-tooltip prop="ssiSimcard"></el-table-column>
												<el-table-column label="SIM卡号运营商" align="center" show-overflow-tooltip prop="ssiSimoperator"></el-table-column>
												<el-table-column label="站点照片" align="center" show-overflow-tooltip prop="ssiPhotoBefore">
													<template scope="scope">
														<a href="javascript:void(0);">
															<img v-bind:src="(imagePath)+(scope.row.ssiPhotoBefore)" v-on:click="updateImage(scope.row,0);" @click="dialogVisible = true" style="width:30px;height:30px;"/>
														</a>
													</template>
												</el-table-column>
<%--												<el-table-column label="测量设备安装后照片" align="center" show-overflow-tooltip prop="ssiPhotoAfter">
													<template scope="scope">
														<a href="javascript:void(0);">
															<img v-bind:src="(imagePath)+(scope.row.ssiPhotoAfter)" v-on:click="updateImage(scope.row,1);" @click="dialogVisible = true" style="width:30px;height:30px;"/>
														</a>
													</template>
												</el-table-column>--%>
												<el-table-column label="站点详细地址" align="center" show-overflow-tooltip prop="ssiAddr"></el-table-column>
												<el-table-column label="建设时间" align="center" show-overflow-tooltip prop="ssiBuildTime" :formatter="dateFormat"></el-table-column>
												<el-table-column label="操作" align="center" show-overflow-tooltip prop="">
													<template slot-scope="scope">
														<el-button type="text" size="small" @click="doEdit(scope.row)">修改</el-button>
														<el-button type="text" size="small" @click="doDelete(scope.row)">删除</el-button>
														<%--<el-button type="text" size="small" @click="">详情</el-button>--%>
													</template>
												</el-table-column>
											</el-table>
											<el-pagination @size-change="handleSizeChange" @current-change="handleCurrentChange"  :current-page.sync="currentPage" :page-size="pagesize" layout="total, prev, pager, next" :total="sluiceData.length" align="right"></el-pagination>
											<!-- 修改图片 -->
											<el-dialog title="修改图片" :modal-append-to-body="false"  :visible.sync="dialogVisible" width="30%" v-if="activeName=='fourth'">
												<el-upload class="upload-demo" :data="map" :on-success="onSuccess" :on-error="onError" :action="waterSluiceUpdateImageUrl" :on-change="imageChange"  list-type="picture">
													<el-button slot="trigger" size="small" type="primary" id="selece">开始上传</el-button>
													<div slot="tip" class="el-upload__tip">只能上传jpg/png文件，且不超过500kb</div>
												</el-upload>
											</el-dialog>
										</el-tab-pane>

										<%--在线水质监测站--%>
										<el-tab-pane label="在线水质监测站" name="sixth">
											<el-table :data="(waterSurveyData || '').slice((currentPage-1)*pagesize,currentPage*pagesize)" header-align="center" show-overflow-tooltip   stripe  border style="width: 100%" size="small">
												<el-table-column type="expand" show-overflow-tooltip>
													<template scope="scope">
														<el-form label-position="left" inline class="demo-table-expand">
															<el-form-item label="SIM卡运营商">
																<span>{{scope.row.simClipOperator}}</span>
															</el-form-item>
															<el-form-item label="修建时间">
																<span>{{scope.row.buildTime}}</span>
															</el-form-item>
															<el-form-item label="SIM卡号">
																<span>{{scope.row.simClip}}</span>
															</el-form-item>
															<el-form-item label="河道编码">
																<span>{{scope.row.riverwayCoding}}</span>
															</el-form-item>
															<el-form-item label="行政区编码">
																<span>{{scope.row.administrativeCoding}}</span>
															</el-form-item>
															<el-form-item label="监测站编码">
																<span>{{scope.row.coding}}</span>
															</el-form-item>
															<el-form-item label="设备编码">
																<span>{{scope.row.equipCoding}}</span>
															</el-form-item>
														</el-form>
													</template>
												</el-table-column>
												<el-table-column prop="monitorName" align="center" show-overflow-tooltip label="监测站名称" ></el-table-column>
												<el-table-column prop="simClip" align="center" show-overflow-tooltip label="SIM卡号"></el-table-column>
												<el-table-column prop="equipCoding" align="center" show-overflow-tooltip label="设备编码"></el-table-column>
												<el-table-column prop="longitudeLatitude" align="center" show-overflow-tooltip label="经纬度(度)"></el-table-column>
												<el-table-column prop="elevation" align="center" show-overflow-tooltip label="高程"></el-table-column>
												<el-table-column prop="waterGrade" align="center" :formatter="formatterGrade" show-overflow-tooltip label="水质等级"></el-table-column>
												<el-table-column prop="monitorAddress" align="center" show-overflow-tooltip label="监测站地址"></el-table-column>
												<el-table-column prop="waterImage" align="center" show-overflow-tooltip label="监测站图片">
													<template scope="scope">
														<a href="javascript:void(0);">
															<img v-bind:src="(imagePath)+(scope.row.waterImage)" v-on:click="updateImage(scope.row);" @click="dialogVisible = true" style="width:30px;height:30px;"/>
														</a>
													</template>
												</el-table-column>
												<el-table-column label="操作" width="130px;" align="center" show-overflow-tooltip>
													<template scope="scope">
														<el-button type="text" v-on:click="doEdit(scope.row)" size="small">修改</el-button>
														<el-button type="text" v-on:click="doDelete(scope.row)" size="small">刪除</el-button>
													</template>
												</el-table-column>
											</el-table>
											<el-pagination @size-change="handleSizeChange" @current-change="handleCurrentChange" :page-sizes="[10, 20, 30, 40]" :current-page.sync="currentPage" :page-size="pagesize" layout="total, prev, pager, next" :total="waterSurveyData!=null?waterSurveyData.length:0" align="right" style="margin-top:10px;"></el-pagination>
											<!-- 修改图片 -->
											<el-dialog title="修改图片" :modal-append-to-body="false"  :visible.sync="dialogVisible" width="30%" v-if="activeName=='sixth'">
												<el-upload class="upload-demo" :data="map" :on-success="onSuccess" :on-error="onError" :action="waterSurveyUpdateImageUrl" :on-change="imageChange"  list-type="picture">
													<el-button slot="trigger" size="small" type="primary" id="selece">开始上传</el-button>
													<div slot="tip" class="el-upload__tip">只能上传jpg/png文件，且不超过500kb</div>
												</el-upload>
											</el-dialog>
										</el-tab-pane>

										<%--气象站数据集合--%>
										<el-tab-pane label="气象站" name="seventh">
											<el-table :data="(meteorSurveyData || '').slice((currentPage-1)*pagesize,currentPage*pagesize)"  border style="width: 100%">
												<el-table-column type="expand" >
													<template scope="scope">
														<el-form label-position="left" inline class="demo-table-expand">
															<el-form-item label="设备编码">
																<span>{{scope.row.equipCoding}}</span>
															</el-form-item>
															<el-form-item label="SIM卡运营商">
																<span>{{scope.row.simClipOperator}}</span>
															</el-form-item>
															<el-form-item label="修建时间">
																<span>{{scope.row.buildTime}}</span>
															</el-form-item>
															<el-form-item label="气象站编码">
																<span>{{scope.row.coding}}</span>
															</el-form-item>
															<el-form-item label="行政区编码">
																<span>{{scope.row.administrativeCoding}}</span>
															</el-form-item>
															<el-form-item label="设备名称">
																<span>{{scope.row.equipName}}</span>
															</el-form-item>
														</el-form>
													</template>
												</el-table-column>
												<el-table-column prop="meteorName" align="center" show-overflow-tooltip label="气象站名称"></el-table-column>
												<el-table-column prop="simClip" align="center" show-overflow-tooltip label="SIM卡号"></el-table-column>
												<el-table-column prop="longitudeLatitude" align="center" show-overflow-tooltip label="经纬度"></el-table-column>
												<el-table-column prop="elevation" align="center" show-overflow-tooltip label="高程"></el-table-column>
												<el-table-column prop="createTime" align="center" show-overflow-tooltip label="创建时间"></el-table-column>
												<el-table-column prop="monitorAddress" align="center" show-overflow-tooltip label="气象站地址"></el-table-column>
												<el-table-column prop="monitorImage" align="center" show-overflow-tooltip label="气象站图片">
													<template scope="scope">
														<a href="javascript:void(0)"><img :src="(imagePath)+(scope.row.monitorImage)" @click="updateImage(scope.row)" @click="dialogVisible = true" style="width:30px;height:30px;"/></a>
													</template>
												</el-table-column>
												<el-table-column prop="" align="center" show-overflow-tooltip label="操作">
													<template scope="scope">
														<el-button type="text" size="small" data-toggle="modal" data-target="#updateModal" v-on:click="updateRow1(scope.row,0)">修改</el-button>
														<el-button type="text" size="small" @click="doDelete(scope.row)">删除</el-button>
													</template>
												</el-table-column>
											</el-table>
											<el-pagination @size-change="handleSizeChange" @current-change="handleCurrentChange" :page-sizes="[10, 20, 30, 40]" :current-page.sync="currentPage" :page-size="pagesize" layout="total, prev, pager, next" :total="meteorSurveyData!=null?meteorSurveyData.length:0" align="right" style="margin-top:10px;"></el-pagination>
											<el-dialog title="图片修改" :visible.sync="dialogVisible" width="30%" v-if="activeName=='seventh'">
												<el-upload class="upload-demo" ref="upload" :on-success="onSuccess" :data="map" :on-change="imageChange" :action="meteorSurveyUpdateImageUrl" list-type="picture">
													<el-button size="small" type="primary">点击上传</el-button>
													<div slot="tip" class="el-upload__tip">只能上传jpg/png文件，且不超过2MB</div>
												</el-upload>
											</el-dialog>
										</el-tab-pane>

										<%--土壤墒情站管理--%>
										<el-tab-pane label="土壤墒情站" name="eighth">
											<el-table :data="(moistureSurveyData || '').slice((currentPage-1)*pagesize,currentPage*pagesize)" stripe  border style="width: 100%">
												<el-table-column type="expand"  >
													<template scope="scope">
														<el-form label-position="left" inline class="demo-table-expand">
															<el-form-item label="设备编码">
																<span>{{scope.row.equipCoding}}</span>
															</el-form-item>
															<el-form-item label="SIM卡运营商">
																<span>{{scope.row.simClipOperator}}</span>
															</el-form-item>
															<el-form-item label="修建时间">
																<span>{{scope.row.buildTime}}</span>
															</el-form-item>
															<el-form-item label="墒情站编码">
																<span>{{scope.row.coding}}</span>
															</el-form-item>
															<el-form-item label="设备名称">
																<span>{{scope.row.equipName}}</span>
															</el-form-item>
															<el-form-item label="行政区编码">
																<span>{{scope.row.administrativeCoding}}</span>
															</el-form-item>
															<el-form-item label="修建时间">
																<span>{{scope.row.buildTime}}</span>
															</el-form-item>
														</el-form>
													</template>
												</el-table-column>
												<el-table-column label="墒情站名称" align="center" show-overflow-tooltip prop="moistureName"></el-table-column>
												<el-table-column label="SIM卡号" align="center" show-overflow-tooltip prop="simClip"></el-table-column>
												<el-table-column label="经度" align="center" show-overflow-tooltip prop="longitude"></el-table-column>
												<el-table-column label="纬度" align="center" show-overflow-tooltip prop="latitude"></el-table-column>
												<el-table-column label="高程" align="center" show-overflow-tooltip prop="elevation"></el-table-column>
												<el-table-column label="创建时间" align="center" show-overflow-tooltip prop="createTime"></el-table-column>
												<el-table-column label="墒情站地址" align="center" show-overflow-tooltip prop="moistureAddress"></el-table-column>
												<el-table-column label="墒情站图片" align="center" show-overflow-tooltip prop="moistureImage">
													<template scope="scope" >
														<a href="javascript:void(0);"><img :src="(imagePath)+(scope.row.moistureImage)" @click="updateImage(scope.row)" @click="dialogVisible = true" style="width:30px;height:30px;"/></a>
													</template>
												</el-table-column>
												<el-table-column label="操作" align="center" width="140px;" >
													<template slot-scope="scope">
														<el-button type="text" id="tabCell" size="small" data-toggle="modal" data-target="#updateModal" v-on:click="updateRow2(scope.row,0)">修改</el-button>
														<el-button type="text" size="small" @click="doDelete(scope.row)" style="margin-left:0;">删除</el-button>
													</template>
												</el-table-column>
											</el-table>
											<el-pagination @size-change="handleSizeChange" @current-change="handleCurrentChange" :page-sizes="[10, 20, 30, 40]" :current-page.sync="currentPage" :page-size="pagesize" layout="total, prev, pager, next" :total="moistureSurveyData!=null?moistureSurveyData.length:0" align="right" style="margin-top:10px;"></el-pagination>
											<el-dialog title="图片修改" :visible.sync="dialogVisible" width="30%" v-if="activeName=='eighth'">
												<el-upload class="upload-demo" ref="upload" :on-success="onSuccess" :on-error="onError" :data="map" :on-change="imageChange" :action="moistureSurveyUpdateImageUrl" list-type="picture">
													<el-button size="small" type="primary">点击上传</el-button>
													<div slot="tip" class="el-upload__tip">只能上传jpg/png文件，且不超过2MB</div>
												</el-upload>
											</el-dialog>
										</el-tab-pane>

										<%--蒸发站--%>
										<el-tab-pane label="蒸发站" name="ninth">
											<el-table :data="(evaporateSurveyData || '').slice((currentPage-1)*pagesize,currentPage*pagesize)" stripe  border style="width: 100%">
												<el-table-column type="expand"  >
													<template scope="scope">
														<el-form label-position="left" inline class="demo-table-expand">
															<el-form-item label="设备编码">
																<span>{{scope.row.equipCoding}}</span>
															</el-form-item>
															<el-form-item label="SIM卡运营商">
																<span>{{scope.row.simClipOperator}}</span>
															</el-form-item>
															<el-form-item label="修建时间">
																<span>{{scope.row.coding}}</span>
															</el-form-item>
															<el-form-item label="蒸发站编码">
																<span>{{scope.row.buildTime}}</span>
															</el-form-item>
															<el-form-item label="设备名称">
																<span>{{scope.row.equipName}}</span>
															</el-form-item>
															<el-form-item label="行政区编码">
																<span>{{scope.row.administrativeCoding}}</span>
															</el-form-item>
														</el-form>
													</template>
												</el-table-column>
												<el-table-column label="蒸发站名称" align="center" show-overflow-tooltip prop="evaporateName"></el-table-column>
												<el-table-column label="SIM卡号" align="center" show-overflow-tooltip prop="simClip"></el-table-column>
												<el-table-column label="经度" align="center" show-overflow-tooltip prop="longitude"></el-table-column>
												<el-table-column label="纬度" align="center" show-overflow-tooltip prop="latitude"></el-table-column>
												<el-table-column label="高程" align="center" show-overflow-tooltip prop="elevation"></el-table-column>
												<el-table-column label="创建时间" align="center" show-overflow-tooltip prop="createTime"></el-table-column>
												<el-table-column label="蒸发站地址" align="center" show-overflow-tooltip prop="evaporateAddress"></el-table-column>
												<el-table-column label="蒸发站图片" align="center" show-overflow-tooltip prop="evaporateImage">
													<template scope="scope" >
														<a href="javascript:void(0);"><img :src="(imagePath)+(scope.row.evaporateImage)" @click="updateImage(scope.row)" @click="dialogVisible = true" style="width:30px;height:30px;"/></a>
													</template>
												</el-table-column>
												<el-table-column label="操作" align="center" width="140px;" >
													<template slot-scope="scope">
														<el-button type="text" id="tabCell" size="small" data-toggle="modal" data-target="#updateModal" v-on:click="updateRow3(scope.row,0)">修改</el-button>
														<el-button type="text" size="small" @click="doDelete(scope.row)" style="margin-left:0;">删除</el-button>
													</template>
												</el-table-column>
											</el-table>
											<el-pagination @size-change="handleSizeChange" @current-change="handleCurrentChange" :page-sizes="[10, 20, 30, 40]" :current-page.sync="currentPage" :page-size="pagesize" layout="total, prev, pager, next" :total="evaporateSurveyData!=null?evaporateSurveyData.length:0" align="right" style="margin-top:10px;"></el-pagination>
											<el-dialog title="图片修改" :visible.sync="dialogVisible" width="30%" v-if="activeName=='ninth'">
												<el-upload class="upload-demo" ref="upload" :on-success="onSuccess" :on-error="onError" :data="map" :on-change="imageChange" :action="evaporateSurveyUpdateImageUrl" list-type="picture">
													<el-button size="small" type="primary">点击上传</el-button>
													<div slot="tip" class="el-upload__tip">只能上传jpg/png文件，且不超过2MB</div>
												</el-upload>
											</el-dialog>
										</el-tab-pane>

									</el-tabs>
								</template>
							</div>

							<!-- 各站点修改dialog -->
							<div>
								<%--视频站点信息修改--%>
								<el-dialog title="视频站" :visible.sync="editDialogVisible" @close="doEditCancel('dialogData')" width="40%" v-if="activeName=='third'">
									<el-form ref="dialogData" :model="dialogData" :inline="true" class="demo-ruleForm" align="center"  label-width="110px" style="display:flex" >
										<div style="width:45%">
											<el-form-item label="站点编码" prop="deviceVideoCode" :rules="[{required: true, message: '请输入站点编码', trigger: 'blur'}]"><el-input v-model="dialogData.deviceVideoCode"></el-input></el-form-item>
											<el-form-item label="设备类型" prop="sviDevicemodelCode" :rules="[{required: true, message: '请输入设备类型', trigger: 'blur'}]">
												<el-select v-model="dialogData.devicemodelName" placeholder="请选择">
													<el-option v-for="item in videoDeviceModelData" :key="item.deviceCode" :label="item.deviceName" :value="item.deviceCode"></el-option>
												</el-select>
												<%--<el-input v-model="dialogData.sviDevicemodelCode"></el-input>--%>
											</el-form-item>
											<el-form-item label="站点经度" prop="sviLongitude" :rules="[{required: true, message: '请输入站点经度', trigger: 'blur'}]">
												<el-input type="number" v-model="dialogData.sviLongitude" auto-complete="off" placeholder="经度">度</el-input>
											</el-form-item>
											<el-form-item label="sim卡号" prop="comm1" :rules="[{required: true, message: '请输入sim卡号', trigger: 'blur'}]"><el-input v-model="dialogData.comm1"></el-input></el-form-item>
											<el-form-item label="站点详细地址" prop="sviAddr" :rules="[{required: true, message: '请输入站点详细地址', trigger: 'blur'}]">
												<el-input v-model="dialogData.sviAddr" type="textarea" style="width: 280px"></el-input>
											</el-form-item>
										</div>
										<div style="width:45%; margin-left: 6%"	 >
											<el-form-item label="站点名称" prop="deviceVideoName" :rules="[{required: true, message: '请输入站点名称', trigger: 'blur'}]"><el-input v-model="dialogData.deviceVideoName"></el-input></el-form-item>
											<el-form-item label="建设时间" prop="sviBuildTime" :rules="[{required: true, message: '请输入建设时间', trigger: 'blur'}]">
												<el-date-picker v-model="dialogData.sviBuildTime" type="datetime" placeholder="选择日期时间" style="width:200px;"></el-date-picker>
											</el-form-item>
											<el-form-item label="站点纬度" prop="sviLatitude" :rules="[{required: true, message: '请输入站点纬度', trigger: 'blur'}]">
												<el-input type="number" v-model="dialogData.sviLatitude" auto-complete="off" placeholder="纬度">度</el-input>
											</el-form-item>
											<el-form-item label="sim运营商" :status-icon="true" prop="comm2" :rules="[{required: true, message: '请输入sim运营商', trigger: 'blur'}]">
												<el-select v-model="dialogData.comm2" placeholder="请选择">
													<el-option v-for="item in options" :key="item.value" :label="item.label" :value="item.value"></el-option>
												</el-select>
											</el-form-item>
											<el-form-item style=" margin-top: 60px">
												<el-button type="primary" @click="doSubmit">确定</el-button>
												<el-button @click="doEditCancel('dialogData')">取消</el-button>
											</el-form-item>
										</div>
									</el-form>
								</el-dialog>

								<%--修改闸门信息--%>
								<div class="modal fade" id="mySluiceModalEdit" tabindex="-1" role="dialog" aria-labelledby="myModalLabel" aria-hidden="true" data-backdrop="static" data-keyboard="false">
									<div class="modal-dialog" style="width:45%">
										<div class="modal-content">
											<div class="modal-header">
												<button type="button" class="close" data-dismiss="modal" aria-hidden="true" @click="doSluiceDialogClose('sluiceGateData')">&times;</button>
												<h4 class="modal-title" >修改闸门信息</h4>
											</div>
											<div class="modal-body" align="center">
												<el-form ref="sluiceGateData" :inline="true" :rules="sluiceGateRules" class="demo-form-inline" label-width="100px" :model="sluiceGateData" >
													<el-form-item label="闸门名称" prop="ssgiSluiceGateName" required>
														<el-input v-model="sluiceGateData.ssgiSluiceGateName"></el-input>
													</el-form-item>
													<el-form-item label="闸门编码" prop="ssgiSluiceGateCode" required>
														<el-input v-model="sluiceGateData.ssgiSluiceGateCode"></el-input>
													</el-form-item>
													<el-form-item label="闸门宽度" prop="ssgiSluiceWidth" >
														<el-input v-model="sluiceGateData.ssgiSluiceWidth" type="number"></el-input>
													</el-form-item>
													<el-form-item label="闸门高度" prop="ssgiSluiceHeight" >
														<el-input v-model="sluiceGateData.ssgiSluiceHeight" type="number"></el-input>
													</el-form-item>
													<el-form-item label="闸门重量" prop="ssgiSluiceWeight" >
														<el-input v-model="sluiceGateData.ssgiSluiceWeight" type="number"></el-input>
													</el-form-item>
													<el-form-item label="电动机功率" prop="ssgiSluiceMotorPower" >
														<el-input v-model="sluiceGateData.ssgiSluiceMotorPower" type="number"></el-input>
													</el-form-item>
													<el-form-item label="启闭类型" prop="sluiceTypeName" >
														<el-select v-model="sluiceGateData.sluiceTypeName" placeholder="请选择">
															<el-option v-for="item in allSluiceType" :key="item.sluiceTypeCode" :label="item.sluiceTypeName" :value="item.sluiceTypeCode"></el-option>
														</el-select>
													</el-form-item>
													<el-form-item label="关联视频站" prop="ssgiSluiceMovieId" >
														<el-select v-model="ssgiSluiceMovieIdArray" placeholder="请选择" multiple collapse-tags>
															<el-option v-for="item in allVideoData" :key="item.id" :label="item.deviceVideoName" :value="item.id"></el-option>
														</el-select>
													</el-form-item>
													<el-form-item label="修建时间" prop="ssgiCreateTime" required >
														<el-date-picker v-model="sluiceGateData.ssgiCreateTime" editable="false" type="datetime" placeholder="选择日期时间" style="width:180px;"></el-date-picker>
													</el-form-item>
													<el-form-item label="" prop="" ></el-form-item>
												</el-form>
											</div>
											<div class="modal-footer">
												<button type="button" class="btn btn-default" data-dismiss="modal" @click="doSluiceDialogClose('sluiceGateData')">关闭</button>
												<button type="button" class="btn btn-primary" @click="editSluiceGateSubmit('sluiceGateData')">提交表单</button>
											</div>
										</div>
									</div>
								</div>

									<%--气象站点数据修改--%>
									<div class="modal fade" id="updateModal" label-width="100px" class="demo-ruleForm" tabindex="-1" role="dialog" aria-labelledby="myModalLabel" aria-hidden="true" v-if="activeName=='seventh'">
										<div class="modal-dialog" style="width:40%">
											<div class="modal-content">
												<div class="modal-header">
													<button type="button" class="close" data-dismiss="modal" aria-hidden="true">&times;</button>
													<h4 class="modal-title" id="myModalLabel" style="font-size:14px;">修改【{{updateData.meteorName}}】气象站信息</h4>
												</div>
												<div class="modal-body" align="center">
													<el-form ref="updateData" label-width="100px" class="demo-ruleForm" :rules="rules" :inline="true" :model="updateData"  >
														<el-form-item label="气象站名称" prop="meteorName">
															<el-input v-model="updateData.meteorName"></el-input>
														</el-form-item>
														<el-form-item label="气象站编码" prop="coding">
															<el-input v-model="updateData.coding"></el-input>
														</el-form-item>
														<el-form-item label="设备名称" prop="equipName" >
															<el-input v-model="updateData.equipName"></el-input>
														</el-form-item>
														<el-form-item label="设备编码" prop="equipCoding">
															<el-input v-model="updateData.equipCoding"></el-input>
														</el-form-item>
														<el-form-item label="SIM卡号" prop="simClip" >
															<el-input v-model="updateData.simClip"></el-input>
														</el-form-item>
														<el-form-item label="SIM运营商" prop="simClipOperator">
															<el-select v-model="updateData.simClipOperator" placeholder="请选择" >
																<el-option v-for="item in options" :key="item.value" :label="item.label" :value="item.value"></el-option>
															</el-select>
														</el-form-item>
														<el-form-item label="修建时间" prop="buildTime" required >
															<el-date-picker v-model="updateData.buildTime" type="datetime" placeholder="选择日期时间" style="width:180px;"></el-date-picker>
														</el-form-item>
														<el-form-item label="气象站高程" prop="elevation" required >
															<el-input v-model="updateData.elevation"></el-input>
														</el-form-item>
														<el-form-item label="经度"  required  prop="longitude" >
															<el-input type="number" placeholder="经度" v-model="updateData.longitude"><template slot="append">度</template></el-input>
														</el-form-item>
														<el-form-item  prop="latitude" label="纬度" required >
															<el-input type="number" placeholder="纬度" v-model="updateData.latitude"><template slot="append">度</template></el-input>
														</el-form-item>
														<el-form-item label="行政区编码" required id="code" prop="administrativeCoding">
															<el-input v-model="updateData.administrativeCoding"  :disabled="true"></el-input>
														</el-form-item>

														<!-- <el-form-item label="气象站地址" required id="distpicker">
														   <div data-toggle="distpicker" >
														   <el-col :span="8">
															   <el-form-item prop="province" id="form1">
																   <div class="form-group" ><select class="form-control" v-model="updateData.province" id="province"></select></div>
															   </el-form-item>
														   </el-col>
														   <el-col :span="8">
															   <el-form-item prop="city" id="form2">
																   <div class="form-group"><select class="form-control" v-model="updateData.city" id="city"></select></div>
															   </el-form-item>
														   </el-col>
														   <el-col :span="8">
															   <el-form-item id="form3">
																   <div class="form-group" ><select class="form-control" v-model="updateData.district"  id="district"></select></div>
															   </el-form-item>
														   </el-col>
														  </div>
													  </el-form-item> -->
														<el-form-item label="详细地址" id="address" prop="monitorAddress" >
															<el-input type="textarea" v-model="updateData.monitorAddress"></el-input>
														</el-form-item>
													</el-form>
												</div>
												<div class="modal-footer">
													<button type="button" class="btn btn-default" data-dismiss="modal">关闭</button>
													<button type="button" class="btn btn-primary" v-on:click="updateRow1(1,1,'updateData')">提交更改</button>
												</div>
											</div><!-- /.modal-content -->
										</div><!-- /.modal -->
									</div>

									<%--土壤墒情站点数据修改--%>
									<div class="modal fade" id="updateModal" tabindex="-1" role="dialog" aria-labelledby="myModalLabel" aria-hidden="true" v-if="activeName=='eighth'">
										<div class="modal-dialog" style="width:40%">
											<div class="modal-content">
												<div class="modal-header">
													<button type="button" class="close" data-dismiss="modal" aria-hidden="true">&times;</button>
													<h4 class="modal-title" id="myModalLabel" style="font-size:14px;">修改【{{updateData.moistureName}}】墒情站信息</h4>
												</div>
												<div class="modal-body" align="center">
													<el-form ref="updateData" label-width="100px" class="demo-ruleForm" :inline="true" :rules="rules"   :model="updateData" >
														<el-form-item label="墒情站名称" prop="moistureName" >
															<el-input v-model="updateData.moistureName"></el-input>
														</el-form-item>
														<el-form-item label="墒情站编码" prop="coding" >
															<el-input v-model="updateData.coding"></el-input>
														</el-form-item>
														<el-form-item label="设备名称" prop="equipName" >
															<el-input v-model="updateData.equipName"></el-input>
														</el-form-item>
														<el-form-item label="设备编码" prop="equipCoding" >
															<el-input v-model="updateData.equipCoding"></el-input>
														</el-form-item>
														<el-form-item label="高程" prop="elevation">
															<el-input v-model="updateData.elevation" type="number"></el-input>
														</el-form-item>
														<el-form-item label="SIM卡号" prop="simClip"  >
															<el-input v-model="updateData.simClip"></el-input>
														</el-form-item>
														<el-form-item label="SIM运营商" prop="simClipOperator"  >
															<el-select v-model="updateData.simClipOperator" placeholder="请选择" >
																<el-option v-for="item in options" :key="item.value" :label="item.label" :value="item.value"></el-option>
															</el-select>
														</el-form-item>
														<el-form-item label="修建时间"  prop="buildTime" >
															<el-date-picker v-model="updateData.buildTime" type="datetime" placeholder="选择日期时间" style="width:180px;"></el-date-picker>
														</el-form-item>
														<el-form-item label="经度" prop="longitude">
															<el-input type="number" placeholder="经度" v-model="updateData.longitude"><template slot="append">度</template></el-input>
														</el-form-item>
														<el-form-item label="纬度" prop="latitude">
															<el-input type="number" placeholder="纬度"  v-model="updateData.latitude"><template slot="append">度</template></el-input>
														</el-form-item>
														<el-form-item label="行政区编码" id="adminCode" prop="administrativeCoding" required >
															<el-input v-model="updateData.administrativeCoding"  disabled></el-input>
														</el-form-item>
														<el-form-item label="详细地址" id="address"  prop="moistureAddress">
															<el-input type="textarea" v-model="updateData.moistureAddress"></el-input>
														</el-form-item>
													</el-form>
												</div>
												<div class="modal-footer">
													<button type="button" class="btn btn-default" data-dismiss="modal">关闭</button>
													<button type="button" class="btn btn-primary" @click="updateRow2(1,1,'updateData')">提交表单</button>
												</div>
											</div>
										</div>
									</div>

									<%--蒸发站点数据修改--%>
									<div class="modal fade" id="updateModal" tabindex="-1" role="dialog" aria-labelledby="myModalLabel" aria-hidden="true" v-if="activeName=='ninth'">
										<div class="modal-dialog" style="width:40%">
											<div class="modal-content">
												<div class="modal-header">
													<button type="button" class="close" data-dismiss="modal" aria-hidden="true">&times;</button>
													<h4 class="modal-title" id="myModalLabel" style="font-size:14px;">修改【{{evaAdd.evaporateName}}】蒸发站信息</h4>
												</div>
												<div class="modal-body" align="center">
													<el-form ref="evaAdd" :inline="true"  label-width="100px" class="demo-ruleForm" :rules="rules"   :model="evaAdd" >
														<el-form-item label="蒸发站名称" prop="evaporateName" >
															<el-input v-model="evaAdd.evaporateName"></el-input>
														</el-form-item>
														<el-form-item label="蒸发站编码" prop="coding" >
															<el-input v-model="evaAdd.coding"></el-input>
														</el-form-item>
														<el-form-item label="设备名称" prop="equipName" >
															<el-input v-model="evaAdd.equipName"></el-input>
														</el-form-item>
														<el-form-item label="设备编码" prop="equipCoding" >
															<el-input v-model="evaAdd.equipCoding"></el-input>
														</el-form-item>
														<el-form-item label="高程" prop="elevation" >
															<el-input v-model.number="evaAdd.elevation" type="number"></el-input>
														</el-form-item>
														<el-form-item label="SIM卡号" prop="simClip"  >
															<el-input v-model="evaAdd.simClip"></el-input>
														</el-form-item>
														<el-form-item label="SIM运营商" prop="simClipOperator"  >
															<el-select v-model="evaAdd.simClipOperator" placeholder="请选择" >
																<el-option v-for="item in options" :key="item.value" :label="item.label" :value="item.value"></el-option>
															</el-select>
														</el-form-item>
														<el-form-item label="修建时间"  prop="buildTime" >
															<el-date-picker v-model="evaAdd.buildTime" type="datetime" placeholder="选择日期时间" style="width:180px;"></el-date-picker>
														</el-form-item>
														<el-form-item label="经度"  prop="longitude">
															<el-input type="number" placeholder="经度" v-model="evaAdd.longitude"><template slot="append">度</template></el-input>
														</el-form-item>
														<el-form-item label="纬度"   prop="latitude">
															<el-input type="number" placeholder="纬度"  v-model="evaAdd.latitude"><template slot="append">度</template></el-input>
														</el-form-item>
														<el-form-item label="行政区编码" id="adminCode" prop="administrativeCoding" required >
															<el-input v-model="evaAdd.administrativeCoding"  disabled></el-input>
														</el-form-item>
														<el-form-item label="详细地址" id="address"  prop="evaporateAddress">
															<el-input type="textarea" v-model="evaAdd.evaporateAddress"></el-input>
														</el-form-item>
													</el-form>
												</div>
												<div class="modal-footer">
													<button type="button" class="btn btn-default" data-dismiss="modal">关闭</button>
													<button type="button" class="btn btn-primary" @click="updateRow3(1,1,'evaAdd')">提交表单</button>
												</div>
											</div>
										</div>
									</div>

							</div>

							<%--各站点详情dialog--%>
							<!-- ===========水位流量关系表修改 -->
								<div>
									<el-dialog  title="水位流量关系表" :visible.sync="detailDialogVisible" @close="doDetailCancel('dialogData')" width="60%" v-if="activeName=='first'">
										<template>
 											 <el-table :data="dialogData.slice((dialogCurrentPage-1)*dialogPagesize,dialogCurrentPage*dialogPagesize)"  border :row-class-name="tableRowClassName" style="width: 100%">
 											 	<el-table-column prop="upperLimit" label="上限" align="center"></el-table-column>
 											 	<el-table-column prop="downerLimit" label="下限" align="center"></el-table-column>
 											 	<el-table-column prop="flow" label="流量" align="center"></el-table-column>
 											 	<el-table-column prop="createTime" label="创建日期" align="center"></el-table-column>
 											 	<el-table-column prop="updateTime" label="修改日期" align="center"></el-table-column>
 											 </el-table>
 											 <el-pagination @size-change="handleDialogSizeChange" @current-change="handleDialogCurrentChange" :page-sizes="[10, 20, 30, 40]" :current-page.sync="dialogCurrentPage" :page-size="dialogPagesize" layout="total, prev, pager, next" :total="dialogData.length" align="right" style="margin-top:10px;"></el-pagination>
 										</template>
									</el-dialog>
								</div>

							<%--各站点新增dialog--%>
							<!-- 新增气象站数据 -->
							<div class="modal fade" id="myModal" tabindex="-1"  aria-hidden="false" role="dialog" aria-labelledby="exampleModalLabel" v-if="activeName=='seventh'">
								<div class="modal-dialog" style="width:40%">
									<div class="modal-content">
										<div class="modal-header">
											<button type="button" class="close" data-dismiss="modal" aria-hidden="true" @click="doAddCancel('monitorImport')">&times;</button>
											<h4 class="modal-title" id="myModalLabel" style="font-size:14px;">新增【{{doAddSiteWithValues.arayName}}】气象站信息</h4>
										</div>
										<div class="modal-body" align="center">
											<el-form ref="monitorImport" :inline="true" label-width="100px" class="demo-ruleForm" :rules="rules" :model="monitorImport" >
												<el-form-item label="气象站名称" prop="meteorName">
													<el-input v-model="monitorImport.meteorName"></el-input>
												</el-form-item>
												<el-form-item label="气象站编码" prop="coding">
													<el-input v-model="monitorImport.coding"></el-input>
												</el-form-item>
												<el-form-item label="设备名称" prop="equipName" >
													<el-input v-model="monitorImport.equipName"></el-input>
												</el-form-item>
												<el-form-item label="设备编码" prop="equipCoding">
													<el-input v-model="monitorImport.equipCoding"></el-input>
												</el-form-item>
												<el-form-item label="SIM卡号" prop="simClip" >
													<el-input v-model="monitorImport.simClip"></el-input>
												</el-form-item>
												<el-form-item label="SIM运营商" prop="simClipOperator">
													<el-select v-model="monitorImport.simClipOperator" placeholder="请选择" >
														<el-option v-for="item in options" :key="item.value" :label="item.label" :value="item.value"></el-option>
													</el-select>
												</el-form-item>
												<el-form-item label="修建时间" prop="buildTime" required >
													<el-date-picker v-model="monitorImport.buildTime" type="datetime" placeholder="选择日期时间" style="width:180px;" ></el-date-picker>
												</el-form-item>
												<el-form-item label="气象站高程" prop="elevation">
													<el-input v-model="monitorImport.elevation"></el-input>
												</el-form-item>
												<el-form-item label="经度"  required  prop="longitude" >
													<el-input type="number" placeholder="经度" v-model="monitorImport.longitude" ><template slot="append">度</template></el-input>
												</el-form-item>
												<el-form-item  prop="latitude" label="纬度">
													<el-input type="number" placeholder="纬度" v-model="monitorImport.latitude" ><template slot="append">度</template></el-input>
												</el-form-item>

												<el-form-item label="行政区编码" required id="code" prop="administrativeCoding">
													<el-input v-model="monitorImport.administrativeCoding"  :disabled="true"></el-input>
												</el-form-item>
												<el-form-item label="详细地址" id="address" prop="monitorAddress">
													<el-input type="textarea" v-model="monitorImport.monitorAddress"></el-input>
												</el-form-item>
												<el-form-item label="气象站图片" id="images" prop="monitorImage" class="imagesWater">
													<el-input id="fileText" v-model="monitorImport.monitorImage" disabled  placeholder="只能上传jpg/png文件，且不超过2MB">
														<template slot="append" id="uploadId">
															<el-upload class="upload-demo"  ref="upload" :limit="1" :on-success="onSuccess" :data="map" :on-change="imageChange" :action="meteorSurveySubmitImageUrl" :auto-upload="false">
																<el-button slot="trigger" id="seed" size="small" :disabled="disaled"  type="primary">点此上传</el-button>
															</el-upload>
														</template>
													</el-input>
												</el-form-item>
											</el-form>
										</div>
										<div class="modal-footer">
											<button type="button" class="btn btn-default" data-dismiss="modal" @click="doAddCancel('monitorImport')">关闭</button>
											<button type="button" class="btn btn-primary" @click="submitForm('monitorImport')">提交表单</button>
										</div>
									</div>
								</div>
							</div>

							<!-- 新增土壤墒情站数据 -->
							<div class="modal fade" id="myModal" tabindex="-1" role="dialog" aria-labelledby="myModalLabel" aria-hidden="true" v-if="activeName=='eighth'">
								<div class="modal-dialog" style="width:40%">
									<div class="modal-content">
										<div class="modal-header">
											<button type="button" class="close" data-dismiss="modal" aria-hidden="true" @click="doAddCancel('moisture')">&times;</button>
											<h4 class="modal-title" id="myModalLabel" style="font-size:14px;">新增【{{doAddSiteWithValues.arayName}}】墒情站信息</h4>
										</div>
										<div class="modal-body" align="center">
											<el-form ref="moisture" :inline="true" label-width="100px" class="demo-ruleForm" :rules="rules" :model="moisture" >
												<el-form-item label="墒情站名称" prop="moistureName" >
													<el-input v-model="moisture.moistureName"></el-input>
												</el-form-item>
												<el-form-item label="墒情站编码" prop="coding" >
													<el-input v-model="moisture.coding"></el-input>
												</el-form-item>
												<el-form-item label="设备名称" prop="equipName"  >
													<el-input v-model="moisture.equipName"></el-input>
												</el-form-item>
												<el-form-item label="设备编码" prop="equipCoding" >
													<el-input v-model="moisture.equipCoding"></el-input>
												</el-form-item>
												<el-form-item label="高程" prop="elevation" >
													<el-input v-model="moisture.elevation" type="number"></el-input>
												</el-form-item>
												<el-form-item label="SIM卡号" prop="simClip" >
													<el-input v-model="moisture.simClip"></el-input>
												</el-form-item>
												<el-form-item label="SIM运营商" prop="simClipOperator" >
													<el-select v-model="moisture.simClipOperator" placeholder="请选择">
														<el-option v-for="item in options" :key="item.value" :label="item.label" :value="item.value"></el-option>
													</el-select>
												</el-form-item>
												<el-form-item label="修建时间" prop="buildTime" >
													<el-date-picker v-model="moisture.buildTime" editable="false" type="datetime" placeholder="选择日期时间" style="width:180px;"></el-date-picker>
												</el-form-item>
												<el-form-item label="经度" prop="longitude" >
													<el-input type="number" placeholder="经度" v-model="moisture.longitude" ><template slot="append">度</template></el-input>
												</el-form-item>
												<el-form-item label="纬度" prop="latitude">
													<el-input type="number" placeholder="纬度"  v-model="moisture.latitude" ><template slot="append">度</template></el-input>
												</el-form-item>
												<el-form-item label="行政区编码" id="adminCode" prop="administrativeCoding" required >
													<el-input v-model="moisture.administrativeCoding"  disabled></el-input>
												</el-form-item>
												<el-form-item label="详细地址" id="address"  prop="moistureAddress">
													<el-input type="textarea" v-model="moisture.moistureAddress"></el-input>
												</el-form-item>
												<el-form-item label="墒情站图片" id="imageMoisture"  prop="moistureImage" class="imagesWater">
													<el-input id="fileText" v-model="moisture.moistureImage" disabled  placeholder="只能上传jpg/png文件，且不超过2MB" >
														<template slot="append" id="uploadId">
															<el-upload class="upload-demo"  ref="upload" :on-success="onSuccess" :limit="1" :data="map" :on-change="imageChange" :action="moistureSurveySubmitImageUrl" :auto-upload="false">
																<el-button slot="trigger" id="seed" size="small" :disabled="disaled"  type="primary">点此上传</el-button>
															</el-upload>
														</template>
													</el-input>
												</el-form-item>
											</el-form>

										</div>
										<div class="modal-footer">
											<button type="button" class="btn btn-default" data-dismiss="modal" @click="doAddCancel('moisture')">关闭</button>
											<button type="button" class="btn btn-primary" @click="submitForm('moisture')">提交表单</button>
										</div>
									</div>
								</div>
							</div>

							<!-- 新增蒸发站数据 -->
							<div class="modal fade" id="myModal" tabindex="-1" role="dialog" aria-labelledby="myModalLabel" aria-hidden="true" v-if="activeName=='ninth'">
								<div class="modal-dialog" style="width:40%">
									<div class="modal-content">
										<div class="modal-header">
											<button type="button" class="close" data-dismiss="modal" aria-hidden="true" @click="doAddCancel('evaAdd')">&times;</button>
											<h4 class="modal-title" id="myModalLabel">新增【{{doAddSiteWithValues.arayName}}】蒸发站信息</h4>
										</div>
										<div class="modal-body" align="center">
											<el-form ref="evaAdd" :inline="true" label-width="100px" class="demo-ruleForm" :rules="rules" :model="evaAdd" >
												<el-form-item label="蒸发站名称" prop="evaporateName" >
													<el-input v-model="evaAdd.evaporateName"></el-input>
												</el-form-item>
												<el-form-item label="蒸发站编码" prop="coding" >
													<el-input v-model="evaAdd.coding"></el-input>
												</el-form-item>
												<el-form-item label="设备名称" prop="equipName" >
													<el-input v-model="evaAdd.equipName"></el-input>
												</el-form-item>
												<el-form-item label="设备编码" prop="equipCoding" >
													<el-input v-model="evaAdd.equipCoding"></el-input>
												</el-form-item>
												<el-form-item label="高程" prop="elevation" >
													<el-input v-model="evaAdd.elevation" type="number"></el-input>
												</el-form-item>
												<el-form-item label="SIM卡号" prop="simClip" >
													<el-input v-model="evaAdd.simClip"></el-input>
												</el-form-item>
												<el-form-item label="SIM运营商" prop="simClipOperator"  >
													<el-select v-model="evaAdd.simClipOperator" placeholder="请选择" >
														<el-option v-for="item in options" :key="item.value" :label="item.label" :value="item.value"></el-option>
													</el-select>
												</el-form-item>
												<el-form-item label="修建时间" prop="buildTime" required >
													<el-date-picker v-model="evaAdd.buildTime" editable="false" type="datetime" placeholder="选择日期时间" style="width:180px;"></el-date-picker>
												</el-form-item>
												<el-form-item label="经度" prop="longitude"   >
													<el-input type="number" placeholder="经度" v-model="evaAdd.longitude" ><template slot="append">度</template></el-input>
												</el-form-item>
												<el-form-item label="纬度" prop="latitude" >
													<el-input type="number" placeholder="纬度"  v-model="evaAdd.latitude" ><template slot="append">度</template></el-input>
												</el-form-item>
												<el-form-item label="行政区编码" id="adminCode" prop="administrativeCoding" required >
													<el-input v-model="evaAdd.administrativeCoding"  disabled></el-input>
												</el-form-item>
												<el-form-item label="详细地址" id="address"  prop="evaporateAddress" >
													<el-input type="textarea" v-model="evaAdd.evaporateAddress"></el-input>
												</el-form-item>
												<el-form-item label="蒸发站图片" id="images"  prop="evaporateImage" class="imagesWater">
													<el-input id="fileText" v-model="evaAdd.evaporateImage" disabled  placeholder="只能上传jpg/png文件，且不超过2MB" >
														<template slot="append" id="uploadId">
															<el-upload class="upload-demo"  ref="upload" :limit="1" :data="map" :on-success="onSuccess" :on-change="imageChange" :action="evaporateSurveySubmitImageUrl" :auto-upload="false">
																<el-button slot="trigger" id="seed" size="small" :disabled="disaled"  type="primary">点此上传</el-button>
															</el-upload>
														</template>
													</el-input>
												</el-form-item>
											</el-form>
										</div>
										<div class="modal-footer">
											<button type="button" class="btn btn-default" data-dismiss="modal" @click="doAddCancel('evaAdd')">关闭</button>
											<button type="button" class="btn btn-primary" @click="submitForm('evaAdd')">提交表单</button>
										</div>
									</div>
								</div>
							</div>

							<%--新增闸门信息--%>
							<div class="modal fade" id="mySluiceModalAdd" tabindex="-1" role="dialog" aria-labelledby="myModalLabel" aria-hidden="true" data-backdrop="static" data-keyboard="false">
								<div class="modal-dialog" style="width:45%">
									<div class="modal-content">
										<div class="modal-header">
											<button type="button" class="close" data-dismiss="modal" aria-hidden="true" @click="doSluiceDialogClose('sluiceGateData')">&times;</button>
											<h4 class="modal-title" >新增闸门信息</h4>
										</div>
										<div class="modal-body" align="center">
											<el-form ref="sluiceGateData" :inline="true" :rules="sluiceGateRules" class="demo-form-inline" label-width="100px" :model="sluiceGateData" >
												<el-form-item label="闸门名称" prop="ssgiSluiceGateName">
													<el-input v-model="sluiceGateData.ssgiSluiceGateName"></el-input>
												</el-form-item>
												<el-form-item label="闸门编码" prop="ssgiSluiceGateCode">
													<el-input v-model="sluiceGateData.ssgiSluiceGateCode"></el-input>
												</el-form-item>
												<el-form-item label="闸门宽度" prop="ssgiSluiceWidth" >
													<el-input v-model="sluiceGateData.ssgiSluiceWidth" type="number"></el-input>
												</el-form-item>
												<el-form-item label="闸门高度" prop="ssgiSluiceHeight" >
													<el-input v-model="sluiceGateData.ssgiSluiceHeight" type="number"></el-input>
												</el-form-item>
												<el-form-item label="闸门重量" prop="ssgiSluiceWeight" >
													<el-input v-model="sluiceGateData.ssgiSluiceWeight" type="number"></el-input>
												</el-form-item>
												<el-form-item label="电动机功率" prop="ssgiSluiceMotorPower" >
													<el-input v-model="sluiceGateData.ssgiSluiceMotorPower" type="number"></el-input>
												</el-form-item>
												<el-form-item label="启闭类型" prop="sluiceTypeName" >
													<el-select v-model="sluiceGateData.sluiceTypeName" placeholder="请选择">
														<el-option v-for="item in allSluiceType" :key="item.sluiceTypeCode" :label="item.sluiceTypeName" :value="item.sluiceTypeCode"></el-option>
													</el-select>
												</el-form-item>
												<el-form-item label="关联视频站" prop="ssgiSluiceMovieId" >
													<el-select v-model="ssgiSluiceMovieIdArray" placeholder="请选择" multiple collapse-tags>
														<el-option v-for="item in allVideoData" :key="item.id" :label="item.deviceVideoName" :value="item.id"></el-option>
													</el-select>
												</el-form-item>
												<el-form-item label="修建时间" prop="ssgiCreateTime">
													<el-date-picker v-model="sluiceGateData.ssgiCreateTime" editable="false" type="datetime" placeholder="选择日期时间" style="width:180px;"></el-date-picker>
												</el-form-item>
												<el-form-item label="" prop="" ></el-form-item>
											</el-form>
										</div>
										<div class="modal-footer">
											<button type="button" class="btn btn-default" data-dismiss="modal" @click="doSluiceDialogClose('sluiceGateData')">关闭</button>
											<button type="button" class="btn btn-primary" @click="addSluiceGateSubmit('sluiceGateData')">提交表单</button>
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
	<script type="text/javascript" src="${ctxstc}/jsp/water_site.jsp" type="text/javascript"></script>
	<script type="text/javascript" src="${ctxstc}/jsp/sluice_site.jsp" type="text/javascript"></script>
	<script type="text/javascript" src="${ctxstc}/jsp/speed_site.jsp" type="text/javascript"></script>
	<script type="text/javascript" src="${ctxstc}/jsp/flowrate_site.jsp" type="text/javascript"></script>
	<script type="text/javascript" src="${ctxstc}/datepicker/WdatePicker.js "></script>
	<script type="text/javascript" src="${ctxstc}/js/custom/permission/show_three_level_permission.js"></script>
	<script type="text/javascript" src="${ctxstc}/js/custom/site_water/site_water.js"></script>
	<%--<script type="text/javascript" src="${ctxstc}/js/custom/sitemanage/water_survey_site/water_survey_site.js.js"></script>--%>
	<script type="text/javascript">
	var url ;
	for(var i=0;i<4;i++){
		  url=window.location.href.indexOf("/",url+1);
	}
	var localPath = window.location.href.substring(0,url);
	/*详情*/
/*	function doDetail(id){
		debugger
		$.post(ctxPath+"/site_water_manage/edit_page_data",{"id":id},function(data){
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
	}*/
	</script>
	<script>

/*	var newCount = 1;
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
	};*/
	function removeHoverDom(treeId, treeNode) {
	    $("#addBtn_"+treeNode.tId).unbind().remove();
	};
/*	function start(id,canalName,canalevl,page,threeLevelPermission){
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
	}*/
	
	
	
	/*function add(){
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
	}*/
	
	//水位站添加提交
	function addWaterSiteSubmit(){
	   var frameId=document.getElementById("add-waterSite-form").getElementsByTagName("iframe")[0].id;
	   $('#'+frameId)[0].contentWindow.mySubmit();
	   window.location.replace("${ctx}/site_water_manage/list");
	 }
	
	
	
	//水位站编辑
	/*function doEdit(id){
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
	}*/
	//水位站编辑提交
/*	function editWaterSiteSubmit(){
		////alert("haha");
	   var frameId=document.getElementById("edit-waterSite-form").getElementsByTagName("iframe")[0].id;
	   $('#'+frameId)[0].contentWindow.mySubmit2();
	   window.location.replace("${ctx}/site_water_manage/list?state="+21);
	}*/
	
	//水位站单个删除
	/*function doDelete(id){
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
	}*/
	
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