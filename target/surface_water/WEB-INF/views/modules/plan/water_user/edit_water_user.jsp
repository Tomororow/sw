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
  					
    				<form  id="form" action="${ctx}/water_user/edit" method="post" enctype="multipart/form-data">
    				
    				<table class="border="0" style="border-collapse:separate; border-spacing:20px 18px;">
						<tr>	
							<td align="right"><span style="color: red">*</span>用户姓名：</td><td class="w18"><input type="text" class="form-control" id="name"  name="name" value="${distWaterPlanConsumer.name}" style="color:black;width:180px;"/></td>
							<td align="right">电话：</td><td class="w18"><input type="text" class="form-control" id="phonenumber"  name="phonenumber" value="${distWaterPlanConsumer.phonenumber}" style="color:black;width:180px;"/></td>
						</tr>
						
						<tr>
							<td align="right"><span style="color: red">*</span>账号：</td><td class="w18"><input type="text" class="form-control"  id="account" name="account" value="${distWaterPlanConsumer.account}" style="color:black;width:180px;"/></td>
							<td align="right"><span style="color: red">*</span>密码：</td><td class="w18"><input type="text"  class="form-control" id="password"  name="password" value="${distWaterPlanConsumer.password}" style="color:black;width:180px;"/></td>
						</tr>
						<tr>	
							<td align="right"><span style="color: red">*</span>水权面积：</td><td class="w18"><input type="text" class="form-control" id="waterRightArea" name="waterRightArea" value="${distWaterPlanConsumer.waterRightArea}" style="color:black;width:180px;"/></td>
							<td align="right"><span style="color: red">*</span>实有面积：</td><td class="w18"><input type="text" class="form-control" id="realArea"  name="realArea" value="${distWaterPlanConsumer.realArea}" style="color:black;width:180px;"/></td>
						</tr>
						
						<tr>
							<td align="right">地址：</td>
							<td class="w18"  colspan="3">
								<textarea  name="address" id="address" class="form-control" cols="60" rows="1" style="color:black;">${distWaterPlanConsumer.address}</textarea> 
							</td>
						</tr>
						
						<tr>
							<td align="right">备注：</td>
							<td class="w18"  colspan="3">
								<textarea  name="dwpcRemark" class="form-control" cols="60" rows="1" style="color:black;">${distWaterPlanConsumer.dwpcRemark}</textarea> 
							</td>
						</tr>
    				</table>
    				<input type="text" hidden="hidden" name="id" value="${distWaterPlanConsumer.id}"/>
	        		</form>
       		 </div>
	
	<script type="text/javascript" src="${ctxstc}/js/footer.js"></script>
	<script type="text/javascript" src="${ctxstc}/js/custom/water_area_cook.js"></script>
	<script type="text/javascript" src="${ctxstc}/datepicker/WdatePicker.js "></script>
	<script src="${ctxstc}/adapters/layui/layui.js" charset="utf-8"></script>
	<script type="text/javascript" src="${ctxstc}/js/custom/water_user/water_user.js" ></script>
</body>
</html>



