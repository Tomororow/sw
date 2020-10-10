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
	<link type="text/css" rel="stylesheet" href="${ctxstc}/css/custom/scroll.css" title="" />
	<link type="text/css" rel="stylesheet" href="${ctxstc}/adapters/ztree/css/zTreeStyle/zTreeStyle.css" /><!-- zTree -->
	<link type="text/css" rel="stylesheet" href="${ctxstc}/adapters/ztree/css/metroStyle/metroStyle.css">

	<script type="text/javascript" src="${ctxstc}/jquery/jquery-1.11.1.min.js"></script>
	<script type="text/javascript" src="${ctxstc}/jquery/jquery.cookie.js"></script>
	<script type="text/javascript" src="${ctxstc}/adapters/bootstrap/js/bootstrap.min.js"></script>
	<script type="text/javascript" src="${ctxstc}/adapters/bootstrap/js/bootstrap-paginator.js"></script>
	<script type="text/javascript" src="${ctxstc}/js/style.js"></script>
	<script type="text/javascript" src="${ctxstc}/js/angular.min.js"></script><!-- angular ui --->
	<script type="text/javascript" src="${ctxstc}/js/ui-layout.js"></script>
	<script type="text/javascript" src="${ctxstc}/adapters/ztree/js/jquery.ztree.core.js"></script><!-- zTree -->
	<script type="text/javascript" src="${ctxstc}/adapters/layui/layer/layer.js" merge="true"></script>
	<script type="text/javascript" src="${ctxstc}/jquery/jquery-form.js" ></script>
	<script type="text/javascript" src="${ctxstc}/datepicker/WdatePicker.js "></script>

