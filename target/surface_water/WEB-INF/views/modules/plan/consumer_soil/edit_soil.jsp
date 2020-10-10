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
  					
    				<form  id="form" action="${ctx}/consumer_soil/edit" method="post" enctype="multipart/form-data">
    				<input type="text"  hidden="hidden"   name="id" value="${consumerSoil.id}"/></td>
    				<input hidden="hidden"  type="text" id="areaSpan" style="color:black;"/> 
    				<table class="border="0" style="border-collapse:separate; border-spacing:20px 18px;">
						<tr>
							<td align="right"><span style="color: red" class="w7">*</span>所属行政区：</td>
							<td id="area" class="w54"  colspan="3">
								<select id="select10" style="color:black;width:100px;height:30px;" onchange="areaChange(this[selectedIndex].value);">
									<option value="area,0,0">--请选择--</option>
									<c:forEach items="${sysAreaList}" var="sysArea">
									 	 <option value="${sysArea.id},${sysArea.areaLevel},${sysArea.areaName}">${sysArea.areaName}</option>
									</c:forEach>
								</select>
								<span id="span10">--</span>
								<input id="areaSure" class="layui-btn layui-btn-normal layui-btn-sm" value="确定" type="button" onclick="getAreaIdAndLevel()" />
							</td>
						</tr>
						<%-- <tr>
							<td align="center" class="w54"  colspan="3">
								<span id="areaSpan">${sysAreaNames}<span>
							</td>
							
						</tr>  --%>
						<tr>	
							<td align="right"><span style="color: red">*</span>所属用户：</td><td class="w18">
							<select class="form-control" id="consumerId" name="consumerId" value="" style="color:black;width:180px;">
								<option value="">--请选择--</option>
								<c:forEach items="${distWaterPlanConsumerList}" var="distWaterPlanConsumer">
									 	 <option id="${distWaterPlanConsumer.id}" value="${distWaterPlanConsumer.id}">${distWaterPlanConsumer.name}</option>
								</c:forEach>
							</select>
							</td>
							<td align="right"><span style="color: red">*</span>土地名称：</td><td class="w18"><input type="text" class="form-control" id="soilName" name="soilName" value="${consumerSoil.soilName}" style="color:black;width:180px;"/></td>
						</tr>
						
						<tr>
							<td align="right"><span style="color: red">*</span>所属渠道：</td><td class="w18"><input type="text" class="form-control" readonly="readonly" placeholder="${canalName}" value="" style="color:black;width:180px;"/></td>
							<td align="right"><span style="color: red">*</span>土质：</td>
							<td class="w18">
								<select id="soilTypeCode" id="soilTypeCode"  name="soilTypeCode" style="color:black;width:180px;height:35px;" class="form-control" onchange="waterAreaChange(this[selectedIndex].value);">
									<option value="">--请选择--</option>
									<c:forEach items="${soilTypeInfoList}" var="soilTypeInfo">
									  <option id="${soilTypeInfo.soilCode}" value="${soilTypeInfo.soilCode}">${soilTypeInfo.soilName}</option>
									</c:forEach>
								</select>
							</td>
						</tr>
						<tr>	
							<td align="right"><span style="color: red">*</span>经度：</td><td class="w18"><input type="text" class="form-control" id="x" name="x" value="${consumerSoil.x}" style="color:black;width:180px;"/></td>
							<td align="right"><span style="color: red">*</span>纬度：</td><td class="w18"><input type="text" class="form-control" id="y" name="y" value="${consumerSoil.y}" style="color:black;width:180px;"/></td>
						</tr>
						
						<tr>	
							<td align="right"><span style="color: red">*</span>海拔：</td><td class="w18"><input type="text"class="form-control" id="z" name="z" value="${consumerSoil.z}" style="color:black;width:180px;"/></td>
							<td align="right"><span style="color: red">*</span>面积：</td><td class="w18"><input type="text" class="form-control" id="soilArea" name="soilArea" value="${consumerSoil.soilArea}" style="color:black;width:180px;"/></td>
						</tr>
						
						<tr>
							<td align="right">承包开始时间：</td><td class="w18"><input type="text" class="form-control"  name="contractStartYear" value="<fmt:formatDate value='${consumerSoil.contractStartYear}' type='date' pattern='yyyy-MM-dd'/>"    style="color:black;width:180px;" onfocus="WdatePicker({'skin':'whyGreen','dateFmt':'yyyy-MM-dd'});" /></td>
							<td align="right">承包结束时间：</td><td class="w18"><input type="text" class="form-control"  name="contractEndYear"   value="<fmt:formatDate value='${consumerSoil.contractEndYear}' type='date' pattern='yyyy-MM-dd'/>" style="color:black;width:180px;"  onfocus="WdatePicker({'skin':'whyGreen','dateFmt':'yyyy-MM-dd'});" /></td>
						</tr>
						
						<tr>
							<td align="right">地址：</td>
							<td class="w18"  colspan="3">
								<textarea  name="address" cols="60" rows="1" class="form-control" style="color:black;">${consumerSoil.address}</textarea> 
							</td>
						</tr>
						
						<tr>
							<td align="right">备注：</td>
							<td class="w18"  colspan="3">
								<textarea  name="remake" cols="60" rows="1" class="form-control" style="color:black;">${consumerSoil.remake}</textarea> 
							</td>
						</tr>
						
						
    				</table>
    					<input type="text" hidden="hidden" name="canalCode" value="${canalCode}">
	        		</form>
       		 </div>
	
	<script type="text/javascript" src="${ctxstc}/js/footer.js"></script>
	<script type="text/javascript" src="${ctxstc}/js/custom/water_area_cook.js"></script>
	<script type="text/javascript" src="${ctxstc}/datepicker/WdatePicker.js "></script>
	<script src="${ctxstc}/adapters/layui/layui.js" charset="utf-8"></script>
	
	
	<script>
