
/* 相对链接的基准URL */
var curWwwPath = window.document.location.href;
var pathName = window.document.location.pathname;
var pos = curWwwPath.indexOf(pathName);
var localhostPaht = curWwwPath.substring(0,pos);
var projectName = pathName.substring(0,pathName.substr(1).indexOf('/')+1);
var ctxPath = localhostPaht + projectName;

function waterAreaChange(a) {

	delCookie("id");
	// //alert(a);
	var paramArray = a.split(",");
	var id = paramArray[0];
	var level = parseInt(paramArray[1]);
	var name = paramArray[2];
	// //alert(name+"rww");
	// 选择已经显示的区域名称
	var content = "";
	if (name != 0) {
		// //alert(name+"rww22");
		/*
		 * for(var i=0;i<=level;i++){ ////alert(name+i); var
		 * selectTag=document.getElementById("select2"+i);
		 * 
		 * 
		 * var optionValue = selectTag.options[selectTag.selectedIndex].value;
		 * var optionParamArray = optionValue.split(",");
		 * 
		 * var optionLevel = optionParamArray[1]; var optionName =
		 * optionParamArray[2];
		 * content=content+("{=="+optionLevel+":"+optionName+"==}-->"); }
		 */

		var waterAreaSpan = document.getElementById("waterAreaSpan");
		waterAreaSpan.innerHTML = content;
	} else {
		if (level == 0) {
			content = "无";
		}
		for (var i = 0; i < level; i++) {
			// //alert(name+i);
			var selectTag = document.getElementById("select2" + i);

			var optionValue = selectTag.options[selectTag.selectedIndex].value;
			var optionParamArray = optionValue.split(",");

			var optionLevel = optionParamArray[1];
			var optionName = optionParamArray[2];
			content = content
					+ ("{==" + optionLevel + ":" + optionName + "==}-->");
		}

		var waterAreaSpan = document.getElementById("waterAreaSpan");
		waterAreaSpan.innerHTML = content;
	}

	if (id != "waterArea") {
		setCookie("id", id);
	} else if (id == "waterArea") {

		if (level <= 0) {
			setCookie("id", "");
		} else {
			var selectTag = document.getElementById("select2" + (level - 1));

			var optionValue = selectTag.options[selectTag.selectedIndex].value;
			var optionParamArray = optionValue.split(",");
			var optionId = optionParamArray[0];
			setCookie("id", optionId);
		}
	}
	// //alert(level);
	var parentNode = document.getElementById("waterArea");
	parentNode.removeChild(document.getElementById("waterAreaSure"));
	// 如果水管区父级重选删除子水管区
	var number1 = level + 1;
	while (document.getElementById("select2" + number1)) {
		// //alert(number);
		parentNode.removeChild(document.getElementById("select2" + number1));
		number1++;
	}

	var number2 = level + 1;
	while (document.getElementById("span2" + number2)) {
		parentNode.removeChild(document.getElementById("span2" + number2));
		number2++;
	}
	$
			.ajax({
				url : ctxPath+"/cal_canal_info/find_son_water_Area",
				data : {
					id : id
				},
				type : "post",
				async : false,// 非异步
				success : function(msg) {
					// //alert(JSON.stringify(msg));
					var currentTag = document.getElementById("waterArea");
					if (msg.length > 0) {
						var newSelectTag = document.createElement("select");
						newSelectTag
								.setAttribute("id", "select2" + (level + 1));
						newSelectTag.setAttribute("style",
								"color:black;width:100px;height:30px;");
						newSelectTag.setAttribute("onchange",
								"waterAreaChange(this[selectedIndex].value);");

						for (var i = 0; i < msg.length; i++) {

							if (i == 0) {
								var newOptionTag = document
										.createElement("option");
								newOptionTag.setAttribute("value", "waterArea,"
										+ msg[i].waterAreaLevel + "," + "0");
								newOptionTag.innerHTML = "请选择";
								newSelectTag.appendChild(newOptionTag);
								var newOptionTag = document
										.createElement("option");
								newOptionTag.setAttribute("value", msg[i].id
										+ "," + msg[i].waterAreaLevel + ","
										+ msg[i].waterAreaName);
								newOptionTag.innerHTML = msg[i].waterAreaName;
								newSelectTag.appendChild(newOptionTag);
							} else {
								var newOptionTag = document
										.createElement("option");
								newOptionTag.setAttribute("value", msg[i].id
										+ "," + msg[i].waterAreaLevel + ","
										+ msg[i].waterAreaName);
								newOptionTag.innerHTML = msg[i].waterAreaName;
								newSelectTag.appendChild(newOptionTag);
							}
						}
						var newSpanTag = document.createElement("span");
						newSpanTag.setAttribute("id", "span2" + (level + 1));
						newSpanTag.innerHTML = "--";
						var newInputTag = document.createElement("input");
						newInputTag.setAttribute("id", "waterAreaSure");
						newInputTag.setAttribute("class",
								"layui-btn layui-btn-normal layui-btn-sm");
						newInputTag.setAttribute("type", "button");
						newInputTag.setAttribute("value", "确定");
						newInputTag.setAttribute("onclick",
								"getWaterAreaIdAndLevel()");
						currentTag.appendChild(newSelectTag);
						currentTag.appendChild(newSpanTag);
						currentTag.appendChild(newInputTag);
					} else {

						var newInputTag = document.createElement("input");
						newInputTag.setAttribute("class",
								"layui-btn layui-btn-normal layui-btn-sm");
						newInputTag.setAttribute("id", "waterAreaSure");
						newInputTag.setAttribute("type", "button");
						newInputTag.setAttribute("value", "确定");
						newInputTag.setAttribute("onclick",
								"getWaterAreaIdAndLevel()");
						currentTag.appendChild(newInputTag);
					}
				}
			});
}
//
function areaChange(a) {
	delCookie("areaId");
	// //alert(a);
	var paramArray = a.split(",");
	var id = paramArray[0];
	var level = parseInt(paramArray[1]);
	var name = paramArray[2];
	// //alert(name+"rww");
	// 选择已经显示的区域名称
	var content = "";
	if (name != 0) {
		// //alert(name+"rww22");
		for (var i = 0; i <= level; i++) {
			// //alert(name+i);
			var selectTag = document.getElementById("select1" + i);

			var optionValue = selectTag.options[selectTag.selectedIndex].value;
			var optionParamArray = optionValue.split(",");

			var optionLevel = optionParamArray[1];
			var optionName = optionParamArray[2];
			content = content
					+ ("{==" + optionLevel + ":" + optionName + "==}-->");
		}

		var areaSpan = document.getElementById("areaSpan");
		areaSpan.innerHTML = content;
	} else {
		if (level == 0) {
			content = "无";
		}
		for (var i = 0; i < level; i++) {
			// //alert(name+i);
			var selectTag = document.getElementById("select1" + i);

			var optionValue = selectTag.options[selectTag.selectedIndex].value;
			var optionParamArray = optionValue.split(",");

			var optionLevel = optionParamArray[1];
			var optionName = optionParamArray[2];
			content = content
					+ ("{==" + optionLevel + ":" + optionName + "==}-->");
		}

		var areaSpan = document.getElementById("areaSpan");
		areaSpan.innerHTML = content;
	}

	if (id != "area") {
		setCookie("areaId", id);
	} else if (id == "area") {

		if (level <= 0) {
			setCookie("areaId", "");
		} else {
			var selectTag = document.getElementById("select1" + (level - 1));

			var optionValue = selectTag.options[selectTag.selectedIndex].value;
			var optionParamArray = optionValue.split(",");
			var optionId = optionParamArray[0];
			setCookie("areaId", optionId);
		}
	}
	// //alert(level);
	var parentNode = document.getElementById("area");
	parentNode.removeChild(document.getElementById("areaSure"));
	// 如果水管区父级重选删除子水管区
	var number1 = level + 1;
	while (document.getElementById("select1" + number1)) {
		// //alert(number);
		parentNode.removeChild(document.getElementById("select1" + number1));
		number1++;
	}

	var number2 = level + 1;
	while (document.getElementById("span1" + number2)) {
		parentNode.removeChild(document.getElementById("span1" + number2));
		number2++;
	}
	$.ajax({
		url : ctxPath+"/cal_canal_info/find_son_Area",
		data : {
			id : id
		},
		type : "post",
		async : false,// 非异步
		success : function(msg) {
			// alert(JSON.stringify(msg));
			var currentTag = document.getElementById("area");
			if (msg.length > 0) {
				var newSelectTag = document.createElement("select");
				newSelectTag.setAttribute("id", "select1" + (level + 1));
				newSelectTag.setAttribute("style",
						"color:black;width:100px;height:30px;");
				newSelectTag.setAttribute("onchange",
						"areaChange(this[selectedIndex].value);");

				for (var i = 0; i < msg.length; i++) {

					if (i == 0) {
						var newOptionTag = document.createElement("option");
						newOptionTag.setAttribute("value", "area,"
								+ msg[i].areaLevel + "," + "0");
						newOptionTag.innerHTML = "请选择";
						newSelectTag.appendChild(newOptionTag);
						var newOptionTag = document.createElement("option");
						newOptionTag.setAttribute("value", msg[i].id + ","
								+ msg[i].areaLevel + "," + msg[i].areaName);
						newOptionTag.innerHTML = msg[i].areaName;
						newSelectTag.appendChild(newOptionTag);
					} else {
						var newOptionTag = document.createElement("option");
						newOptionTag.setAttribute("value", msg[i].id + ","
								+ msg[i].areaLevel + "," + msg[i].areaName);
						newOptionTag.innerHTML = msg[i].areaName;
						newSelectTag.appendChild(newOptionTag);
					}
				}
				var newSpanTag = document.createElement("span");
				newSpanTag.setAttribute("id", "span1" + (level + 1));
				newSpanTag.innerHTML = "--";
				var newInputTag = document.createElement("input");
				newInputTag.setAttribute("id", "areaSure");
				newInputTag.setAttribute("class",
						"layui-btn layui-btn-normal layui-btn-sm");
				newInputTag.setAttribute("type", "button");
				newInputTag.setAttribute("value", "确定");
				newInputTag.setAttribute("onclick", "getAreaIdAndLevel()");
				currentTag.appendChild(newSelectTag);
				currentTag.appendChild(newSpanTag);
				currentTag.appendChild(newInputTag);
			} else {

				var newInputTag = document.createElement("input");
				newInputTag.setAttribute("class",
						"layui-btn layui-btn-normal layui-btn-sm");
				newInputTag.setAttribute("id", "areaSure");
				newInputTag.setAttribute("type", "button");
				newInputTag.setAttribute("value", "确定");
				newInputTag.setAttribute("onclick", "getAreaIdAndLevel()");
				currentTag.appendChild(newInputTag);
			}
		}
	});
}

