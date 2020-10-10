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
	<script type="text/javascript" src="http://resource.bcevod.com/player/cyberplayer.js"></script>

	<script type="text/javascript" src="${ctxstc}/js/vue.js"></script>
	<link rel="stylesheet" href="${ctxstc}/js/element-ui/theme-chalk/index.css" type="text/css">
	<script type="text/javascript" src="${ctxstc}/js/element-ui/index.js"></script>
    <script rel="stylesheet" src="${ctxstc}/adapters/moment/moment.js"></script>
	<!-- 2018-5-04 关于摄像头视频的插件 -->
	<script type="text/javascript" src="${ctxstc}/js/ezuikit.js"></script>

	<style type="text/css">
        .el-table .positive-row {background: #e2f0e4;}
		.el-table thead{color:#4b5261;font-weight:600;font-size: 15px }
		/*视频站样式设置*/
		.vi-ul{width:100%;height:300px;list-style:none;}
		.vi-li{width:30%;height:270px;float:left;border:solid 1px green;margin:5px}
		.clear{clear:both;display:none}

		#yuntai,#yuntai div{border:solid 1px #8e8a8a;border-radius: 50%;}
		#yuntai .el-icon-caret-top{position: absolute!important;font-size:35px;left:37px;top:-5px;}
		#yuntai .el-icon-caret-top:hover{color: #0468bf;cursor:pointer}
		#yuntai .el-icon-caret-right{position: absolute!important;font-size:35px;right:0;top:35px;}
		#yuntai .el-icon-caret-right:hover{color: #0468bf;cursor:pointer}
		#yuntai .el-icon-caret-bottom{position: absolute!important;font-size:35px;left:37px;bottom:0px;}
		#yuntai .el-icon-caret-bottom:hover{color: #0468bf;cursor:pointer}
		#yuntai .el-icon-caret-left{position: absolute!important;font-size:35px;top:35px;}
		#yuntai .el-icon-caret-left:hover{color: #0468bf;cursor:pointer}

		#videoAtr table td{border: solid 2px #000;}
		#videoAtr table td div{height: 100%;width: 100%;}
		#videoAtr table td div:hover{border:solid 2px #00B83F}
		#videoAtr div img{margin: 0 1% 0 1%;}
		#videoCtr img:hover{cursor:pointer}
		#videoCtr img:hover{cursor:pointer}
		#videoCtr{display: inline-block;position: relative}
		/*在填充数据之前隐藏*/
		[v-cloak] {
			display: none;
		}
		#liTabe table:nth-child(1) thead{display: none}
		.sluiceRealVideo td{width: 100px;position: relative;text-align: center}
		.sluiceRealVideo td div{width: 300px;height: 200px;line-height: 200px;}
		.sluiceRealVideo td video{position: relative;width: 100%;height: 100%;}
		.sluiceRealVideo tr:nth-child(1) td{height: 30px;font-weight:bold;font-size: 15px;}
		.el-popover{left:60%!important;/*width:360px;*/height: 310px;}
	</style>
</head>
<body >
	<!-- 页面主体start -->
	<div class="down-main" id="scroll" v-cloak>
		<!-- 页面主体右侧内容start -->
		<div class="right-product right-full" style="/*margin-left:55px*/;">
			<section id="layout" ng-app="doc.ui-layout">
			<div ui-layout class="layout-mock">
				<ui-layout options="{ flow : 'column' }">
				
				<sidebar class="east-back left-back" >
					 <ul id="tree" class="nav nav-pills nav-stacked">
						<li><h4 style="margin-left:20px;margin-top:20px">渠道等级</h4></li>
						<li id="treeDemo" style="margin-left:15px;" class="ztree">
						</li>
					</ul> 
				</sidebar>
				
				<div class="center-back right-back" >
					<div class="container-fluid">
						<div class="info-center">
							<div class="page-header">
								<div class="pull-left">
									<h4>灌区信息化平台>实时监测>渠道闸门数据监测</h4>
								</div>
							</div>
							<div class="search-box row">

                                <div class="demo-input-suffix">
                                    <span style="margin-left: 20px"></span>
                                    按闸门站编码查询：
                                    <el-input placeholder="请输入内容" v-model="sluiceCodeSelect" prefix-icon="el-icon-search" clearable size="mini" style="width:200px;">
                                        <el-button slot="append" icon="el-icon-search" @click="sluiceCodeQuery"></el-button>
                                    </el-input>
                                    <span style="margin-left: 40px"></span>
                                    按闸门站名称查询：
                                    <el-input placeholder="请输入内容" v-model="sluiceNameSelect" prefix-icon="el-icon-search" clearable size="mini" style="width:200px;">
                                        <el-button slot="append" icon="el-icon-search" @click="sluiceNameQuery"></el-button>
                                    </el-input>
                                </div>
							</div>

							<div class="clearfix"></div>
							<div class="table-margin">
                                <el-tabs @tab-click="tabsClick" v-model="activeName">
                                    <el-tab-pane label="闸门实时数据" name="1">
                                        <el-table :data="(sluiceData || '').slice((currentPage-1)*pageSize,currentPage*pageSize)" highlight-current-row stripe border width="100%" size="medium"
												  @expand-change="handleConnectionSearch" :expand-row-keys="expands" :row-key='getRowKeys' @row-click="tableRowClick" ref="refTable">
											<el-table-column type="expand">
												<template scope="props">
													<el-table :data="props.row.siteSluiceGateInfoList" border size="medium" :header-cell-style="{background:'#f0f9eb'}">
														<el-table-column label="闸门编码" fixed prop="ssgiSluiceGateCode" show-overflow-tooltip align="center"></el-table-column>
														<el-table-column label="闸门名称" fixed prop="ssgiSluiceGateName" show-overflow-tooltip align="center"></el-table-column>
														<el-table-column label="设备状态" show-overflow-tooltip align="center">
															<template slot-scope="scope">
																<span v-if="scope.row.siteSluiceJzMiddDevice.ssjmdSluicGateType=='1'" style="color:green;"><i class="el-icon-circle-check" ></i> 在线</span>
																<span v-if="scope.row.siteSluiceJzMiddDevice.ssjmdSluicGateType=='0'" style="color:red;"><i class="el-icon-circle-close" ></i> 离线</span>
															</template>
														</el-table-column>
														<el-table-column label="开度(cm)" align="center">
															<el-table-column label="当前" show-overflow-tooltip align="center" prop="siteSluiceJzMiddDevice.ssjmdSluiceHeight"></el-table-column>
															<el-table-column label="上限" show-overflow-tooltip align="center" prop="siteSluiceJzMiddDevice.ssjmdOpenCeiling"></el-table-column>
															<el-table-column label="下限" show-overflow-tooltip align="center" prop="siteSluiceJzMiddDevice.ssjmdOpenLower"></el-table-column>
														</el-table-column>
														<el-table-column label="闸前水位(cm)" show-overflow-tooltip align="center" prop="siteSluiceJzMiddDevice.ssjmdBeforeWaterLevel"></el-table-column>
														<el-table-column label="过闸流量(m/s)" show-overflow-tooltip align="center">
                                                            <el-table-column label="实时" align="center" prop="siteSluiceJzMiddDevice.ssjmdSluiceInstantFlow">
                                                                <template slot-scope="scope">
                                                                    <span>{{scope.row.siteSluiceJzMiddDevice.ssjmdSluiceInstantFlow}}</span>
                                                                </template>
                                                            </el-table-column>
                                                            <el-table-column label="计算" align="center">
                                                                <template slot-scope="scope">
                                                                    <span></span>
                                                                </template>
                                                            </el-table-column>
                                                        </el-table-column>
														<el-table-column label="荷重(吨)" align="center">
															<el-table-column label="单路荷重" align="center">
																<el-table-column label="当前" align="center" prop="siteSluiceJzMiddDevice.ssjmdARoadLoad">
																	<template slot-scope="scope">
																		<span>{{(scope.row.siteSluiceJzMiddDevice.ssjmdARoadLoad)/10}}</span>
																	</template>
																</el-table-column>
																<el-table-column label="下限" align="center" prop="siteSluiceJzMiddDevice.ssjmdARoadLoad90">
																	<template slot-scope="scope">
																		<span>{{(scope.row.siteSluiceJzMiddDevice.ssjmdARoadLoad90)/10}}</span>
																	</template>
																</el-table-column>
																<el-table-column label="上限" align="center" prop="siteSluiceJzMiddDevice.ssjmdARoadLoad110">
																	<template slot-scope="scope">
																		<span>{{(scope.row.siteSluiceJzMiddDevice.ssjmdARoadLoad110)/10}}</span>
																	</template>
																</el-table-column>
															</el-table-column>
															<el-table-column label="双路荷重" align="center">
																<el-table-column label="当前" align="center" prop="siteSluiceJzMiddDevice.ssjmdBRoadLoad">
																	<template slot-scope="scope">
																		<span>{{(scope.row.siteSluiceJzMiddDevice.ssjmdBRoadLoad)/10}}</span>
																	</template>
																</el-table-column>
																<el-table-column label="下限" align="center" prop="siteSluiceJzMiddDevice.ssjmdBRoadLoad90">
																	<template slot-scope="scope">
																		<span>{{(scope.row.siteSluiceJzMiddDevice.ssjmdBRoadLoad90)/10}}</span>
																	</template>
																</el-table-column>
																<el-table-column label="上限" align="center" prop="siteSluiceJzMiddDevice.ssjmdBRoadLoad110">
																	<template slot-scope="scope">
																		<span>{{(scope.row.siteSluiceJzMiddDevice.ssjmdBRoadLoad110)/10}}</span>
																	</template>
																</el-table-column>
															</el-table-column>
														</el-table-column>
														<el-table-column label="采集时间" prop="siteSluiceJzMiddDevice.ssjmdModifyTime" show-overflow-tooltip align="center" :formatter="dateFormat"></el-table-column>
														<el-table-column label="实时录像"  show-overflow-tooltip fixed="right" align="center" width="90">
															<template scope="props">
																<div @click.stop>
																	<el-popover title="" placement="bottom"  @show="getLabelInfo(props.row)" width="auto" trigger="click">
																		<%--<table class="sluiceRealVideo" cellspacing="5" border="1">
																			<tr>
																				<td v-for="sli_1 in realVideoData">{{sli_1.deviceVideoName}}</td>
																			</tr>
																			<tr>
																				<td v-for="(sli_2,index) in realVideoData">
																					<div>
																						<video v-bind:id="('vidty')+(props.row.ssgiSluiceGateCode)" controls poster=""  playsInline webkit-playsinline autoplay>
																							<source :src="sli_2.ezopenLive" type=""/>
																						</video>
																						<span v-if="sli_2.ezopenLive==null||sli_2.ezopenLive==''">暂无视频地址</span>
																					</div>
																				</td>
																			</tr>
																		</table>--%>
																		<iframe id="iFramse" v-if="realVideoData.length>0" src="/surface_water/site_sluice_manage/videoFrame"
                                                                                width="100%" height="93.5%" frameborder="0" name="right" scrolling="no" ></iframe>
																		<div slot="reference" class="realVideo">
																			<img src="${ctxstc}/images/video/realVideo.png" title="查看实时录像" style="width: 30px;vertical-align:sub"/>
																		</div>
																	</el-popover>
																</div>
															</template>
														</el-table-column>
														<el-table-column label="历史数据" show-overflow-tooltip align="center" fixed="right" width="90">
															<template scope="scope">
																<el-button @click="historyDataSelect(scope.row)" icon="el-icon-search" size="small" type="text" >点击查询</el-button>
															</template>
														</el-table-column>
													</el-table>
												</template>
											</el-table-column>
											<el-table-column label="闸门站编码" prop="deviceSluiceCode" show-overflow-tooltip align="center"></el-table-column>
											<el-table-column label="闸门站名称" prop="deviceSluiceName" show-overflow-tooltip align="center"></el-table-column>
											<el-table-column label="闸门状态 || 设备类型" prop="siteSluiceGateInfoList" show-overflow-tooltip align="center">
												<template scope="props">
													<el-table :data="props.row.siteSluiceGateInfoList" row-key="id" stripe border width="100%" size="mini" id="liTabe">
														<el-table-column prop="ssgiSluiceGateName" show-overflow-tooltip align="center"></el-table-column>
														<el-table-column prop="siteSluiceJzMiddDevice.ssjmdSluicGateType" show-overflow-tooltip align="center">
															<template scope="props">
																<span :style="{color:props.row.siteSluiceJzMiddDevice.ssjmdSluicGateType=='0'?'red':'green'}">
																	<i :class="props.row.siteSluiceJzMiddDevice.ssjmdSluicGateType=='0'?'el-icon-circle-close':'el-icon-circle-check'" ></i>{{props.row.siteSluiceJzMiddDevice.ssjmdSluicGateType=='0'?'离线':'在线'}}
																</span>
															</template>
														</el-table-column>
														<el-table-column prop="ssgiSluiceTypeName" show-overflow-tooltip align="center">
															<template scope="props">
																<span style="color:#43a5ea ">
																	{{props.row.ssgiSluiceTypeName}}
																</span>
															</template>
														</el-table-column>
													</el-table>
												</template>
											</el-table-column>
											<el-table-column label="详细地址" prop="ssiAddr" show-overflow-tooltip align="center"></el-table-column>
											<el-table-column label="建设时间" prop="ssiBuildTime" show-overflow-tooltip align="center" :formatter="dateFormat"></el-table-column>
										</el-table>
                                        <el-pagination @size-change="handleSizeChange" @current-change="handleCurrentChange"  :current-page.sync="currentPage" :page-size="pageSize" layout="total, prev, pager, next" :total="sluiceData!=null?sluiceData.length:0" align="right"></el-pagination>
                                    </el-tab-pane>
                                    <el-tab-pane label="闸门站视频" name="2">
                                    </el-tab-pane>
                                </el-tabs>
							</div>
							<div>
								<el-dialog  :title="dialogDevicesluiceName + '历史数据'" :visible.sync="historyDialogVisible" @close="doCancel('historySluiceData')" width="80%">
									<template>
										<span style="font-weight:600">当前闸门编码:{{dialogDevicesluiceCode}}</span>
										<el-date-picker v-model="queryStartTime" format="yyyy-MM-dd HH:mm:ss" type="datetime" placeholder="请选择开始时间" clearable size="small" style="left: 50%;position: absolute"></el-date-picker>
										<el-date-picker v-model="queryEndTime" format="yyyy-MM-dd HH:mm:ss" type="datetime" placeholder="请选择结束时间" clearable size="small" style="left: 53%;position: relative;"></el-date-picker>
										<el-button size="small" @click="historyDataQueryByTime" type="primary" icon="el-icon-search" style="left: 54%; position: relative">查询</el-button>
										<el-button size="small" type="primary" @click="sluiceExcelExport" icon="el-icon-share" style="left: 54%; position: relative">报表导出</el-button>
									</template>
									<template>
										<el-table :data="(historySluiceData || '').slice((dialogCurrentPage-1)*dialogPageSize,dialogCurrentPage*dialogPageSize)"  border :row-class-name="tableRowClassName" style="width: 100%; margin-top:5px" v-loading="loading">
											<%--<el-table-column label="闸门站编码" align="center" show-overflow-tooltip prop="devicesluiceCode"></el-table-column>--%>
											<%--<el-table-column label="设备状态" prop="type" show-overflow-tooltip width="100" align="center">
												<template scope="props">
													<span v-if="props.row.ssdiNetState=='1'" style="color:green;"><i class="el-icon-circle-check" ></i> 在线</span>
													<span v-if="props.row.ssdiNetState=='0'" style="color:red;"><i class="el-icon-circle-close" ></i> 离线</span>
												</template>
											</el-table-column>--%>
											<el-table-column label="闸门开度(cm)" align="center" show-overflow-tooltip prop="sluiceHeight"></el-table-column>
											<el-table-column label="闸前水位(cm)" align="center" show-overflow-tooltip prop="beforeWaterLevel"></el-table-column>
											<el-table-column label="过闸流量(m/s)" align="center" show-overflow-tooltip prop="sluiceInstantFlow"></el-table-column>
											<el-table-column label="单路荷重(吨)" align="center" show-overflow-tooltip prop="gateLoada"></el-table-column>
											<el-table-column label="双路荷重(吨)" align="center" show-overflow-tooltip prop="gateLoadb"></el-table-column>
											<el-table-column label="采集时间" align="center" show-overflow-tooltip prop="ssdiCollectTime" :formatter="dateFormat"></el-table-column>
										</el-table>
										<el-pagination @size-change="handleDialogSizeChange" @current-change="handleDialogCurrentChange" :page-sizes="[10, 20, 30, 40]" :current-page.sync="dialogCurrentPage" :page-size="dialogPageSize" layout="total, prev, pager, next" :total="historySluiceData.length" align="right" style="margin-top:10px;"></el-pagination>
									</template>
								</el-dialog>
							</div>
						 </div>
					  </div>
					<div id="videoAtr" v-if="activeName=='2'" style="height: 83.5%;margin-right:5px;" >
						<table height="95%" width="100%" border="2" cellpadding="5" style="table-layout: fixed">
							<tr v-for="(item,idx) in videoControl.consoleTag">
								<td v-for="(item,idt) in videoControl.consoleTag" v-bind:style="{border:videoControl.fullscreen==true?'solid 2px #fff':'solid 2px #000'}">
									<div style="position: relative" @click="videoDivClick(idx,idt)" v-bind:id="('videoDivId')+(idx)+(idt)">
										<video v-bind:id="('myPlayer')+(idx)+(idt)" controls poster=""  playsInline webkit-playsinline <%--autoplay--%> style="position: absolute; width: 100%; height: 100%" >
											<source src="" type=""/>
										</video>
										<input v-bind:id="('videoInput')+(idx)+(idt)" type="hidden" value="">
									</div>
								</td>
							</tr>
						</table>
						<div style="border: solid 1px blue;height:5%;text-align:right;background-color:#f0f0f0">
							<span style="margin: 0.6% 0 1% 1%;font-size: 14px;float: left">当前选择设备：</span>
							<span v-text="videoControl.deviceVideoName" style="margin: 0.6% 0 1% 0;font-size: 13px;float: left"></span>
							<div id="videoCtr" style="margin-right: 1%">
								<el-popover placement="bottom" title="云台控制" width="150" trigger="click" close-delay="50">
									<div id="yuntai" style="width: 110px;height:110px;margin:20px auto 0 auto;position: relative">
										<i class="el-icon-caret-top" @click="yuntaiControlBefore(0,videoControl.videoDeviceSerial)"></i>
										<i class="el-icon-caret-right" @click="yuntaiControlBefore(3,videoControl.videoDeviceSerial)"></i>
										<i class="el-icon-caret-bottom" @click="yuntaiControlBefore(1,videoControl.videoDeviceSerial)"></i>
										<i class="el-icon-caret-left" @click="yuntaiControlBefore(2,videoControl.videoDeviceSerial)"></i>
										<div style="width: 50px;height:50px;margin:25% auto 25% auto;"></div>
									</div>
									<img src="${ctxstc}/images/video/videoCtr.png" slot="reference" title="云台控制" style="cursor: pointer;">
								</el-popover>
							</div>
							<img src="${ctxstc}/images/video/qp.png" slot="reference"  style="cursor: pointer;" @click=screen>
							<img src="${ctxstc}/images/video/1x1.png" slot="reference"  style="cursor: pointer;" @click=consoleClick(1)>
							<img src="${ctxstc}/images/video/2x2.png" slot="reference"  style="cursor: pointer;" @click=consoleClick(2)>
							<img src="${ctxstc}/images/video/3x3.png" slot="reference"  style="cursor: pointer;" @click=consoleClick(3)>
							<img src="${ctxstc}/images/video/4x4.png" slot="reference"  style="cursor: pointer;" @click=consoleClick(4)>
							<img src="${ctxstc}/images/video/5x5.png" slot="reference"  style="cursor: pointer;" @click=consoleClick(5)>
							<el-select v-model="videoControl.consoleTagSelectVal" placeholder="6x6" @change=consoleSelectChange size="mini" style="width: 100px;margin: 6px 1% 0 1%;">
								<el-option v-for="(item,index) in videoControl.consoleTagSelect" :key="index" :label="item" :value="item"></el-option>
							</el-select>
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
	<script type="text/javascript" src="${ctxstc}/js/custom/water_area_cook.js"></script>
	<script type="text/javascript" src="${ctxstc}/datepicker/WdatePicker.js "></script>
	<script type="text/javascript" src="${ctxstc}/js/custom/sluice/site_sluice.js"></script>
	<script type="text/javascript" src="${ctxstc}/js/custom/common/yuntaiControl.js"></script>
</body>
</html>