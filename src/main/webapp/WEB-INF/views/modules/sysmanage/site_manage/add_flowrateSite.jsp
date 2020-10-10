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
  					
    				<form  id="form" action="${ctx}/site_flowrate_manage/add" method="post" enctype="multipart/form-data">
    				
    				<table class="table table-bordered table-header">
						
						<tr>	
							<td class="w7">流量站唯一编码</td><td class="w18"><input type="text" id="fsiFlowrateCode" name="fsiFlowrateCode" value="${siteFlowrateInfo.fsiFlowrateCode}" style="color:black;width:180px;"/></td>
							<td class="w7">流量站名称</td><td class="w18"><input type="text"  id="fsiFlowrateName" name="fsiFlowrateName" value="${siteFlowrateInfo.fsiFlowrateName}" style="color:black;width:180px;"/></td>
							
						</tr>
						<tr>	
							<td class="w7">站点详细地址</td>
							<td class="w18"  colspan="3">
								<textarea  name="fsiFlowrateAddr" cols="100" rows="3" style="color:black;">${siteFlowrateInfo.fsiFlowrateAddr}</textarea> 
							</td>
						</tr>
						<tr>	
							<td class="w7">站点建设时间</td><td class="w18"><input type="text" name="fsiBuildTime" value="${siteFlowrateInfo.fsiBuildTime}" style="color:black;width:180px;" onfocus="WdatePicker({'skin':'whyGreen','dateFmt':'yyyy-MM-dd'});" /></td>
						
						</tr>
						
						
						<tr>
							<td class="w7">水位站</td>
							<td class="w18">
								<select  name="fsiWaterCode" style="color:black;width:180px;height:30px;">
										<option>请选择</option>
										<c:forEach items="${siteWaterInfoList}" var="siteWaterInfo">
										  	<option value="${siteWaterInfo.deviceWaterCode}">${siteWaterInfo.deviceWaterName}：${siteWaterInfo.deviceWaterCode}</option>
										</c:forEach>
								</select>
							</td>
							
							<td class="w7">流速站</td>
							<td class="w18">
								<select  name="fsiSpeedCode" style="color:black;width:180px;height:30px;" >
										<option>请选择</option>
										<c:forEach items="${siteSpeedInfoList}" var="siteSpeedInfo">
										  	<option value="${siteSpeedInfo.ssiCode}">${siteSpeedInfo.ssiName}：${siteSpeedInfo.ssiCode}</option>
										</c:forEach>
								</select>
							</td>
						</tr>
						
						<tr>
							<td class="w7">备注</td>
							<td class="w18"  colspan="3">
								<textarea  name="fsiRemark" cols="100" rows="3" style="color:black;">${siteFlowrateInfo.fsiRemark}</textarea> 
							</td>
						</tr>
    				</table>
    				<input hidden="hidden"  type="text" name="fsiCanalCode" value="${calCanalInfo.canalCode}" style="color:black;"/>
    				
	        		</form>
       		 </div>
	
	<script type="text/javascript" src="${ctxstc}/js/footer.js"></script>
	<script type="text/javascript" src="${ctxstc}/js/custom/water_area_cook.js"></script>
	<script type="text/javascript" src="${ctxstc}/datepicker/WdatePicker.js "></script>
	<script src="${ctxstc}/adapters/layui/layui.js" charset="utf-8"></script>
	
	
	<script>
	
	
	//给父页面传值所用信息
	var index = parent.layer.getFrameIndex(window.name);
	
	function mySubmit(){
		
		parent.layer.close(index);
		//parent.layer.msg('您将标记 成功传送给了父窗口');
        $('#form').submit();
    }
	
	</script>
</body>
</html>



