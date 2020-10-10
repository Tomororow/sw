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

</head>
<body>
	<div align="center" style="background-color:#393D49; color:#fff; padding-top:25px; padding-bottom:25px;">
		<table border="0" style="border-collapse:separate; border-spacing:20px 18px;">
			<tr>
				<td align="right">站点编码：</td>
				<td><input type="text" class="form-control" value="${siteRainInfo.deviceRainCode}" readonly="readonly" style="color:black; width:233px;"/></td>
				
				<td align="right">站点名称：</td>
				<td><input type="text" class="form-control" value="${siteRainInfo.deviceRainName}" readonly="readonly" style="color:black; width:233px;"/></td>
			</tr>
			
			<tr>
				<td align="right">数据提取系统：</td>
				<td><input type="text" class="form-control" value="${siteRainInfo.systemName}" readonly="readonly" style="color:black; width:233px;"/></td>
				
				<td align="right">站点详细地址：</td>
				<td><input type="text" class="form-control" value="${siteRainInfo.sriAddr}" readonly="readonly" style="color:black; width:233px;"/></td>
			</tr>
			
			<tr>
				<td align="right">设备类型：</td>
				<td><input type="text" class="form-control" value="${siteRainInfo.deviceName}" readonly="readonly" style="color:black; width:233px;"/></td>
				
				<td align="right">设备厂家：</td>
				<td><input type="text" class="form-control" value="${siteRainInfo.deviceBrand}" readonly="readonly" style="color:black; width:233px;"/></td>
			</tr>
			
			<tr>
				<td align="right">设备型号：</td>
				<td><input type="text" class="form-control" value="${siteRainInfo.deviceModel}" readonly="readonly" style="color:black; width:233px;"/></td>
				
				<td align="right">登录IP：</td>
				<td><input type="text" class="form-control" value="${siteRainInfo.sriIp}" readonly="readonly" style="color:black; width:233px;"/></td>
			</tr>
			
			<tr>
				<td align="right">站点经度：</td>
				<td><input type="text" class="form-control" value="${siteRainInfo.sriLongitude}" readonly="readonly" style="color:black; width:233px;"/></td>
				
				<td align="right">站点纬度：</td>
				<td><input type="text" class="form-control" value="${siteRainInfo.sriLatitude}" readonly="readonly" style="color:black; width:233px;"/></td>
			</tr>
			
			<tr>
				<td align="right">基面高程：</td>
				<td><input type="text" class="form-control" value="${siteRainInfo.sriHeight}"  readonly="readonly" style="color:black; width:233px;"/></td>
				
				<td align="right">建设时间：</td>
				<td><input type="text" class="form-control" value="<fmt:formatDate value="${siteRainInfo.sriBuildTime}" pattern="yyyy-MM-dd HH:mm:ss"/>" readonly="readonly" style="color:black; width:233px;"/></td>
			</tr>
			
			<tr>
				<td align="right">备注信息：</td>
				<td colspan="3"><textarea rows="2" class="form-control" style="color:black; resize:none; width:605px;" readonly="readonly">${siteRainInfo.sriRemark}</textarea></td>
			</tr>
		</table>
	</div>
	
	<script type="text/javascript" src="${ctxstc}/js/footer.js"></script>
	<script type="text/javascript" src="${ctxstc}/js/custom/rain_site_manage.js"></script>
</body>
</html>