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
    				<form  id="form" action="${ctx}/waterAuota/edit" method="post" enctype="multipart/form-data">
    				<table class="border="0" style="border-collapse:separate; border-spacing:20px 18px;">
						<tr>
							<td align="right"><span style="color: red">*</span>土质</td>
							<td class="w18">
								<select  name="soilTypeCode" id="soilTypeCode" class="form-control" style="color:black;width:180px;height:35px;" onchange="waterAreaChange(this[selectedIndex].value);" >
									<option>请选择</option>
									<c:forEach items="${soilTypeInfoList}" var="soilTypeInfo">
									  <option id="${soilTypeInfo.soilCode}s" value="${soilTypeInfo.soilCode}">${soilTypeInfo.soilName}</option>
									</c:forEach>
								</select>
							</td>
							
							<td align="right"><span style="color: red">*</span>农作物</td>
							<td class="w18">
								<select  name="cropsTypeCode" id="cropsTypeCode" class="form-control" style="color:black;width:180px;height:35px;" onchange="waterAreaChange(this[selectedIndex].value);">
									<option>请选择</option>
									<c:forEach items="${cropsTypeInfoList}" var="cropsTypeInfo">
									  <option id="${cropsTypeInfo.cropsCode}c"" value="${cropsTypeInfo.cropsCode}">${cropsTypeInfo.cropsName}</option>
									</c:forEach>
								</select>
							</td>
							
						</tr>
						<tr>	
							<td align="right"><span style="color: red">*</span>生长周期</td>
							<td class="w18">
								<select   name="cropsGrowthCycle" id="cropsGrowthCycle" class="form-control" style="color:black;width:180px;height:35px;" onchange="waterAreaChange(this[selectedIndex].value);">
									<option>请选择</option>
									<c:forEach items="${cropsGrowthCycleList}" var="cropsGrowthCycle">
									  <option id="${cropsGrowthCycle.cycleCode}g" value="${cropsGrowthCycle.cycleCode}">${cropsGrowthCycle.cycleName}</option>
									</c:forEach>
								</select>
							</td>
						 	 
							<td align="right"><span style="color: red">*</span>灌水定额</td><td class="w18"><input class="form-control" type="text" name="waterQuota" id="waterQuota" value="${waterAuota.waterQuota}" style="color:black;width:180px;"/></td>
						</tr>
						<tr>	
							<td align="right"><span style="color: red">*</span>年份</td><td class="w18"><input class="form-control" readonly="readonly" type="text" id="year"  name="year" value="${waterAuota.year}" style="color:black;width:180px;"/></td>
						</tr>
						
						<tr>
							<td align="right">备注</td>
							<td class="w18"  colspan="3">
								<textarea  name="remark" class="form-control" cols="60" rows="1" style="color:black;">${waterAuota.remark}</textarea> 
							</td>
						</tr>
							<input type="text" hidden="hidden" name="id" value="${waterAuota.id}">
    				</table>
	        		</form>
       		 </div>
	
	<script type="text/javascript" src="${ctxstc}/js/footer.js"></script>
	<script type="text/javascript" src="${ctxstc}/js/custom/water_area_cook.js"></script>
	<script type="text/javascript" src="${ctxstc}/datepicker/WdatePicker.js "></script>
	<script src="${ctxstc}/adapters/layui/layui.js" charset="utf-8"></script>
	
	
	<script>
	window.onload = function(){
		var soilTypeCode = "${waterAuota.soilTypeCode}s";
		document.getElementById(soilTypeCode).selected=true;
		
		var cropsTypeCode = "${waterAuota.cropsTypeCode}c";
		document.getElementById(cropsTypeCode).selected=true;
		
		var cropsGrowthCycle = "${waterAuota.cropsGrowthCycle}g";
		document.getElementById(cropsGrowthCycle).selected=true;
		 
		$("#soilTypeCode").attr("disabled",true); 
		$("#cropsTypeCode").attr("disabled",true); 
		$("#cropsGrowthCycle").attr("disabled",true); 
	}
	
	//给父页面传值所用信息
	var index = parent.layer.getFrameIndex(window.name);
	
	function mySubmit(){
		$("#soilTypeCode").attr("disabled",false); 
		$("#cropsTypeCode").attr("disabled",false); 
		$("#cropsGrowthCycle").attr("disabled",false); 
		parent.layer.close(index);
		//parent.layer.msg('您将标记 成功传送给了父窗口');
        $('#form').submit();
    }
	
	
	

	</script>
</body>
</html>