</head>
<body>
	<div style="padding: 30px; line-height: 22px; background-color: #393D49; color: #fff; font-weight: 300;">
		<form id="form" action="${ctx}/cropsCycle/saveCropsCycleInfo" method="post">
		
		<input type="hidden" name="sysareaCode" hidden value="${areaCode}" class="form-control" style="color:black; width:180px;"/>
			<table border="0"  cellspacing="15" style="line-height: 25px; border-collapse:separate; border-spacing:0px 15px;">
				<tr>
					<td align="right"><span style="color: red">*</span>行政区域：</td>
					<td class="w18"><input type="text" name="" readonly="readonly" value="${areaName}" class="form-control" style="color:black; width:180px;"/></td>
					<td align="right"><span style="color: red">*</span>土质类型</td>
					<td class="w18">
						<select  name="comm3" id="comm3" class="form-control" style="color:black;width:180px;height:35px;" onchange="waterAreaChange(this[selectedIndex].value);" >
							<option value="">请选择</option>
							<c:forEach items="${soilTypeInfoList}" var="soilTypeInfo">
							  <option value="${soilTypeInfo.id}">${soilTypeInfo.soilName}</option>
							</c:forEach>
						</select>
					</td>
				</tr>
				
				<tr>
				 <td align="right"><span style="color: red">*</span>农作物类型：</td>
							<td class="w18">
								<select  name="comm2" class="form-control" id="comm2" style="color:black;width:180px;height:35px;">
										<option value="">请选择:</option>
										<c:forEach items="${cropsTypeInfoList}" var="cropsTypeInfo">
										  	<option value="${cropsTypeInfo.id}">${cropsTypeInfo.cropsName}</option>
										</c:forEach>
								</select>
							</td>
					<td align="right"><span style="color: red" class="w7">*</span>生长周期名称：</td>
					<td class="w18"><input type="text" id="cycleName" name="cycleName" class="form-control" style="color:black; width:180px;"/></td>
					
				</tr>
				<tr>
					<td align="right"><span style="color: red">*</span>生育期开始时间:</td><td class="w18"><input class="form-control" type="text" class="form-control" name="stateDate" id="stateDate"  style="color:black;width:180px;" onfocus="WdatePicker({'skin':'whyGreen','dateFmt':'yyyy-MM-dd'});" /></td>
					<td align="right"><span style="color: red">*</span>生育期结束时间:</td><td class="w18"><input class="form-control" type="text" class="form-control" name="endDate" id="endDate"  style="color:black;width:180px;" onfocus="WdatePicker({'skin':'whyGreen','dateFmt':'yyyy-MM-dd'});" /></td>
				</tr>
				<td align="right"><span style="color: red">*</span>平均温度：</td>
					<td class="w18"><input type="text" id="comm4" name="comm4" class="form-control" style="color:black; width:180px;"/></td>
					<td align="right"><span style="color: red" class="w7">*</span>日照时数：</td>
					<td class="w18"><input type="text" id="comm5" name="comm5" class="form-control" style="color:black; width:180px;"/></td>
				</tr>
				<tr>
					<td align="right"><span style="color: red" class="w7">*</span>蒸发蒸腾量(mm)：</td>
					<td class="w18"><input type="text" id="evapotranspiration" name="evapotranspiration" class="form-control" style="color:black; width:180px;"/></td>
					<td align="right"><span style="color: red">*</span>有效降水量(mm)：</td>
					<td class="w18"><input type="text" id="growthPeriodRainfall" name="growthPeriodRainfall" class="form-control" style="color:black; width:180px;"/></td>
				
				</tr>
				
				<tr>
					<td align="right"><span style="color: red" class="w7">*</span>开始土壤含水率（%）：</td>
					<td class="w18"><input type="text" id="growthPeriodSoilStart" name="growthPeriodSoilStart" class="form-control" style="color:black; width:180px;"/></td>
					<td align="right"><span style="color: red">*</span>结束土壤含水率（%）：</td>
					<td class="w18"><input type="text" id="growthPeriodSoilEnd" name="growthPeriodSoilEnd" class="form-control" style="color:black; width:180px;"/></td>
				
				</tr>
				
				<tr>
				<td align="right"><span style="color: red">*</span>日耗水量：</td>
					<td class="w18"><input type="text" id="consumedWater" name="consumedWater" class="form-control" style="color:black; width:180px;"/></td>
					<td align="right"><span style="color: red" class="w7">*</span>地下水利用量(mm)：</td>
					<td class="w18"><input type="text" id="groundwater" name="groundwater" class="form-control" style="color:black; width:180px;"/></td>
				</tr>
				<tr>
					<td align="right"><span style="color: red" class="w7">*</span>作物犁地深度(m)：</td>
					<td class="w18"><input type="text" id="comm6" name="comm6" class="form-control" style="color:black; width:180px;"/></td>
				</tr>
				
				
				<tr>
					<td align="right">生长周期描述：</td>
					<td class="w18" colspan="3"><textarea id="description" name="description" class="form-control" rows="1" cols="60" maxlength="256" style="color:black; resize:none;"></textarea></td>
				</tr>
				
				<tr>
					<td align="right">备注信息：</td>
					<td class="w18" colspan="3"><textarea id="cgcRemark" name="cgcRemark" class="form-control" rows="1" cols="60" maxlength="256" style="color:black; resize:none;"></textarea></td>
				</tr> 
			</table>
		</form>
	</div>
	
	<%-- <script type="text/javascript" src="${ctxstc}/js/custom/crops_cycle.js"></script> --%>
	<script type="text/javascript" src="${ctxstc}/js/footer.js"></script>
	<script type="text/javascript">
	//给父页面传值所用信息
	var index = parent.layer.getFrameIndex(window.name);
	
	function mySubmit(){
		/*  if($("#name").val()==null || $("#name").val()==""){
			layer.alert('用户姓名不能为空！', {icon: 0});
		 }else if($("#account").val()==null || $("#account").val()==""){
			 layer.alert('用户账号不能为空！', {icon: 0});
		 }else if($("#password").val()==null || $("#password").val()==""){
			 layer.alert('用户密码不能为空！', {icon: 0});
		 }else if($("#waterRightArea").val()==null || $("#waterRightArea").val()==""){
			 layer.alert('水权面积为必填项！', {icon: 0});
		 }else if($("#realArea").val()==null || $("#realArea").val()==""){
			 layer.alert('实有面积为必填项！', {icon: 0});
		 }		 
		 else{ */
			//关闭子页面
			parent.layer.close(index);
			//parent.layer.msg('您将标记 成功传送给了父窗口');
	        $('#form').submit();
		// }
    }
	</script>
</body>
</html>