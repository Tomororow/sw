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
  					
    				<form  id="form" action="${ctx}/cal_canal_info/add" method="post" enctype="multipart/form-data">
    				
    				<table class="table table-bordered table-header">
	        			<tr>
							<td id="area" class="w7" rowspan="2">所属行政区</td><td class="w54"  colspan="3">
								<select id="" style="color:black;width:100px;height:30px;" onchange="areaChange(this[selectedIndex].value);">
									
									<c:forEach items="" var="sysWaterArea">
									  <option value="${sysWaterArea.id},${sysWaterArea.waterAreaLevel}">${sysWaterArea.waterAreaName}</option>
									</c:forEach>
								</select>
								<span id="span10">--</span>
								<input id="areaSure" class="layui-btn layui-btn-normal layui-btn-sm" value="确定" type="button" />
							</td>
							
						</tr>
						<tr>
							<td class="w54"  colspan="3">
								<span id="areaSpan">无<span>
							</td>
							
						</tr>
						
						<tr>	
							<td class="w7" rowspan="2">所属水管区</td>
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
								<span id="waterAreaSpan">无<span>
							</td>
							
						</tr>
						
						<tr>	
							<td class="w7">所属行政区编码</td><td class="w18"><input type="text" id="sysareaCode" name="calCanalInfo.sysareaCode" value="" style="color:black;width:180px;"/></td>
							<td class="w7">所属水管区编码</td><td class="w18"><input type="text" readonly="true" id="syswaterareaCode" name="calCanalInfo.syswaterareaCode" value="" style="color:black;width:180px;"/></td>
							
						</tr>
						
						
						<tr>	
							<td class="w7">渠道--编码</td><td class="w18"><input type="text" name="calCanalInfo.canalCode" value="${calCanalInfo.canalCode}" style="color:black;width:180px;"/></td>
							<td class="w7">渠道--名称</td><td class="w18"><input type="text" name="calCanalInfo.canalName" value="${calCanalInfo.canalName}" style="color:black;width:180px;"/></td>
						
						</tr>
						
						<tr>
							<td class="w7">渠道--长度</td><td class="w18"><input type="text" name="calCanalInfo.canalLength" value="${calCanalInfo.canalLength}" style="color:black;width:180px;"/></td>
							<td class="w7">渠道--材质</td>
							<td class="w18">
								<select id="canalmaterialCodeSelect" name="calCanalInfo.canalmaterialCode" style="color:black;width:180px;height:30px;" onchange="waterAreaChange(this[selectedIndex].value);">
									<option>请选择</option>
									<c:forEach items="${calCanalMaterialList}" var="calCanalMaterial">
									  <option value="${calCanalMaterial.canalMaterialCode}">${calCanalMaterial.canalMaterialName}</option>
									</c:forEach>
								</select>
							</td>
							
						</tr>
						
						
						<tr>
							<td class="w7">渠道--类型</td>
							<td class="w18">
								<select id="canalTypeCodeSelect" name="calCanalInfo.canaltypeCode" style="color:black;width:180px;height:30px;" onchange="calCanTypeChange(this[selectedIndex].value);">
										<option>请选择</option>
										<c:forEach items="${calCanalTypeList}" var="calCanalType">
										  	<option value="${calCanalType.canalTypeCode}">${calCanalType.canalTypeName}</option>
										</c:forEach>
								</select>
							</td>
							
							<td class="w7">渠道--用途</td>
							<td class="w18">
								<select id="canalUsetypeCodeSelect" name="calCanalInfo.canalusetypeCode" style="color:black;width:180px;height:30px;" onchange="waterAreaChange(this[selectedIndex].value);">
										<option>请选择</option>
										<c:forEach items="${calCanalUsetypeList}" var="calCanalUsetype">
										  <option value="${calCanalUsetype.canalUsetypeCode}">${calCanalUsetype.canalUsetypeName}</option>
										</c:forEach>
								</select>
							</td>
						</tr>
						
						<tr>
							<td class="w7" rowspan="2">渠道衬砌材质分类长度说明</td>
							<td class="w18" colspan="3">
								一类：<input type="text" name="calCanalLengthCalssify.highStandardOne" value="" style="color:black;width:60px;height:25px;"/>&nbsp;km&nbsp;
								二类：<input type="text" name="calCanalLengthCalssify.highStandardTwo" value="" style="color:black;width:60px;height:25px;"/>&nbsp;km&nbsp;
								三类：<input type="text" name="calCanalLengthCalssify.highStandardThree" value="" style="color:black;width:60px;height:25px;"/>&nbsp;km<br>
								干砌：<input type="text" name="calCanalLengthCalssify.dryMasonry" value="" style="color:black;width:60px;height:25px;"/>&nbsp;km&nbsp;
								土渠：<input type="text" name="calCanalLengthCalssify.earthCanal" value="" style="color:black;width:60px;height:25px;"/>&nbsp;km&nbsp;
								其他：<input type="text" name="calCanalLengthCalssify.other" value="" style="color:black;width:60px;height:25px;"/>&nbsp;km
							</td>
						</tr>
						<tr>
							<td class="w18" colspan="3">
								高标准说明备注：<br><textarea  name="calCanalLengthCalssify.cclcRemark" cols="100" rows="3" style="color:black;"></textarea> 
							</td>
						</tr>
						
						
						
						<tr>
							<td class="w7">所属--灌区</td><td class="w18"><input type="text" name="calCanalInfo.irrigatedAreaName" value="${calCanalInfo.irrigatedAreaName}" style="color:black;width:180px;"/></td>
							<td class="w7">渠道设计流量</td><td class="w18"><input type="text" name="calCanalInfo.canalDesignFlow" value="${calCanalInfo.canalDesignFlow}" style="color:black;width:180px;"/></td>
						
						</tr>
						
						<tr>
							<td class="w7">渠道实际流量</td><td class="w18"><input type="text" name="calCanalInfo.canalRealityFlow" value="${calCanalInfo.canalRealityFlow}" style="color:black;width:180px;"/></td>
							<td class="w7">渠道设计灌溉亩数</td><td class="w18"><input type="text" name="calCanalInfo.canalIrrigatedAcreage" value="${calCanalInfo.canalIrrigatedAcreage}" style="color:black;width:180px;"/></td>
						</tr>
						
						
						
						<tr>
							<td class="w7">渠道完好率</td><td class="w18"><input type="text" name="calCanalInfo.canalPerfectRate" value="${calCanalInfo.canalRealityFlow}" style="color:black;width:180px;"/></td>
							<td class="w7">渠道利用率</td><td class="w18"><input type="text" name="calCanalInfo.canalRatio" value="${calCanalInfo.canalRatio}" style="color:black;width:180px;"/></td>
						</tr>
						
						<tr>
							<td class="w7">渠道建设时间</td><td class="w18"><input type="text"  name="calCanalInfo.canalBuildTime"   style="color:black;" onfocus="WdatePicker({'skin':'whyGreen','dateFmt':'yyyy-MM-dd'});" /></td>
							<td class="w7">渠道修缮时间</td><td class="w18"><input type="text"  name="calCanalInfo.canalRepairTime"   style="color:black;"  onfocus="WdatePicker({'skin':'whyGreen','dateFmt':'yyyy-MM-dd'});" /></td>
						</tr>
						
						
						<tr>
							<td class="w7">渠道详细地址</td>
							<td class="w18" colspan="3">
								<textarea  name="calCanalInfo.canalAddr" cols="100" rows="3" style="color:black;"></textarea> 
							</td>
						</tr>
						
						<tr>
							<td class="w7">渠道纵坡,定长内渠道下降比例</td><td class="w18"><input type="text" name="calCanalInfo.canalSlope" value="${calCanalInfo.canalSlope}" style="color:black;width:180px;"/></td>
							<td class="w7">渠道糙率</td><td class="w18"><input type="text" name="calCanalInfo.canalRough" value="${calCanalInfo.canalRough}" style="color:black;width:180px;"/></td>
						</tr>
						

						<tr>
							<td class="w7">渠道渠底和坡边的夹角</td><td class="w18"><input type="text" name="calCanalInfo.canalAngle" value="${calCanalInfo.canalAngle}" style="color:black;width:180px;"/></td>
							<td class="w7">渠道高度</td><td class="w18"><input type="text" name="calCanalInfo.canalHeight" value="${calCanalInfo.canalHeight}" style="color:black;width:180px;"/></td>
						</tr>
						
						<tr>
							<td class="w7">渠道宽度</td><td class="w18"><input type="text" name="calCanalInfo.canalWight" value="${calCanalInfo.canalWight}" style="color:black;width:180px;"/></td>
							
							</td>
							
							<td class="w7" >照片编号</td><td class="w18"><input type="text" name="calCanalInfo.canalPhotoCode" value="" style="color:black;width:180px;"/></td>
						</tr>
						
						<tr>
							<td class="w7">渠道--备注</td>
							<td class="w18"  colspan="3">
								<textarea  name="calCanalInfo.cciRemark" cols="100" rows="3" style="color:black;"></textarea> 
							</td>
						</tr>
						<!--<tr>
							<td id="photo" class="w18" rowspan="" colspan="4">
									  <div class="layui-upload">
									  <button type="button" class="layui-btn" id="test2">多图片上传</button> 
									  <blockquote class="layui-elem-quote layui-quote-nm" style="margin-top: 10px;">
									    预览图：
									    <div class="layui-upload-list" id="demo2"></div>
									 </blockquote>
							</div>
									
									<div class="layui-upload">
									  <button type="button" class="layui-btn layui-btn-normal" id="testList">选择多文件</button> 
									  <div class="layui-upload-list">
									    <table class="layui-table">
									      <thead>
									        <tr><th>文件名</th>
									        <th>大小</th>
									        <th>状态</th>
									        <th>操作</th>
									      </tr></thead>
									      <tbody id="demoList"></tbody>
									    </table>
									  </div>
									  <button type="button" class="layui-btn" id="testListAction">开始上传</button>
									</div> 
							
							
									<input type="file" name="files" onchange="addPhoto()"  style="color:black;width:180px;"> 照片备注:<input type="text" name="calCanalPhotoList[0].ccpRemark" style="color:black;width:180px;" />
							</td>
						</tr>
						-->
						
						
						
						
    				</table>
    				<input hidden="hidden"  type="text" name="calCanalInfo.canalParentId" value="${id}" style="color:black;"/>
    				
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



