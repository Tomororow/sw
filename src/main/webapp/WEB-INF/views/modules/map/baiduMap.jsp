<%@ page language="java" import="java.util.*" pageEncoding="utf-8"%>
<%@ include file="/WEB-INF/views/base.jsp"%>

<!DOCTYPE html>
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
	<meta http-equiv="Content-Type" content="text/html; charset=utf-8">
	<meta http-equiv="X-UA-Compatible" content="IE=Edge">
	<meta name="viewport" content="width=device-width, initial-scale=1,maximum-scale=1, user-scalable=no">
	<title>地表水智能监测云平台</title>
	<link rel="Shortcut Icon" href="${ctxstc}/images/jzlogo.ico" type="image/x-icon" />
	<script type="text/javascript" src="${ctxstc}/jquery/jquery-1.8.2.min.js"></script>
	<script type="text/javascript" src="http://api.map.baidu.com/api?v=3.0&ak=BqBbhtroCdoQtxOj1yxrr8NPvPlkMKst"></script>
	<script type="text/javascript" src="http://api.map.baidu.com/library/AreaRestriction/1.2/src/AreaRestriction_min.js"></script>
	<link rel="stylesheet" href="${ctxstc}/adapters/ztree/css/zTreeStyle/zTreeStyle.css" type="text/css">
	<script type="text/javascript" src="${ctxstc}/adapters/ztree/js/jquery.ztree.core.js"></script>
	<script type="text/javascript" src="${ctxstc}/adapters/ztree/js/jquery.ztree.excheck.js"></script>
	<script type="text/javascript" src="${ctxstc}/adapters/ztree/js/jquery.ztree.exedit.js"></script>
	<script type="text/javascript" src="${ctxstc}/js/ezuikit.js"></script>
	<script type="text/javascript" src="${ctxstc}/js/echarts.min.js"></script>
	<script src="${ctxstc}/adapters/layui/layer/layer.js"></script>
	<link rel="stylesheet" href="${ctxstc}/css/custom/map_canal.css" type="text/css">
	<script type="text/javascript" src="${ctxstc}/js/vue.js"></script>
	<link rel="stylesheet" href="${ctxstc}/js/element-ui/theme-chalk/index.css" type="text/css">
	<script type="text/javascript" src="${ctxstc}/js/element-ui/index.js"></script>

	<style>
		/*#searchSiteInfo{display: none}*/
		#searchSiteId:HOVER{cursor: move;}
		#searchSiteId:active{cursor: move;}
	</style>
