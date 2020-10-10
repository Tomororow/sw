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
  					
    				<form  id="form" action="${ctx}/site_speed_manage/edit" method="post" enctype="multipart/form-data">
    				
    				<table class="table table-bordered table-header">
						
						<tr>	
							<td class="w7">流速站唯一编码</td><td class="w18"><input type="text" id="ssiCode" name="ssiCode" value="${siteSpeedInfo.ssiCode}" style="color:black;width:180px;"/></td>
							<td class="w7">流速站名称</td><td class="w18"><input type="text"  id="ssiName" name="ssiName" value="${siteSpeedInfo.ssiName}" style="color:black;width:180px;"/></td>
							
						</tr>
						<tr>	
							<td class="w7">站点设备编码</td><td class="w18"><input type="text" name="ssiDeviceNo" value="${siteSpeedInfo.ssiDeviceNo}" style="color:black;width:180px;"/></td>
							<td class="w7">站点sim卡号</td><td class="w18"><input type="text" name="ssiSimNumber" value="${siteSpeedInfo.ssiSimNumber}" style="color:black;width:180px;"/></td>
						
						</tr>
						<tr>	
							<td class="w7">站点详细地址</td>
							<td class="w18"  colspan="3">
								<textarea  name="ssiAddr" cols="100" rows="3" style="color:black;">${siteSpeedInfo.ssiAddr}</textarea> 
							</td>
						</tr>
						<tr>	
							<td class="w7">站点建设时间</td><td class="w18"><input type="text" name="ssiBuildTime" value="<fmt:formatDate value='${siteSpeedInfo.ssiBuildTime}' type='date' pattern='yyyy-MM-dd'/>" style="color:black;width:180px;" onfocus="WdatePicker({'skin':'whyGreen','dateFmt':'yyyy-MM-dd'});" /></td>
							<td class="w7">sim卡号运营商</td><td class="w18"><input type="text" name="ssiSimoperator" value="${siteSpeedInfo.ssiSimoperator}" style="color:black;width:180px;"/></td>
						
						</tr>
						<tr>	
							<td class="w7">站点设备最后一次登录IP和端口</td><td class="w18"><input type="text" name="siteSpeedInfo.ssiIpPort" value="${siteSpeedInfo.ssiIpPort}" style="color:black;width:180px;" /></td>
							<td class="w7">水位站经度</td><td class="w18"><input type="text" name="ssiLongitude" value="${siteSpeedInfo.ssiLongitude}" style="color:black;width:180px;"/></td>
						
						</tr>
						<tr>	
							<td class="w7">水位站纬度</td><td class="w18"><input type="text" name="ssiLatitude" value="${siteSpeedInfo.ssiLatitude}" style="color:black;width:180px;" /></td>
							<td class="w7">水位站高程</td><td class="w18"><input type="text" name="ssiHight" value="${siteSpeedInfo.ssiHight}" style="color:black;width:180px;"/></td>
						
						</tr>
						
						<tr>	
							<td class="w7">设备安装前照片</td>
							<td class="w18">
								<img src="${picPath}/pic/${siteSpeedInfo.ssiPhotoBefore}" height="50" width="50" onclick="showPhoto('${picPath}/pic/${siteSpeedInfo.ssiPhotoBefore}')"/><br>
								<span>更换照片</span>
								<input type="file" name="file" style="color:black;width:180px;">
							</td>
							<td class="w7">设备安装后的照片</td>
							<td class="w18">
								<img src="${picPath}/pic/${siteSpeedInfo.ssiPhotoAfter}" height="50" width="50" onclick="showPhoto('${picPath}/pic/${siteSpeedInfo.ssiPhotoAfter}')"/><br>
								<span>更换照片</span>
							
								<input type="file" name="file"  style="color:black;width:180px;">
							</td>
						</tr>
						<tr>
							<td class="w7">水位计类型</td>
							<td class="w18">
								<select id="swiDevicemodelCodeSelect" name="ssiDeviceCode" style="color:black;width:180px;height:30px;" >
										<option>请选择</option>
										<c:forEach items="${siteDeviceModelList}" var="siteDeviceModel">
										  	<option id="${siteDeviceModel.deviceCode}" value="${siteDeviceModel.deviceCode}">${siteDeviceModel.deviceName}</option>
										</c:forEach>
								</select>
							</td>
							
							<td class="w7">数据提取系统编码</td>
							<td class="w18">
								<select id="canalUsetypeCodeSelect" name="systemCode" style="color:black;width:180px;height:30px;" >
										<option>请选择</option>
										<c:forEach items="${calCanalUsetypeList}" var="calCanalUsetype">
										  <option id="${calCanalUsetype.canalUsetypeCode}" value="${calCanalUsetype.canalUsetypeCode}">${calCanalUsetype.canalUsetypeName}</option>
										  
										</c:forEach>
										<option value="22">22</option>
										  <option value="11">11</option>
								</select>
							</td>
						</tr>
						
						<tr>
							<td class="w7">备注</td>
							<td class="w18"  colspan="3">
								<textarea  name="ssiRemark" cols="100" rows="3" style="color:black;">${siteSpeedInfo.ssiRemark}</textarea> 
							</td>
						</tr>
    				</table>
    				<input hidden="hidden"  type="text" name="id" value="${siteSpeedInfo.id}" style="color:black;"/>
    				
	        		</form>
       		 </div>
	
	<script type="text/javascript" src="${ctxstc}/js/footer.js"></script>
	<script type="text/javascript" src="${ctxstc}/js/custom/water_area_cook.js"></script>
	<script type="text/javascript" src="${ctxstc}/datepicker/WdatePicker.js "></script>
	<script src="${ctxstc}/adapters/layui/layui.js" charset="utf-8"></script>
	
	
	<script>
	window.onload = function(){
		var ssiDeviceCode = "${siteSpeedInfo.ssiDeviceCode}";
		//alert(swiDevicemodelCode);
		document.getElementById(ssiDeviceCode).selected=true;
	}
	
	//给父页面传值所用信息
	var index = parent.layer.getFrameIndex(window.name);
	function mySubmit2(){
		//alert("111111");
		//关闭子页面
		parent.layer.close(index);
		//parent.layer.msg('您将标记 成功传送给了父窗口');
        $('#form').submit();
    }
	//照片点击事件显示照片=====================
	function showPhoto(img){
		//alert(a);
		layer.open({
			  type: 1,
			  title: false,
			  closeBtn: 0,
			  area: ['500px', '300px'],
			  skin: 'layui-layer-nobg', //没有背景色
			  shadeClose: true,
			  content: '<img src= '+img+'  width="500" height="300" alt="渠道照片" />'
		});
	}
	
	

	</script>
</body>
</html>


