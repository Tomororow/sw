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
	<script type="text/javascript" src="${ctxstc}/datepicker/WdatePicker.js "></script>
</head>
<body>
	<div align="center" style="background-color:#393D49; color:#fff; padding-top:25px; padding-bottom:25px;">
		<form id="form" action="${ctx}/video/saveVideoInfo" method="post" enctype="multipart/form-data">
			<table cellspacing="30" style="line-height:30px; border-collapse:separate; border-spacing:0px 20px;">
				<input type="hidden" id="sviCanalCode" name="sviCanalCode" value="${canalCode}"/>
				<tr>
					<td align="right"><span style="color: red">*</span>站点编码：</td>
					<td><input type="text" class="form-control" id="deviceVideoCode" name="deviceVideoCode" style="color:black;width:180px;"/></td>
					
					<td align="right"><span style="color: red">*</span>站点名称：</td>
					<td><input type="text" class="form-control" id="deviceVideoName" name="deviceVideoName" style="color:black;width:180px;"/></td>
				</tr>
				
			<tr>
					<td align="right"><span style="color: red">*</span>设备类型：</td>
					<td>
						<select class="form-control" id="sviDevicemodelCode" name="sviDevicemodelCode" style="color:black;width:180px;">
							<option>--请选择设备类型--</option>
							<c:forEach var="item" items="${siteDeviceModels}">
								<option value="${item.deviceCode}">${item.deviceName}</option>
							</c:forEach>
					  	</select>
					</td>
					
					<td align="right"><span style="color: red">*</span>建设时间：</td>
					<td><input type="text" class="form-control" id="sviBuildTime" name="sviBuildTime"  onfocus="WdatePicker({'skin':'whyGreen','dateFmt':'yyyy-MM-dd HH:mm:ss'});"  style="color:black;width:180px;"/></td>
				</tr>
					
				<tr>
					<td align="right"><span style="color: red">*</span>站点经度：</td>
					<td><input type="text" class="form-control" id="sviLongitude" name="sviLongitude" style="color:black;width:180px;"/></td>
					
					<td align="right"><span style="color: red">*</span>站点纬度：</td>
					<td><input type="text" class="form-control" id="sviLatitude" name="sviLatitude" style="color:black;width:180px;"/></td>
				</tr>
				 <tr>
					<td align="right"><span style="color: red">*</span>站点SIM卡号:</td><td class="w18"><input class="form-control" type="text" class="form-control" name="comm1" id="comm1" style="color:black;width:180px;"/></td>
					<td align="right"><span style="color: red">*</span>SIM卡号运营商:</td><td class="w18"><input type="text" name="comm2" class="form-control" id="comm2"  style="color:black;width:180px;"/></td>
				</tr>
				
				<tr>
					<td align="right"><span style="color: red">*</span>设备序列号：</td>
					<td><input type="text" class="form-control" id="equipmentSequence" name="equipmentSequence" style="color:black;width:180px;"/></td>
					<td align="right"><span style="color: red">*</span>设备唯一编码：</td>
					<td><input type="text" class="form-control" id="deviceSerial" name="deviceSerial" style="color:black;width:180px;"/></td>
				</tr>
				
				<tr>
					<td align="right"><span style="color: red">*</span>绑定设备秘钥：</td>
					<td><input type="text" class="form-control" id="accesstoken" name="accesstoken" style="color:black;width:180px;"/></td>
					<td align="right"><span style="color: red">*</span>设备通道号：</td>
					<td><input type="text" class="form-control" id="deviceChannelNumber" name="deviceChannelNumber" style="color:black;width:180px;"/></td>
				</tr>
				
				<tr>
					<td align="right"><span style="color: red">*</span>设备安装前照片：</td>
					<td><input type="file" id="sviPhotoBefore" class="form-control" name="file" style="color:black;width:180px;"/></td>
					
					<td align="right"><span style="color: red">*</span>设备安装后照片：</td>
					<td><input type="file" id="sviPhotoAfter" class="form-control" name="file" style="color:black;width:180px;"/></td>
				</tr>
				<tr>
					<td align="right"><span style="color: red">*</span>萤石直播源地址(高清)：</td>
					<td><input type="text" class="form-control" id="ezopenHdLive" name="ezopenHdLive" style="color:black;width:180px;"/></td>
					
					<td align="right"><span style="color: red">*</span>萤石直播源地址(流畅)：</td>
					<td><input type="text" class="form-control" id="ezopenLive" name="ezopenLive" style="color:black;width:180px;"/></td>
				</tr>
				<tr>
					<td align="right"><span style="color: red">*</span>萤石回放源地址<!-- (EZOPEN协议) -->：</td>
					<td colspan="3"><textarea class="form-control" id="ezopenRecLive" name="ezopenRecLive" class="form-control" rows="1" cols="60" rows="3" style="color:black;"></textarea></td>
				</tr>
				<tr>
					<td align="right"><span style="color: red">*</span>所在地址：</td>
					<td colspan="3"><textarea  id="sviAddr" name="sviAddr" class="form-control" rows="1" cols="60" rows="3" style="color:black;" ></textarea></td>
				</tr>
				<tr>
					<td align="right">备注信息：</td>
					<td colspan="3"><textarea  id="sviRemark" name="sviRemark" class="form-control" rows="1" cols="60" rows="3" style="color:black;"></textarea></td>
				</tr> 
			</table>
		</form>
	</div>	
	<script type="text/javascript" src="${ctxstc}/js/footer.js"></script>
	<script type="text/javascript" src="${ctxstc}/js/custom/video_site.js"></script>
	<script>
	//给父页面传值所用信息
	var index = parent.layer.getFrameIndex(window.name);
	
	function mySubmit(){
		//alert(888888888888888);
		/* $("#consumerId").removeAttr("disabled");
		var canalCode = "${consumerSoil.canalCode}";
		
		if($("#consumerId option:selected").val()==null || $("#consumerId option:selected").val()==""){
			layer.alert('请选择用户！', {icon: 0});
		}else if($("#soilName").val()==null || $("#soilName").val()==""){
			layer.alert('土地名称不能为空！', {icon: 0});
		}else if($("#soilTypeCode option:selected").val()==null || $("#soilTypeCode option:selected").val()==""){
			layer.alert('请选择土质类型！', {icon: 0});
		}else if($("#x").val()==null || $("#x").val()==""){
			layer.alert('经度不能为空！', {icon: 0});
		}else if($("#y").val()==null || $("#y").val()==""){
			layer.alert('纬度不能为空！', {icon: 0});
		}else if($("#z").val()==null || $("#z").val()==""){
			layer.alert('海拔不能为空', {icon: 0});
		}else if($("#soilArea").val()==null || $("#soilArea").val()==""){
			layer.alert('面积不能为空！', {icon: 0});
		}
		else{ */
			//关闭子页面
			parent.layer.close(index);
	        $('#form').submit();
		//}
		
    }
	</script>
</body>
</html>