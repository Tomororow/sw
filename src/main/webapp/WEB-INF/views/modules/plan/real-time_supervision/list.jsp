<%@ page language="java" contentType="text/html; charset=utf-8" pageEncoding="utf-8"%>
<%@ include file="/WEB-INF/views/base.jsp"%>
<!--  实时数据ui-->
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
<link type="text/css" rel="stylesheet" href="${ctxstc}/css/ui-layout.css" title="" /><!-- angular ui --->
<link type="text/css" rel="stylesheet" href="${ctxstc}/css/custom/scroll.css" title="" /><!-- 滚动条样式 --->

<script type="text/javascript" src="${ctxstc}/jquery/jquery-1.11.1.min.js"></script>

<script type="text/javascript" src="${ctxstc}/jquery/jquery.cookie.js"></script>
<script type="text/javascript" src="${ctxstc}/adapters/bootstrap/js/bootstrap.min.js"></script>
<script type="text/javascript" src="${ctxstc}/adapters/bootstrap/js/bootstrap-paginator.js"></script>
<script type="text/javascript" src="${ctxstc}/js/style.js"></script>
<script type="text/javascript" src="${ctxstc}/js/angular.min.js"></script><!-- angular ui --->
<script type="text/javascript" src="${ctxstc}/js/ui-layout.js"></script>
<script type="text/javascript" src="${ctxstc}/js/moment.js"></script>
<link rel="stylesheet" href="${ctxstc}/adapters/ztree/css/zTreeStyle/zTreeStyle.css" type="text/css">

<script type="text/javascript" src="${ctxstc}/adapters/ztree/js/jquery.ztree.core.js"></script>

<link rel="stylesheet" href="${ctxstc}/adapters/ztree/css/metroStyle/metroStyle.css" type="text/css">
<%--<script type="text/javascript" src="${ctxstc}/adapters/ztree/js/jquery.ztree.excheck.js"></script>--%>
<script type="text/javascript" src="${ctxstc}/adapters/ztree/js/jquery.ztree.exedit.js"></script>

<script src="${ctxstc}/adapters/layui/layer/layer.js"></script>
<script type="text/javascript" src="http://resource.bcevod.com/player/cyberplayer.js"></script>
<%--<link rel="stylesheet" href="${ctxstc}/css/demo.css" type="text/css">--%>
<script type="text/javascript" src="${ctxstc}/js/vue.js"></script>
<link rel="stylesheet" href="${ctxstc}/js/element-ui/theme-chalk/index.css" type="text/css">
<script type="text/javascript" src="${ctxstc}/js/element-ui/index.js"></script>
<!-- 2018-5-04 关于摄像头视频的插件 -->
<script type="text/javascript" src="${ctxstc}/js/ezuikit.js"></script>
<%--<script type="text/javascript" src="${ctxstc}/js/cyberplayer.js"></script>--%>
<%--<link rel="stylesheet" href="${ctxstc}/css/demo.css" type="text/css">--%>

