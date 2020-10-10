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

	<link rel="stylesheet" href="${ctxstc}/adapters/ztree/css/zTreeStyle/zTreeStyle.css" type="text/css">
	<link rel="stylesheet" href="${ctxstc}/adapters/layui/css/layui.css" type="text/css">
	
	<script type="text/javascript" src="${ctxstc}/adapters/ztree/js/jquery.ztree.core.js"></script>
	
    <link rel="stylesheet" href="${ctxstc}/adapters/ztree/css/metroStyle/metroStyle.css" type="text/css">
    <script type="text/javascript" src="${ctxstc}/adapters/ztree/js/jquery.ztree.excheck.js"></script>
    <script type="text/javascript" src="${ctxstc}/adapters/ztree/js/jquery.ztree.exedit.js"></script>
	<script type="text/javascript" src="${ctxstc}/datepicker/WdatePicker.js "></script>
	 <script src="${ctxstc}/adapters/layui/layer/layer.js"></script>
	 <script type="text/javascript" src="${ctxstc}/js/custom/water_area_cook.js"></script>

	<style>
		.topbar-nav-item a{color: red;}
		.topbar-nav-item a:hover{color: blue;}
		
	  </style>
</head>
<body >
		<div style="padding: 30px; line-height: 22px; background-color: #393D49; color: #fff; font-weight: 300;">
  					
    				<form  id="form" action="${ctx}/reservoir/add" method="post" enctype="multipart/form-data">
    				 <input hidden="hidden"  type="text" id="areaSpan" style="color:black;"/>
    				 <input hidden="hidden"  type="text" id="waterAreaSpan" style="color:black;"/> 
    				<table border="0" style="border-collapse:separate; border-spacing:20px 18px;">
	        			<tr>
							<td align="right"><span style="color: red" class="w7">*</span>所属行政区：</td>
							<td id="area" class="w54"  colspan="3">
								<select id="select10" style="color:black;width:100px;height:30px;" onchange="areaChange(this[selectedIndex].value);">
									<option value="area,0,0">--请选择--</option>
									<c:forEach items="${sysAreaList}" var="sysArea">
									 	 <option value="${sysArea.id},${sysArea.areaLevel},${sysArea.areaName}">${sysArea.areaName}</option>
									</c:forEach>
								</select>
								<span id="span10">--</span>
								<input id="areaSure" class="layui-btn layui-btn-normal layui-btn-sm" value="确定" type="button" onclick="getAreaIdAndLevel()" />
							</td>
							
						</tr>
						
						<!-- <tr>
							<td align="center" class="w54"  colspan="3">
								<span id="areaSpan">无<span>
							</td>
							
						</tr>  -->
						
						<tr>	
							<td align="right"><span style="color: red" class="w7">*</span>所属水管区：</td>
							<td id="waterArea" class="w54"  colspan="3">
								<select id="select20" style="color:black;width:100px;height:30px;" onchange="waterAreaChange(this[selectedIndex].value);">
									<option value="waterArea,0,0">--请选择--</option>
									<c:forEach items="${sysWaterAreaList}" var="sysWaterArea">
									  <option value="${sysWaterArea.id},${sysWaterArea.waterAreaLevel},${sysWaterArea.waterAreaName}">${sysWaterArea.waterAreaName}</option>
									</c:forEach>
								</select>
								<span id="span20">--</span>
								<input id="waterAreaSure" class="layui-btn layui-btn-normal layui-btn-sm" value="确定" type="button" onclick="getWaterAreaIdAndLevel()"/>
							</td>
						</tr>
						 <!-- <tr>
							<td align="center" class="w54"  colspan="3">
								<span id="waterAreaSpan">无<span>
							</td>
							
						</tr> -->
						
						<tr>	
							<td align="right"><span style="color: red" class="w7">*</span>行政区编码：</td><td class="w18"><input  class="form-control" type="text" readonly="true" id="sysareaCode" name="sysareaCode" value="" style="color:black;width:180px;"/></td>
							<td align="right"><span style="color: red" class="w7">*</span>水管区编码：</td><td class="w18"><input  class="form-control" type="text" readonly="true" id="syswaterareaCode" name="syswaterareaCode" value="" style="color:black;width:180px;"/></td>
						</tr>
						
						<tr>	
							<td align="right"><span style="color: red" class="w7">*</span>水库编码：</td><td class="w18"><input  class="form-control" type="text" id="deviceReservoirCode" name="deviceReservoirCode" value="${siteReservoirInfo.deviceReservoirCode}" style="color:black;width:180px;"/></td>
							<td align="right"><span style="color: red" class="w7">*</span>水库名称：</td><td class="w18"><input  class="form-control" type="text"  id="deviceReservoirName" name="deviceReservoirName" value="${siteReservoirInfo.deviceReservoirName}" style="color:black;width:180px;"/></td>
							
						</tr>
						<tr>	
							<td align="right"><span style="color: red" class="w7">*</span>水库纬度：</td><td class="w18"><input  class="form-control" type="text" id="sriLatitude" name="sriLatitude" value="${siteReservoirInfo.sriLatitude}" style="color:black;width:180px;"/></td>
							<td align="right"><span style="color: red" class="w7">*</span>水库高程：</td><td class="w18"><input  class="form-control" type="text" id="sriHeight" name="sriHeight" value="${siteReservoirInfo.sriHeight}" style="color:black;width:180px;"/></td>
						
						</tr>
						
						<tr>	
							<td align="right"><span style="color: red" class="w7">*</span>水库总库容：</td><td class="w18"><input class="form-control" type="text" id="reservoirCapacity" name="reservoirCapacity" value="${siteReservoirInfo.reservoirCapacity}" style="color:black;width:180px;"/></td>
							<td align="right"><span style="color: red" class="w7">*</span>调洪库容：</td><td class="w18"><input class="form-control" type="text" id="thReservoirCapacity" name="thReservoirCapacity" value="${siteReservoirInfo.thReservoirCapacity}" style="color:black;width:180px;"/></td>
						
						</tr>
						
						<tr>	
							<td align="right"><span style="color: red" class="w7">*</span>防洪库容：</td><td class="w18"><input class="form-control" type="text" id="fhReservoirCapacity" name="fhReservoirCapacity" value="${siteReservoirInfo.fhReservoirCapacity}" style="color:black;width:180px;"/></td>
							<td align="right"><span style="color: red" class="w7">*</span>兴利库容：</td><td class="w18"><input class="form-control" type="text" id="xlReservoirCapacity" name="xlReservoirCapacity" value="${siteReservoirInfo.xlReservoirCapacity}" style="color:black;width:180px;"/></td>
						
						</tr>
						
						
						<tr>
							<td align="right"><span style="color: red" class="w7">*</span>建设时间：</td><td class="w18"><input  class="form-control" id="sriBuildTime" type="text"  name="sriBuildTime"   onfocus="WdatePicker({'skin':'whyGreen','dateFmt':'yyyy-MM-dd'});" style="color:black;width:180px;"  /></td>
							<td align="right"><span style="color: red" class="w7">*</span>水库经度：</td><td class="w18"><input  class="form-control" type="text"  id="sriLongitude" name="sriLongitude"   value="${siteReservoirInfo.sriLongitude}" style="color:black;width:180px;"  /></td>
						</tr>
						<tr>	
							<td align="right"><span style="color: red" class="w7">*</span>主坝坝高:</td><td class="w18"><input class="form-control" type="text" id="mainDamHeight" name="mainDamHeight" value="${siteReservoirInfo.mainDamHeight}" style="color:black;width:180px;"/></td>
							<td align="right"><span style="color: red" class="w7">*</span>主坝坝长:</td><td class="w18"><input class="form-control"  type="text" id="mainDanLength"  name="mainDanLength" value="${siteReservoirInfo.mainDanLength}" style="color:black;width:180px;"/></td>
						</tr>
						
						<tr>
							<td align="right"><span style="color: red" class="w7">*</span>坝顶高程:</td><td class="w18"><input class="form-control" type="text" id="damTopHeight" name="damTopHeight" value="${siteReservoirInfo.damTopHeight}" style="color:black;width:180px;"/></td>
							<td align="right"><span style="color: red" class="w7">*</span>高程系数:</td><td class="w18"><input class="form-control" type="text" id="heightCoefficient" name="heightCoefficient" value="${siteReservoirInfo.heightCoefficient}" style="color:black;width:180px;"/></td>
						</tr>
						<tr>	
							<td align="right"><span style="color: red" class="w7">*</span>水库调节性能:</td><td class="w18"><input class="form-control" type="text" id="reservoirRegulationPerformance" name="reservoirRegulationPerformance" value="${siteReservoirInfo.reservoirRegulationPerformance}" style="color:black;width:180px;"/></td>
							<td align="right"><span style="color: red" class="w7">*</span>主坝级别:</td><td class="w18">
							<%-- <input class="form-control" type="text" name="mainDamLevel" value="${siteReservoirInfo.mainDamLevel}" style="color:black;width:180px;"/> --%>
								<select  name="mainDamLevel" id="mainDamLevel" value="${siteReservoirInfo.mainDamLevel}" class="form-control" style="color:black;width:180px;height:35px;">
										<option value="">--请选择--</option>
										<option value="一级">一级</option>
										<option value="二级">二级</option>
										<option value="三级">三级</option>
										<option value="四级">四级</option>
										<option value="五级">五级</option>
										<option value="六级">六级</option>
								</select>
							</td>
						</tr>
						<tr>	
							<td align="right"><span style="color: red" class="w7">*</span>供水对象:</td>
							<td class="w18">
								<%-- calCanalUsetypeList <input class="form-control" type="text" name="supplyObject" value="${siteReservoirInfo.supplyObject}" style="color:black;width:180px;"/> --%>
								<%-- <select  name="supplyObject" id="supplyObject" value="${siteReservoirInfo.supplyObject}" class="form-control" style="color:black;width:180px;height:35px;">
										<option value="">--请选择--</option>
										<option value="农业灌溉">农业灌溉</option>
										<option value="城乡生活">城乡生活</option>
										<option value="工矿企业">工矿企业</option>
								</select> --%>
								<select  name="supplyObject" id="supplyObject" value="${siteReservoirInfo.supplyObject}" class="form-control" style="color:black;width:180px;height:35px;">
											<option value="">--请选择--</option>
											<c:forEach items="${calCanalUsetypeList}" var="CalCanalUsetype">
											  	<option value="${CalCanalUsetype.canalUsetypeCode}">${CalCanalUsetype.canalUsetypeName}</option>
											</c:forEach>
								</select>
							</td>
							<td align="right"><span style="color: red" class="w7">*</span>坝的用途功能:</td>
							<td class="w18">
								<%-- <input class="form-control" type="text" name="damFunction" value="${siteReservoirInfo.damFunction}" style="color:black;width:180px;"/> --%>
								<select  name="damFunction" id="damFunction" value="${siteReservoirInfo.damFunction}" class="form-control" style="color:black;width:180px;height:35px;">
										<option value="">--请选择--</option>
										<option value="挡水坝001">挡水坝001</option>
										<option value="挡水坝002">挡水坝002</option>
										<option value="挡水坝003">挡水坝003</option>
										<option value="挡水坝004">挡水坝004</option>
										<option value="挡水坝005">挡水坝005</option>
								</select>
							</td>
						</tr>
						<tr>
							<td align="right"><span style="color: red" class="w7">*</span>所属河流：</td>
								<td class="w18">
								<%-- <input  class="form-control" type="text" name="belongsCanalCode" value="${siteReservoirInfo.belongsCanalCode}" style="color:black;width:180px;"/> --%>
								
								<select  name="belongsCanalCode" id="belongsCanalCode" value="${siteReservoirInfo.belongsCanalCode}" class="form-control" style="color:black;width:180px;height:35px;">
											<option value="">--请选择--</option>
											<c:forEach items="${calCanalInfoList}" var="calCanalInfo">
											  	<option value="${calCanalInfo.canalCode}">${calCanalInfo.canalName}</option>
											</c:forEach>
								</select>
								</td>	
							<td align="right"><span style="color: red" class="w7">*</span>三级区名称(流域)：</td>
							<td class="w18">
								<%-- <input  class="form-control" type="text" name="threeLevelAreaName" value="${siteReservoirInfo.threeLevelAreaName}" style="color:black;width:180px;"/> --%>
								<select  name="threeLevelAreaName" id="threeLevelAreaName" value="${siteReservoirInfo.threeLevelAreaName}" class="form-control" style="color:black;width:180px;height:35px;">
										<option value="">--请选择--</option>
										<option value="黑河001">黑河001</option>
										<option value="黑河002">黑河002</option>
										<option value="黑河003">黑河003</option>
										<option value="黑河004">黑河004</option>
										<option value="黑河005">黑河005</option>
										<option value="黑河006">黑河006</option>
								</select>
								</td>
						</tr>
						
						<tr>	
							<td align="right"><span style="color: red" class="w7">*</span>工程级别：</td>
							<td class="w18">
								<%-- <input type="text"  class="form-control" name="engineeringLevel" value="${siteReservoirInfo.engineeringLevel}" style="color:black;width:180px;"/> --%>
								<select  name="engineeringLevel" id="engineeringLevel" value="${siteReservoirInfo.engineeringLevel}" class="form-control" style="color:black;width:180px;height:35px;">
										<option value="">--请选择--</option>
										<option value="1">Ⅰ</option>
										<option value="2">Ⅱ</option>
										<option value="3">Ⅲ</option>
										<option value="4">Ⅳ</option>
										<option value="5">Ⅴ</option>
										<option value="6">Ⅵ</option>
										<option value="7">Ⅶ</option>
										<option value="8">Ⅷ</option>
										<option value="9">Ⅸ</option>
										<option value="10">Ⅹ</option>
										
								</select>
							</td>
							
							<td align="right"><span style="color: red" class="w7">*</span>设备编码(水位监测仪器)：</td><td class="w18"><input  class="form-control" type="text" id="sriDeviceNo" name="sriDeviceNo" value="${siteReservoirInfo.sriDeviceNo}" style="color:black;width:180px;"/></td>
						
						</tr>
						
						
						<tr>	
							<td align="right"><span style="color: red" class="w7">*</span>取水口水量单位个：</td><td class="w18"><input class="form-control" type="text" id="waterMouth" name="waterMouth" value="${siteReservoirInfo.waterMouth}" style="color:black;width:180px;"/></td>
							<td align="right"><span style="color: red" class="w7">*</span>设计年供水量：</td><td class="w18"><input class="form-control" type="text" id="designWaterYearSupply" name="designWaterYearSupply" value="${siteReservoirInfo.designWaterYearSupply}" style="color:black;width:180px;"/></td>
						
						</tr>
						
						
						<tr>	
							<td align="right"><span style="color: red" class="w7">*</span>水资源三级区名称：</td><td class="w18"><input  class="form-control" type="text" id="waterResourcesLevelCode" name="waterResourcesLevelCode" value="${siteReservoirInfo.waterResourcesLevelCode}" style="color:black;width:180px;"/></td>
							<td align="right"><span style="color: red" class="w7">*</span>水资源三级区编码：</td><td class="w18"><input type="text"  class="form-control" id="code" name="code" value="${siteReservoirInfo.code}" style="color:black;width:180px;"/></td>
						</tr>
						<tr>	
							<td align="right"><span style="color: red" class="w7">*</span>大坝材质类型:</td>
							<td class="w18">
								<%-- <input class="form-control" type="text" name="damMaterialType" value="${siteReservoirInfo.damMaterialType}" style="color:black;width:180px;"/> --%>
								<select  name="damMaterialType" id="damMaterialType" value="${siteReservoirInfo.damMaterialType}" class="form-control" style="color:black;width:180px;height:35px;">
										<option value="">--请选择--</option>
										<option value="土坝">土坝</option>
										<option value="堆石坝">堆石坝</option>
								</select>
								</td>
							<td align="right"><span style="color: red" class="w7">*</span>大坝结构分类:</td>
							<td class="w18">
								<%-- <input class="form-control" type="text" name="damStructureType" value="${siteReservoirInfo.damStructureType}" style="color:black;width:180px;"/> --%>
								<select  name="damStructureType" id="damStructureType" value="${siteReservoirInfo.damStructureType}" class="form-control" style="color:black;width:180px;height:35px;">
										<option value="">--请选择--</option>
										<option value="心墙坝">心墙坝</option>
										<option value="面板坝">面板坝</option>
								</select>
							</td>
						</tr>
						
						
						<tr>	
							<td align="right"><span style="color: red" class="w7">*</span>大坝泄洪建筑物:</td><td class="w18">
							<%-- <input class="form-control" type="text" name="releaseFloodWatersBuilding" value="${siteReservoirInfo.releaseFloodWatersBuilding}" style="color:black;width:180px;"/> --%>
								<select  name="releaseFloodWatersBuilding" id="releaseFloodWatersBuilding" value="${siteReservoirInfo.releaseFloodWatersBuilding}" class="form-control" style="color:black;width:180px;height:35px;">
										<option value="">--请选择--</option>
										<option value="岸坡式">岸坡式</option>
										<option value="隧洞式">隧洞式</option>
								</select>
							</td>
							<td align="right"><span style="color: red" class="w7">*</span>大坝控制流域面积:</td><td class="w18"><input class="form-control" type="text" id="damControlBasinArea" name="damControlBasinArea" value="${siteReservoirInfo.damControlBasinArea}" style="color:black;width:180px;"/></td>
						</tr>
						
						<tr>	
							<td align="right"><span style="color: red" class="w7">*</span>大坝多年平均径流量:</td><td class="w18"><input class="form-control" type="text" id="damAverageFlowRate" name="damAverageFlowRate" value="${siteReservoirInfo.damAverageFlowRate}" style="color:black;width:180px;"/></td>
							<td align="right"><span style="color: red" class="w7">*</span>生产安置人口（万人）:</td><td class="w18"><input class="form-control" type="text" id="scazPeopleNumber" name="scazPeopleNumber" value="${siteReservoirInfo.scazPeopleNumber}" style="color:black;width:180px;"/></td>
						</tr>
						
						<tr>	
							<td align="right"><span style="color: red" class="w7">*</span>搬迁安置人口（万人）:</td><td class="w18"><input class="form-control" type="text" id="bqazPeopleNumber" name="bqazPeopleNumber" value="${siteReservoirInfo.bqazPeopleNumber}" style="color:black;width:180px;"/></td>
							<td align="right"><span style="color: red" class="w7">*</span>工程建设情况:</td><td class="w18">
							<%-- <input class="form-control" type="text" name="engineeringConstructionSituation" value="${siteReservoirInfo.engineeringConstructionSituation}" style="color:black;width:180px;"/> --%>
								<select  name="engineeringConstructionSituation" id="engineeringConstructionSituation" value="${siteReservoirInfo.engineeringConstructionSituation}" class="form-control" style="color:black;width:180px;height:35px;">
										<option value="">--请选择--</option>
										<option value="已建">已建</option>
										<option value="未建">未建</option>
								</select>
							</td>
						</tr>
						
						<tr>	
							<td align="right"><span style="color: red" class="w7">*</span>最大泄洪流量:</td><td class="w18"><input class="form-control" type="text" id="maxReleaseFloodWaters" name="maxReleaseFloodWaters" value="${siteReservoirInfo.maxReleaseFloodWaters}" style="color:black;width:180px;"/></td>
							<td align="right"><span style="color: red" class="w7">*</span>设计洪水标准重现期:</td><td class="w18"><input class="form-control" type="text" id="sjhsbz" name="sjhsbz" value="${siteReservoirInfo.sjhsbz}" style="color:black;width:180px;"/></td>
						</tr>
						
						<tr>	
							<td align="right"><span style="color: red" class="w7">*</span>校核洪水标准重现期:</td><td class="w18"><input class="form-control" type="text" id="jzhsbz" name="jzhsbz" value="${siteReservoirInfo.jzhsbz}" style="color:black;width:180px;"/></td>
							<td align="right"><span style="color: red" class="w7">*</span>设计洪水位(m)</td><td class="w18"><input class="form-control" type="text" id="sjhsw" name="sjhsw" value="${siteReservoirInfo.sjhsw}" style="color:black;width:180px;"/></td>
						</tr>
						
						<tr>	
							<td align="right"><span style="color: red" class="w7">*</span>校核洪水位(m):</td><td class="w18"><input class="form-control" type="text" id="jzhsw" name="jzhsw" value="${siteReservoirInfo.jzhsw}" style="color:black;width:180px;"/></td>
							<td align="right"><span style="color: red" class="w7">*</span>防洪高水位(m):</td><td class="w18"><input class="form-control" type="text" id="fhgsw" name="fhgsw" value="${siteReservoirInfo.fhgsw}" style="color:black;width:180px;"/></td>
						</tr>
						
						<tr>	
							<td align="right"><span style="color: red" class="w7">*</span>正常蓄水位(m):</td><td class="w18"><input class="form-control" type="text" id="zcxsw" name="zcxsw" value="${siteReservoirInfo.zcxsw}" style="color:black;width:180px;"/></td>
							<td align="right"><span style="color: red" class="w7">*</span>防洪限制水位(m)：</td><td class="w18"><input type="text" name="fhxzsw" id="fhxzsw" value="${siteReservoirInfo.fhxzsw}" style="color:black;width:180px;"/></td>
						</tr>
						
						<tr>	
							<td align="right"><span style="color: red" class="w7">*</span>死水位(m)：</td><td class="w18"><input class="form-control" type="text" id="ssw" name="ssw" value="${siteReservoirInfo.ssw}" style="color:black;width:180px;"/></td>
							<td align="right"><span style="color: red" class="w7">*</span>死库容(万m³)：</td><td class="w18"><input class="form-control" type="text" id="skr" name="skr" value="${siteReservoirInfo.skr}" style="color:black;width:180px;"/></td>
						</tr>
						
						<tr>	
							<td align="right"><span style="color: red" class="w7">*</span>正常蓄水位相应水面面积（km²）：</td><td class="w18"><input class="form-control" type="text" id="zcxswxysmmj" name="zcxswxysmmj" value="${siteReservoirInfo.zcxswxysmmj}" style="color:black;width:180px;"/></td>
							<td align="right"><span style="color: red" class="w7">*</span>重要保护对象：</td><td class="w18"><input class="form-control" type="text" id="zybhdx" name="zybhdx" value="${siteReservoirInfo.zybhdx}" style="color:black;width:180px;"/></td>
						</tr>
						
						<tr>	
							<td align="right"><span style="color: red" class="w7">*</span>灌区名称：</td><td class="w18"><input class="form-control" type="text" id="gxmc" name="gxmc" value="${siteReservoirInfo.gxmc}" style="color:black;width:180px;"/></td>
							<td align="right"><span style="color: red" class="w7">*</span>水库归口管理部门：</td><td class="w18"><input class="form-control" type="text" id="skgkglbm" name="skgkglbm" value="${siteReservoirInfo.skgkglbm}" style="color:black;width:180px;"/></td>
						</tr>
						
						<tr>	
							<td align="right"><span style="color: red" class="w7">*</span>是否完成划界：</td><td class="w18">
								<%-- <input class="form-control" type="text" name="sfwchj" value="${siteReservoirInfo.sfwchj}" style="color:black;width:180px;"/> --%>
								<select  name="sfwchj" id="sfwchj" value="${siteReservoirInfo.sfwchj}" class="form-control" style="color:black;width:180px;height:35px;">
										<option value="">--请选择--</option>
										<option value="0">是</option>
										<option value="1">否</option>
								</select>
								</td>
							<td align="right"><span style="color: red" class="w7">*</span>是否完成确权：</td><td class="w18">
								<%-- <input class="form-control" type="text" name="sfwcqq" value="${siteReservoirInfo.sfwcqq}" style="color:black;width:180px;"/> --%>
								<select  name="sfwcqq" id="sfwcqq" value="${siteReservoirInfo.sfwcqq}" class="form-control" style="color:black;width:180px;height:35px;">
										<option value="">--请选择--</option>
										<option value="0">是</option>
										<option value="1">否</option>
								</select>
							</td>
						</tr>
						<tr>	
							<td align="right">联系人员：</td><td class="w18"><input type="text"  class="form-control" name="contactsPeople" value="${siteReservoirInfo.contactsPeople}" style="color:black;width:180px;"/></td>
							
							<td align="right">联系电话：</td><td class="w18"><input type="text"  class="form-control" name="contentPhone" value="${siteReservoirInfo.contentPhone}" style="color:black;width:180px;"/></td>
						</tr>
						<tr>	
							<td align="right"><span style="color: red" class="w7">*</span>设计灌溉面积单位(万亩)：</td><td class="w18"><input class="form-control" type="text" id="reservoirIrrigatedAcreage" name="reservoirIrrigatedAcreage" value="${siteReservoirInfo.reservoirIrrigatedAcreage}" style="color:black;width:180px;"/></td>
							
						<td align="right"><span style="color: red" class="w7">*</span>所属水位站：</td>
							<td class="w18">
							<select  name="siteWaterId" id="siteWaterId" value="${siteReservoirInfo.siteWaterId}" class="form-control" style="color:black;width:180px;height:35px;">
										<option value="">--请选择--</option>
										<c:forEach items="${siteWaterInfoList}" var="siteWaterInfo">
										  	<option value="${siteWaterInfo.id}">${siteWaterInfo.deviceWaterName}</option>
										</c:forEach>
							</select>
						</td>	
						
						
						</tr>
						 <tr>
							<td align="right"><span style="color: red">*</span>水库详细地址:</td>
							<td class="w18"  colspan="3">
								<textarea  name="sriAddr" id="sriAddr" cols="100" class="form-control" rows="1" style="color:black;">${siteReservoirInfo.sriAddr}</textarea> 
							</td>
						</tr>
						
						<tr>
							<td align="right">备注：</td>
							<td class="w18"  colspan="3">
							<textarea  name="sriRemark" cols="100" class="form-control" rows="1" style="color:black;">${siteReservoirInfo.sriRemark}</textarea> 
							</td>
						</tr>
						
    				</table>
	        		</form>
       		 </div>
	<script type="text/javascript" src="${ctxstc}/js/footer.js"></script>
	<script type="text/javascript" src="${ctxstc}/js/custom/water_area_cook.js"></script>
	<script type="text/javascript" src="${ctxstc}/datepicker/WdatePicker.js "></script>
	<script src="${ctxstc}/adapters/layui/layui.js" charset="utf-8"></script>
	<script type="text/javascript" src="${ctxstc}/js/custom/reservoir/reservoir.js" ></script> 
	<script type="text/javascript">
		var curWwwPath = window.document.location.href;
		var pathName = window.document.location.pathname;
		var pos = curWwwPath.indexOf(pathName);
		var localhostPaht = curWwwPath.substring(0,pos);
		var projectName = pathName.substring(0,pathName.substr(1).indexOf('/')+1);
		var ctxPath = localhostPaht + projectName;
		var picPath = localhostPaht;
		/* function waterAreaChange(a){
				
				delCookie("id");
				////alert(a);
				var paramArray = a.split(",");  
			    	var id = paramArray[0];  
			    	var level =parseInt(paramArray[1]);
			    	var name =paramArray[2];
			    	////alert(name+"rww");
			    	//选择已经显示的区域名称
			    	var content = "";
			    	if(name!=0){
			    		////alert(name+"rww22");
			    		for(var i=0;i<=level;i++){
			    			////alert(name+i);
			    			var selectTag=document.getElementById("select2"+i);
			    			
			    			var optionValue = selectTag.options[selectTag.selectedIndex].value;
				    			var optionParamArray = optionValue.split(",");  
				    			
				    			var optionLevel = optionParamArray[1]; 
				    	    	var optionName = optionParamArray[2]; 
				    	    	content=content+("【"+optionLevel+":"+optionName+"】-");
			    		}
			    		
			    		
			    		var waterAreaSpan = document.getElementById("waterAreaSpan");
			    		waterAreaSpan.innerHTML=content;
			    	}else{
			    		if(level==0){
			    			content="无";
			    		}
			    		for(var i=0;i<level;i++){
			    			////alert(name+i);
			    			var selectTag=document.getElementById("select2"+i);
			    			
			    			var optionValue = selectTag.options[selectTag.selectedIndex].value;
				    			var optionParamArray = optionValue.split(",");  
				    			
				    			var optionLevel = optionParamArray[1]; 
				    	    	var optionName = optionParamArray[2]; 
				    	    	content=content+("【"+optionLevel+":"+optionName+"】-");
			    		}
			    		
			    		
			    		var waterAreaSpan = document.getElementById("waterAreaSpan");
			    		waterAreaSpan.innerHTML=content;
			    	}
			    	
			    	
			    	if(id!="waterArea"){
			    		setCookie("id",id);
			    	}else if(id=="waterArea"){
			    		
			    		if(level<=0){
			    			setCookie("id","");
			    		}else{
			    			var selectTag = document.getElementById("select2"+(level-1));
			    			
			    			var optionValue = selectTag.options[selectTag.selectedIndex].value;
				    			var optionParamArray = optionValue.split(",");  
				    	    	var optionId = optionParamArray[0]; 
				    	    	setCookie("id",optionId);
			    		}
			    	}
			    	////alert(level);
			    	var parentNode = document.getElementById("waterArea");
			    		parentNode.removeChild(document.getElementById("waterAreaSure"));
			    	//如果水管区父级重选删除子水管区
			    	var number1=level+1;
			    	while(document.getElementById("select2"+number1)){
			    		////alert(number);
			    		parentNode.removeChild(document.getElementById("select2"+number1));
			    		number1++;
			    	}
			    	
			    	var number2=level+1;
			    	while(document.getElementById("span2"+number2)){
			    		parentNode.removeChild(document.getElementById("span2"+number2));
			    		number2++;
			    	}
				$.ajax({
					url:ctxPath+"/cal_canal_info/find_son_water_Area",
					data: {id:id},
					type: "post",
					async: false,//非异步
					success: function(msg){
						////alert(JSON.stringify(msg));
						var currentTag = document.getElementById("waterArea");
						if(msg.length>0){
						    var newSelectTag = document.createElement("select");
						    	newSelectTag.setAttribute("id", "select2"+(level+1));
						    	newSelectTag.setAttribute("style", "color:black;width:100px;height:30px;");
						    	newSelectTag.setAttribute("onchange","waterAreaChange(this[selectedIndex].value);");
						    	
						    	for(var i=0;i<msg.length;i++){
						    		
						    		if(i==0){
						    			var newOptionTag = document.createElement("option");
							    			newOptionTag.setAttribute("value","waterArea,"+msg[i].waterAreaLevel+","+"0");
							    			newOptionTag.innerHTML="请选择";
							    			newSelectTag.appendChild(newOptionTag);
						    			var newOptionTag = document.createElement("option");
							    			newOptionTag.setAttribute("value",msg[i].id+","+msg[i].waterAreaLevel+","+msg[i].waterAreaName);
							    			newOptionTag.innerHTML=msg[i].waterAreaName;
							    			newSelectTag.appendChild(newOptionTag);
						    		}else{
						    			var newOptionTag = document.createElement("option");
							    			newOptionTag.setAttribute("value",msg[i].id+","+msg[i].waterAreaLevel+","+msg[i].waterAreaName);
							    			newOptionTag.innerHTML=msg[i].waterAreaName;
							    			newSelectTag.appendChild(newOptionTag);
						    		}
						    	}
						    var newSpanTag = document.createElement("span");
						    	newSpanTag.setAttribute("id","span2"+(level+1));
								newSpanTag.innerHTML="--";
						    var newInputTag = document.createElement("input");
						    	newInputTag.setAttribute("id","waterAreaSure");
						    	newInputTag.setAttribute("class","layui-btn layui-btn-normal layui-btn-sm");
						    	newInputTag.setAttribute("type","button");
						    	newInputTag.setAttribute("value","确定");
						    	newInputTag.setAttribute("onclick","getWaterAreaIdAndLevel()");
						    	currentTag.appendChild(newSelectTag);
						    	currentTag.appendChild(newSpanTag);
						    	currentTag.appendChild(newInputTag);
						}else{
						
							var newInputTag = document.createElement("input");
								newInputTag.setAttribute("class","layui-btn layui-btn-normal layui-btn-sm");
						    	newInputTag.setAttribute("id","waterAreaSure");
						    	newInputTag.setAttribute("type","button");
						    	newInputTag.setAttribute("value","确定");
						    	newInputTag.setAttribute("onclick","getWaterAreaIdAndLevel()");
					    	currentTag.appendChild(newInputTag);
						}
					}
				});
			} */
			//
			function areaChange(a){
			delCookie("areaId");
			////alert(a);
			var paramArray = a.split(",");  
		    	var id = paramArray[0];  
		    	var level =parseInt(paramArray[1]);
		    	var name =paramArray[2];
		    	////alert(name+"rww");
		    	//选择已经显示的区域名称
		    	var content = "";
		    	if(name!=0){
		    		////alert(name+"rww22");
		    		for(var i=0;i<=level;i++){
		    			////alert(name+i);
		    			var selectTag=document.getElementById("select1"+i);
		    			
		    			var optionValue = selectTag.options[selectTag.selectedIndex].value;
			    			var optionParamArray = optionValue.split(",");  
			    			
			    			var optionLevel = optionParamArray[1]; 
			    	    	var optionName = optionParamArray[2]; 
			    	    	content=content+("【"+optionLevel+":"+optionName+"】-");
		    		}
		    		
		    		
		    		var areaSpan = document.getElementById("areaSpan");
		    		areaSpan.innerHTML=content;
		    	}else{
		    		if(level==0){
		    			content="无";
		    		}
		    		for(var i=0;i<level;i++){
		    			////alert(name+i);
		    			var selectTag=document.getElementById("select1"+i);
		    			
		    			var optionValue = selectTag.options[selectTag.selectedIndex].value;
			    			var optionParamArray = optionValue.split(",");  
			    			
			    			var optionLevel = optionParamArray[1]; 
			    	    	var optionName = optionParamArray[2]; 
			    	    	content=content+("【"+optionLevel+":"+optionName+"】-");
		    		}
		    		
		    		
		    		var areaSpan = document.getElementById("areaSpan");
		    		areaSpan.innerHTML=content;
		    	}
		    	
		    	
		    	if(id!="area"){
		    		setCookie("areaId",id);
		    	}else if(id=="area"){
		    		
		    		if(level<=0){
		    			setCookie("areaId","");
		    		}else{
		    			var selectTag = document.getElementById("select1"+(level-1));
		    			
		    			var optionValue = selectTag.options[selectTag.selectedIndex].value;
			    			var optionParamArray = optionValue.split(",");  
			    	    	var optionId = optionParamArray[0]; 
			    	    	setCookie("areaId",optionId);
		    		}
		    	}
		    	////alert(level);
		    	var parentNode = document.getElementById("area");
		    		parentNode.removeChild(document.getElementById("areaSure"));
		    	//如果水管区父级重选删除子水管区
		    	var number1=level+1;
		    	while(document.getElementById("select1"+number1)){
		    		////alert(number);
		    		parentNode.removeChild(document.getElementById("select1"+number1));
		    		number1++;
		    	}
		    	
		    	var number2=level+1;
		    	while(document.getElementById("span1"+number2)){
		    		parentNode.removeChild(document.getElementById("span1"+number2));
		    		number2++;
		    	}
			$.ajax({
				url:ctxPath+"/cal_canal_info/find_son_Area",
				data: {id:id},
				type: "post",
				async: false,//非异步
				success: function(msg){
					//alert(JSON.stringify(msg));
					var currentTag = document.getElementById("area");
					if(msg.length>0){
					    var newSelectTag = document.createElement("select");
					    	newSelectTag.setAttribute("id", "select1"+(level+1));
					    	newSelectTag.setAttribute("style", "color:black;width:100px;height:30px;");
					    	newSelectTag.setAttribute("onchange","areaChange(this[selectedIndex].value);");
					    	
					    	for(var i=0;i<msg.length;i++){
					    		
					    		if(i==0){
					    			var newOptionTag = document.createElement("option");
						    			newOptionTag.setAttribute("value","area,"+msg[i].areaLevel+","+"0");
						    			newOptionTag.innerHTML="请选择";
						    			newSelectTag.appendChild(newOptionTag);
					    			var newOptionTag = document.createElement("option");
						    			newOptionTag.setAttribute("value",msg[i].id+","+msg[i].areaLevel+","+msg[i].areaName);
						    			newOptionTag.innerHTML=msg[i].areaName;
						    			newSelectTag.appendChild(newOptionTag);
					    		}else{
					    			var newOptionTag = document.createElement("option");
						    			newOptionTag.setAttribute("value",msg[i].id+","+msg[i].areaLevel+","+msg[i].areaName);
						    			newOptionTag.innerHTML=msg[i].areaName;
						    			newSelectTag.appendChild(newOptionTag);
					    		}
					    	}
					    var newSpanTag = document.createElement("span");
					    	newSpanTag.setAttribute("id","span1"+(level+1));
							newSpanTag.innerHTML="--";
					    var newInputTag = document.createElement("input");
					    	newInputTag.setAttribute("id","areaSure");
					    	newInputTag.setAttribute("class","layui-btn layui-btn-normal layui-btn-sm");
					    	newInputTag.setAttribute("type","button");
					    	newInputTag.setAttribute("value","确定");
					    	newInputTag.setAttribute("onclick","getAreaIdAndLevel()");
					    	currentTag.appendChild(newSelectTag);
					    	currentTag.appendChild(newSpanTag);
					    	currentTag.appendChild(newInputTag);
					}else{
					
						var newInputTag = document.createElement("input");
							newInputTag.setAttribute("class","layui-btn layui-btn-normal layui-btn-sm");
					    	newInputTag.setAttribute("id","areaSure");
					    	newInputTag.setAttribute("type","button");
					    	newInputTag.setAttribute("value","确定");
					    	newInputTag.setAttribute("onclick","getAreaIdAndLevel()");
				    	currentTag.appendChild(newInputTag);
					}
				}
			});
		}
		
		
		/* function getWaterAreaIdAndLevel(){
			//选中水管区的id
			var id = getCookie("id");
			if(id==""){
				var syswaterareaCodeInput =  document.getElementById("syswaterareaCode");
				syswaterareaCodeInput.value="";
				return;
			}
			$.ajax({
				url:ctxPath+"/sys_water_area/ajax_findWaterArea",
				data: {id:id},
				type: "post",
				async: false,//非异步
				success: function(msg){
					//alert(JSON.stringify(msg));
					var syswaterareaCodeInput =  document.getElementById("syswaterareaCode");
					syswaterareaCodeInput.value=msg.waterAreaCode;
				}
			});
		} */
		
		function getAreaIdAndLevel(){
			//选中行政区的id
			var id = getCookie("areaId");
			if(id==""){
				var sysareaCodeInput =  document.getElementById("sysareaCode");
				sysareaCodeInput.value="";
				return;
			}
			$.ajax({
				url:ctxPath+"/sysArea/ajax_findArea",
				data: {id:id},
				type: "post",
				async: false,//非异步
				success: function(msg){
					////alert(JSON.stringify(msg));
					var sysareaCodeInput =  document.getElementById("sysareaCode");
					sysareaCodeInput.value=msg.areaCode;
				}
			});
		}
	
	</script>
</body>
</html>



