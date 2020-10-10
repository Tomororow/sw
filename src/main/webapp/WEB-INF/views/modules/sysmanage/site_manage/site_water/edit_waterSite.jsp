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
  					
    		<form  id="form" action="${ctx}/site_water_manage/edit" method="post" enctype="multipart/form-data">
    				<span  style="color: white;font-size:20px;">基础信息:</span><br/>
    					<div style="border:1px solid white;width:100%;border-radius:10px">
    					<table border="0" cellspacing="50px" style="line-height: 35px; border-collapse:separate; border-spacing:0px 10px;">
						
						<tr>	
							<td class="w7"><span style="color: red">&nbsp;&nbsp;*&nbsp;</span>站点编码:</td><td class="w18"><input type="text" class="form-control" id="deviceWaterCode" name="deviceWaterCode" value="${siteWaterInfo.deviceWaterCode}" style="color:black;width:180px;height:30px"/></td>
							<td class="w7"><span style="color: red">&nbsp;&nbsp;*&nbsp;</span>站点名称:</td><td class="w18"><input type="text" class="form-control" id="deviceWaterName" name="deviceWaterName" value="${siteWaterInfo.deviceWaterName}" style="color:black;width:180px;height:30px"/></td>
						</tr>
						
						<tr>	
							<td class="w7"><span style="color: red">&nbsp;&nbsp;*&nbsp;</span>设备编码:</td><td class="w18"><input type="text" class="form-control" id="swiDeviceNo" name="swiDeviceNo" value="${siteWaterInfo.swiDeviceNo}" style="color:black;width:180px;height:30px"/></td>
							<td class="w7"><span style="color: red">&nbsp;&nbsp;*&nbsp;</span>sim卡号:</td><td class="w18"><input type="text" class="form-control" id="swiSimcard" name="swiSimcard" value="${siteWaterInfo.swiSimcard}" style="color:black;width:180px;height:30px"/></td>
						</tr>
																		
						<tr>	
							<td class="w7"><span style="color: red">&nbsp;&nbsp;*&nbsp;</span>建设时间</td><td class="w18"><input type="text" id="swiBuildTime" name="swiBuildTime" value="<fmt:formatDate value='${siteWaterInfo.swiBuildTime}' type='date' pattern='yyyy-MM-dd'/>" style="color:black;width:180px;" onfocus="WdatePicker({'skin':'whyGreen','dateFmt':'yyyy-MM-dd'});" /></td>
							<td class="w7"><span style="color: red">&nbsp;&nbsp;*&nbsp;</span>sim运营商:</td><td class="w18"><input type="text" class="form-control" id="swiSimoperator" name="swiSimoperator" value="${siteWaterInfo.swiSimoperator}" style="color:black;width:180px;height:30px"/></td>
						</tr>
																	
						<tr>	
							<td class="w7"><span style="color: red">&nbsp;&nbsp;*&nbsp;</span>站点经度:</td><td class="w18"><input type="text" class="form-control" id="swiLongitude" name="swiLongitude" value="${siteWaterInfo.swiLongitude}" style="color:black;width:180px;height:30px"/></td>
							<td class="w7"><span style="color: red">&nbsp;&nbsp;*&nbsp;</span>站点纬度:</td><td class="w18"><input type="text" class="form-control" id="swiLatitude" name="swiLatitude" value="${siteWaterInfo.swiLatitude}" style="color:black;width:180px;height:30px" /></td>
						</tr>
						
						<tr>	
							<td class="w7"><span style="color: red">&nbsp;&nbsp;*&nbsp;</span>站点空高:</td><td class="w18"><input type="text" class="form-control" id="siteDepth" name="siteDepth" value="${siteWaterInfo.siteDepth}" style="color:black;width:180px;height:30px"/></td>
							<td class="w7"><span style="color: red">&nbsp;&nbsp;*&nbsp;</span>渠底高程:</td><td class="w18"><input type="text" class="form-control" id="siteCanalBottomHeight" name="siteCanalBottomHeight" value="${siteWaterInfo.siteCanalBottomHeight}" style="color:black;width:180px;height:30px" /></td>
						</tr>

						<tr>
							<td class="w7"><span style="color: red">&nbsp;&nbsp;*&nbsp;</span>站点海拔:</td><td class="w18"><input type="text" class="form-control" id="swiHight" name="swiHeight" value="${siteWaterInfo.swiHeight}" style="color:black;width:180px;height:30px"/></td>
							<td class="w7"><span style="color: red">&nbsp;&nbsp;*&nbsp;</span>死水位:</td><td class="w18"><input type="text" class="form-control" id="swiDeadWaterLevel" name="swiDeadWaterLevel" value="${siteWaterInfo.swiDeadWaterLevel}" style="color:black;width:180px;height:30px"/></td>
						</tr>
						<%--新追加--%>
						<tr>
							<td class="w7"><span></span>计量期开始:</td>
							<td class="w18"><input type="text" class="form-control" id="swiMeasureUpperTime" name="swiMeasureUpperTime" value="${siteWaterInfo.swiMeasureUpperTime}" style="color:black;width:180px;height:30px" onfocus="WdatePicker({'skin':'whyGreen','dateFmt':'yyyy-MM-dd'});"/></td>
							<td class="w7"><span></span>&nbsp;计量期结束:</td>
							<td class="w18"><input type="text" class="form-control" id="swiMeasureLowerTime" name="swiMeasureLowerTime" value="${siteWaterInfo.swiMeasureLowerTime}" style="color:black;width:180px;height:30px" onfocus="WdatePicker({'skin':'whyGreen','dateFmt':'yyyy-MM-dd'});"/></td>
						</tr>
						<tr>
							<td class="w7"><span style="color: red">&nbsp;&nbsp;*&nbsp;</span>设备类型:</td>
							<td class="w18">
								<select id="swiDevicemodelCode" name="swiDevicemodelCode" style="color:black;width:180px;height:30px;" >
									<option>请选择</option>
									<c:forEach items="${siteDeviceModelList}" var="siteDeviceModel">
										<option id="${siteDeviceModel.deviceCode}" value="${siteDeviceModel.deviceCode}">${siteDeviceModel.deviceName}</option>
									</c:forEach>
								</select>
							</td>
						</tr>
						<%-- <tr>
							<td class="w7">设备安装前照片</td>
							<td class="w18">
								<img src="${picPath}/pic/${siteWaterInfo.swiPhotoBefore}" height="50" width="50" onclick="showPhoto('${picPath}/pic/${siteWaterInfo.swiPhotoBefore}')"/><br>
								<span>更换照片</span>
								<input type="file" name="file" style="color:black;width:180px;">
							</td>
							<td class="w7">设备安装后的照片</td>
							<td class="w18">
								<img src="${picPath}/pic/${siteWaterInfo.swiPhotoAfter}" height="50" width="50" onclick="showPhoto('${picPath}/pic/${siteWaterInfo.swiPhotoAfter}')"/><br>
								<span>更换照片</span>
							
								<input type="file" name="file"  style="color:black;width:180px;">
							</td>
						</tr> --%>
												
						<tr>	
							<td class="w7">详细地址</td>
							<td class="w18"  colspan="3">
								<textarea  name="swiAddr" class="form-control" cols="50" rows="1" style="color:black;" cols="100" rows="1" style="color:black;">${siteWaterInfo.swiAddr}</textarea> 
							</td>
						</tr>
						<tr>
							<td class="w7">备注</td>
							<td class="w18"  colspan="3">
								<textarea  name="swiRemark" class="form-control" cols="50" rows="1" style="color:black;" cols="100" rows="1" style="color:black;">${siteWaterInfo.swiRemark}</textarea> 
							</td>
						</tr>
    				</table>
    				</div><br/>
    					<span  style="color: white;font-size:20px;">测流方式:</span><br/>
    		 <div style="border:1px solid white;width:100%;border-radius:10px">
    		 <span style="margin-left: 20px;margin-top: 10px;">选择测流方法：</span>
    			<select name="fractureAppearanceCode"  onchange="functionChange(this[selectedIndex].value);" style="color:black;width:150px;height:30px;margin-top: 10px;margin-bottom: 10px" >
						
						<!--O:什么都不选择 F：公式法 R：水位流量关系法-->
						<option value="O">--请选择测流方式--</option>
						<option value="F">--参数公式计算法--</option>
						<option value="R">--水位流量关系法--</option>
				</select>
			 <input value="修改水位流量关系表" type="button" onclick="updateFlow();" style="margin-left: 60px;margin-top: 10px;color:#000000;"/>
    		</div><br/>
    		
    		
			<span id="formula_title"  style="display: none;color: white;font-size:20px;">测流参数(公式法):</span><br/>
    		 <div id="formula_content" style="display: none;border:1px solid white;width:100%;border-radius:10px;">
    			
    			<span style="margin-left: 20px;margin-top: 10px;">选择渠形：</span>
    			<select name="fractureAppearanceCode"  onchange="shapeChange(this[selectedIndex].value);" style="color:black;width:100px;height:30px;margin-top: 10px" >
						<option value="O">请选择</option>
						<option value="T">梯形渠</option>
						<option value="J">矩形渠</option>
						<option value="U">U形渠</option>
						<option value="T-U">TU形渠</option>
				</select>
    			 
				 <table id="canal"  style="margin-left: 10px;margin-top: 10px;margin-bottom: 10px">
				 	 <tr id="T-canal" style="display: none" >
				 		<td style="border:solid 1px #FFFFFF;width:50px;text-align:center"><input type="radio" name="type"/></td>	
						<td style="border:solid 1px #FFFFFF;width:50px;text-align:center">梯<br/>形<br/>渠</td>
						<td style="border:solid 1px #FFFFFF;width:200px;text-align:center">
							<canvas id="canvas1" width="150" height="100" style="border:0px solid #c3c3c3;">
								Your browser does not support the canvas element.
								</canvas>
						</td>
						<td style="border:solid 1px #FFFFFF;width:200px;" align="center">
							①渠底宽度:<input type="text" id="siteCanalBottomLenth" name="siteCanalBottomLenth" value="" style="color:black;width:60px;height:30px;border-radius:5px;margin-top: 10px"/>&nbsp;m<br/>
						 	②渠底夹角:<input type="text" id="siteCanalWellpaperAngle" name="siteCanalWellpaperAngle" value="" style="color:black;width:60px;height:30px;border-radius:5px;margin-top: 10px"/>&nbsp;度<br/>
						 	  
						 	   渠道糙率n:<input type="text" id="rounghness" name="rounghness" value="" style="color:black;width:60px;height:30px;border-radius:5px;margin-top: 10px"/>&nbsp;n<br/>
						 	  水力斜坡s:<input type="text" id="hydraulicSlope" name="hydraulicSlope" value="" style="color:black;width:60px;height:30px;border-radius:5px;margin-top: 10px"/>&nbsp;s<br/>
						 	  修正系数k:<input type="text" id="ratio" name="ratio" value="" style="color:black;width:60px;height:30px;border-radius:5px;margin-top: 10px;"/>&nbsp;k<br/>
						</td>
					</tr>   
					 <tr id="J-canal"  style="display: none">
				 		<td style="border:solid 1px #FFFFFF;width:50px;text-align:center"><input type="radio" name="type"/></td>	
						<td style="border:solid 1px #FFFFFF;width:50px;text-align:center">矩<br/>形<br/>渠</td>
						<td style="border:solid 1px #FFFFFF;width:200px;text-align:center">
							<canvas id="canvas2" width="200" height="100" style="border:0px solid #c3c3c3;">
								Your browser does not support the canvas element.
								</canvas>
						</td>
						<td style="border:solid 1px #FFFFFF;width:200px;" align="center">
							①渠底宽度:<input type="text" id="siteCanalBottomLenth" name="siteCanalBottomLenth" value="" style="color:black;width:60px;height:30px;border-radius:5px;margin-top: 10px"/>&nbsp;m<br/>
							
						       渠道糙率n:<input type="text" id="rounghness" name="rounghness" value="" style="color:black;width:60px;height:30px;border-radius:5px;margin-top: 10px"/>&nbsp;n<br/>
						       水力斜坡s:<input type="text" id="hydraulicSlope" name="hydraulicSlope" value="" style="color:black;width:60px;height:30px;border-radius:5px;margin-top: 10px"/>&nbsp;s<br/>
						 	  修正系数k:<input type="text" id="ratio" name="ratio" value="" style="color:black;width:60px;height:30px;border-radius:5px;margin-top: 10px;"/>&nbsp;k<br/>
						 	
						</td>
					</tr> 
					
					<tr id="U-canal"  style="display: none">
				 		<td style="border:solid 1px #FFFFFF;width:50px;text-align:center"><input type="radio" name="type"/></td>	
						<td style="border:solid 1px #FFFFFF;width:50px;text-align:center">U<br/>形<br/>渠</td>
						<td style="border:solid 1px #FFFFFF;width:200px;text-align:center">
							<canvas id="canvas3" width="200" height="100%" style="border:0px solid #c3c3c3;">
								Your browser does not support the canvas element.
								</canvas>
						</td>
						<td style="border:solid 1px #FFFFFF;width:200px;" align="center">
							①渠底宽度:<input type="text" id="siteCanalBottomLenth" name="siteCanalBottomLenth" value="" style="color:black;width:60px;height:30px;border-radius:5px;margin-top: 10px"/>&nbsp;m<br/>
							②U底半径:<input type="text" id="siteCanalBottomUR" name="siteCanalBottomUR" value="" style="color:black;width:60px;height:30px;border-radius:5px;margin-top: 10px"/>&nbsp;m<br/>
							③U底高度:<input type="text" id="siteCanalBottomUHeight" name="siteCanalBottomUHeight" value="" style="color:black;width:60px;height:30px;border-radius:5px;margin-top: 10px"/>&nbsp;m<br/>
							
							 渠道糙率n:<input type="text" id="rounghness" name="rounghness" value="" style="color:black;width:60px;height:30px;border-radius:5px;margin-top: 10px"/>&nbsp;n<br/>
						 	  水力斜坡s:<input type="text" id="hydraulicSlope" name="hydraulicSlope" value="" style="color:black;width:60px;height:30px;border-radius:5px;margin-top: 10px"/>&nbsp;s<br/>
						 	  修正系数k:<input type="text" id="ratio" name="ratio" value="" style="color:black;width:60px;height:30px;border-radius:5px;margin-top: 10px;"/>&nbsp;k<br/>
						</td>
					</tr>
					
					<tr id="T-U-canal"  style="display: none">
				 		<td style="border:solid 1px #FFFFFF;width:50px;text-align:center"><input type="radio" name="type"/></td>	
						<td style="border:solid 1px #FFFFFF;width:50px;text-align:center">TU<br/>形<br/>渠</td>
						<td style="border:solid 1px #FFFFFF;width:200px;text-align:center">
							<canvas id="canvas4" width="200" height="100" style="border:0px solid #c3c3c3;">
								Your browser does not support the canvas element.
								</canvas>
						</td>
						<td style="border:solid 1px #FFFFFF;width:200px;padding-top: 5px;" align="center">
							①渠底宽度 :<input type="text" id="siteCanalBottomLenth" name="siteCanalBottomLenth" value="" style="color:black;width:60px;height:30px;border-radius:5px;margin-top: 10px"/>&nbsp;m<br/>
							②U底半径 :<input type="text" id="siteCanalBottomUR" name="siteCanalBottomUR" value="" style="color:black;width:60px;height:30px;border-radius:5px;margin-top: 10px"/>&nbsp;m<br/>
							③U底高度 :<input type="text" id="siteCanalBottomUHeight" name="siteCanalBottomUHeight" value="" style="color:black;width:60px;height:30px;border-radius:5px;margin-top: 10px"/>&nbsp;m<br/>
							④侧壁夹角 :<input type="text" id="siteCanalWellpaperAngle" name="siteCanalWellpaperAngle" value="" style="color:black;width:60px;height:30px;border-radius:5px;margin-top: 10px"/>&nbsp;度<br/>
							
							 渠道糙率n:<input type="text" id="rounghness" name="rounghness" value="" style="color:black;width:60px;height:30px;border-radius:5px;margin-top: 10px"/>&nbsp;n<br/>
						 	 水力斜坡s:<input type="text" id="hydraulicSlope" name="hydraulicSlope" value="" style="color:black;width:60px;height:30px;border-radius:5px;margin-top: 10px"/>&nbsp;s<br/>
						 	 修正系数k:<input type="text" id="ratio" name="ratio" value="" style="color:black;width:60px;height:30px;border-radius:5px;margin-top: 10px;"/>&nbsp;k<br/>
						 	
						</td>
					</tr>  
				 </table>
    		</div><br/>
			<span id="relation_title"  style="display: none;color: white;font-size:20px;margin-top: -50px">测流参数(关系法):</span><br/>
    		<div id="relation_content" style="display: none;border:1px solid white;width:100%;border-radius:10px;padding: 10px;">
    			 
    		 	<table class="table table-bordered table-header">
					<tbody id="table_list">
						<tr>
							<td class="w5">上限（m）</td>
							<td class="w5">下限（m）</td>
							<td class="w5">流量（m3/s）</td>
							<td class="w5">操作</td>
						</tr>
						<tr>
							<td id="upTd0" class="w5"><input   type="text" id="up0" name="canalFlowHightList[0].upperLimit" value="" style="color:black;width:40px;height:30px"></td>
							<td id="downTd0" class="w5"><input type="text" id="down0"  name="canalFlowHightList[0].downerLimit" value="" style="color:black;width:40px;height:30px"></td>
							<td id="flowTd0" class="w5"><input type="text" id="flow0"  name="canalFlowHightList[0].flow" value="" style="color:black;width:40px;height:30px"></td>
							<td class="w5"><a href="javascript:add()" style="color:white;background-color: #4BB2FF">添加</a></td>
						</tr>
					</tbody>
				</table>
    		</div>	
    				<input hidden="hidden"  type="text" name="id" value="${siteWaterInfo.id}" style="color:black;"/>
    				
	        		</form>
       		 </div>
	
	<script type="text/javascript" src="${ctxstc}/js/footer.js"></script>
	<script type="text/javascript" src="${ctxstc}/js/custom/water_area_cook.js"></script>
	<script type="text/javascript" src="${ctxstc}/js/custom/site_water/site_water_canvas.js"></script>
	<script type="text/javascript" src="${ctxstc}/datepicker/WdatePicker.js "></script>
	<script src="${ctxstc}/adapters/layui/layui.js" charset="utf-8"></script>
	
	
	<script>
	var url ;
	   for(var i=0;i<4;i++){
		  url=window.location.href.indexOf("/",url+1);
	   }
	   var localPath = window.location.href.substring(0,url);
	window.onload = function(){
		var swiDevicemodelCode = "${siteWaterInfo.swiDevicemodelCode}";
		//alert(swiDevicemodelCode);
		document.getElementById(swiDevicemodelCode).selected=true;
	}
	function updateFlow(){
		var waterId = "${siteWaterInfo.id}";
		layer.open({
			id:'updateFlow',
			title: "修改【${siteWaterInfo.deviceWaterName}】水位流量关系表",
			  content:[localPath+"/site_water_manage/edit_flow_page?waterId="+waterId],
			  type:2, // 基本层类型
		      area: ["85%","85%"], // 弹窗大小(宽高)
		      maxmin: true,
		      btn: ['确定', '取消'], // 页面按钮
		      closeBtn: 1, // 显示关闭按钮(右上角)
		      shade: 0.5,	// 遮罩阴影程度
		      resize: false, // 禁止拉伸
		      yes: function(){
		        	//子页面提交
		        	editWaterSite();
			  },
			  zIndex: layer.zIndex, //重点1
		      success: function(layero){
		    	  debugger
		      }
			}); 
	}
	//水位站编辑提交
	function editWaterSite(){
		debugger
	   var frameId=document.getElementById("updateFlow").getElementsByTagName("iframe")[0].id;
	   $('#'+frameId)[0].contentWindow.waterFlow.submitForm();;
	   //window.location.replace("${ctx}/site_water_manage/list?state="+21);
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
	//----------测流方式---------------》start--------李玥-2018-5-31--------
	//给父页面传值所用信息
	var index = parent.layer.getFrameIndex(window.name);
	function mySubmit2(){
		var deviceWaterCode = document.getElementById("deviceWaterCode").value;
		var deviceWaterName = document.getElementById("deviceWaterName").value;
		var swiDeviceNo = document.getElementById("swiDeviceNo").value;
		var swiSimcard = document.getElementById("swiSimcard").value;
		var swiBuildTime = document.getElementById("swiBuildTime").value;
		var swiSimoperator = document.getElementById("swiSimoperator").value;
		var swiLongitude = document.getElementById("swiLongitude").value;
		var swiLatitude = document.getElementById("swiLatitude").value;
		var swiHight = document.getElementById("swiHight").value;
		
		var swiDevicemodelCode = document.getElementById("swiDevicemodelCode");
		var index2 = swiDevicemodelCode.selectedIndex; 
		//判空
		//if(index2==0||deviceWaterCode==""||deviceWaterName==""||swiDeviceNo==""||swiSimcard==""||swiBuildTime==""||swiSimoperator==""||swiLongitude==""||swiLatitude==""||swiHight==""){
		//	alert("红星为必填");
		//}else{
			var con=confirm("是否继续");//在页面上弹出对话框
			if(con==true){
				var T = document.getElementById("T-canal");
				var J = document.getElementById("J-canal");
				var U= document.getElementById("U-canal");
				var TU = document.getElementById("T-U-canal");
				if(T.style.display=="inline"){
					$("#J-canal").empty();
					$("#U-canal").empty();
					$("#T-U-canal").empty();
					var siteCanalBottomLenth = document.getElementById("siteCanalBottomLenth").value;
					var siteCanalWellpaperAngle = document.getElementById("siteCanalWellpaperAngle").value;
					//var siteCanalBottomHeight = document.getElementById("siteCanalBottomHeight").value;
					var rounghness = document.getElementById("rounghness").value;
					var hydraulicSlope = document.getElementById("hydraulicSlope").value;
					var ratio = document.getElementById("ratio").value;
					if(siteCanalBottomLenth==""||siteCanalWellpaperAngle==""||rounghness==""||hydraulicSlope==""||ratio==""){
						alert("渠道横截面参数不完整");
						return;
					}
			    }else if(J.style.display=="inline"){
			    	$("#T-canal").empty();
					$("#U-canal").empty();
					$("#T-U-canal").empty();
			    	
				    var siteCanalBottomLenth = document.getElementById("siteCanalBottomLenth").value;
					//var siteCanalBottomHeight = document.getElementById("siteCanalBottomHeight").value;
					var rounghness = document.getElementById("rounghness").value;
					var hydraulicSlope = document.getElementById("hydraulicSlope").value;
					var ratio = document.getElementById("ratio").value;
					if(siteCanalBottomLenth==""||rounghness==""||hydraulicSlope==""||ratio==""){
						alert("渠道横截面参数不完整");
						return;
					}
				}else if(U.style.display=="inline"){
					$("#J-canal").empty();
					$("#T-canal").empty();
					$("#T-U-canal").empty();
					var siteCanalBottomLenth = document.getElementById("siteCanalBottomLenth").value;
					var siteCanalBottomUR = document.getElementById("siteCanalBottomUR").value;
					var siteCanalBottomUHeight= document.getElementById("siteCanalBottomUHeight").value;
					//var siteCanalBottomHeight = document.getElementById("siteCanalBottomHeight").value;
					var rounghness = document.getElementById("rounghness").value;
					var hydraulicSlope = document.getElementById("hydraulicSlope").value;
					var ratio = document.getElementById("ratio").value;
					if(siteCanalBottomLenth==""||siteCanalBottomUR==""||siteCanalBottomUHeight==""||rounghness==""||hydraulicSlope==""||ratio==""){
						alert("渠道横截面参数不完整");
						return;
					}
				}else if(TU.style.display=="inline"){
					$("#J-canal").empty();
					$("#U-canal").empty();
					$("#T-canal").empty();
					var siteCanalBottomLenth = document.getElementById("siteCanalBottomLenth").value;
					var siteCanalBottomUR = document.getElementById("siteCanalBottomUR").value;
					var siteCanalBottomUHeight= document.getElementById("siteCanalBottomUHeight").value;
					var siteCanalWellpaperAngle = document.getElementById("siteCanalWellpaperAngle").value;
					//var siteCanalBottomHeight = document.getElementById("siteCanalBottomHeight").value;
					var rounghness = document.getElementById("rounghness").value;
					var hydraulicSlope = document.getElementById("hydraulicSlope").value;
					var ratio = document.getElementById("ratio").value;
					if(siteCanalBottomLenth==""||siteCanalWellpaperAngle==""||siteCanalBottomUR==""||siteCanalBottomUHeight==""||rounghness==""||hydraulicSlope==""||ratio==""){
						alert("渠道横截面参数不完整");
						return;
					}
				}else{
					
					$("#J-canal").empty();
					$("#U-canal").empty();
					$("#T-canal").empty();
					$("#TU-canal").empty();
				} 
				//判断水位流量
				if(addIndex==0){
					parent.layer.close(index);
					//parent.layer.msg('您将标记 成功传送给了父窗口');
					//alert(111);
			        $('#form').submit();
				}else{
					var upValue = document.getElementById("up"+addIndex).value;
					var downValue = document.getElementById("down"+addIndex).value;
					var flowValue = document.getElementById("flow"+addIndex).value;
					if(upValue==""||downValue==""||flowValue==""){
						alert("请完善水位流量数据");
						return;
					}else{
						parent.layer.close(index);
						//parent.layer.msg('您将标记 成功传送给了父窗口');
						alert(222);
				        $('#form').submit();
					}
				} 
				
			}else{
			}
		//}
    }
		
	function shapeChange(value){
		switch (value) {
		case "O":
			var T = document.getElementById("T-canal");
			var J = document.getElementById("J-canal");
			var U= document.getElementById("U-canal");
			var TU = document.getElementById("T-U-canal");
			T.style.display="none";
			J.style.display="none";
			U.style.display="none";
			TU.style.display="none";
			break;
		case "T":
			var T = document.getElementById("T-canal");
			var J = document.getElementById("J-canal");
			var U= document.getElementById("U-canal");
			var TU = document.getElementById("T-U-canal");
			
			T.style.display="inline";
			J.style.display="none";
			U.style.display="none";
			TU.style.display="none";
			break;
		case "J":
			var T = document.getElementById("T-canal");
			var J = document.getElementById("J-canal");
			var U= document.getElementById("U-canal");
			var TU = document.getElementById("T-U-canal");
			T.style.display="none";
			J.style.display="inline";
			U.style.display="none";
			TU.style.display="none";
			break;
		case "U":
			var T = document.getElementById("T-canal");
			var J = document.getElementById("J-canal");
			var U= document.getElementById("U-canal");
			var TU = document.getElementById("T-U-canal");
			T.style.display="none";
			J.style.display="none";
			U.style.display="inline";
			TU.style.display="none";
			break;
		case "T-U":
			var T = document.getElementById("T-canal");
			var J = document.getElementById("J-canal");
			var U= document.getElementById("U-canal");
			var TU = document.getElementById("T-U-canal");
			T.style.display="none";
			J.style.display="none";
			U.style.display="none";
			TU.style.display="inline";
			break;
		default:
			break;
		}
		
	}
	
	var addIndex=0;
	function add(){
		var upValue = document.getElementById("up"+addIndex).value;
		var downValue = document.getElementById("down"+addIndex).value;
		var flowValue = document.getElementById("flow"+addIndex).value;
		if(upValue==""||downValue==""||flowValue==""){
			alert("请填写完整");
		}else{
			var up = document.getElementById("up"+addIndex);
			var down = document.getElementById("down"+addIndex);
			var flow = document.getElementById("flow"+addIndex);
			//将input隐藏
			up.style.display="none";
			down.style.display="none";
			flow.style.display="none";
			
			var upTd = document.getElementById("upTd"+addIndex);
			var downTd = document.getElementById("downTd"+addIndex);
			var flowTd = document.getElementById("flowTd"+addIndex);
			//显示数字
		    var upSpanTag = document.createElement("span");
		        upSpanTag.innerHTML=upValue;
		        upTd.appendChild(upSpanTag);
		    var downSpanTag = document.createElement("span");
		        downSpanTag.innerHTML=downValue;
		        downTd.appendChild(downSpanTag);
		    var flowSpanTag = document.createElement("span");
		        flowSpanTag.innerHTML=flowValue;
		        flowTd.appendChild(flowSpanTag);
			
			addIndex++;
			//alert(addIndex);
			var tBodyTag = document.getElementById("table_list");
			   var newTrTag = document.createElement("tr");
			       var newTdTag1 = document.createElement("td");
			           newTdTag1.setAttribute("id", "upTd"+addIndex);
			           
			       	   var newInputTag1 = document.createElement("input");
			       		   newInputTag1.setAttribute("type", "text");
			       		   newInputTag1.setAttribute("id", "up"+addIndex);
			       		   newInputTag1.setAttribute("name", "canalFlowHightList["+addIndex+"].upperLimit");
			       		   newInputTag1.setAttribute("style", "color:black;width:40px;height:30px");
			       	newTdTag1.appendChild(newInputTag1);
			       	   var newSpanTag1 = document.createElement("span");
			       	       newSpanTag1.setAttribute("style", "color:white");
			       	       //newSpanTag1.innerHTML="&nbsp;米";
			       	newTdTag1.appendChild(newSpanTag1);
			       	
			       	var newTdTag2 = document.createElement("td");
			       	    newTdTag2.setAttribute("id", "downTd"+addIndex);
				       	var newInputTag2 = document.createElement("input");
			       		   newInputTag2.setAttribute("type", "text");
			       		   newInputTag2.setAttribute("id", "down"+addIndex);
			       		   newInputTag2.setAttribute("name", "canalFlowHightList["+addIndex+"].downerLimit");
			       		   newInputTag2.setAttribute("style", "color:black;width:40px;height:30px");
			       		newTdTag2.appendChild(newInputTag2);
					       var newSpanTag2 = document.createElement("span");
					       	   newSpanTag2.setAttribute("style", "color:white");
					       	   //newSpanTag2.innerHTML="&nbsp;米";
					   newTdTag2.appendChild(newSpanTag2);
				       var newTdTag3 = document.createElement("td");
				           newTdTag3.setAttribute("id", "flowTd"+addIndex);
				      		 var newInputTag3 = document.createElement("input");
		  		   				 newInputTag3.setAttribute("type", "text");
		  		   			     newInputTag3.setAttribute("id", "flow"+addIndex);
		  		   			     newInputTag3.setAttribute("name", "canalFlowHightList["+addIndex+"].flow");
		  		   				 newInputTag3.setAttribute("style", "color:black;width:40px;height:30px");
			          newTdTag3.appendChild(newInputTag3);
			           		var newSpanTag3 = document.createElement("span");
			       	   			newSpanTag3.setAttribute("style", "color:white");
			       	  		    //newSpanTag3.innerHTML="&nbsp;m3/s";
			          newTdTag3.appendChild(newSpanTag3);
				       var newTdTag4 = document.createElement("td");
				      		 var newATag4 = document.createElement("a");
				       			 newATag4.setAttribute("href", "javascript:add()");
				                 newATag4.setAttribute("style", "color:white;background-color: #4BB2FF");
				                 newATag4.innerHTML="添加";
		    		newTdTag4.appendChild(newATag4);
			           
			           newTrTag.appendChild(newTdTag1);
			           newTrTag.appendChild(newTdTag2);
			           newTrTag.appendChild(newTdTag3);
			           newTrTag.appendChild(newTdTag4);
			           tBodyTag.appendChild(newTrTag);
			
		}
		
	}
	
	function functionChange(value){
		switch (value) {
		case "O":
			//公式法复位
			var T = document.getElementById("T-canal");
			var J = document.getElementById("J-canal");
			var U= document.getElementById("U-canal");
			var TU = document.getElementById("T-U-canal");
			T.style.display="none";
			J.style.display="none";
			U.style.display="none";
			TU.style.display="none";
			
			var formula_title = document.getElementById("formula_title");
			var formula_content = document.getElementById("formula_content");
			var relation_title = document.getElementById("relation_title");
			var relation_content = document.getElementById("relation_content");
			formula_title.style.display="none";
			formula_content.style.display="none";
			relation_title.style.display="none";
			relation_content.style.display="none";
			
			break;
		case "F":
			var formula_title = document.getElementById("formula_title");
			var formula_content = document.getElementById("formula_content");
			var relation_title = document.getElementById("relation_title");
			var relation_content = document.getElementById("relation_content");
			formula_title.style.display="block";
			formula_content.style.display="block";
			relation_title.style.display="none";
			relation_content.style.display="none";
			break;
		case "R":
			
			//公式法复位
			var T = document.getElementById("T-canal");
			var J = document.getElementById("J-canal");
			var U= document.getElementById("U-canal");
			var TU = document.getElementById("T-U-canal");
			T.style.display="none";
			J.style.display="none";
			U.style.display="none";
			TU.style.display="none";
			
			var formula_title = document.getElementById("formula_title");
			var formula_content = document.getElementById("formula_content");
			var relation_title = document.getElementById("relation_title");
			var relation_content = document.getElementById("relation_content");
			formula_title.style.display="none";
			formula_content.style.display="none";
			relation_title.style.display="block";
			relation_content.style.display="block";
	
			break;
		default:
			break;
		}
		
		//document.getElementById("formula_title");
		//document.getElementById("formula_content");
		
		
		//document.getElementById("relation_title");
		//document.getElementById("relation_content");
		
	}
	//----------测流方式---------------《end--------李玥-2018-5-31--------

	</script>
</body>
</html>



