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
  					
    				<form  id="form" action="${ctx}/site_sluice_manage/edit" method="post" enctype="multipart/form-data">
    				
    				<table border="0" style="border-collapse:separate; border-spacing:20px 18px;">
						<tr>	
							<td align="right"><span style="color: red">*</span>闸门站编码:</td><td class="w18"><input type="text" class="form-control" id="deviceSluiceCode" name="deviceSluiceCode" value='${siteSluiceInfo.deviceSluiceCode}' style="color:black;width:180px;"/></td>
							<td align="right"><span style="color: red">*</span>闸门站名称:</td><td class="w18"><input type="text" class="form-control" id="deviceSluiceName" name="deviceSluiceName" value="${siteSluiceInfo.deviceSluiceName}" style="color:black;width:180px;"/></td>
							
						</tr>
						<tr>	
							<td align="right"><span style="color: red">*</span>闸门站设备编码:</td><td class="w18"><input type="text" class="form-control" id="ssiDeviceNo" name="ssiDeviceNo" value="${siteSluiceInfo.ssiDeviceNo}"  style="color:black;width:180px;"/></td>
							<td align="right"><span style="color: red">*</span>水位计类型:</td>
							<td class="w18">
								<select  name="ssiDevicemodelCode" class="form-control" id="ssiDevicemodelCode"   style="color:black;width:180px;height:35px;">
										<option value="">请选择:</option>
										<c:forEach items="${siteDeviceModelList}" var="siteDeviceModel">
										  	<option id="${siteDeviceModel.deviceCode}" value="${siteDeviceModel.deviceCode}">${siteDeviceModel.deviceName}</option>
										</c:forEach>
								</select>
							</td>
						</tr>
						
						<tr>	
							<td align="right"><span style="color: red">*</span>站点建设时间:</td><td class="w18"><input type="text" name="ssiBuildTime" id="ssiBuildTime" value="<fmt:formatDate value='${siteSluiceInfo.ssiBuildTime}' type='date' pattern='yyyy-MM-dd'/>" style="color:black;width:180px;" onfocus="WdatePicker({'skin':'whyGreen','dateFmt':'yyyy-MM-dd'});" />
							</td>
							<td align="right"><span style="color: red">*</span>站点SIM卡号:</td><td class="w18"><input class="form-control" type="text" class="form-control" name="ssiSimcard" id="ssiSimcard" value="${siteSluiceInfo.ssiSimcard }"  style="color:black;width:180px;"/></td>
						</tr>
						<tr>	
							<td class="w7" colspan="1">SIM卡号运营商:</td><td class="w18"><input type="text" name="ssiSimoperator" class="form-control" id="ssiSimoperator" value="${siteSluiceInfo.ssiSimoperator }"   style="color:black;width:180px;"/></td>
							<td align="right"><span style="color: red">*</span>闸门站经度:</td><td class="w18"><input type="text" class="form-control" id="ssiLongitude" name="ssiLongitude"  value="${siteSluiceInfo.ssiLongitude }"  style="color:black;width:180px;"/></td>
						</tr>
						<tr>	
							
							<td align="right"><span style="color: red">*</span>闸门站纬度:</td><td class="w18"><input type="text" class="form-control" id="ssiLatitude" name="ssiLatitude" value="${siteSluiceInfo.ssiLatitude }"   style="color:black;width:180px;" /></td>
							<td align="right"><span style="color: red">*</span>闸门站的海拔:</td><td class="w18"><input type="text" class="form-control" id="ssiHeight" name="ssiHeight" value="${ siteSluiceInfo.ssiHeight}"   style="color:black;width:180px;" /></td>
						</tr>
						<tr>	
							<td align="right"><span style="color: red">*</span>闸前水位站:</td>
							<td class="w18">
								<select  name="sluiceBeforeSiteWaterId" id="sluiceBeforeSiteWaterId"   class="form-control" style="color:black;width:180px;height:35px;">
										<option value="">请选择:</option>
										<c:forEach items="${siteWaterInfoList}" var="siteWaterInfo">
										  	<option id="${siteWaterInfo.id}+0"  value="${siteWaterInfo.id}">${siteWaterInfo.deviceWaterName}</option>
										</c:forEach>
								</select>
							</td>
							<td align="right"><span style="color: red">*</span>闸后水位站:</td>
							<td class="w18">
								<select  name="sluiceAfterSiteWaterId"  class="form-control" id="sluiceAfterSiteWaterId" style="color:black;width:180px;height:35px;">
										<option value="">请选择:</option>
										<c:forEach items="${siteWaterInfoList}" var="siteWaterInfo">
										  	<option id="${siteWaterInfo.id}" value="${siteWaterInfo.id}">${siteWaterInfo.deviceWaterName}</option>
										</c:forEach>
								</select>
							</td>
						</tr>
						
						<tr>	
							<td align="right"><span style="color: red">*</span>关联视频站:</td><td class="w18"><input class="form-control" type="text" id="sluiceMovieSiteId" name="sluiceMovieSiteId" value="${siteSluiceInfo.deviceSluiceName}"   style="color:black;width:180px;"/></td>
						</tr>
						 
						<tr>	
							<td align="right">设备安装前照片:</td>
							<td class="w18">
								<img src="${picPath}/pic/${siteSluiceInfo.ssiPhotoBefore}" height="50" width="50" onclick="showPhoto('${picPath}/pic/${siteSluiceInfo.ssiPhotoBefore}')"/><br>
								<span>更换照片</span>
								<input type="file" id="file1" class="form-control" name="file"  style="color:black;width:180px;">
							</td>
							<td align="right">设备安装后的照片:</td>
							<td class="w18">
							<img src="${picPath}/pic/${siteSluiceInfo.ssiPhotoAfter}" height="50" width="50" onclick="showPhoto('${picPath}/pic/${siteSluiceInfo.ssiPhotoAfter}')"/><br>
								<span>更换照片</span>
								<input type="file" class="form-control" name="file"    style="color:black;width:180px;">
							</td>
						</tr> 
						<tr>
							<td align="right"><span style="color: red">*</span>闸门站详细地址:</td>
							<td class="w18"  colspan="3">
								<textarea  name="ssiAddr" id="ssiAddr"   class="form-control" rows="1" cols="60" rows="3" style="color:black;"></textarea> 
							</td>
						</tr>
						<tr>
							<td align="right">备注:</td>
							<td class="w18"  colspan="3">
								<textarea  name="ssiRemark" id="ssiRemark"   class="form-control" rows="1" cols="60" rows="3" style="color:black;"></textarea> 
							</td>
						</tr> 
    				</table>
    				<input hidden="hidden"  type="text" name="id" value="${siteSluiceInfo.id}" style="color:black;"/>
	        		</form>
       		 </div>
	
	<script type="text/javascript" src="${ctxstc}/js/footer.js"></script>
	<script type="text/javascript" src="${ctxstc}/js/custom/water_area_cook.js"></script>
	<script type="text/javascript" src="${ctxstc}/datepicker/WdatePicker.js "></script>
	<script src="${ctxstc}/adapters/layui/layui.js" charset="utf-8"></script>
	
	
	<script>
	window.onload = function(){
		
		document.getElementById("ssiAddr").value="${siteSluiceInfo.ssiAddr}";
		document.getElementById("ssiRemark").value="${siteSluiceInfo.ssiRemark}";
		
		 var ssiDevicemodelCode = "${siteSluiceInfo.ssiDevicemodelCode}";
	//alert(ssiDevicemodelCode);
		document.getElementById(ssiDevicemodelCode).selected=true;
		
		var sluiceBeforeSiteWaterId = "${siteSluiceInfo.sluiceBeforeSiteWaterId}+0";
	//	alert(sluiceBeforeSiteWaterId);
		document.getElementById(sluiceBeforeSiteWaterId).selected=true;
		
		var sluiceAfterSiteWaterId = "${siteSluiceInfo.sluiceAfterSiteWaterId}";
		//alert(sluiceAfterSiteWaterId);
		document.getElementById(sluiceAfterSiteWaterId).selected=true; 
		
	}
	
	

	</script>
	
	<script type="text/javascript" src="${ctxstc}/js/custom/sluice/sluice.js" ></script>
</body>
</html>



