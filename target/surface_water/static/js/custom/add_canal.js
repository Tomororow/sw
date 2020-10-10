function waterAreaChange(a){
		delCookie("id");
		
		//alert(a);
		var paramArray = a.split(",");  
	    	var id = paramArray[0];  
	    	var level =parseInt(paramArray[1]);
	    	
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
					    			newOptionTag.setAttribute("value","waterArea,"+msg[i].waterAreaLevel);
					    			newOptionTag.innerHTML="请选择";
					    			newSelectTag.appendChild(newOptionTag);
				    			var newOptionTag = document.createElement("option");
					    			newOptionTag.setAttribute("value",msg[i].id+","+msg[i].waterAreaLevel);
					    			newOptionTag.innerHTML=msg[i].waterAreaName;
					    			newSelectTag.appendChild(newOptionTag);
				    			
				    			
				    		}else{
				    			var newOptionTag = document.createElement("option");
					    			newOptionTag.setAttribute("value",msg[i].id+","+msg[i].waterAreaLevel);
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
	