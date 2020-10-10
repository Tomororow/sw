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
  					
    				<form  id="form" action="${ctx}/need_water/add" method="post" enctype="multipart/form-data">
    				
    				<table class="table table-bordered table-header">
						
						<tr>	
							<td class="w7">提报渠道</td><td class="w18"><input type="text" value="${canalName}" style="color:black;width:180px;"/></td>
							<td class="w7">渠道编码</td><td class="w18"><input type="text"  name="canalCode" value="${canalCode}" style="color:black;width:180px;"/></td>
							
						</tr>
						
						<tr>
							<td class="w7">土质</td>
							<td class="w18">
								<select  name="soilType" style="color:black;width:180px;height:30px;" onchange="waterAreaChange(this[selectedIndex].value);">
									<option>请选择</option>
									<c:forEach items="${soilTypeInfoList}" var="soilTypeInfo">
									  <option value="${soilTypeInfo.soilCode}">${soilTypeInfo.soilName}</option>
									</c:forEach>
								</select>
							</td>
							
							<td class="w7">农作物</td>
							<td class="w18">
								<select  name="cropsType" style="color:black;width:180px;height:30px;" onchange="waterAreaChange(this[selectedIndex].value);">
									<option>请选择</option>
									<c:forEach items="${cropsTypeInfoList}" var="cropsTypeInfo">
									  <option value="${cropsTypeInfo.cropsCode}">${cropsTypeInfo.cropsName}</option>
									</c:forEach>
								</select>
							</td>
							
						</tr>
						
						<tr>	
							<td class="w7">面积</td><td class="w18"><input type="text" name="area" value="" style="color:black;width:180px;"/></td>
							<td class="w7">年份</td><td class="w18"><input type="text"  name="year" value="" style="color:black;width:180px;"/></td>
						</tr>
						
						<tr>	
							<td class="w7">提报人</td><td class="w18"><input type="text" name="reportPeopleName" value="" style="color:black;width:180px;"/></td>
							<td class="w7">电话</td><td class="w18"><input type="text"  name="phoneNumber" value="" style="color:black;width:180px;"/></td>
						</tr>
						<tr>
							<td class="w7">备注</td>
							<td class="w18"  colspan="3">
								<textarea  name="remark" cols="100" rows="3" style="color:black;"></textarea> 
							</td>
						</tr>
						
    				</table>
    				
	        		</form>
       		 </div>
	
	<script type="text/javascript" src="${ctxstc}/js/footer.js"></script>
	<script type="text/javascript" src="${ctxstc}/js/custom/water_area_cook.js"></script>
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
		/*
		//获取渠道材料
		var canalmaterialCodeSelect = document.getElementById("canalmaterialCodeSelect");
		var canalmaterialCodeSelectValue = canalmaterialCodeSelect.options[canalmaterialCodeSelect.selectedIndex].value;
		var canalmaterialCodeInput =  document.getElementById("canalmaterialCode");
		canalmaterialCodeInput.value=canalmaterialCodeSelectValue;
		//获取渠道类型
		var canalTypeCodeSelect = document.getElementById("canalTypeCodeSelect");
		var canalTypeCodeSelectValue = canalTypeCodeSelect.options[canalTypeCodeSelect.selectedIndex].value;
		alert(canalTypeCodeSelectValue);
		var canalTypeCodeInput =  document.getElementById("canalTypeCode");
		canalTypeCodeInput.value=canalTypeCodeSelectValue;
		//获取渠道用途
		var canalUsetypeCodeSelect = document.getElementById("canalUsetypeCodeSelect");
		var canalUsetypeCodeSelectValue = canalUsetypeCodeSelect.options[canalUsetypeCodeSelect.selectedIndex].value;
		var canalUsetypeCodeInput =  document.getElementById("canalUsetypeCode");
		canalUsetypeCodeInput.value=canalUsetypeCodeSelectValue;
		*/
		//关闭子页面
		parent.layer.close(index);
		//parent.layer.msg('您将标记 成功传送给了父窗口');
        $('#form').submit();
    }
	function waterAreaChange(a){
		
		delCookie("id");
		//alert(a);
		var paramArray = a.split(",");  
	    	var id = paramArray[0];  
	    	var level =parseInt(paramArray[1]);
	    	var name =paramArray[2];
	    	//alert(name+"rww");
	    	//选择已经显示的区域名称
	    	var content = "";
	    	if(name!=0){
	    		//alert(name+"rww22");
	    		for(var i=0;i<=level;i++){
	    			//alert(name+i);
	    			var selectTag=document.getElementById("select2"+i);
	    			
	    			var optionValue = selectTag.options[selectTag.selectedIndex].value;
		    			var optionParamArray = optionValue.split(",");  
		    			
		    			var optionLevel = optionParamArray[1]; 
		    	    	var optionName = optionParamArray[2]; 
		    	    	content=content+("{=="+optionLevel+":"+optionName+"==}-->");
	    		}
	    		
	    		
	    		var waterAreaSpan = document.getElementById("waterAreaSpan");
	    		waterAreaSpan.innerHTML=content;
	    	}else{
	    		if(level==0){
	    			content="无";
	    		}
	    		for(var i=0;i<level;i++){
	    			//alert(name+i);
	    			var selectTag=document.getElementById("select2"+i);
	    			
	    			var optionValue = selectTag.options[selectTag.selectedIndex].value;
		    			var optionParamArray = optionValue.split(",");  
		    			
		    			var optionLevel = optionParamArray[1]; 
		    	    	var optionName = optionParamArray[2]; 
		    	    	content=content+("{=="+optionLevel+":"+optionName+"==}-->");
	    		}
	    		
	    		
	    		var waterAreaSpan = document.getElementById("waterAreaSpan");
	    		waterAreaSpan.innerHTML=content;
	    	}
	    	
	    	
	    	if(id!="waterArea"){
	    		setCookie("id",id);
	    	}else if(id=="waterArea"){
	    		
	    		if(level<=0){
	    			setCookie("id","");
	    		}else{
	    			var selectTag = document.getElementById("select2"+(level-1));
	    			
	    			var optionValue = selectTag.options[selectTag.selectedIndex].value;
		    			var optionParamArray = optionValue.split(",");  
		    	    	var optionId = optionParamArray[0]; 
		    	    	setCookie("id",optionId);
	    		}
	    	}
	    	//alert(level);
	    	var parentNode = document.getElementById("waterArea");
	    		parentNode.removeChild(document.getElementById("waterAreaSure"));
	    	//如果水管区父级重选删除子水管区
	    	var number1=level+1;
	    	while(document.getElementById("select2"+number1)){
	    		//alert(number);
	    		parentNode.removeChild(document.getElementById("select2"+number1));
	    		number1++;
	    	}
	    	
	    	var number2=level+1;
	    	while(document.getElementById("span2"+number2)){
	    		parentNode.removeChild(document.getElementById("span2"+number2));
	    		number2++;
	    	}
		$.ajax({
			url:"${ctx}/cal_canal_info/find_son_water_Area",
			data: {id:id},
			type: "post",
			async: false,//非异步
			success: function(msg){
				//alert(JSON.stringify(msg));
				var currentTag = document.getElementById("waterArea");
				if(msg.length>0){
				    var newSelectTag = document.createElement("select");
				    	newSelectTag.setAttribute("id", "select2"+(level+1));
				    	newSelectTag.setAttribute("style", "color:black;width:100px;height:30px;");
				    	newSelectTag.setAttribute("onchange","waterAreaChange(this[selectedIndex].value);");
				    	
				    	for(var i=0;i<msg.length;i++){
				    		
				    		if(i==0){
				    			var newOptionTag = document.createElement("option");
					    			newOptionTag.setAttribute("value","waterArea,"+msg[i].waterAreaLevel+","+"0");
					    			newOptionTag.innerHTML="请选择";
					    			newSelectTag.appendChild(newOptionTag);
				    			var newOptionTag = document.createElement("option");
					    			newOptionTag.setAttribute("value",msg[i].id+","+msg[i].waterAreaLevel+","+msg[i].waterAreaName);
					    			newOptionTag.innerHTML=msg[i].waterAreaName;
					    			newSelectTag.appendChild(newOptionTag);
				    		}else{
				    			var newOptionTag = document.createElement("option");
					    			newOptionTag.setAttribute("value",msg[i].id+","+msg[i].waterAreaLevel+","+msg[i].waterAreaName);
					    			newOptionTag.innerHTML=msg[i].waterAreaName;
					    			newSelectTag.appendChild(newOptionTag);
				    		}
				    	}
				    var newSpanTag = document.createElement("span");
				    	newSpanTag.setAttribute("id","span2"+(level+1));
						newSpanTag.innerHTML="--";
				    var newInputTag = document.createElement("input");
				    	newInputTag.setAttribute("id","waterAreaSure");
				    	newInputTag.setAttribute("class","layui-btn layui-btn-normal layui-btn-sm");
				    	newInputTag.setAttribute("type","button");
				    	newInputTag.setAttribute("value","确定");
				    	newInputTag.setAttribute("onclick","getWaterAreaIdAndLevel()");
				    	currentTag.appendChild(newSelectTag);
				    	currentTag.appendChild(newSpanTag);
				    	currentTag.appendChild(newInputTag);
				}else{
				
					var newInputTag = document.createElement("input");
						newInputTag.setAttribute("class","layui-btn layui-btn-normal layui-btn-sm");
				    	newInputTag.setAttribute("id","waterAreaSure");
				    	newInputTag.setAttribute("type","button");
				    	newInputTag.setAttribute("value","确定");
				    	newInputTag.setAttribute("onclick","getWaterAreaIdAndLevel()");
			    	currentTag.appendChild(newInputTag);
				}
			}
		});
	}
	//
	function areaChange(a){
		//alert(a);
		var paramArray = a.split(",");  
	    	var id = paramArray[0];  
	    	
	    	var level =parseInt(paramArray[1]);
	    	//alert(level);
	    	var parentNode = document.getElementById("area");
	    		parentNode.removeChild(document.getElementById("areaSure"));
	    	//如果水管区父级重选删除子水管区
	    	var number1=level+1;
	    	while(document.getElementById("select1"+number1)){
	    		//alert(number);
	    		parentNode.removeChild(document.getElementById("select1"+number1));
	    		number1++;
	    	}
	    	
	    	var number2=level+1;
	    	while(document.getElementById("span1"+number2)){
	    		parentNode.removeChild(document.getElementById("span1"+number2));
	    		number2++;
	    	}
		$.ajax({
			url:"${ctx}/cal_canal_info/find_son_water_Area",
			data: {id:id},
			type: "post",
			async: false,//非异步
			success: function(msg){
				//alert(JSON.stringify(msg));
				var currentTag = document.getElementById("waterArea");
				if(msg.length>0){
				    var newSelectTag = document.createElement("select");
				    	newSelectTag.setAttribute("id", "select1"+(level+1));
				    	newSelectTag.setAttribute("style", "color:black;width:100px;height:30px;");
				    	newSelectTag.setAttribute("onchange","areaChange(this[selectedIndex].value);");
				    	
				    	for(var i=0;i<msg.length;i++){
				    		var newOptionTag = document.createElement("option");
				    			newOptionTag.setAttribute("value",msg[i].id+","+msg[i].waterAreaLevel);
				    			newOptionTag.innerHTML=msg[i].waterAreaName;
				    			newSelectTag.appendChild(newOptionTag);
				    	}
				    var newSpanTag = document.createElement("span");
				    	newSpanTag.setAttribute("id","span2"+(level+1));
						newSpanTag.innerHTML="--";
				    var newInputTag = document.createElement("input");
				    	newInputTag.setAttribute("id","areaSure");
				    	newInputTag.setAttribute("class","layui-btn layui-btn-normal layui-btn-sm");
				    	newInputTag.setAttribute("type","button");
				    	newInputTag.setAttribute("value","确定");
				    	currentTag.appendChild(newSelectTag);
				    	currentTag.appendChild(newSpanTag);
				    	currentTag.appendChild(newInputTag);
				}else{
				
					var newInputTag = document.createElement("input");
						newInputTag.setAttribute("class","layui-btn layui-btn-normal layui-btn-sm");
				    	newInputTag.setAttribute("id","areaSure");
				    	newInputTag.setAttribute("type","button");
				    	newInputTag.setAttribute("value","确定");
			    	currentTag.appendChild(newInputTag);
				}
			}
		});
	}
	function getWaterAreaIdAndLevel(){
		//选中水管区的id
		var id = getCookie("id");
		if(id==""){
			var syswaterareaCodeInput =  document.getElementById("syswaterareaCode");
			syswaterareaCodeInput.value="";
			return;
		}
		$.ajax({
			url:"${ctx}/sys_water_area/ajax_findWaterArea",
			data: {id:id},
			type: "post",
			async: false,//非异步
			success: function(msg){
				alert(JSON.stringify(msg));
				var syswaterareaCodeInput =  document.getElementById("syswaterareaCode");
				syswaterareaCodeInput.value=msg.waterAreaCode;
			}
		});
	}

	
	
	

	</script>
</body>
</html>



