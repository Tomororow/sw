/* 相对链接的基准URL */
var curWwwPath = window.document.location.href;
var pathName = window.document.location.pathname;
var pos = curWwwPath.indexOf(pathName);
var localhostPaht = curWwwPath.substring(0,pos);
var projectName = pathName.substring(0,pathName.substr(1).indexOf('/')+1);
var ctxPath = localhostPaht + projectName;
/* 树结构数据 */
var zNodes;

$(function (){
	// 页面初始化加载下拉框站点信息
	$("#getStationById").empty();
	$.ajax({
		url:ctxPath+"/rainDynamicInfo/getAllRainName",
		type: "GET",
		async: false,//非异步
		success: function(data){
			if(data != null && data != ''){
				var htmltv = "<select id='selStation' class='form-control' onchange='getMonitorByStation()'>";
				htmltv += "<option value=''>--请选择雨量站点--</option>";
				for(var i=0; i<data.length; i++) {
					htmltv += "<option value='"+data[i].deviceRainCode+"'>"+data[i].deviceRainName+"</option>";
				}
				htmltv += "</select>";
				$("#getStationById").append(htmltv);
			}
		}
	});
	
	// 初始化树菜单
	showNodes();
	$.fn.zTree.init($("#areaZtree"), setting, zNodes);
});

/**
 * 树菜单配置
 */
var setting = {
    view: {
        selectedMulti: false	// 设置是否允许同时选中多个节点
    },
    check: {
        enable: true	// 设置zTree节点上是否显示CheckBox
    },
    data: {
        simpleData: {
            enable: true	// 使用简单数据格式
        }
    }
};

/**
 * 树菜单点击事件
 * @param id
 */
function getRainSiteByArea(id){
	$("#getStationById").empty();
	$.ajax({
		url:ctxPath+"/rainDynamicInfo/getRainNameByAreaId",
		data:{
			areaId:id
		},
		type: "GET",
		async: false,//非异步
		success: function(data){
			if(data != null && data != ''){
				var htmltv = "<select id='selStation' class='form-control' onchange='getMonitorByStation()'>";
					htmltv += "<option value=''>--请选择雨量站点--</option>";
				for(var i=0; i<data.length; i++) {
					htmltv += "<option value='"+data[i].deviceRainCode+"'>"+data[i].deviceRainName+"</option>";
				}
				htmltv += "</select>";
				$("#getStationById").append(htmltv);
			}
		}
	});
}

/**
 * 下拉框选项改变 获取数据生成动态图表
 */
function getMonitorByStation(){
	// 获取下拉框选中值
	var options=$("#selStation option:selected");
	var stationCode = options.val();
	// 初始化图表
	var myChart = echarts.init(document.getElementById('rainChart'));
	// 显示加载
	myChart.showLoading();
	var rainfalls = [];
	var stationName;
	$.ajax({
		url:ctxPath+"/rainDynamicInfo/getDynamicInfoByCode",
		data:{
			stationCode:stationCode
		},
		type: "GET",
		async: false,//非异步
		success: function(data){
			// 隐藏加载
			myChart.hideLoading();
			for (var i = 0; i < data.length; i++) {
				rainfalls.push(data[i].timeRainfall);
				stationName = data[0].deviceRainName;
			}
			// 图表参数设置
			chartOption = {
				title: {
		            text: stationName+'实时雨情折线图',
		            left: "center",
	                right: "center"
		        },
		        tooltip: {
		        	trigger: 'axis',
		            formatter: "{b}: {c}毫米"
		        },
			    xAxis: {
			        type: 'category',
			        boundaryGap: false,
			        data: ['5分钟降雨', '10分钟降雨', '30分钟降雨', '1小时降雨', '3小时降雨', '6小时降雨', '12小时降雨', '24小时降雨']
			    },
			    yAxis: {
			        type: 'value',
		        	axisLabel: {
		                formatter: '{value} mm'
		            }
			    },
			    series: [{
			        data: rainfalls,
			        type: 'line'
			    }]
			};
			myChart.setOption(chartOption);
			
			// 表格形式
			$("#dynamicRainList").empty();
			//for(var j=0; j<data.length; j++){
				var currentTag = document.getElementById("dynamicRainList");
					var newTrTag = document.createElement("tr");
						var newTdTag1 = document.createElement("td");
							newTdTag1.innerHTML=data[0].deviceRainName;
							
						var newTdTag2 = document.createElement("td");
							newTdTag2.innerHTML=data[0].timeRainfall;
							
						var newTdTag3 = document.createElement("td");
							newTdTag3.innerHTML=data[1].timeRainfall;
							
						var newTdTag4 = document.createElement("td");
							newTdTag4.innerHTML=data[2].timeRainfall;
						
						var newTdTag5 = document.createElement("td");
							newTdTag5.innerHTML=data[3].timeRainfall;
							
						var newTdTag6 = document.createElement("td");
							newTdTag6.innerHTML=data[4].timeRainfall;
							
						var newTdTag7 = document.createElement("td");
							newTdTag7.innerHTML=data[5].timeRainfall;
							
						var newTdTag8 = document.createElement("td");
							newTdTag8.innerHTML=data[6].timeRainfall;
							
						var newTdTag9 = document.createElement("td");
							newTdTag9.innerHTML=data[7].timeRainfall;
							
						newTrTag.appendChild(newTdTag1);
						newTrTag.appendChild(newTdTag2);
						newTrTag.appendChild(newTdTag3);
						newTrTag.appendChild(newTdTag4);
						newTrTag.appendChild(newTdTag5);
						newTrTag.appendChild(newTdTag6);
						newTrTag.appendChild(newTdTag7);
						newTrTag.appendChild(newTdTag8);
						newTrTag.appendChild(newTdTag9);
						
					currentTag.appendChild(newTrTag);
			//};
		}
	});
}