<style>
.el-tree{border:none;background: none;}
.demo-table-expand {font-size: 0;}
.demo-table-expand label {width: 140px;color: #99a9bf;}
.demo-table-expand .el-form-item {margin-right: 0;margin-bottom: 0;width: 25%;}
.el-tabs__item.is-active{color:#20a0ff;background: #d1dbe5;border-radius:3px;}
.el-row {
margin-bottom: 20px;
&:last-child {
margin-bottom: 0;
}
}
.el-col {
border-radius: 4px;
}
.bg-purple-dark {
background: #99a9bf;
}
.bg-purple {
background: #d3dce6;
}
.bg-purple-light {
background: #e5e9f2;
}
.grid-content {
border-radius: 4px;
min-height: 36px;
height:200px;
}
.jwplayer{float:left;margin:20px;}
#inputVideo div{/* float:left; */margin:0 10% 0 5%;font-size:14px;}
#app{width:10%;position: fixed;top:200px;right:15px;}
#app .el-card__body{padding:0px;}
#inputVideo label:hover{cursor: pointer;}
a:hover{cursor: pointer;}
#trder tr:nth-child(1) td{border:solid 1px #a2a2a2;height:40px;text-align: center;width:110px;}
#trder tr:nth-child(2) td{border:solid 1px #a2a2a2;height:40px;text-align: center;width:110px;}
.el-popover__title{font-weight:600}
#tierDcher .el-dialog--small{width:auto;min-width:20%;}
/* 加载高亮设置 */

/*视频站样式设置*/
.vi-ul{width:100%;height:300px;list-style:none;}
.vi-li{width:30%;height:270px;float:left;border:solid 1px green;margin:5px}
.clear{clear:both;display:none}
.el-tabs__item{padding-left: 20px!important;padding-right: 20px!important;}
.el-table thead{color:#4b5261;font-weight:600;font-size: 15px }
/*#videoCtr:hover{background:#0000008c;cursor: pointer}*/
#videoCtr img:hover{cursor:pointer}
/*#videoCtr{width: 35px;height: 35px;position: relative;bottom: 65px;left: 66px;cursor: pointer;line-height: 40px;border-radius: 50%;}*/
#videoCtr{display: inline-block;position: relative}
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
/*在填充数据之前隐藏*/
[v-cloak] {
	display: none;
}
.el-popover__title{font-size: 13px;}
.realVideo:hover{background: #d7efff;cursor: pointer;color:red}
</style>
</head>
<body>
<form  action="${ctx}/cal_canal_info/list" method="post">

<!-- 页面主体start -->
<div class="down-main"  id="realTime" style="left:0;" v-cloak>

<!-- 页面主体右侧内容start -->
<div class="right-product right-full">
<section id="layout" ng-app="doc.ui-layout">
<div ui-layout class="layout-mock">
<ui-layout options="{ flow : 'column' }">

<sidebar class="east-back left-back" >
<ul id="tree" class="nav nav-pills nav-stacked">
<li><h4 style="margin-left:20px;margin-top:20px">渠道等级</h4></li>
<ul id="treeDemo" style="margin-left:15px;" class="ztree"></ul>
</ul>

</sidebar>

<div class="center-back right-back" >
<div class="container-fluid" style="height: 13%;">
<div class="info-center">
<div class="page-header">
<div class="pull-left">
	<h4>灌区信息化平台>实时监测>渠道流量数据监测</h4>
</div>
</div>
<div id="dataTable" style="position: absolute;right: 5%;top:63px;z-index:9999" v-if="type=='1'||type=='2'" v-show="isshow">
	<template>
		<el-date-picker v-model="startTime" format="yyyy-MM-dd HH:mm:ss" type="datetime" placeholder="请选择开始时间" align="right"></el-date-picker>
		<el-date-picker v-model="endTime" format="yyyy-MM-dd HH:mm:ss" type="datetime" placeholder="请选择结束时间"></el-date-picker>
		<el-button size="medium" @click="selectDate">历史数据查询</el-button>
		<el-button size="medium" type="primary" @click="excelPortyu" :loading="exporting">报表导出</el-button>
		<el-button  size="medium" type="primary" @click="backwater()"  icon="el-icon-back">返回</el-button>
	</template>
</div>
<!-- 水位站数据表格展示 -->
<template>
	<el-tabs v-model="type"  @tab-click="ObjectSite" style="margin-top:10px;">
		<el-tab-pane label="雷达流速一体站" name="1" v-if="switchTab==false">
			<el-table  :data="(tableData || '').slice((currentPage-1)*pagesize,currentPage*pagesize)" stripe border width="100%" size="small" key="siteWaterList" :default-sort = "{prop: 'amendTime', order: 'descending'}"  style="width: 100%" border stripe>
				<el-table-column prop="deviveId" label="站点编码"  show-overflow-tooltip align="center" ></el-table-column>
			  <el-table-column label="站点名称" prop="terminalName"  show-overflow-tooltip align="center"></el-table-column>
			  <el-table-column label="设备类型" prop="swiDevicemodelCode"  show-overflow-tooltip align="center">
			  <template scope="props">
					<span v-bind:style="{color:(props.row.swiDevicemodelCode==5?'#E6A23C':'')}">{{props.row.swiDevicemodelCode==5?'雷达水位站':'雷达流速一体计'}}</span>
				 </template>
			  </el-table-column>
			  <el-table-column label="设备状态" prop="type" show-overflow-tooltip width="100" align="center">
				<template scope="props">
					<span v-if="props.row.type=='1'" style="color:green;"><i class="el-icon-circle-check" ></i> 在线</span>
					<span v-if="props.row.type=='0'" style="color:red;"><i class="el-icon-circle-close" ></i> 离线</span>
				</template>
			  </el-table-column>
			  <el-table-column label="实时水位（m）" prop="waterLevel"  show-overflow-tooltip align="center"></el-table-column>
			  <el-table-column label="流速（m/s）" prop="instantSpeed"  show-overflow-tooltip align="center"></el-table-column>
			  <el-table-column label="瞬时流量（m³/s）" prop="instantFlow"  show-overflow-tooltip align="center"></el-table-column>
			 <%-- <el-table-column label="累计流量（m³）" prop="totleFlow"  show-overflow-tooltip align="center"></el-table-column>--%>
			  <el-table-column label="信息采集时间" prop="createtime" show-overflow-tooltip align="center" :formatter="dateFormat"></el-table-column>
			<el-table-column label="实时录像"  show-overflow-tooltip align="center">
				<template scope="props">
					<el-popover :title="props.row.terminalName" placement="bottom"  @show="getLabelInfo(props.row)" width="auto" trigger="click">
						<video v-bind:id="('vidqt')+(props.row.deviveId)" controls poster=""  playsInline webkit-playsinline style="height: 200px;width: 300px;" >
							<source src="" type=""/>
						</video>
						<div slot="reference" class="realVideo">
							<%--<el-button size="small" class="el-icon-video-camera-solid" type="text" >实时视频</el-button>--%>
							<img src="${ctxstc}/images/video/realVideo.png" title="查看实时录像" style="width: 30px;vertical-align:sub"/>
						</div>
					</el-popover>
				</template>
			</el-table-column>
			<el-table-column label="历史数据查询" show-overflow-tooltip align="center" >
			<template scope="props">
                <div class="realVideo">
                    <el-button @click="selecthdata(props.row)" icon="el-icon-search" size="small" type="text" >查询</el-button>
                </div>
			</template>
		  </el-table-column>

			</el-table>
			<el-pagination @size-change="handleSizeChangeother" @current-change="handleCurrentChangeother" :page-sizes="[10, 20, 30, 40]" :current-page.sync="currentPage" :page-size="pagesize" layout="total, prev, pager, next" :total="tableData!=null?tableData.length:0" align="right" style="margin-top:10px;"></el-pagination>
		</el-tab-pane>
		<el-tab-pane label="水位站历史记录" name="1" v-if="switchTab==true">
			<el-table   v-loading = "pictLoading"  element-loading-text = "请稍后" element-loading-spinner = "el-icon-loading"
			:data="historicalList" key="historicalList" <%--height="750"--%>  :default-sort = "{prop: 'swdiCreateTime', order: 'descending'}" style="width: 100%" border>
				<el-table-column label="站点编码" show-overflow-tooltip align="center" ><template slot-scope="scope"><span>{{deviveIdCode}}</span></template></el-table-column>
				<el-table-column label="站点名称" show-overflow-tooltip align="center"><template slot-scope="scope"><span>{{deviceWaterName}}</span></template></el-table-column>
			 	<el-table-column label="实时水位（m）" prop="waterLevel"  show-overflow-tooltip align="center"></el-table-column>
				<el-table-column label="流速（m/s）" prop="instantSpeed"  show-overflow-tooltip align="center"></el-table-column>
			 	<el-table-column label="瞬时流量（m³/s）" prop="instantFlow"  show-overflow-tooltip align="center"></el-table-column>
			 	<el-table-column label="信息采集时间" prop="swdiCreateTime" show-overflow-tooltip align="center" :formatter="dateFormat"></el-table-column>
			</el-table>
			<el-pagination @size-change="handleSizeChange(historyPageSize)" @current-change="handleCurrentChange(historycurrentPage)"  :current-page.sync="historycurrentPage" :page-size="historyPageSize" layout="total, prev, pager, next" :total="sum" align="right"></el-pagination>
		</el-tab-pane>
	<el-tab-pane label="明渠流量站" name="2" v-if="switchTabm==false">
	<!-- 明渠流量站数据表格展示 -->
	  <el-table :data="tableData.slice((currentPage-1)*pagesize,currentPage*pagesize)" :default-sort = "{prop: 'ssdiCollectTime', order: 'descending'}" @row-click="tableRowClick" ref="refTable" style="width: 100%" border stripe>
		  <el-table-column type="expand" show-overflow-tooltip>
			  <template scope="scope">
				  <el-form label-position="left" inline class="demo-table-expand">

					  <el-form-item label="第一层流速(m/s)：">
						  <span>{{scope.row.trenChier1}}</span>
					  </el-form-item>
					  <el-form-item label="第二层流速(m/s)：">
						  <span>{{scope.row.trenChier2}}</span>
					  </el-form-item>
					  <el-form-item label="第三层流速(m/s)：">
						  <span>{{scope.row.trenChier3}}</span>
					  </el-form-item>
					  <el-form-item label="第四层流速(m/s)：">
						  <span>{{scope.row.trenChier4}}</span>
					  </el-form-item>
				  </el-form>
			  </template>
		  </el-table-column>
		  <el-table-column prop="deviveId" label="站点编码"  show-overflow-tooltip align="center" ></el-table-column>
		  <el-table-column label="站点名称" prop="terminalName"  show-overflow-tooltip align="center"></el-table-column>
		  <el-table-column prop="ssdiCollectTime" label="站点类型" show-overflow-tooltip align="center" >
		  <template scope="props">
			  <span v-bind:style="{color:(props.row.swiDevicemodelCode==8?'#E6A23C':'')}">{{props.row.swiDevicemodelCode==8?'明渠流量站':''}}</span>
		  </template>
		  </el-table-column>
		  <el-table-column prop="type" label="设备状态" show-overflow-tooltip align="center" >
			<template scope="props">
				<span v-if="props.row.type=='1'" style="color:green;"><i class="el-icon-circle-check" ></i> 在线</span>
				<span v-if="props.row.type=='0'" style="color:red;"><i class="el-icon-circle-close" ></i> 离线</span>
			</template>
		  </el-table-column>
		  <el-table-column label="实时水位（m）" prop="waterLevel"  show-overflow-tooltip align="center"></el-table-column>
		  <el-table-column label="瞬时流速" prop="instantSpeed"  show-overflow-tooltip align="center"></el-table-column>
		  <el-table-column label="瞬时流量（m³/s）" prop="instantFlow"  show-overflow-tooltip align="center"></el-table-column>
		  <el-table-column label="累计流量（m³）" prop="totleFlow"  show-overflow-tooltip align="center"></el-table-column>
		  <el-table-column label="信息采集时间" prop="createtime" show-overflow-tooltip align="center" :formatter="dateFormat"></el-table-column>
          <el-table-column label="实时录像"  show-overflow-tooltip align="center">
              <template scope="props">
                  <el-popover :title="props.row.terminalName" placement="bottom"  @show="getLabelInfo(props.row)" width="auto" trigger="click">
                      <video v-bind:id="('vidqw')+(props.row.deviveId)" controls poster=""  playsInline webkit-playsinline <%--autoplay--%> style="height: 200px;width: 300px;" >
                          <source src="" type=""/>
                      </video>
                      <div slot="reference" class="realVideo">
                          <%--<el-button size="small" class="el-icon-video-camera-solid" type="text" >实时视频</el-button>--%>
                          <img src="${ctxstc}/images/video/realVideo.png" title="查看实时录像" style="width: 30px;vertical-align:sub"/>
                      </div>
                  </el-popover>
              </template>
          </el-table-column>
		  <el-table-column label="历史数据查询" show-overflow-tooltip align="center" >
			  <template scope="props">
				  <el-button @click="selecthdata(props.row)" icon="el-icon-search" size="small" type="text" >查询</el-button>
			  </template>
		  </el-table-column>
		</el-table>
		<el-pagination @size-change="handleSizeChangeother" @current-change="handleCurrentChangeother" :page-sizes="[10, 20, 30, 40]" :current-page.sync="currentPage" :page-size="pagesize" layout="total, prev, pager, next" :total="tableData!=null?tableData.length:0" align="right" style="margin-top:10px;"></el-pagination>
		</el-tab-pane>
        <el-tab-pane label="流量站历史记录" name="2" v-if="switchTabm==true">
            <el-table  v-loading = "pictLoading"  element-loading-text = "请稍后" element-loading-spinner = "el-icon-loading"
                        :data="historicalList" key="historicalList"   :default-sort = "{prop: 'swdiCreateTime', order: 'descending'}" style="width: 100%" border>
				<el-table-column label="站点编码" show-overflow-tooltip align="center" ><template slot-scope="scope"><span>{{deviveIdCode}}</span></template></el-table-column>
				<el-table-column label="站点名称" show-overflow-tooltip align="center"><template slot-scope="scope"><span>{{deviceWaterName}}</span></template></el-table-column>
				<el-table-column label="实时水位（m）" prop="waterLevel"  show-overflow-tooltip align="center"></el-table-column>
				<el-table-column label="瞬时流速" prop="instantSpeed"  show-overflow-tooltip align="center"></el-table-column>
				<el-table-column label="瞬时流量（m³/s）" prop="instantFlow"  show-overflow-tooltip align="center"></el-table-column>
				<el-table-column label="累计流量（m³）" prop="totleFlow"  show-overflow-tooltip align="center"></el-table-column>
				<el-table-column label="信息采集时间" prop="swdiCreateTime" show-overflow-tooltip align="center" :formatter="dateFormat"></el-table-column>
            </el-table>
			<el-pagination @size-change="handleSizeChange(historyPageSize)" @current-change="handleCurrentChange(historycurrentPage)"  :current-page.sync="historycurrentPage" :page-size="historyPageSize" layout="total, prev, pager, next" :total="sum" align="right"></el-pagination>
        </el-tab-pane>
		<el-tab-pane label="视频站" name="3" align="center" v-loading = "pictLoading"  element-loading-text = "加载中" element-loading-spinner = "el-icon-loading">
		</el-tab-pane>
	  </el-tabs>
</template>

</div>
</div>
	<div id="videoAtr" v-if="type=='3'" style="height: 86.5%;margin-right:5px;" >
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
</form>
<!-- js引入 -->
<script type="text/javascript" src="${ctxstc}/js/custom/province_city/distpicker.data.js"></script>
<script type="text/javascript" src="${ctxstc}/js/custom/province_city/distpicker.js"></script>
<script type="text/javascript" src="${ctxstc}/js/custom/province_city/main.js"></script>
<script type="text/javascript" src="${ctxstc}/js/footer.js"></script>
<script type="text/javascript" src="${ctxstc}/js/custom/water_area_cook.js"></script>
<script type="text/javascript" src="${ctxstc}/jsp/water_site.jsp" type="text/javascript"></script>
<script type="text/javascript" src="${ctxstc}/jsp/sluice_site.jsp" type="text/javascript"></script>
<script type="text/javascript" src="${ctxstc}/jsp/speed_site.jsp" type="text/javascript"></script>
<script type="text/javascript" src="${ctxstc}/jsp/flowrate_site.jsp" type="text/javascript"></script>
<script type="text/javascript" src="${ctxstc}/datepicker/WdatePicker.js "></script>
<script type="text/javascript" src="${ctxstc}/js/custom/plan/real-time_supervision/real-time_supervision.js"></script>
<script type="text/javascript" src="${ctxstc}/js/custom/common/yuntaiControl.js"></script>
</body>
</html>