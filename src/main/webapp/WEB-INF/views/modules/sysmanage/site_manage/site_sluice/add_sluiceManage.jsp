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
    				<form  id="form" action="${ctx}/site_sluice_manage/add" method="post" enctype="multipart/form-data">
    				<table border="0" style="border-collapse:separate; border-spacing:20px 18px;">
						<tr>	
							<td align="right"><span style="color: red">*</span>闸门站编码:</td><td class="w18"><input type="text" class="form-control" id="deviceSluiceCode" name="deviceSluiceCode" value="" style="color:black;width:180px;"/></td>
							<td align="right"><span style="color: red">*</span>闸门站名称:</td><td class="w18"><input type="text" class="form-control" id="deviceSluiceName" name="deviceSluiceName" value="" style="color:black;width:180px;"/></td>
							
						</tr>
						<tr>	
							<td align="right"><span style="color: red">*</span>闸门站设备编码:</td><td class="w18"><input type="text" class="form-control" id="ssiDeviceNo" name="ssiDeviceNo"  style="color:black;width:180px;"/></td>
							<td align="right"><span style="color: red">*</span>水位计类型:</td>
							<td class="w18">
								<select  name="ssiDevicemodelCode" class="form-control" id="ssiDevicemodelCode" style="color:black;width:180px;height:35px;">
										<option value="">请选择:</option>
										<c:forEach items="${siteDeviceModelList}" var="siteDeviceModel">
										  	<option value="${siteDeviceModel.deviceCode}">${siteDeviceModel.deviceName}</option>
										</c:forEach>
								</select>
							</td>
						</tr>
						
						<tr>	
							<td align="right"><span style="color: red">*</span>站点建设时间:</td><td class="w18"><input class="form-control" type="text" class="form-control" name="ssiBuildTime" id="ssiBuildTime"  style="color:black;width:180px;" onfocus="WdatePicker({'skin':'whyGreen','dateFmt':'yyyy-MM-dd'});" /></td>
							<td align="right"><span style="color: red">*</span>站点SIM卡号:</td><td class="w18"><input class="form-control" type="text" class="form-control" name="ssiSimcard" id="ssiSimcard" style="color:black;width:180px;"/></td>
						</tr>
						<tr>	
							<td class="w7" colspan="1">SIM卡号运营商:</td><td class="w18"><input type="text" name="ssiSimoperator" class="form-control" id="ssiSimoperator"  style="color:black;width:180px;"/></td>
							<td align="right"><span style="color: red">*</span>闸门站经度:</td><td class="w18"><input type="text" class="form-control" id="ssiLongitude" name="ssiLongitude"  style="color:black;width:180px;"/></td>
						</tr>
						<tr>	
							
							<td align="right"><span style="color: red">*</span>闸门站纬度:</td><td class="w18"><input type="text" class="form-control" id="ssiLatitude" name="ssiLatitude"  style="color:black;width:180px;" /></td>
							<td align="right"><span style="color: red">*</span>闸门站的海拔:</td><td class="w18"><input type="text" class="form-control" id="ssiHeight" name="ssiHeight"  style="color:black;width:180px;" /></td>
						</tr>
						<tr>	
							
							<td align="right"><span style="color: red">*</span>闸前水位站:</td>
							<td class="w18">
								<select  name="sluiceBeforeSiteWaterId" id="sluiceBeforeSiteWaterId" class="form-control" style="color:black;width:180px;height:35px;">
										<option value="">请选择:</option>
										<c:forEach items="${siteWaterInfoList}" var="siteWaterInfo">
										  	<option value="${siteWaterInfo.id}">${siteWaterInfo.deviceWaterName}</option>
										</c:forEach>
								</select>
							</td>
							<td align="right"><span style="color: red">*</span>闸后水位站:</td>
							<td class="w18">
								<select  name="sluiceAfterSiteWaterId" class="form-control" id="sluiceAfterSiteWaterId" style="color:black;width:180px;height:35px;">
										<option value="">请选择:</option>
										<c:forEach items="${siteWaterInfoList}" var="siteWaterInfo">
										  	<option value="${siteWaterInfo.id}">${siteWaterInfo.deviceWaterName}</option>
										</c:forEach>
								</select>
							</td>
						</tr>
						