</head>
<body>
<div id="baiDuMapPage">
	<!-- ------------ 左侧模块 -->
	<div class="leftBtn">
		<ul>
			<li v-for="(model,index) in leftBtnList" v-bind:id="('leftBtn')+(index)" @click="handleMenuBtn('leftBtn',index)">
				<div style="margin:16px 8px 16px 8px;text-align: center">{{model.name}}</div>
			</li>
			<div style="clear:both;"></div>
		</ul>
	</div>
	<!-- ------------ 顶部模块 -->
	<div class="topBtn">
		<ul>
			<li v-for="(model,index) in topBtnList" v-bind:id="('topBtn')+(index)" @click="handleMenuBtn('topBtn',index)">
				<span style="margin:15px 18px 15px 18px;letter-spacing:5px;">{{model.name}}</span>
			</li>
			<div style="clear:both;"></div>
            <%--<el-input id="searchSiteInfo" v-model="searchSite" placeholder="请输入站点" size="small" style="width: 170px;left: 85%;z-index: 999;opacity:0.7;">
                <el-button slot="append" icon="el-icon-search" @click="searchSiteInfo" &lt;%&ndash;@mouseenter.native="mouseenter" @mouseleave.native="mouseleave"&ndash;%&gt; &lt;%&ndash;style="display: block"&ndash;%&gt;></el-button>
            </el-input>--%>
		</ul>
	</div>

    <div id="searchSiteId" style="position: absolute;right: 10%;z-index:999;top:3%;">
        <el-input id="searchSiteInfo" v-model="searchSite" placeholder="请输入站点" size="small" style="width: 170px;opacity:0.7;">
            <el-button slot="append" icon="el-icon-search" @click="searchSiteInfo" <%--@mouseenter.native="mouseenter" @mouseleave.native="mouseleave"--%> <%--style="display: block"--%>></el-button>
        </el-input>
    </div>

	<!-- ------------ 左侧树菜单模块 -->
	<div class="treeBack">
		<ul id="treeDemo" class="ztree"></ul>
	</div>
	<!-- ------------  地图div模块 -->
	<div id="cesiumContainer"></div>
	<!-- ------------  底部弹出框 -->
	<div id="btnProDiv">
		<div style="height: 30px;line-height: 28px;border-bottom:dashed 1px #bb7102;" align="center">
			<div align="left" style="float: left">
				<span style="color:blue;font-size: 15px;font-weight: 600;color: #f39f06">>>></span>
				<span style="color: #fff;font-size: 14px;">当前站点:{{mapButy.deviceWaterName}}</span>
			</div>
			<div align="center" style="position: absolute;width: 50%;left: 25%;">
				<marquee behavior="scroll" width="100%" vspace="1" onmouseover="this.stop();" onmouseout="this.start();">
					<span id="marques" style="font-weight: bolder;font-size: 18px;color: #33b19f;"><<{{mapButy.deviceWaterName}}>>实时监测数据</span>
				</marquee>
			</div>
			<div align="right" style="float: right">
				<a href="javascript:void(0);" onclick="contrAction(1)" style="font-size: 20px;margin-right: 10px;color: #fff">x</a>
			</div>
		</div>
		<div id="monMap">
			<%--站点的基本信息展示--%>
			<div id="waterInfo">
				<table>
					<tr>
						<td>站点编码:</td>
						<td>{{mapButy.deviceWaterCode}}</td>
						<td>在线状态:</td>
						<td>
							<span v-if="mapDynamic.type==1"><i class="el-icon-success" style="color:#15b740;"></i> 在线</span>
							<span v-if="mapDynamic.type==0" ><i class="el-icon-error" style="color: red;"></i> 离线</span>
						</td>
					</tr>
					<tr v-if="activeIndex ===0">
						<td>空高值:</td><td>{{mapButy.siteDepth}} （cm）</td><td>测高值:</td><td>{{mapDynamic.meptyHing}} （cm）</td>
					</tr>
					<tr>
						<td>当前水位:</td><td>{{mapDynamic.waterLevel}}</td><td>瞬时流量:</td><td>{{mapDynamic.instantFlow}}</td>
					</tr>
                    <tr v-if="activeIndex ===1">
                        <td>瞬时流速:</td><td>{{mapButy.instantSpeend}} （m/s）</td><td>累计流量:</td><td>{{mapDynamic.totleFlow}}</td>
                    </tr>
					<tr>
						<td>站点类型:</td><td>{{mapButy.siteType==5?'雷达水位站':'明渠流量站'}}</td><td>上传时间:</td><td>{{mapDynamic.uploadTime}}</td>
					</tr>
				</table>
			</div>
			<%--站点的实时数据--%>
			<div id="waterMonitor" style="color: #fff"  v-loading="EchartLoading" element-loading-text="拼命加载中"
				 element-loading-spinner="el-icon-loading" element-loading-background="#293038b3">
				<div id="EchartMain" style="width:905px;height:266px;right: 0"></div>
			</div>
			<%--明渠流量站的分层流速显示--%>
<%--				<div id="waterMonitor" style="color: #fff"  v-loading="EchartLoading" element-loading-text="拼命加载中"
				 element-loading-spinner="el-icon-loading" element-loading-background="#293038b3">
				<div id="EchartMain" style="width:905px;height:266px;right: 0"></div>
			</div>--%>
			<%--站点的实时视频监控--%>
			<div id="videoMonitor">
				<video id="myPlayer" poster="" controls playsInline webkit-playsinline width="100%" height="100%">
					<source :src="mapButy.ezopenLive" type="" />
				</video>
			</div>
		</div>
	</div>
</div>
<!--弹窗添加或修改内容必备的代码-->
<script type="text/javascript" src="${ctxstc}/js/map/map_baidu_water.js"></script>
<script src="${ctxstc}/js/map/baiDuMap.js"></script>
<%--搜索框拖动--%>
<script type="text/javascript">
	// event.preventDefault();
	var oDivTest = document.getElementById("searchSiteId");
	darg(oDivTest);
	function darg(obj){
		//鼠标按下
		obj.onmousedown = function(ev){
			//IE直接用event或者window.event得到事件本身,而在其他浏览器函数要获取到事件本身需要从函数中传入
			var oevent = ev || event;
			var distanceX = oevent.clientX - this.offsetLeft;
			var distanceY = oevent.clientY - this.offsetTop;
			//鼠标移动
			document.onmousemove = function(ev){
				var oevent = ev || event;
				obj.style.left = oevent.clientX - distanceX + 'px';
				obj.style.top = oevent.clientY - distanceY + 'px';
			};
			//鼠标放开
			document.onmouseup = function(){
				document.onmousemove = null;
				document.onmouseup = null;
			};
		};
	}
</script>
</body>
</html>
