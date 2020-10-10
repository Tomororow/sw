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
  					
    				<form  id="form" action="${ctx}/cal_canal_info/add" method="post" enctype="multipart/form-data">
    				
    				<table border="0" cellspacing="50px" style="line-height: 35px; border-collapse:separate; border-spacing:0px 10px;">
	        			<tr>
							<td  align="right"  rowspan="2"><span style="color: red">&nbsp;&nbsp;*&nbsp;</span>所属行政区：</td>
							<td id="area" class="w54"  colspan="3">
								<select id="select10" style="color:black;width:100px;height:30px;" onchange="areaChange(this[selectedIndex].value);">
									<option value="area,0,0">请选择</option>
									<c:forEach items="${sysAreaList}" var="sysArea">
									 	 <option value="${sysArea.id},${sysArea.areaLevel},${sysArea.areaName}">${sysArea.areaName}</option>
									</c:forEach>
								</select>
								<span id="span10">--</span>
								<input id="areaSure" class="layui-btn layui-btn-normal layui-btn-sm" value="确定" type="button" onclick="getAreaIdAndLevel()" />
							</td>
							
						</tr>
						<tr>
							<td class="w54"  colspan="3">
								<span hidden="true" id="areaSpan">无<span>
							</td>
							
						</tr>
						
						<tr>	
							<td align="right"  rowspan="2"><span style="color: red">&nbsp;&nbsp;*&nbsp;</span>所属水管区：</td>
							<td id="waterArea" class="w54"  colspan="3">
								<select id="select20" style="color:black;width:100px;height:30px;" onchange="waterAreaChange(this[selectedIndex].value);">
									<option value="waterArea,0,0">请选择</option>
									<c:forEach items="${sysWaterAreaList}" var="sysWaterArea">
									  <option value="${sysWaterArea.id},${sysWaterArea.waterAreaLevel},${sysWaterArea.waterAreaName}">${sysWaterArea.waterAreaName}</option>
									</c:forEach>
								</select>
								<span id="span20">--</span>
								<input id="waterAreaSure" class="layui-btn layui-btn-normal layui-btn-sm" value="确定" type="button" onclick="getWaterAreaIdAndLevel()"/>
							</td>
						</tr>
						<tr>
							<td class="w54"  colspan="3">
								<span hidden="true" id="waterAreaSpan">无<span>
							</td>
							
						</tr>
						
						<tr>	
							<td align="right"><span style="color: red">&nbsp;&nbsp;*&nbsp;</span>行政区编码：</td><td><input type="text" class="form-control" readonly="true" id="sysareaCode" name="calCanalInfo.sysareaCode" value="" style="color:black;width:180px;"/></td>
							<td align="right" ><span style="color: red">&nbsp;&nbsp;*&nbsp;</span>水管区编码：</td><td><input type="text" class="form-control" readonly="true" id="syswaterareaCode" name="calCanalInfo.syswaterareaCode" value="" style="color:black;width:180px;"/></td>
							
						</tr>
						
						
						<tr>	
							<td align="right" ><span style="color: red">&nbsp;&nbsp;*&nbsp;</span>渠道编码：</td><td><input type="text" class="form-control" id="canalCode" name="calCanalInfo.canalCode" value="${calCanalInfo.canalCode}" style="color:black;width:180px;"/></td>
							<td align="right" ><span style="color: red">&nbsp;&nbsp;*&nbsp;</span>渠道名称：</td><td><input type="text" class="form-control" id="canalName" name="calCanalInfo.canalName" value="${calCanalInfo.canalName}" style="color:black;width:180px;"/></td>
						
						</tr>
						
						<tr>
							<td align="right" ><span style="color: red">&nbsp;&nbsp;*&nbsp;</span>渠道长度：</td><td><input type="text" class="form-control" id="canalLength" name="calCanalInfo.canalLength" value="${calCanalInfo.canalLength}" style="color:black;width:180px;"/></td>
							<td align="right" ><span style="color: red">&nbsp;&nbsp;*&nbsp;</span>渠道材质：</td>
							<td>
								<select id="canalmaterialCodeSelect" class="form-control" name="calCanalInfo.canalmaterialCode"  style="color:black;width:180px;height:35px;" onchange="waterAreaChange(this[selectedIndex].value);">
									<option value="M">请选择</option>
									<c:forEach items="${calCanalMaterialList}" var="calCanalMaterial">
									  <option value="${calCanalMaterial.canalMaterialCode}">${calCanalMaterial.canalMaterialName}</option>
									</c:forEach>
								</select>
							</td>
							
						</tr>
						
						
						<tr>
							<td align="right" ><span style="color: red">&nbsp;&nbsp;*&nbsp;</span>渠道类型：</td>
							<td>
								<select id="canalTypeCodeSelect" class="form-control" name="calCanalInfo.canaltypeCode" style="color:black;width:180px;height:35px;" onchange="calCanTypeChange(this[selectedIndex].value);">
										<option value="T">请选择</option>
										<c:forEach items="${calCanalTypeList}" var="calCanalType">
										  	<option value="${calCanalType.canalTypeCode}">${calCanalType.canalTypeName}</option>
										</c:forEach>
								</select>
							</td>
							
							<td align="right"><span style="color: red">&nbsp;&nbsp;*&nbsp;</span>渠道用途：</td>
							<td  >
								<select id="canalUsetypeCodeSelect" class="form-control" name="calCanalInfo.canalusetypeCode" style="color:black;width:180px;height:35px;" onchange="waterAreaChange(this[selectedIndex].value);">
										<option value="U">请选择</option>
										<c:forEach items="${calCanalUsetypeList}" var="calCanalUsetype">
										  <option value="${calCanalUsetype.canalUsetypeCode}">${calCanalUsetype.canalUsetypeName}</option>
										</c:forEach>
								</select>
							</td>
						</tr>
						
						<tr  >
							<td align="right"><span style="color: red">&nbsp;&nbsp;&nbsp;</span>材质分类长度：</td>
							<td colspan="3" style="border:1px solid white;border-radius:10px;padding-left: 30px">
								一类：<input type="text" name="calCanalLengthCalssify.highStandardOne" value="" style="color:black;width:60px;height:25px;"/>&nbsp;km&nbsp;
								二类：<input type="text" name="calCanalLengthCalssify.highStandardTwo" value="" style="color:black;width:60px;height:25px;"/>&nbsp;km&nbsp;
								三类：<input type="text" name="calCanalLengthCalssify.highStandardThree" value="" style="color:black;width:60px;height:25px;"/>&nbsp;km<br>
								干砌：<input type="text" name="calCanalLengthCalssify.dryMasonry" value="" style="color:black;width:60px;height:25px;"/>&nbsp;km&nbsp;
								土渠：<input type="text" name="calCanalLengthCalssify.earthCanal" value="" style="color:black;width:60px;height:25px;"/>&nbsp;km&nbsp;
								其他：<input type="text" name="calCanalLengthCalssify.other" value="" style="color:black;width:60px;height:25px;"/>&nbsp;km
							</td>
						</tr>
						
						
						<tr>
							<td align="right"><span style="color: red">&nbsp;&nbsp;&nbsp;</span>高标准说明备注：</td>
							<td  colspan="3">
								<textarea class="form-control"  name="calCanalLengthCalssify.cclcRemark" cols="60" rows="1" style="color:black;"></textarea> 
							</td>
						</tr>
						
						<tr>
							<td align="right" ><span style="color: red">&nbsp;&nbsp;&nbsp;</span>所属灌区：</td><td><input type="text"  class="form-control" name="calCanalInfo.irrigatedAreaName" value="${calCanalInfo.irrigatedAreaName}" style="color:black;width:180px;"/></td>
							<td align="right" ><span style="color: red">&nbsp;&nbsp;&nbsp;</span>设计流量：</td><td><input type="text" class="form-control" name="calCanalInfo.canalDesignFlow" value="${calCanalInfo.canalDesignFlow}" style="color:black;width:180px;"/></td>
						
						</tr>
						
						<tr>
							<td align="right" ><span style="color: red">&nbsp;&nbsp;&nbsp;</span>实际流量：</td><td><input type="text"  class="form-control" name="calCanalInfo.canalRealityFlow" value="${calCanalInfo.canalRealityFlow}" style="color:black;width:180px;"/></td>
							<td align="right" ><span style="color: red">&nbsp;&nbsp;&nbsp;</span>设计灌溉亩数：</td><td><input type="text"  class="form-control" name="calCanalInfo.canalIrrigatedAcreage" value="${calCanalInfo.canalIrrigatedAcreage}" style="color:black;width:180px;"/></td>
						</tr>
						
						
						
						<tr>
							<td align="right" ><span style="color: red">&nbsp;&nbsp;&nbsp;</span>完好率：</td><td><input type="text"  class="form-control" name="calCanalInfo.canalPerfectRate" value="${calCanalInfo.canalRealityFlow}" style="color:black;width:180px;"/></td>
							<td align="right" ><span style="color: red">&nbsp;&nbsp;&nbsp;</span>利用率：</td><td ><input type="text"  class="form-control" name="calCanalInfo.canalRatio" value="${calCanalInfo.canalRatio}" style="color:black;width:180px;"/></td>
						</tr>
						
						<tr>
							<td align="right" ><span style="color: red">&nbsp;&nbsp;&nbsp;</span>建设时间：</td><td><input type="text"   class="form-control" name="calCanalInfo.canalBuildTime"   style="color:black;width:180px;" onfocus="WdatePicker({'skin':'whyGreen','dateFmt':'yyyy-MM-dd'});" /></td>
							<td align="right" ><span style="color: red">&nbsp;&nbsp;&nbsp;</span>修缮时间：</td><td><input type="text"   class="form-control" name="calCanalInfo.canalRepairTime"   style="color:black;width:180px;"  onfocus="WdatePicker({'skin':'whyGreen','dateFmt':'yyyy-MM-dd'});" /></td>
						</tr>
						
						
						
						
						<tr>
							<td align="right" >渠道纵坡：</td><td align="right" ><input type="text"  class="form-control"  name="calCanalInfo.canalSlope" value="${calCanalInfo.canalSlope}" style="color:black;width:180px;"/></td>
							<td align="right" >渠道糙率：</td><td align="right" ><input type="text"  class="form-control"  name="calCanalInfo.canalRough" value="${calCanalInfo.canalRough}" style="color:black;width:180px;"/></td>
						</tr>
						

						<tr>
							<td align="right" >侧边夹角：</td><td align="right" ><input type="text"  class="form-control"  name="calCanalInfo.canalAngle" value="${calCanalInfo.canalAngle}" style="color:black;width:180px;"/></td>
							<td align="right" >渠道高度：</td><td align="right" ><input type="text"  class="form-control"  name="calCanalInfo.canalHeight" value="${calCanalInfo.canalHeight}" style="color:black;width:180px;"/></td>
						</tr>
						
						<tr>
							<td align="right" >渠道宽度：</td><td align="right" ><input type="text"  class="form-control"  name="calCanalInfo.canalWight" value="${calCanalInfo.canalWight}" style="color:black;width:180px;"/></td>
							
							</td>
							
							<td align="right"  >渠道判定面积：</td><td align="right" ><input type="text"  class="form-control"  name="calCanalInfo.decisionArea" value="" style="color:black;width:180px;"/></td>
						</tr>
						
						<tr>
							<td align="right" >渠道详细地址：</td>
							<td colspan="3">
								<textarea class="form-control"  name="calCanalInfo.canalAddr" cols="60" rows="1" style="color:black;"></textarea> 
							</td>
						</tr>
						
						<tr>
							<td align="right" >渠道备注：</td>
							<td colspan="3">
								<textarea  class="form-control"  name="calCanalInfo.cciRemark" cols="60" rows="1" style="color:black;"></textarea> 
							</td>
						</tr>
    				</table>
    				<input hidden="hidden"  type="text" name="calCanalInfo.canalParentId" value="${id}" style="color:black;"/>
    				
	        		</form>
       		 </div>
	
	<script type="text/javascript" src="${ctxstc}/js/footer.js"></script>
	<script type="text/javascript" src="${ctxstc}/js/custom/water_area_cook.js"></script>
	<script type="text/javascript" src="${ctxstc}/datepicker/WdatePicker.js "></script>
	<script src="${ctxstc}/adapters/layui/layui.js" charset="utf-8"></script>
	<script type="text/javascript" src="${ctxstc}/js/custom/select/select.js"></script>
	
	
	<script>
	
	//给父页面传值所用信息
	var index = parent.layer.getFrameIndex(window.name);
	
	function mySubmit(){
		if($("#sysareaCode").val()=="" ){
			layer.alert("行政编码不能为空！", {icon: 0});
		}else if($("#syswaterareaCode").val() == ""){
			layer.alert("水管编码不能为空！", {icon: 0});
			
		}else if($("#canalCode").val() == ""){
			layer.alert("渠道编码不能为空！", {icon: 0});
		}else if($("#canalName").val() == ""){
			layer.alert("渠道名称不能为空！", {icon: 0});
		}else if($("#canalLength").val() == ""){
			layer.alert("渠道长度不能为空！", {icon: 0});
		}else if($("#canalmaterialCodeSelect").val() == "M"){
			layer.alert("渠道材质不能为空！", {icon: 0});
		}else if($("#canalTypeCodeSelect").val() == "T"){
			layer.alert("渠道类型不能为空！", {icon: 0});
		}else if($("#canalUsetypeCodeSelect").val() == "U"){
			layer.alert("渠道用途不能为空！", {icon: 0});
		}else{
			//关闭子页面
			parent.layer.close(index);
			//parent.layer.msg('您将标记 成功传送给了父窗口');
	        $('#form').submit();
	        
	       
	      
		}
    }
	
	</script>
</body>
</html>



