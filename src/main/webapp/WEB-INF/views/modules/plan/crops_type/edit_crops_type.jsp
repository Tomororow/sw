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

</head>
<body>
	<div align="center" style="background-color: #393D49; color: #fff; padding-top: 25px; padding-bottom: 25px;">
		<form id="cropsEditForm" action="${ctx}/crops/editSaveCropsInfo" method="post">
			<input type="hidden" id="id" name="id" value="${cropsTypeInfo.id}">
			<table border="0" cellspacing="15" style="line-height: 25px; border-collapse:separate; border-spacing:0px 10px;">
				<tr>
					<td align="right"><span style="color: red">*</span>作物类型名称：</td>
					<td><input type="text" id="cropsName" name="cropsName" value="${cropsTypeInfo.cropsName}" style="color:black; width:233px;"/></td>
				</tr>
				
				<tr>
					<td align="right">作物类型描述：</td>
					<td><textarea id="description" name="description" rows="2" cols="35" maxlength="256" style="color:black; resize:none;">${cropsTypeInfo.description}</textarea></td>
				</tr>
				
				<tr>
					<td align="right">备注信息：</td>
					<td><textarea id="ctiRemark" name="ctiRemark" rows="2" cols="35" maxlength="256" style="color:black; resize:none;">${cropsTypeInfo.ctiRemark}</textarea></td>
				</tr>
			</table>
		</form>
	</div>
	
	<script type="text/javascript" src="${ctxstc}/js/custom/crops.js"></script>
	<script type="text/javascript" src="${ctxstc}/js/footer.js"></script>
</body>
</html>