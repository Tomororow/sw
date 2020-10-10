/* 相对链接的基准URL */
	var curWwwPath = window.document.location.href;
	var pathName = window.document.location.pathname;
	var pos = curWwwPath.indexOf(pathName);
	var localhostPaht = curWwwPath.substring(0,pos);
	var projectName = pathName.substring(0,pathName.substr(1).indexOf('/')+1);
	var ctxPath = localhostPaht + projectName;
	var picPath = localhostPaht;


//给父页面传值所用信息
	var index = parent.layer.getFrameIndex(window.name);
	var reg = /^[0-9]*$/;
	var age = /^[\-\+]?(0?\d{1,2}\.\d{1,10}|1[0-7]?\d{1}\.\d{1,10}|180\.0{1,10})$/;
	var msg = /^[\-\+]?([0-8]?\d{1}\.\d{1,10}|90\.0{1,10})$/;
	function mySubmit(){
		 if($("#sysareaCode").val()==null || $("#sysareaCode").val()==""){
			layer.alert('请选择行政编码！', {icon: 0});
		} else if($("#syswaterareaCode").val()==null || $("#syswaterareaCode").val()==""){
			layer.alert('请选择水管区编码！', {icon: 0});
		}else if($("#deviceReservoirCode").val()==null || $("#deviceReservoirCode").val()==""){
			layer.alert('水库编码不能为空，不能重复！', {icon: 0});
		}else if($("#deviceReservoirName").val()==null || $("#deviceReservoirName").val()==""){
			layer.alert('水库名称不能为空！', {icon: 0});
		}else if($("#sriBuildTime").val()==null || $("#sriBuildTime").val()==""){
			layer.alert('水库建设时间不能为空！', {icon: 0});
		}else if($("#sriLongitude").val()==null || $("#sriLongitude").val()==""){
			layer.alert('水库经度不能为空！', {icon: 0});
		}else if(!age.test($("#sriLongitude").val())){
			layer.alert('经度在-180.0～+180.0（整数部分为0～180，必须输入1到10位小数）!', {icon: 0});
		}
		else if($("#sriLatitude").val()==null || $("#sriLatitude").val()==""){
			layer.alert('水库纬度不能为空！', {icon: 0});
		}
		else if(!msg.test($("#sriLatitude").val())){
			layer.alert('纬度在-90.0～+90.0（整数部分为0～90，必须输入1到10位小数）!', {icon: 0});
		}
		else if($("#sriHeight").val()==null || $("#sriHeight").val()==""){
			layer.alert('水库高程不能为空！', {icon: 0});
		}else if($("#reservoirCapacity").val()==null || $("#reservoirCapacity").val()==""){
			layer.alert('水库总库容量不能为空！', {icon: 0});
		}else if($("#thReservoirCapacity").val()==null || $("#thReservoirCapacity").val()==""){
			layer.alert('调洪库容不能为空！', {icon: 0});
		}else if($("#fhReservoirCapacity").val()==null || $("#fhReservoirCapacity").val()==""){
			layer.alert('防洪库容不能为空！', {icon: 0});
		}else if($("#xlReservoirCapacity").val()==null || $("#xlReservoirCapacity").val()==""){
			layer.alert('兴利库容不能为空！', {icon: 0});
		}else if($("#mainDamHeight").val()==null || $("#mainDamHeight").val()==""){
			layer.alert('主坝坝高不能为空！', {icon: 0});
		}else if($("#mainDanLength").val()==null || $("#mainDanLength").val()==""){
			layer.alert('主坝坝长不能为空！', {icon: 0});
		}else if($("#threeLevelAreaName option:selected").val()==null || $("#threeLevelAreaName option:selected").val()==""){
			layer.alert('请选择三级区名称(流域)！', {icon: 0});
		}else if($("#belongsCanalCode option:selected").val()==null || $("#belongsCanalCode option:selected").val()==""){
			layer.alert('请选择所属河流！', {icon: 0});
		}else if($("#engineeringLevel option:selected").val()==null || $("#engineeringLevel option:selected").val()==""){
			layer.alert('请选择工程级别！', {icon: 0});
		}else if($("#damTopHeight").val()==null || $("#damTopHeight").val()==""){
			layer.alert('坝顶高程不能为空！', {icon: 0});
		}else if($("#waterMouth").val()==null || $("#waterMouth").val()==""){
			layer.alert('取水口水量不能为空！', {icon: 0});
		}else if($("#designWaterYearSupply").val()==null || $("#designWaterYearSupply").val()==""){
			layer.alert('设计年供水量不能为空！', {icon: 0});
		}else if($("#supplyObject option:selected").val()==null || $("#supplyObject option:selected").val()==""){
			layer.alert('请选择供水对象！', {icon: 0});
		}else if($("#damFunction option:selected").val()==null || $("#damFunction option:selected").val()==""){
			layer.alert('请选择坝的用途功能！', {icon: 0});
		}else if($("#damMaterialType option:selected").val()==null || $("#damMaterialType option:selected").val()==""){
			layer.alert('请选择大坝材质类型！', {icon: 0});
		}else if($("#damStructureType option:selected").val()==null || $("#damStructureType option:selected").val()==""){
			layer.alert('请选择大坝结构分类！', {icon: 0});
		}else if($("#waterResourcesLevelCode").val()==null || $("#waterResourcesLevelCode").val()==""){
			layer.alert('水资源三级区名称不能为空！', {icon: 0});
		}else if($("#code").val()==null || $("#code").val()==""){
			layer.alert('水资源三级区编码不能为空！', {icon: 0});
		}else if($("#releaseFloodWatersBuilding option:selected").val()==null || $("#releaseFloodWatersBuilding option:selected").val()==""){
			layer.alert('请选择大坝泄洪建筑物！', {icon: 0});
		}else if($("#damControlBasinArea").val()==null || $("#damControlBasinArea").val()==""){
			layer.alert('大坝控制流域面积不能为空！', {icon: 0});
		}else if($("#damAverageFlowRate").val()==null || $("#damAverageFlowRate").val()==""){
			layer.alert('大坝多年平均径流量不能为空！', {icon: 0});
		}else if($("#scazPeopleNumber").val()==null || $("#scazPeopleNumber").val()==""){
			layer.alert('生产安置人口不能为空！', {icon: 0});
		}else if($("#bqazPeopleNumber").val()==null || $("#bqazPeopleNumber").val()==""){
			layer.alert('搬迁安置人口不能为空！', {icon: 0});
		}else if($("#engineeringConstructionSituation option:selected").val()==null || $("#engineeringConstructionSituation option:selected").val()==""){
			layer.alert('请选择工程建设情况！', {icon: 0});
		}else if($("#reservoirRegulationPerformance").val()==null || $("#reservoirRegulationPerformance").val()==""){
			layer.alert('水库调节性能不能为空！', {icon: 0});
		}else if($("#mainDamLevel option:selected").val()==null || $("#mainDamLevel option:selected").val()==""){
			layer.alert('请选择主坝级别！', {icon: 0});
		}else if($("#maxReleaseFloodWaters").val()==null || $("#maxReleaseFloodWaters").val()==""){
			layer.alert('最大泄洪流量不能为空！', {icon: 0});
		}else if($("#heightCoefficient").val()==null || $("#heightCoefficient").val()==""){
			layer.alert('高程系数不能为空！', {icon: 0});
		}else if($("#sriDeviceNo").val()==null || $("#sriDeviceNo").val()==""){
			layer.alert('设备编码(水位监测仪器)不能为空！', {icon: 0});
		}else if($("#sjhsbz").val()==null || $("#sjhsbz").val()==""){
			layer.alert('设计洪水标准重现期不能为空！', {icon: 0});
		}else if($("#jzhsbz").val()==null || $("#jzhsbz").val()==""){
			layer.alert('校核洪水标准重现期不能为空！', {icon: 0});
		}else if($("#sjhsw").val()==null || $("#sjhsw").val()==""){
			layer.alert('设计洪水位不能为空！', {icon: 0});
		}else if($("#jzhsw").val()==null || $("#jzhsw").val()==""){
			layer.alert('校核洪水位不能为空！', {icon: 0});
		}else if($("#fhgsw").val()==null || $("#fhgsw").val()==""){
			layer.alert('防洪高水位不能为空！', {icon: 0});
		}else if($("#zcxsw").val()==null || $("#zcxsw").val()==""){
			layer.alert('正常蓄水位不能为空！', {icon: 0});
		}else if($("#fhxzsw").val()==null || $("#fhxzsw").val()==""){
			layer.alert('防洪限制水位不能为空！', {icon: 0});
		}else if($("#ssw").val()==null || $("#ssw").val()==""){
			layer.alert('死水位不能为空！', {icon: 0});
		}else if($("#skr").val()==null || $("#skr").val()==""){
			layer.alert('死库容不能为空！', {icon: 0});
		}else if($("#zcxswxysmmj").val()==null || $("#zcxswxysmmj").val()==""){
			layer.alert('蓄水位相应水面面积不能为空！', {icon: 0});
		}else if($("#zybhdx").val()==null || $("#zybhdx").val()==""){
			layer.alert('重要保护对象不能为空！', {icon: 0});
		}else if($("#gxmc").val()==null || $("#gxmc").val()==""){
			layer.alert('灌溉对象灌区名称不能为空！', {icon: 0});
		}else if($("#skgkglbm").val()==null || $("#skgkglbm").val()==""){
			layer.alert('水库归口管理部门不能为空！', {icon: 0});
		}else if($("#sfwchj option:selected").val()==null || $("#sfwchj option:selected").val()==""){
			layer.alert('请选择是否完成划界！', {icon: 0});
		}else if($("#sfwcqq option:selected").val()==null || $("#sfwcqq option:selected").val()==""){
			layer.alert('请选择是否完成确权！', {icon: 0});
		}/* else if($("#sriAddr").val()==null || $("#sriAddr").val()==""){
			layer.alert('水库详细地址不能为空！', {icon: 0});
		} */
		 else {
			parent.layer.close(index);
	        $('#form').submit();
		} 
    }
	function waterAreaChange(a){
		
		delCookie("id");
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
	    			var selectTag=document.getElementById("select2"+i);
	    			
	    			var optionValue = selectTag.options[selectTag.selectedIndex].value;
		    			var optionParamArray = optionValue.split(",");  
		    			
		    			var optionLevel = optionParamArray[1]; 
		    	    	var optionName = optionParamArray[2]; 
		    	    	content=content+("【"+optionLevel+":"+optionName+"】-");
	    		}
	    		
	    		
	    		var waterAreaSpan = document.getElementById("waterAreaSpan");
	    		waterAreaSpan.innerHTML=content;
	    	}else{
	    		if(level==0){
	    			content="无";
	    		}
	    		for(var i=0;i<level;i++){
	    			////alert(name+i);
	    			var selectTag=document.getElementById("select2"+i);
	    			
	    			var optionValue = selectTag.options[selectTag.selectedIndex].value;
		    			var optionParamArray = optionValue.split(",");  
		    			
		    			var optionLevel = optionParamArray[1]; 
		    	    	var optionName = optionParamArray[2]; 
		    	    	content=content+("【"+optionLevel+":"+optionName+"】-");
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
	    	////alert(level);
	    	var parentNode = document.getElementById("waterArea");
	    		parentNode.removeChild(document.getElementById("waterAreaSure"));
	    	//如果水管区父级重选删除子水管区
	    	var number1=level+1;
	    	while(document.getElementById("select2"+number1)){
	    		////alert(number);
	    		parentNode.removeChild(document.getElementById("select2"+number1));
	    		number1++;
	    	}
	    	
	    	var number2=level+1;
	    	while(document.getElementById("span2"+number2)){
	    		parentNode.removeChild(document.getElementById("span2"+number2));
	    		number2++;
	    	}
		$.ajax({
			url:ctxPath+"/cal_canal_info/find_son_water_Area",
			data: {id:id},
			type: "post",
			async: false,//非异步
			success: function(msg){
				////alert(JSON.stringify(msg));
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


function getWaterAreaIdAndLevel(){
	//选中水管区的id
	var id = getCookie("id");
	if(id==""){
		var syswaterareaCodeInput =  document.getElementById("syswaterareaCode");
		syswaterareaCodeInput.value="";
		return;
	}
	$.ajax({
		url:ctxPath+"/sys_water_area/ajax_findWaterArea",
		data: {id:id},
		type: "post",
		async: false,//非异步
		success: function(msg){
			//alert(JSON.stringify(msg));
			var syswaterareaCodeInput =  document.getElementById("syswaterareaCode");
			syswaterareaCodeInput.value=msg.waterAreaCode;
		}
	});
}

function getAreaIdAndLevel(){
	//选中行政区的id
	var id = getCookie("areaId");
	if(id==""){
		var sysareaCodeInput =  document.getElementById("sysareaCode");
		sysareaCodeInput.value="";
		return;
	}
	$.ajax({
		url:ctxPath+"/sysArea/ajax_findArea",
		data: {id:id},
		type: "post",
		async: false,//非异步
		success: function(msg){
			////alert(JSON.stringify(msg));
			var sysareaCodeInput =  document.getElementById("sysareaCode");
			sysareaCodeInput.value=msg.areaCode;
		}
	});
}
