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
	<link type="text/css" rel="stylesheet" href="${ctxstc}/adapters/ztree/css/metroStyle/metroStyle.css" />

	<script type="text/javascript" src="${ctxstc}/jquery/jquery-1.11.1.min.js"></script>
	<script type="text/javascript" src="${ctxstc}/jquery/jquery-form.js"></script>
	<script type="text/javascript" src="${ctxstc}/jquery/jquery.cookie.js"></script>
	<script type="text/javascript" src="${ctxstc}/adapters/bootstrap/js/bootstrap.min.js"></script>
	<script type="text/javascript" src="${ctxstc}/adapters/bootstrap/js/bootstrap-paginator.js"></script>
	<script type="text/javascript" src="${ctxstc}/js/style.js"></script>
	<script type="text/javascript" src="${ctxstc}/js/angular.min.js"></script><!-- angular ui --->
	<script type="text/javascript" src="${ctxstc}/js/ui-layout.js"></script>
	<script type="text/javascript" src="${ctxstc}/adapters/ztree/js/jquery.ztree.core.js"></script><!-- zTree -->
	<script type="text/javascript" src="${ctxstc}/adapters/layui/layer/layer.js" merge="true"></script>
	<script type="text/javascript" src="${ctxstc}/adapters/layui/layui.js" merge="true"></script>
	<script type="text/javascript" src="${ctxstc}/datepicker/WdatePicker.js"></script>

</head>
<body>
	<div align="center" style="background-color:#393D49; color:#fff; padding-top:25px; padding-bottom:25px;">
		<form id="addRainSiteForm" action="${ctx}/siteRainManage/saveRainSiteInfo" enctype="multipart/form-data" method="post">
			<table border="0" style="border-collapse:separate; border-spacing:20px 18px;">
				<input type="hidden" id="sysareaId" name="sysareaId" value="${areaId}"/>
				<tr>
					<td align="right">站点模式：</td>
					<td>
						<select class="form-control" id="isNewSite" name="isNewSite" style="width:233px;" onchange="chooseSiteModel()">
							<option value="0">原有站点</option>
							<option value="1">新建站点</option>
					  	</select>
					</td>
					
					<td align="right" id="systemCodeText"><span style="color: red">*</span>数据提取系统：</td>
					<td>
						<select class="form-control" id="systemCode" name="systemCode" style="width:233px;">
							<option>--请选择提取系统--</option>
							<c:forEach var="item" items="${databaseInfos}">
								<option value="${item.systemCode}">${item.systemName}</option>
							</c:forEach>
					  	</select>
					</td>
				</tr>
				
				<tr>
					<td align="right"><span style="color: red">*</span>站点编码：</td>
					<td><input type="text" id="deviceRainCode" name="deviceRainCode" class="form-control" style="width:233px;"/></td>
					
					<td align="right"><span style="color: red">*</span>站点名称：</td>
					<td><input type="text" id="deviceRainName" name="deviceRainName" class="form-control" style="width:233px;"/></td>
				</tr>
				
				<tr>
					<td align="right"><span style="color: red">*</span>设备类型：</td>
					<td>
						<select class="form-control" id="sriDevicemodelCode" name="sriDevicemodelCode" style="width:233px;">
							<option>--请选择设备类型--</option>
							<c:forEach var="item" items="${siteDeviceModels}">
								<option value="${item.deviceCode}">${item.deviceName}</option>
							</c:forEach>
					  	</select>
					</td>
					
					<td align="right">站点详细地址：</td>
					<td><input type="text" id="sriAddr" name="sriAddr" class="form-control" style="width:233px;"/></td>
				</tr>
				
				<tr>
					<td align="right">建设时间：</td>
					<td>
						<input type="text" id="sriBuildTime" name="sriBuildTime" class="form-control" readonly="readonly" style="width:233px; cursor:pointer;" onfocus="WdatePicker({skin:'whyGreen', dateFmt:'yyyy-MM-dd HH:mm:ss'})" />
					</td>
					
					<td align="right"><span style="color: red">*</span>基面高程：</td>
					<td><input type="text" id="sriHeight" name="sriHeight" class="form-control" style="width:233px;"/></td>
				</tr>
				
				<tr>
					<td align="right"><span style="color: red">*</span>站点经度：</td>
					<td><input type="text" id="sriLongitude" name="sriLongitude" class="form-control" style="width:233px;"/></td>
					
					<td align="right"><span style="color: red">*</span>站点纬度：</td>
					<td><input type="text" id="sriLatitude" name="sriLatitude" class="form-control" style="width:233px;"/></td>
				</tr>
				
				<tr>
					<td align="right">设备安装前照片：</td>
					<td><input type="file" id="sriPhotoBefore" name="files" /></td>
					
					<td align="right">设备安装后照片：</td>
					<td><input type="file" id="sriPhotoAfter" name="files" /></td>
				</tr>
				
				<tr>
					<td align="right">备注信息：</td>
					<td colspan="3"><textarea rows="2" id="sriRemark" name="sriRemark" class="form-control" style="resize:none; width:605px;"></textarea></td>
				</tr>
			</table>
			<input type="submit" id="siteSubmit" value="确认" onclick="rainSiteSubmit()"/>
		</form>
	</div>
	<script type="text/javascript" src="${ctxstc}/js/custom/rain_site_manage.js"></script>
	<script type="text/javascript" src="${ctxstc}/js/footer.js"></script>
</body>
</html>