function getWaterAreaIdAndLevel() {
	// 选中水管区的id
	var id = getCookie("id");
	if (id == "") {
		var syswaterareaCodeInput = document.getElementById("syswaterareaCode");
		syswaterareaCodeInput.value = "";
		return;
	}
	$.ajax({
		url : ctxPath+"/sys_water_area/ajax_findWaterArea",
		data : {
			id : id
		},
		type : "post",
		async : false,// 非异步
		success : function(msg) {
			// alert(JSON.stringify(msg));
			var syswaterareaCodeInput = document
					.getElementById("syswaterareaCode");
			syswaterareaCodeInput.value = msg.waterAreaCode;
		}
	});
}

function getAreaIdAndLevel() {
	// 选中水管区的id
	var id = getCookie("areaId");
	if (id == "") {
		var sysareaCodeInput = document.getElementById("sysareaCode");
		sysareaCodeInput.value = "";
		return;
	}
	$.ajax({
		url : ctxPath+"/sysArea/ajax_findArea",
		data : {
			id : id
		},
		type : "post",
		async : false,// 非异步
		success : function(msg) {
			// //alert(JSON.stringify(msg));
			var sysareaCodeInput = document.getElementById("sysareaCode");
			sysareaCodeInput.value = msg.areaCode;
		}
	});
}
