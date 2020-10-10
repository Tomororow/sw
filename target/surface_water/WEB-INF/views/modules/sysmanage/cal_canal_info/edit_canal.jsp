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
    			<form  id="form2" action="${ctx}/cal_canal_info/edit" method="post" enctype="multipart/form-data">
    				<table border="0" cellspacing="50px" style="line-height: 35px; border-collapse:separate; border-spacing:0px 10px;">
	        			<tr>
							<td  align="right" ><span style="color: red">&nbsp;&nbsp;*&nbsp;</span>所属行政区：</td>
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
						<tr >
							<td align="right" class="w54"  colspan="3">
								<span id="areaSpan">${areaNames}<span>
							</td>
						</tr> 
    					<tr>	
						<td align="right" ><span style="color: red">&nbsp;&nbsp;*&nbsp;</span>所属水管区：</td>
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
						 <tr >
							<td align="right" class="w54"  colspan="3">
								<span id="waterAreaSpan">${waterAreaNames}<span>
							</td>
						</tr> 
						
						<tr>	
							<td align="right"><span style="color: red">&nbsp;&nbsp;*&nbsp;</span>所属行政区编码：</td><td class="w18"><input type="text" class="form-control" readonly="true" id="sysareaCode" name="calCanalInfo.sysareaCode" value="${canalQueryVO.calCanalInfo.sysareaCode}" style="color:black;width:180px;"/></td>
							<td align="right" ><span style="color: red">&nbsp;&nbsp;*&nbsp;</span>所属水管区编码：</td><td class="w18"><input type="text" class="form-control" readonly="true" id="syswaterareaCode" name="calCanalInfo.syswaterareaCode" value="${canalQueryVO.calCanalInfo.syswaterareaCode}" style="color:black;width:180px;"/></td>
							
						</tr>
						
						
						<tr>	
							<td align="right"><span style="color: red">&nbsp;&nbsp;*&nbsp;</span>渠道--编码：</td><td class="w18"><input type="text" class="form-control" name="calCanalInfo.canalCode" value="${canalQueryVO.calCanalInfo.canalCode}" style="color:black;width:180px;"/></td>
							<td align="right"><span style="color: red">&nbsp;&nbsp;*&nbsp;</span>渠道--名称：</td><td class="w18"><input type="text" class="form-control" name="calCanalInfo.canalName" value="${canalQueryVO.calCanalInfo.canalName}" style="color:black;width:180px;"/></td>
						
						</tr>
						
						<tr>
							<td align="right" ><span style="color: red">&nbsp;&nbsp;*&nbsp;</span>渠道--长度：</td><td class="w18"><input type="text" class="form-control" name="calCanalInfo.canalLength" value="${canalQueryVO.calCanalInfo.canalLength}" style="color:black;width:180px;"/></td>
							<td align="right" ><span style="color: red">&nbsp;&nbsp;*&nbsp;</span>渠道--材质：</td>
							<td class="w18">
								<select id="canalmaterialCodeSelect" class="form-control" name="calCanalInfo.canalmaterialCode" style="color:black;width:180px;height:30px;" onchange="waterAreaChange(this[selectedIndex].value);">
									<option>请选择</option>
									<c:forEach items="${calCanalMaterialList}" var="calCanalMaterial">
									  <option id="${calCanalMaterial.canalMaterialCode}" value="${calCanalMaterial.canalMaterialCode}">${calCanalMaterial.canalMaterialName}</option>
									</c:forEach>
								</select>
							</td>
						</tr>
						<tr>
							<td align="right" ><span style="color: red">&nbsp;&nbsp;*&nbsp;</span>渠道类型：</td>
							  <td class="w18">
								<select id="canalTypeCodeSelect" class="form-control" name="calCanalInfo.canaltypeCode" style="color:black;width:180px;height:30px;" onchange="waterAreaChange(this[selectedIndex].value);">
										<option>请选择</option>
										<c:forEach items="${calCanalTypeList}" var="calCanalType">
										  	<option id="${calCanalType.canalTypeCode}+1" value="${calCanalType.canalTypeCode}">${calCanalType.canalTypeName}</option>
										</c:forEach>
								</select>
							</td>
							<td align="right" ><span style="color: red">&nbsp;&nbsp;*&nbsp;</span>渠道用途：</td>
							<td class="w18">
								<select id="canalUsetypeCodeSelect" class="form-control" name="calCanalInfo.canalusetypeCode" style="color:black;width:180px;height:30px;" onchange="waterAreaChange(this[selectedIndex].value);">
										<option>请选择</option>
										<c:forEach items="${calCanalUsetypeList}" var="calCanalUsetype">
										  	<option id="${calCanalUsetype.canalUsetypeCode}+2" value="${calCanalUsetype.canalUsetypeCode}">${calCanalUsetype.canalUsetypeName}</option>
										</c:forEach>
								</select>
							</td>
						</tr>
						
						<tr>
							<td align="right"><span style="color: red">&nbsp;&nbsp;&nbsp;</span>材质分类长度：</td>
							<td colspan="3" style="border:1px solid white;border-radius:10px;padding-left: 30px">
									<input hidden="hidden" type="text" name="calCanalLengthCalssify.id" value="${canalQueryVO.calCanalLengthCalssify.id}">
									一类：<input type="text" name="calCanalLengthCalssify.highStandardOne" value="${canalQueryVO.calCanalLengthCalssify.highStandardOne}" style="color:black;width:60px;height:25px;"/>&nbsp;km&nbsp;
									二类：<input type="text" name="calCanalLengthCalssify.highStandardTwo" value="${canalQueryVO.calCanalLengthCalssify.highStandardTwo}" style="color:black;width:60px;height:25px;"/>&nbsp;km&nbsp;
									三类：<input type="text" name="calCanalLengthCalssify.highStandardThree" value="${canalQueryVO.calCanalLengthCalssify.highStandardThree}" style="color:black;width:60px;height:25px;"/>&nbsp;km<br>
									干砌：<input type="text" name="calCanalLengthCalssify.dryMasonry" value="${canalQueryVO.calCanalLengthCalssify.dryMasonry}" style="color:black;width:60px;height:25px;"/>&nbsp;km&nbsp;
									土渠：<input type="text" name="calCanalLengthCalssify.earthCanal" value="${canalQueryVO.calCanalLengthCalssify.earthCanal}" style="color:black;width:60px;height:25px;"/>&nbsp;km&nbsp;
									其他：<input type="text" name="calCanalLengthCalssify.other" value="${canalQueryVO.calCanalLengthCalssify.other}" style="color:black;width:60px;height:25px;"/>&nbsp;km
							</td>
						</tr>
						<tr>
							<td align="right"><span style="color: red">&nbsp;&nbsp;&nbsp;</span>高标准说明备注：</td>
							<td colspan="3">
								<textarea class="form-control"  name="calCanalLengthCalssify.cclcRemark" cols="60" rows="1" style="color:black;">${canalQueryVO.calCanalLengthCalssify.cclcRemark}</textarea> 
							</td>
						</tr>
						<tr>
							<td align="right" ><span style="color: red">&nbsp;&nbsp;&nbsp;</span>所属--灌区：</td><td class="w18"><input class="form-control" type="text" name="calCanalInfo.irrigatedAreaName" value="${canalQueryVO.calCanalInfo.irrigatedAreaName}" style="color:black;width:180px;"/></td>
							<td align="right" ><span style="color: red">&nbsp;&nbsp;&nbsp;</span>渠道设计流量：</td><td class="w18"><input class="form-control" type="text" name="calCanalInfo.canalDesignFlow" value="${canalQueryVO.calCanalInfo.canalDesignFlow}" style="color:black;width:180px;"/></td>
						
						</tr>
						<tr>
							<td align="right" ><span style="color: red">&nbsp;&nbsp;&nbsp;</span>实际流量：</td><td class="w18"><input class="form-control" type="text" name="calCanalInfo.canalRealityFlow" value="${canalQueryVO.calCanalInfo.canalRealityFlow}" style="color:black;width:180px;"/></td>
							<td align="right" ><span style="color: red">&nbsp;&nbsp;&nbsp;</span>设计灌溉亩数：</td><td class="w18"><input class="form-control" type="text" name="calCanalInfo.canalIrrigatedAcreage" value="${canalQueryVO.calCanalInfo.canalIrrigatedAcreage}" style="color:black;width:180px;"/></td>
						</tr>
						<tr>
							<td align="right" ><span style="color: red">&nbsp;&nbsp;&nbsp;</span>渠道完好率：</td><td class="w18"><input class="form-control" type="text" name="calCanalInfo.canalPerfectRate" value="${canalQueryVO.calCanalInfo.canalRealityFlow}" style="color:black;width:180px;"/></td>
							<td align="right" ><span style="color: red">&nbsp;&nbsp;&nbsp;</span>渠道利用率：</td><td class="w18"><input class="form-control" type="text" name="calCanalInfo.canalRatio" value="${canalQueryVO.calCanalInfo.canalRatio}" style="color:black;width:180px;"/></td>
						</tr>
						  
						<tr>
							<td align="right" ><span style="color: red">&nbsp;&nbsp;&nbsp;</span>建设时间：</td><td class="w18"><input class="form-control" type="text"  name="calCanalInfo.canalBuildTime" value="<fmt:formatDate value='${canalQueryVO.calCanalInfo.canalBuildTime}' type='date' pattern='yyyy-MM-dd'/>"  style="color:black;" onfocus="WdatePicker({'skin':'whyGreen','dateFmt':'yyyy-MM-dd'});" /></td>
							<td align="right" ><span style="color: red">&nbsp;&nbsp;&nbsp;</span>修缮时间：</td><td class="w18"><input class="form-control" type="text"  name="calCanalInfo.canalRepairTime" value="<fmt:formatDate value='${canalQueryVO.calCanalInfo.canalRepairTime}' type='date' pattern='yyyy-MM-dd'/>"  style="color:black;"  onfocus="WdatePicker({'skin':'whyGreen','dateFmt':'yyyy-MM-dd'});" /></td>
						</tr>
						<tr>
							<td align="right" ><span style="color: red">&nbsp;&nbsp;&nbsp;</span>渠道纵坡：</td><td class="w18"><input class="form-control" type="text" name="calCanalInfo.canalSlope" value="${canalQueryVO.calCanalInfo.canalSlope}" style="color:black;width:180px;"/></td>
							<td align="right" ><span style="color: red">&nbsp;&nbsp;&nbsp;</span>渠道糙率：</td><td class="w18"><input class="form-control" type="text" name="calCanalInfo.canalRough" value="${canalQueryVO.calCanalInfo.canalRough}" style="color:black;width:180px;"/></td>
						</tr>
						<tr>
							<td align="right" ><span style="color: red">&nbsp;&nbsp;&nbsp;</span>侧边夹角：</td><td class="w18"><input class="form-control" type="text" name="calCanalInfo.canalAngle" value="${canalQueryVO.calCanalInfo.canalAngle}" style="color:black;width:180px;"/></td>
							<td align="right" ><span style="color: red">&nbsp;&nbsp;&nbsp;</span>渠道高度：</td><td class="w18"><input class="form-control" type="text" name="calCanalInfo.canalHeight" value="${canalQueryVO.calCanalInfo.canalHeight}" style="color:black;width:180px;"/></td>
						</tr>
						<tr>
							<td align="right" ><span style="color: red">&nbsp;&nbsp;&nbsp;</span>渠道宽度：</td><td class="w18"><input class="form-control" type="text" name="calCanalInfo.canalWight" value="${canalQueryVO.calCanalInfo.canalWight}" style="color:black;width:180px;"/></td>
							<td align="right" ><span style="color: red">&nbsp;&nbsp;&nbsp;</span>渠道判定面积：</td><td class="w18" ><input class="form-control" type="text" name="calCanalInfo.decisionArea" value="${canalQueryVO.calCanalInfo.decisionArea}" style="color:black;width:180px;"/></td>
						</tr>
						<tr>
							<td align="right" >渠道详细地址：</td>
							<td colspan="3">
								<textarea class="form-control"  name="calCanalInfo.canalAddr" cols="60" rows="1" style="color:black;">${canalQueryVO.calCanalInfo.canalAddr}</textarea> 
							</td>
						</tr>
						<tr>
							<td align="right" >渠道备注：</td>
							<td colspan="3">
								<textarea  class="form-control"  name="calCanalInfo.cciRemark" cols="60" rows="1" style="color:black;">${canalQueryVO.calCanalInfo.cciRemark}</textarea> 
							</td>
						</tr>
    				</table>
    				<input hidden="hidden"  type="text" name="calCanalInfo.id" value="${canalQueryVO.calCanalInfo.id}" style="color:black;"/>
	        		</form>
       		 </div>
	
	<script type="text/javascript" src="${ctxstc}/js/footer.js"></script>
	<script type="text/javascript" src="${ctxstc}/js/custom/water_area_cook.js"></script>
	<script type="text/javascript" src="${ctxstc}/datepicker/WdatePicker.js "></script>
	<script type="text/javascript" src="${ctxstc}/js/custom/select/select.js"></script>
	<script>
	//下拉框回显
	window.onload = function(){
		
		var canalmaterialCode = "${canalQueryVO.calCanalInfo.canalmaterialCode}";
		document.getElementById(canalmaterialCode).selected=true;
		var canaltypeCode = "${canalQueryVO.calCanalInfo.canaltypeCode}+1";
			document.getElementById(canaltypeCode).selected=true;
		var canalusetypeCode = "${canalQueryVO.calCanalInfo.canalusetypeCode}+2";
			document.getElementById(canalusetypeCode).selected=true;
			//	alert(canalusetypeCode+"----222asdfasdfasdfasdf");
		//alert(canaltypeCode+"----asdfasdfasdfasdf");
	}
	var fileNumber = 0;
	function addPhoto(){
		fileNumber++;
		var currenTag = document.getElementById("photo");
		
		var newInputTag = document.createElement("input");
			newInputTag.setAttribute("type","file");
			newInputTag.setAttribute("name","files");
			newInputTag.setAttribute("style","color:black;width:180px;");
			newInputTag.setAttribute("onchange","addPhoto()");
		var newInputTag2 = document.createElement("input");
			newInputTag2.setAttribute("type","text");
			newInputTag2.setAttribute("name","calCanalPhotoList["+fileNumber+"].ccpRemark");
			newInputTag2.setAttribute("style","color:black;width:180px;");
			currenTag.appendChild(newInputTag);
			currenTag.appendChild(newInputTag2);
	}
	
	//给父页面传值所用信息
	var index = parent.layer.getFrameIndex(window.name);
	
	function mySubmit2(){
		alert("rwwsadfsdfgsdfg");
		//关闭子页面
		parent.layer.close(index);
		//parent.layer.msg('您将标记 成功传送给了父窗口');
        $('#form2').submit();
    }
	
	</script>
</body>
</html>