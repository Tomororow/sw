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
		<form id="form" action="${ctx}/soils/saveSoilsInfo" method="post">
			<table border="0" cellspacing="15" style="line-height: 25px; border-collapse:separate; border-spacing:0px 10px;">
				
				<tr>
					<td align="right"><span style="color: red">*</span>行政区编码：</td>
					<td><input type="text" name="areaCode" readonly="readonly" value="${areaCode}" class="form-control" style="color:black; width:180px;"/></td>
					<td align="right"><span style="color: red">*</span>行政区名称：</td>
					<td><input type="text"  readonly="readonly" value="${areaName}" class="form-control" style="color:black; width:180px;"/></td>
					
				</tr>
				
				<tr>
					<td align="right"><span style="color: red">*</span>土地类型名称：</td>
					<td><input type="text" class="form-control" id="soilName" name="soilName" style="color:black; width:180px;"/></td>
					<td align="right"><span style="color: red">*</span>土质系数：</td>
					<td><input type="text"class="form-control"  id="coefficientSoil" name="coefficientSoil" style="color:black; width:180px;"/></td>
				</tr>
				<tr>
					<td align="right"><!-- <span style="color: red">*</span> -->土壤储存水量：</td>
					<td><input type="text" class="form-control" id="storeWaterSoil"  name="storeWaterSoil" style="color:black; width:180px;"/></td>
				</tr>
				<tr>
					<td align="right">土地类型描述：</td>
					<td colspan="3"><textarea id="description" name="description" class="form-control" rows="1" cols="35" maxlength="256" style="color:black; resize:none;"></textarea></td>
				</tr>
				
				<tr>
					<td align="right">备注信息：</td>
					<td colspan="3"><textarea id="stiRemark" name="stiRemark" class="form-control" rows="1" cols="35" maxlength="256" style="color:black; resize:none;"></textarea></td>
				</tr>
			</table>
		</form>
	</div>
	
	<script type="text/javascript" src="${ctxstc}/js/custom/soils.js"></script>
	<script type="text/javascript" src="${ctxstc}/js/footer.js"></script>
</body>
<script type="text/javascript">
	//给父页面传值所用信息
	var index = parent.layer.getFrameIndex(window.name);
	
	function mySubmit(){
		//alert(11111111111111111);
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
</html>