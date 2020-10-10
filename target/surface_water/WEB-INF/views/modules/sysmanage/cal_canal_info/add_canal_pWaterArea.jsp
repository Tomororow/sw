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
  					
    				<form  id="form" action="${ctx}/cal_canal_info/add_canal_pwaterarea" method="post" enctype="multipart/form-data">
    				
    				<table border="0" cellspacing="50px" style="line-height: 35px; border-collapse:separate; border-spacing:0px 10px;">
	        			<tr>
							<td  align="right"  rowspan="2"><span style="color: red">&nbsp;&nbsp;*&nbsp;</span>所属行政区：</td>
							<td id="area" class="w54"  colspan="3">
								<select id="select10" style="color:black;width:100px;height:30px;" onchange="areaChange(this[selectedIndex].value);">
									<option value="area,0,0">请选择</option>
									<c:forEach items="${sysAreaList}" var="sysArea">
									 	 <option value="${sysArea.id},${sysArea.areaLevel},${sysArea.areaName}">${sysArea.areaName}</option>
									</c:forEach>
								</select>
								<span id="span10">--</span>
								<input id="areaSure" class="layui-btn layui-btn-normal layui-btn-sm" value="确定" type="button" onclick="getAreaIdAndLevel()" />
							</td>
							
						</tr>
						<tr>
							<td class="w54"  colspan="3">
								<span hidden="true" id="areaSpan">无<span>
							</td>
							
						</tr>
						
						<tr>	
							<td align="right"  rowspan="2"><span style="color: red">&nbsp;&nbsp;*&nbsp;</span>所属水管区：</td>
							<td id="waterArea" class="w54"  colspan="3">
								<select id="select20" style="color:black;width:100px;height:30px;" onchange="waterAreaChange(this[selectedIndex].value);">
									<option value="waterArea,0,0">请选择</option>
									<c:forEach items="${sysWaterAreaList}" var="sysWaterArea">
									  <option value="${sysWaterArea.id},${sysWaterArea.waterAreaLevel},${sysWaterArea.waterAreaName}">${sysWaterArea.waterAreaName}</option>
									</c:forEach>
								</select>
								<span id="span20">--</span>
								<input id="waterAreaSure" class="layui-btn layui-btn-normal layui-btn-sm" value="确定" type="button" onclick="getWaterAreaIdAndLevel()"/>
							</td>
						</tr>
						<tr>
							<td class="w54"  colspan="3">
								<span hidden="true" id="waterAreaSpan">无<span>
							</td>
							
						</tr>
						
						<tr>	
							<td align="right">所属行政区编码：</td><td class="w18"><input type="text" class="form-control" id="sysareaCode" name="sysareaCode" value="" style="color:black;width:180px;"/></td>
							<td align="right">&nbsp;&nbsp;&nbsp;所属水管区编码：</td><td class="w18"><input type="text" class="form-control" readonly="true" id="syswaterareaCode" name="syswaterareaCode" value="" style="color:black;width:180px;"/></td>
						</tr>
						<tr>	
							<!-- 临时编码，无实际意义 -->
							<td align="right">所属渠系编码：</td><td class="w18"><input type="text" class="form-control" name="canalCode" value="" style="color:black;width:180px;"/></td>
						</tr>
						<tr>
							<td align="right">详细地址：</td>
							<td class="w18" colspan="3">
								<textarea  class="form-control"  name="canalAddr" cols="60" rows="1" style="color:black;"></textarea> 
							</td>
						</tr>
						<tr>
							<td align="right">备注：</td>
							<td class="w18"  colspan="3">
								<textarea  class="form-control"   name="cciRemark" cols="60" rows="1" style="color:black;"></textarea> 
							</td>
						</tr>
    				</table>
    				<input hidden="hidden"  type="text" name="canalParentId" value="${id}" style="color:black;"/>
	        		</form>
       		 </div>
	
	<script type="text/javascript" src="${ctxstc}/js/footer.js"></script>
	<script type="text/javascript" src="${ctxstc}/js/custom/water_area_cook.js"></script>
	<script type="text/javascript" src="${ctxstc}/js/custom/select/select.js"></script>
	<script type="text/javascript" src="${ctxstc}/datepicker/WdatePicker.js "></script>
	<script src="${ctxstc}/adapters/layui/layui.js" charset="utf-8"></script>
	
	
	<script>
	var fileNumber = 0;
	function addPhoto(){
		fileNumber++;
		var currenTag = document.getElementById("photo");
		
		var newInputTag = document.createElement("input");
			newInputTag.setAttribute("type","file");
			newInputTag.setAttribute("name","files");
			newInputTag.setAttribute("style","color:black;width:180px;");
			newInputTag.setAttribute("onchange","addPhoto()");
		var newInputTag2 = document.createElement("input");
			newInputTag2.setAttribute("type","text");
			newInputTag2.setAttribute("name","calCanalPhotoList["+fileNumber+"].ccpRemark");
			newInputTag2.setAttribute("style","color:black;width:180px;");
			currenTag.appendChild(newInputTag);
			currenTag.appendChild(newInputTag2);
	}
	
	//给父页面传值所用信息
	var index = parent.layer.getFrameIndex(window.name);
	
	function mySubmit(){
		
		//关闭子页面
		parent.layer.close(index);
		//parent.layer.msg('您将标记 成功传送给了父窗口');
        $('#form').submit();
    }
	

	</script>
</body>
</html>



