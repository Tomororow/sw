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
	
	<script type="text/javascript" src="${ctxstc}/adapters/ztree/js/jquery.ztree.core.js"></script>
	
    <link rel="stylesheet" href="${ctxstc}/adapters/ztree/css/metroStyle/metroStyle.css" type="text/css">
    <script type="text/javascript" src="${ctxstc}/adapters/ztree/js/jquery.ztree.excheck.js"></script>
    <script type="text/javascript" src="${ctxstc}/adapters/ztree/js/jquery.ztree.exedit.js"></script>
	
	<script src="${ctxstc}/adapters/layui/layer/layer.js"></script>

</head>
<body>
	<div  style="padding: 30px; line-height: 22px; background-color: #393D49; color: #fff; font-weight: 300;">
		<form  id="feorm"  method="post" action="${ctx}/syn_fpud/updataSynFpud"  enctype="multipart/form-data">
    				<table border="0" style="border-collapse:separate; border-spacing:20px 18px;">
						<tr>	
							<td align="right"><span style="color:red">*</span>公司名称:</td><td class="w18"><input type="text" class="form-control" id="deviceSluiceName" name="fpudName" value="${SynFpud.fpudName}" style="color:black;width:180px;"/></td>
							<td align="right"><span style="color:red">*</span>公司编码:</td><td class="w18"><input type="text" class="form-control" id="deviceSluiceCode" name="fpudNumber" value="${SynFpud.fpudNumber}" style="color:black;width:180px;"/></td>
						</tr>
						<tr>	
							<td align="right"><span style="color: red">*</span>建设时间:</td><td class="w18"><input class="form-control" type="text" class="form-control" name="buildTime" value="<fmt:formatDate value='${SynFpud.buildTime}' type='date' pattern='yyyy-MM-dd'/>"  id="ssiBuildTime"  style="color:black;width:180px;" onfocus="WdatePicker({'skin':'whyGreen','dateFmt':'yyyy-MM-dd'});" /></td>
							<td align="right"><span style="color: red">*</span>SIM卡号:</td><td class="w18"><input class="form-control" type="text" class="form-control" name="simClip" value="${SynFpud.simClip}" id="simClip" style="color:black;width:180px;"/></td>
						 </tr>
						 <tr>	
							<td class="w7" colspan="1"><span style="color: red">*</span>SIM卡号运营商:</td><td class="w18"><input type="text" name="simClipOperator" class="form-control" value="${SynFpud.simClipOperator}" id="simClipOperator"  style="color:black;width:180px;"/></td>
							<td align="right"><span style="color: red">*</span>经度:</td><td class="w18"><input type="text" class="form-control" id="ssiLongitude" name="longitude" value="${SynFpud.longitude}"  style="color:black;width:180px;"/></td>
						</tr>
						<tr>	
							
							<td align="right"><span style="color: red">*</span>纬度:</td><td class="w18"><input type="text" class="form-control" id="ssiLatitude" name="latitude" value="${SynFpud.latitude}" style="color:black;width:180px;" /></td>
							<td align="right"><span style="color: red">*</span>高程:</td><td class="w18"><input type="text" class="form-control" id="ssiHeight" name="elevation" value="${SynFpud.elevation}" style="color:black;width:180px;" /></td>
						</tr>
				
						<tr>	
							<td align="right"><span style="color: red">*</span>公司图片:</td>
							<td class="w18">
								<input type="file" id="file1" class="form-control" name="file" style="color:black;width:180px;">
							</td>
						</tr> 
						<tr>
							<td align="right"><span style="color: red">*</span>公司地址:</td>
							<td class="w18"  colspan="3">
								<textarea  name="address" id="ssiAddr" class="form-control"  rows="1" cols="60" rows="3"  style="color:black;"></textarea>
							</td>
						</tr>
						<tr>
							<td align="right">备注:</td>
							<td class="w18"  colspan="3">
								 <textarea  name="comm1" id="ssiRemark" class="form-control" rows="1" cols="60" rows="3" style="color:black;"></textarea>
							</td>
						</tr> 
    				</table>
    				 	<input hidden="hidden"  type="text" name="id" value="${SynFpud.id}" style="color:black;"/>
    				 	<input hidden="hidden"  type="text" name="sysareaId" value="${SynFpud.sysareaId}" style="color:black;"/>
	        		</form>
	</div>
	<script type="text/javascript" src="${ctxstc}/js/footer.js"></script>
	<script type="text/javascript" src="${ctxstc}/js/custom/water_area_cook.js"></script>
	<script type="text/javascript" src="${ctxstc}/datepicker/WdatePicker.js "></script>
	<script src="${ctxstc}/adapters/layui/layui.js" charset="utf-8"></script>
	
	<script type="text/javascript" src="${ctxstc}/js/custom/watersupply/syn_fpud/syn_fpud.js"></script>
		<script type="text/javascript">
		function mySubmit(){
			$("#feorm").submit();
		}
		$(function(){
			$("#ssiAddr").html("${SynFpud.address}");
			$("#ssiRemark").html("${SynFpud.comm1}");
		});
		var index = parent.layer.getFrameIndex(window.name);1000000.333
		function mySubmit(){
			var res = "(?:0\.\d{0,3}|[1-9][0-9]{0,9}|[1-9]{1,7}\.\d{0,3})";
			debugger
			if($("#deviceSluiceName").val()==null || $("#deviceSluiceName").val()==""){
				layer.alert('公司名称不能为空！', {icon: 0});
			}else if($("#deviceSluiceCode").val()==null || $("#deviceSluiceCode").val()==""){
				layer.alert('公司编码不能为空！', {icon: 0});
			}else if($("#ssiBuildTime").val()==null || $("#ssiBuildTime").val()==""){
				layer.alert('请选择站点建设时间！', {icon: 0});
			}else if($("#simClip").val()==null || $("#simClip").val()=="") {
				layer.alert('请输入SIM卡号！', {icon: 0});
			}else if($("#simClipOperator").val()==null || $("#simClipOperator").val()=="") {
				layer.alert('请输入运营商名称！', {icon: 0});
			}else if($("#ssiLongitude").val()==null && $("#ssiLongitude").val()=="" &&$("#ssiLongitude").val().length>7) {
				layer.alert('经度不能为空或格式输入错误'+"\n"+'正确格式为（0000000.000）！', {icon: 0});
			}else if($("#ssiLatitude").val()==null && $("#ssiLatitude").val()==""&& $("#ssiLatitude").val().length>7) {
				layer.alert('纬度不能为空或格式输入错误'+"\n"+'正确格式为（0000000.000）！', {icon: 0});
			}else if($("#ssiHeight").val()==null && $("#ssiHeight").val()==""&&$("#ssiHeight").val().length>7) {
				layer.alert('高程不能为空或格式输入错误'+"\n"+'正确格式为（0000000.000）！', {icon: 0});
			}else if($("#ssiAddr").val()==null || $("#ssiAddr").val()=="") {
				layer.alert('请输入详细地址！', {icon: 0});
			}else{
				debugger
				
				$("#feorm").submit();
				parent.layer.close(index);
			}
		}
	</script>
</body>
</html>