<%--						<tr>
							<td align="right"><span style="color: red">*</span>关联视频站:</td>
							<td class="w18">
							&lt;%&ndash;<input class="form-control" type="text" id="sluiceMovieSiteId" name="sluiceMovieSiteId"  style="color:black;width:180px;"/>&ndash;%&gt;
								<select  name="sluiceMovieSiteId" class="form-control" id="sluiceMovieSiteId" style="color:black;width:180px;height:35px;">
									<option value="">请选择:</option>
									<c:forEach items="${SiteVideoInfoList}" var="siteVideoInfo">
										<option value="${siteVideoInfo.id}">${siteVideoInfo.deviceVideoName}</option>
									</c:forEach>
								</select>
							</td>
						</tr>--%>
						 
						<tr>	
							<td align="right">设备安装前照片:</td>
							<td class="w18">
								<input type="file" id="file1" class="form-control" name="file" style="color:black;width:180px;">
							</td>
							<td align="right">设备安装后的照片:</td>
							<td class="w18">
								<input type="file" class="form-control" name="file"  style="color:black;width:180px;">
							</td>
						</tr> 
						<tr>
							<td align="right"><span style="color: red">*</span>闸门站详细地址:</td>
							<td class="w18"  colspan="3">
								<textarea  name="ssiAddr" id="ssiAddr" class="form-control" rows="1" cols="60" rows="3" style="color:black;"></textarea> 
							</td>
						</tr>
						<tr>
							<td align="right">备注:</td>
							<td class="w18"  colspan="3">
								<textarea  name="ssiRemark" id="ssiRemark" class="form-control" rows="1" cols="60" rows="3" style="color:black;"></textarea> 
							</td>
						</tr> 
    				</table>
    				 <input hidden="hidden"  type="text" name="ssiCanalCode" value="${calCanalInfo.canalCode}" style="color:black;"/>
	        		</form>
       		 </div>
	
	<script type="text/javascript" src="${ctxstc}/js/footer.js"></script>
	<script type="text/javascript" src="${ctxstc}/js/custom/water_area_cook.js"></script>
	<script type="text/javascript" src="${ctxstc}/datepicker/WdatePicker.js "></script>
	<script src="${ctxstc}/adapters/layui/layui.js" charset="utf-8"></script>
	
	<script type="text/javascript" src="${ctxstc}/js/custom/sluice/sluice.js" ></script>
	<script>
	
	
	//给父页面传值所用信息
	/* var index = parent.layer.getFrameIndex(window.name);
	function mySubmit(){
		var reg = /^[0-9]*$/;
		var age = /^[\-\+]?(0?\d{1,2}\.\d{1,5}|1[0-7]?\d{1}\.\d{1,5}|180\.0{1,10})$/;
		var msg = /^[\-\+]?([0-8]?\d{1}\.\d{1,5}|90\.0{1,10})$/; */
	//	var avg = /^[a-zA-Z/d/.]+$ ;
		/* if($("#deviceSluiceCode").val()==null || $("#deviceSluiceCode").val()==""){ */
			//墨绿深蓝风
			/* layer.alert('闸门站编码不能为空！', {
			  skin: 'layui-layer-lan' //样式类名
			  ,closeBtn: 0
			}); */
		/*  	layer.alert('闸门站编码不能为空！', {icon: 0});
		}else if($("#deviceSluiceName").val()==null || $("#deviceSluiceName").val()==""){
			layer.alert('闸门站名称不能为空！', {icon: 0});
		}else if($("#ssiDeviceNo").val()==null || $("#ssiDeviceNo").val()==""){
			layer.alert('闸门站设备编码不能为空！', {icon: 0});
		}else if($("#ssiDevicemodelCode option:selected").val()==null || $("#ssiDevicemodelCode option:selected").val()==""){
			layer.alert('请选择水位计类型！', {icon: 0});
		}else if($("#ssiBuildTime").val()==null || $("#ssiBuildTime").val()==""){
			layer.alert('请选择站点建设时间！', {icon: 0});
		}else if($("#deviceSluiceCode").val()==null || $("#deviceSluiceCode").val()==""){
			layer.alert('水位计类型！', {icon: 0});
		}else if($("#ssiSimcard").val()==null || $("#ssiSimcard").val()==""){
			layer.alert('站点SIM卡号不能为空！', {icon: 0});
		}
		else if(!reg.test($("#ssiSimcard").val())){
			//正则验证sim号不能为非数字
			layer.alert('SIM卡号只能为0~9的数字！', {icon: 0});
		}
		else if($("#ssiSimoperator").val()==null || $("#ssiSimoperator").val()==""){
			layer.alert('站点SIM运营商不能为空！', {icon: 0});
		}else if($("#ssiLongitude").val()==null || $("#ssiLongitude").val()==""){
			layer.alert('闸门站经度不能为空！', {icon: 0});
		}
		else if(!age.test($("#ssiLongitude").val())){
			layer.alert('-180.0～+180.0（整数部分为0～180，必须输入1到10位小数）!', {icon: 0});
		}
		else if($("#ssiLatitude").val()==null || $("#ssiLatitude").val()==""){
			layer.alert('闸门站纬度不能为空！', {icon: 0});
		}
		else if(!msg.test($("#ssiLatitude").val())){
			layer.alert('-90.0～+90.0（整数部分为0～90，必须输入1到10位小数）!', {icon: 0});
		}
		else if($("#ssiHeight").val()==null || $("#ssiHeight").val()==""){
			layer.alert('闸门站海拔不能为空！', {icon: 0});
		} 
		 else if(!avg.test($("#ssiHeight").val())){
			layer.alert('闸门站海拔高度只能为0~9的数字，必须输入1到10位小数！', {icon: 0});
		} 
		else if($("#sluiceBeforeSiteWaterId option:selected").val()==null || $("#sluiceBeforeSiteWaterId").val()==""){
			layer.alert('闸前水位站不能为空！', {icon: 0});
		}else if($("#sluiceAfterSiteWaterId option:selected").val()==null || $("#sluiceAfterSiteWaterId").val()==""){
			layer.alert('闸后水位站不能为空！', {icon: 0});
		}else if($("#sluiceMovieSiteId").val()==null || $("#sluiceMovieSiteId").val()==""){
			layer.alert('请选择关联视频站！', {icon: 0});
		}else if($("#sluiceBeforeSiteWaterId option:selected").val()==$("#sluiceAfterSiteWaterId option:selected").val()){
			layer.alert('闸前水位站和闸后水位站不能为同一站点！', {icon: 0});
		}else if($("#ssiAddr").val()==null || $("#ssiAddr").val()==""){
			layer.alert('闸门站详细地址不能空！', {icon: 0});
		}else{
			parent.layer.close(index);
			//parent.layer.msg('您将标记 成功传送给了父窗口');
	        $('#form').submit(); 
	    }
	}  */
		
		
	
	</script>
</body>
</html>