window.onload = function(){//consumerId
		
		//土质
		var soilTypeCode = "${consumerSoil.soilTypeCode}";
		document.getElementById(soilTypeCode).selected=true;
		
		var consumerId = "${consumerSoil.consumerId}";
		document.getElementById(consumerId).selected=true;
		$("#consumerId").attr("disabled","disabled"); 
	}
	var curWwwPath = window.document.location.href;
	var pathName = window.document.location.pathname;
	var pos = curWwwPath.indexOf(pathName);
	var localhostPaht = curWwwPath.substring(0,pos);
	var projectName = pathName.substring(0,pathName.substr(1).indexOf('/')+1);
	var ctxPath = localhostPaht + projectName;
	var picPath = localhostPaht;
	 
	function areaChange(a){
		delCookie("areaId");
		////alert(a);
		var paramArray = a.split(",");  
	    	var id = paramArray[0];  
	    	var level =parseInt(paramArray[1]);
	    	var name =paramArray[2];
	    	////alert(name+"rww");
	    	//选择已经显示的区域名称
	    	var content = "";
	    	if(name!=0){
	    		////alert(name+"rww22");
	    		for(var i=0;i<=level;i++){
	    			////alert(name+i);
	    			var selectTag=document.getElementById("select1"+i);
	    			
	    			var optionValue = selectTag.options[selectTag.selectedIndex].value;
		    			var optionParamArray = optionValue.split(",");  
		    			
		    			var optionLevel = optionParamArray[1]; 
		    	    	var optionName = optionParamArray[2]; 
		    	    	content=content+("【"+optionLevel+":"+optionName+"】-");
	    		}
	    		
	    		
	    		var areaSpan = document.getElementById("areaSpan");
	    		areaSpan.innerHTML=content;
	    	}else{
	    		if(level==0){
	    			content="无";
	    		}
	    		for(var i=0;i<level;i++){
	    			////alert(name+i);
	    			var selectTag=document.getElementById("select1"+i);
	    			
	    			var optionValue = selectTag.options[selectTag.selectedIndex].value;
		    			var optionParamArray = optionValue.split(",");  
		    			
		    			var optionLevel = optionParamArray[1]; 
		    	    	var optionName = optionParamArray[2]; 
		    	    	content=content+("【"+optionLevel+":"+optionName+"】-");
	    		}
	    		
	    		
	    		var areaSpan = document.getElementById("areaSpan");
	    		areaSpan.innerHTML=content;
	    	}
	    	
	    	
	    	if(id!="area"){
	    		setCookie("areaId",id);
	    	}else if(id=="area"){
	    		
	    		if(level<=0){
	    			setCookie("areaId","");
	    		}else{
	    			var selectTag = document.getElementById("select1"+(level-1));
	    			
	    			var optionValue = selectTag.options[selectTag.selectedIndex].value;
		    			var optionParamArray = optionValue.split(",");  
		    	    	var optionId = optionParamArray[0]; 
		    	    	setCookie("areaId",optionId);
	    		}
	    	}
	    	////alert(level);
	    	var parentNode = document.getElementById("area");
	    		parentNode.removeChild(document.getElementById("areaSure"));
	    	//如果水管区父级重选删除子水管区
	    	var number1=level+1;
	    	while(document.getElementById("select1"+number1)){
	    		////alert(number);
	    		parentNode.removeChild(document.getElementById("select1"+number1));
	    		number1++;
	    	}
	    	
	    	var number2=level+1;
	    	while(document.getElementById("span1"+number2)){
	    		parentNode.removeChild(document.getElementById("span1"+number2));
	    		number2++;
	    	}
	    
		$.ajax({
			url:ctxPath+"/cal_canal_info/find_son_Area",
			data: {id:id},
			type: "post",
			async: false,//非异步
			success: function(msg){
				//alert(JSON.stringify(msg));
				var currentTag = document.getElementById("area");
				if(msg.length>0){
				    var newSelectTag = document.createElement("select");
				    	newSelectTag.setAttribute("id", "select1"+(level+1));
				    	newSelectTag.setAttribute("style", "color:black;width:100px;height:30px;");
				    	newSelectTag.setAttribute("onchange","areaChange(this[selectedIndex].value);");
				    	
				    	for(var i=0;i<msg.length;i++){
				    		
				    		if(i==0){
				    			var newOptionTag = document.createElement("option");
					    			newOptionTag.setAttribute("value","area,"+msg[i].areaLevel+","+"0");
					    			newOptionTag.innerHTML="请选择";
					    			newSelectTag.appendChild(newOptionTag);
				    			var newOptionTag = document.createElement("option");
					    			newOptionTag.setAttribute("value",msg[i].id+","+msg[i].areaLevel+","+msg[i].areaName);
					    			newOptionTag.innerHTML=msg[i].areaName;
					    			newSelectTag.appendChild(newOptionTag);
				    		}else{
				    			var newOptionTag = document.createElement("option");
					    			newOptionTag.setAttribute("value",msg[i].id+","+msg[i].areaLevel+","+msg[i].areaName);
					    			newOptionTag.innerHTML=msg[i].areaName;
					    			newSelectTag.appendChild(newOptionTag);
				    		}
				    	}
				    var newSpanTag = document.createElement("span");
				    	newSpanTag.setAttribute("id","span1"+(level+1));
						newSpanTag.innerHTML="--";
				    var newInputTag = document.createElement("input");
				    	newInputTag.setAttribute("id","areaSure");
				    	newInputTag.setAttribute("class","layui-btn layui-btn-normal layui-btn-sm");
				    	newInputTag.setAttribute("type","button");
				    	newInputTag.setAttribute("value","确定");
				    	newInputTag.setAttribute("onclick","getAreaIdAndLevel()");
				    	currentTag.appendChild(newSelectTag);
				    	currentTag.appendChild(newSpanTag);
				    	currentTag.appendChild(newInputTag);
				}else{
				
					var newInputTag = document.createElement("input");
						newInputTag.setAttribute("class","layui-btn layui-btn-normal layui-btn-sm");
				    	newInputTag.setAttribute("id","areaSure");
				    	newInputTag.setAttribute("type","button");
				    	newInputTag.setAttribute("value","确定");
				    	newInputTag.setAttribute("onclick","getAreaIdAndLevel()");
			    	currentTag.appendChild(newInputTag);
				}
			}
		});
	}
	
	function getAreaIdAndLevel(){
		//选中行政区的id
		var id = getCookie("areaId");
	//	alert(id);
		if(id==""){
			var consumerIdInput =  document.getElementById("consumerId");
			consumerIdInput.value="";
			return;
		}
		$("#consumerId").empty();
		$("#consumerId").removeAttr("disabled");
		$.ajax({
			url:ctxPath+"/water_user/ajax_findUser",
			data: {id:id},
			type: "post",
			async: false,//非异步
			success: function(msg){
				//alert(JSON.stringify(msg));
				var consumerIdInput = document.getElementById("consumerId");
				if(msg!==null && msg.length>0){
					for(var i=-1;i<msg.length;i++){
						if(i==-1){
							consumerIdInput.add(new Option("--请选择--","")); //这个兼容IE与firefox
						}else{
							consumerIdInput.add(new Option(msg[i].name,msg[i].id)); //这个兼容IE与firefox
						}
						 
					}
				}
			 	
			}
		});
	}
	
	
	//给父页面传值所用信息
	var index = parent.layer.getFrameIndex(window.name);
	
	function mySubmit(){
		$("#consumerId").removeAttr("disabled");
		var canalCode = "${consumerSoil.canalCode}";
		//alert(canalCode);
		
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
		else{
			//关闭子页面
			parent.layer.close(index);
	        $('#form').submit();
		}
		
    }
	
	</script>
</body>
</html>



