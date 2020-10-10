/* 相对链接的基准URL */
var curWwwPath = window.document.location.href;
var pathName = window.document.location.pathname;
var pos = curWwwPath.indexOf(pathName);
var localhostPaht = curWwwPath.substring(0,pos);
var projectName = pathName.substring(0,pathName.substr(1).indexOf('/')+1);
var ctxPath = localhostPaht + projectName;
//地图闸门站基础信息vue.js
/*var electronic = new Vue({
	el:'#electronic',
	data:{
		sulices:{},
	},
	methods:{
		
	},
	created:function(){
		var _this = this;
		
	},
});*/

//==============================
	function getEntityMsg(id,name,msg){
		debugger
		removeWaterSiteMessage();
		removeRainSiteMessage();
		removeReservoirSiteMessage();
		removeSluiceWaterSiteMessage();
		removeSluiceWaterSiteMessage();
		removeSiteWaterPivot();
		removeSluicerSiteMessage();
		if(name=="0"){
			$("#water_iframe").empty();
			$("#flow_iframe").empty();
			$("#addFlow_iframe").empty();
			//用来区别是水位站
			setCookie("devicewaterCode",msg.deviceWaterCode); 
			addWaterSiteMessage(id,name,msg);
			//动态加载实时水位模块
			var water_iframe = $("<iframe name='current_water_height_table' frameborder='no' width='100%' height='100%' align='center'></iframe>");
			water_iframe.attr("src",ctxPath+"/map/current_water_height_table");
			$("#water_iframe").append(water_iframe);
			//动态加载实时流量模块
			var flow_iframe = $("<iframe name='current_water_height_table' frameborder='no' width='100%' height='100%' align='center'></iframe>");
			flow_iframe.attr("src",ctxPath+"/map/current_water_flow_table");
			$("#flow_iframe").append(flow_iframe);
			//动态加载累计流量模块
			var addFlow_iframe = $("<iframe name='current_water_height_table' frameborder='no' width='100%' height='100%' align='center'></iframe>");
			addFlow_iframe.attr("src",ctxPath+"/map/current_water_surface_height_table");
			$("#addFlow_iframe").append(addFlow_iframe);
		}else if(name=="1"){
			debugger
			setCookie("siteWaterId",msg.siteWaterId); 
			setCookie("deviceReservoirCode",msg.deviceReservoirCode); 
			addReservoirSiteMessage(id,name,msg);
		}else if(name=="2"){
			addRainSiteMessage(id,name,msg);
		}else if(name=="3"){
			setCookie("canCode",msg.deviceSluiceCode);
			//定时2分钟查一次闸门开度，荷重
			window.setInterval(function Interval(){
				$.post(ctxPath+"/site_sluice_manage/slice_id",{"id":id,"type":2},function(data){
					electronic.sulices = data.data.ssi;
				});
			}, 1000); 
			addSluiceSiteMessage(id,name,msg);
		}else if(name=="001"){
			addSluiceWaterSiteMessage(id,name,msg);
		}else if(name=="002"){
			addSiteWaterPivot(id,name,msg);
		}
	}

function getTenArray(arr){
		for(var j=0;j<arr.length-1;j++){
				for(var k=0;k<arr.length-j-1;k++){
					var a1 = arr[k].currentYear;
				  var a2 = arr[k+1].currentYear;
					if(a1>a2){
						var temp = arr[k];
						arr[k] = arr[k+1];
						arr[k+1] = temp;
					}
				}
			}
		var y = new Array([arr.length]);
		for(var i = 0;i<arr.length;i++){
			y[i] = arr[i].tenFlow;
		}	
		return y;	
	}	
//水位站
function addWaterSiteMessage(id,name,msg){
	debugger
	//显示总title条
    var water_site_current_location = document.getElementById("water_site_current_location");
        water_site_current_location.innerHTML=msg.deviceWaterName+"（"+msg.swiLongitude+"，"+msg.swiLatitude+"，"+msg.swiHeight+"）";
  //实时水位图表
  //基本信息显示
    var deviceWaterName = document.getElementById("deviceWaterName");
    var deviceWaterName_two = document.getElementById("deviceWaterName_two");
	    deviceWaterName.innerHTML=msg.deviceWaterName;
	    deviceWaterName_two.innerHTML=msg.deviceWaterName;
    var deviceWaterCode = document.getElementById("deviceWaterCode");
    var deviceWaterCode_two = document.getElementById("deviceWaterCode_two");
    	deviceWaterCode.innerHTML=msg.deviceWaterCode;
    	deviceWaterCode_two.innerHTML=msg.deviceWaterCode;
    var swiBuildTime = document.getElementById("swiBuildTime");
    var swiBuildTime_two = document.getElementById("swiBuildTime_two");
        swiBuildTime.innerHTML=msg.swiBuildTime;
        swiBuildTime_two.innerHTML=msg.swiBuildTime;
    var swiAddr = document.getElementById("swiAddr");
    var swiAddr_two = document.getElementById("swiAddr_two");
        swiAddr.innerHTML=msg.swiAddr;
        swiAddr_two.innerHTML=msg.swiAddr;

	$('#righteject_site strong').addClass("rightejectthis_site").next("div").animate({height: '+300px'}, "slow");
}
function removeWaterSiteMessage(){
	//alert(1313212);
	$('#righteject_site strong').removeClass("rightejectthis_site").next("div").animate({height: '-300px'}, "slow");
}

//水位站信息x掉
function canalWaterMsg(){
	removeWaterSiteMessage();
}
//雨量站信息x掉
function canalRainMsg(){
	removeRainSiteMessage();
}

//水库信息x掉
function canalReservoirMsg(){
	removeRainSiteMessage();
}

//水厂信息X掉
function siteWaterMsg(){
	debugger
	removeSluiceWaterSiteMessage();
}
//闸门站信息X掉
function canalSluiceMsg(){
	removeSluicerSiteMessage();
}

//水厂支点X掉
function siteWaterPivot(){
	debugger
	removeSiteWaterPivot();
}
//测试方法
function test(){
	alert(111);
}
//雨量站信息框
function addRainSiteMessage(id,name,msg){
	//显示总title条
    var rain_site_current_location = document.getElementById("rain_site_current_location");
        rain_site_current_location.innerHTML=msg.deviceRainName+"（"+msg.sriLongitude+"，"+msg.sriLatitude+"，"+msg.sriHeight+"）";
        
     //雨量站实时数据表
     getCurrentSiteRainTable(msg);
     //累积雨量显示
     getCurrentSiteTotalRainTable(msg)
  //基本信息显示
	 var deviceRainName = document.getElementById("deviceRainName");
          deviceRainName.innerHTML=msg.deviceRainName;
      var deviceRainCode = document.getElementById("deviceRainCode");
      	  deviceRainCode.innerHTML=msg.deviceRainCode;
      var sriBuildTime = document.getElementById("sriBuildTime");
          sriBuildTime.innerHTML=msg.sriBuildTime;
      var sriAddr = document.getElementById("sriAddr");
          sriAddr.innerHTML=msg.sriAddr;
	$('#righteject_rain_site strong').addClass("rightejectthis_rain_site").next("div").animate({height: '+300px'}, "slow");
}


function removeRainSiteMessage(){
	$('#righteject_rain_site strong').removeClass("rightejectthis_rain_site").next("div").animate({height: '-300px'}, "slow");
}

//水库信息框
function addReservoirSiteMessage(id,name,msg){
	//显示总title条
    var reservoir_site_current_location = document.getElementById("reservoir_site_current_location");
        reservoir_site_current_location.innerHTML=msg.deviceReservoirName+"（"+msg.sriLongitude+"，"+msg.sriLatitude+"，"+msg.sriHeight+"）";
        
   //水库水位关系图  
       getReservoirHeightCapacityTable(msg);
        
   //基本信息显示
	var deviceReservoirName = document.getElementById("deviceReservoirName");
          deviceReservoirName.innerHTML=msg.deviceReservoirName;
    var deviceReservoirCode = document.getElementById("deviceReservoirCode");
      	  deviceReservoirCode.innerHTML=msg.deviceReservoirCode;
    var sriReservoirBuildTime = document.getElementById("sriReservoirBuildTime");
          sriReservoirBuildTime.innerHTML=msg.sriBuildTime;
    var sriReservoirAddr = document.getElementById("sriReservoirAddr");
          sriReservoirAddr.innerHTML=msg.sriAddr;
	$('#righteject_reservoir_site strong').addClass("rightejectthis_reservoir_site").next("div").animate({height: '+300px'}, "slow");
}


function removeReservoirSiteMessage(){
	$('#righteject_reservoir_site strong').removeClass("rightejectthis_reservoir_site").next("div").animate({height: '-300px'}, "slow");
}


//闸门站信息框
function addSluiceSiteMessage(id,name,msg){
	//显示总title条
    var water_site_current_location = document.getElementById("sluice_site_current_location");
        water_site_current_location.innerHTML=msg.deviceSluiceName+"（"+msg.ssiLongitude+"，"+msg.ssiLatitude+"，"+msg.ssiHeight+"）";
	
	$('#righteject_sluice_site strong').addClass("rightejectthis_sluicer_site").next("div").animate({height: '+300px'}, "slow");
}


function removeSluicerSiteMessage(){
	$('#righteject_sluice_site strong').removeClass("rightejectthis_sluice_site").next("div").animate({height: '-300px'}, "slow");
}
//水厂信息
function addSluiceWaterSiteMessage(id,name,msg){
	debugger
	//显示总title条
    var reservoir_site_current_location = document.getElementById("water_site");
        /*reservoir_site_current_location.innerHTML=msg.deviceReservoirName+"（"+5656565+"，"+6565656+"，"+655656565+"）";*/
        reservoir_site_current_location.innerHTML="海潮坝水厂"+"（"+100.6526+"，"+38.3859+"，"+2290+"）";
   //水库水位关系图  
      /* getReservoirHeightCapacityTable(6565655);*/
        
   /*//基本信息显示
	var deviceReservoirName = document.getElementById("deviceReservoirName");
          deviceReservoirName.innerHTML=msg.deviceReservoirName;
    var deviceReservoirCode = document.getElementById("deviceReservoirCode");
      	  deviceReservoirCode.innerHTML=msg.deviceReservoirCode;
    var sriReservoirBuildTime = document.getElementById("sriReservoirBuildTime");
          sriReservoirBuildTime.innerHTML=msg.sriBuildTime;
    var sriReservoirAddr = document.getElementById("sriReservoirAddr");
          sriReservoirAddr.innerHTML=msg.sriAddr;*/
	$('#righteject_site_site strong').addClass("rightejecttit_site_site").next("div").animate({height: '+300px'}, "slow");
}
function removeSluiceWaterSiteMessage(){
	
	$('#righteject_site_site strong').removeClass("rightejecttit_site_site").next("div").animate({height: '-300px'}, "slow");
}

//水厂支点信息
function addSiteWaterPivot(id,name,msg){
	debugger
	//显示总title条
    var reservoir_site_current_location = document.getElementById("water_pivot");
        reservoir_site_current_location.innerHTML="友爱减压井"+"（"+100.6526+"，"+38.3859+"，"+2290+"）";
   //水库水位关系图  
       /*getReservoirHeightCapacityTable(6565655);*/
	$('#righteject_pivot strong').addClass("rightejecttit_pivot_site").next("div").animate({height: '+300px'}, "slow");
}
function removeSiteWaterPivot(){
	$('#righteject_pivot strong').removeClass("rightejecttit_pivot_site").next("div").animate({height: '-300px'}, "slow");
}

function showCanal(){
	//菜单切换管理
	$('#righteject_canal strong').addClass("rightejectthis_canal").next("div").animate({height: '+800px'}, "slow");
	/*function addCanal(){

	}*/
	$('.map_button1').css({"background":"#0099cc"});
	$('.map_button2').css({"background":"black"});
	$('.map_button3').css({"background":"black"});
	$('.map_button4').css({"background":"black"});
	$('.map_button5').css({"background":"black"});
	$('.map_video').css({"background":"black"});
	var canalLength = $('.rightejectthis_canal').length;
	var reservoirLength = $('.rightejectthis_reservoir').length;
	var rainLength = $('.rightejectthis_rain').length;
	var sluiceLength = $('.rightejectthis_sluice').length;
	var WaterLength = $(".rightejectthis_water").length;
	var VideoLength = $(".rightthis_video").length;
	if(canalLength==0&&reservoirLength==0&&rainLength==0&&sluiceLength==0&&WaterLength==0&&VideoLength==0){
		addCanal();
	}else if(canalLength>0){
		removeCanal();
		$('.map_button1').css({"background":"black"});
	}else if(reservoirLength>0){
		removeReservoir();
		setTimeout("addCanal()",1000);
	}else if(rainLength>0){
		removeRain();
		setTimeout("addCanal()",1000);
	}else if(sluiceLength>0){
		removeSluice();
		setTimeout("addCanal()",1000);
	}else if(WaterLength>0){
		removeWater();
		setTimeout("addCanal()",1000);
	}else if(VideoLength>0){
		removeVideo();
		setTimeout("addCanal()",1000);
	}	
}

function showReservoir(){
	$('.map_button1').css({"background":"black"});
	$('.map_button2').css({"background":"#0099cc"});
	$('.map_button3').css({"background":"black"});
	$('.map_button4').css({"background":"black"});
	$('.map_button5').css({"background":"black"});
	$('.map_video').css({"background":"black"});
	var canalLength = $('.rightejectthis_canal').length;
	var reservoirLength = $('.rightejectthis_reservoir').length;
	var rainLength = $('.rightejectthis_rain').length;
	var sluiceLength = $('.rightejectthis_sluice').length;
	var WaterLength = $(".rightejectthis_water").length;
	var VideoLength = $(".rightthis_video").length;
	if(canalLength==0&&reservoirLength==0&&rainLength==0&&sluiceLength==0&&WaterLength==0&&VideoLength==0){
		addReservoir();
	}else if(reservoirLength>0){
		removeReservoir();
		$('.map_button2').css({"background":"black"});
	}else if(canalLength>0){
		removeCanal();
		setTimeout("addReservoir()",1000);
	}else if(rainLength>0){
		removeRain();
		setTimeout("addReservoir()",1000);
	}else if(sluiceLength>0){
		removeSluice();
		setTimeout("addReservoir()",1000);
	}else if(WaterLength>0){
		removeWater();
		setTimeout("addReservoir()",1000);
	}else if(VideoLength>0){
		removeVideo();
		setTimeout("addReservoir()",1000);
	}		
}

function showRainSite(){
	$('.map_button1').css({"background":"black"});
	$('.map_button2').css({"background":"black"});
	$('.map_button3').css({"background":"#0099cc"});
	$('.map_button4').css({"background":"black"});
	$('.map_button5').css({"background":"black"});
	$('.map_video').css({"background":"black"});
	var canalLength = $('.rightejectthis_canal').length;
	var reservoirLength = $('.rightejectthis_reservoir').length;
	var rainLength = $('.rightejectthis_rain').length;
	var sluiceLength = $('.rightejectthis_sluice').length;
	var WaterLength = $(".rightejectthis_water").length;
	var VideoLength = $(".rightthis_video").length;
	if(canalLength==0&&reservoirLength==0&&rainLength==0&&sluiceLength==0&&WaterLength==0&&VideoLength==0){
		addRain();
	}else if(rainLength>0){
		removeRain();
		$('.map_button3').css({"background":"black"});
	}else if(canalLength>0){
		removeCanal();
		setTimeout("addRain()",1000);
	}else if(reservoirLength>0){
		removeReservoir();
		setTimeout("addRain()",1000);
	}else if(sluiceLength>0){
		removeSluice();
		setTimeout("addRain()",1000);
	}else if(WaterLength>0){
		removeWater();
		setTimeout("addRain()",1000);
	}else if(VideoLength>0){
		removeVideo();
		setTimeout("addRain()",1000);
	}	
}

 function showSluiceSite(){
	 debugger
 	$('.map_button1').css({"background":"black"});
	$('.map_button2').css({"background":"black"});
	$('.map_button3').css({"background":"black"});
	$('.map_button4').css({"background":"#0099cc"});
	$('.map_button5').css({"background":"black"});
	$('.map_video').css({"background":"black"});
	var canalLength = $('.rightejectthis_canal').length;
	var reservoirLength = $('.rightejectthis_reservoir').length;
	var rainLength = $('.rightejectthis_rain').length;
	var sluiceLength = $('.rightejectthis_sluice').length;
	var WaterLength = $(".rightejectthis_water").length;
	var VideoLength = $(".rightthis_video").length;
	if(canalLength==0&&reservoirLength==0&&rainLength==0&&sluiceLength==0&&WaterLength==0&&VideoLength==0){
		addSluice();
	}else if(sluiceLength>0){
		removeSluice();
		$('.map_button4').css({"background":"black"});
	}else if(canalLength>0){
		removeCanal();
		setTimeout("addSluice()",1000);
	}else if(reservoirLength>0){
		removeReservoir();
		setTimeout("addSluice()",1000);
	}else if(rainLength>0){
		removeRain();
		setTimeout("addSluice()",1000);
	}else if(WaterLength>0){
		removeWater();
		setTimeout("addSluice()",1000);
	}else if(VideoLength>0){
		removeVideo();
		setTimeout("addSluice()",1000);
	}	
 	


 } 
 //供水站菜单
function showWaterSite(){
	debugger
	$('.map_button1').css({"background":"black"});
	$('.map_button2').css({"background":"black"});
	$('.map_button3').css({"background":"black"});
	$('.map_button4').css({"background":"black"});
	$('.map_button5').css({"background":"#0099cc"});
	$('.map_video').css({"background":"black"});
	var canalLength = $('.rightejectthis_canal').length;
	var reservoirLength = $('.rightejectthis_reservoir').length;
	var rainLength = $('.rightejectthis_rain').length;
	var sluiceLength = $('.rightejectthis_sluice').length;
	var WaterLength = $(".rightejectthis_water").length;
	var VideoLength = $(".rightthis_video").length;
	if(canalLength==0&&reservoirLength==0&&rainLength==0&&sluiceLength==0&&WaterLength==0&&VideoLength==0){
		addWater();
	}else if(sluiceLength>0){
		removeSluice();
		setTimeout("addWater()",1000);
	}else if(canalLength>0){
		removeCanal();
		setTimeout("addWater()",1000);
	}else if(reservoirLength>0){
		removeReservoir();
		setTimeout("addWater()",1000);
	}else if(rainLength>0){
		removeRain();
		setTimeout("addWater()",1000);
	}else if(WaterLength>0){
		removeWater();
		$('.map_button5').css({"background":"black"});
	}else if(VideoLength>0){
		removeVideo();
		setTimeout("addWater()",1000);
	}		
}

//视频站菜单
function videoSite(){
	debugger
	$('.map_button1').css({"background":"black"});
	$('.map_button2').css({"background":"black"});
	$('.map_button3').css({"background":"black"});
	$('.map_button4').css({"background":"black"});
	$('.map_button5').css({"background":"black"});
	$('.map_video').css({"background":"#0099cc"});
	var canalLength = $('.rightejectthis_canal').length;
	var reservoirLength = $('.rightejectthis_reservoir').length;
	var rainLength = $('.rightejectthis_rain').length;
	var sluiceLength = $('.rightejectthis_sluice').length;
	var WaterLength = $(".rightejectthis_water").length;
	var VideoLength = $(".rightthis_video").length;
	if(canalLength==0&&reservoirLength==0&&rainLength==0&&sluiceLength==0&&WaterLength==0&&VideoLength==0){
		addVideo();
	}else if(sluiceLength>0){
		removeSluice();
		setTimeout("addVideo()",1000);
	}else if(canalLength>0){
		removeCanal();
		setTimeout("addVideo()",1000);
	}else if(reservoirLength>0){
		removeReservoir();
		setTimeout("addVideo()",1000);
	}else if(rainLength>0){
		removeRain();
		setTimeout("addVideo()",1000);
	}else if(WaterLength>0){
		removeWater();
		setTimeout("addVideo()",1000);
	}else if(VideoLength>0){
		removeVideo();
		$('.map_video').css({"background":"black"});
	}	
}

//菜单切换管理
function addCanal(){
	$('#righteject_canal strong').addClass("rightejectthis_canal").next("div").animate({height: '+800px'}, "slow");
}
function removeCanal(){
	$('#righteject_canal strong').removeClass("rightejectthis_canal").next("div").animate({height: '-800px'}, "slow");
}

function addReservoir(){
	$('#righteject_reservoir strong').addClass("rightejectthis_reservoir").next("div").animate({height: '+800px'}, "slow");
}
function removeReservoir(){
	$('#righteject_reservoir strong').removeClass("rightejectthis_reservoir").next("div").animate({height: '-800px'}, "slow");
}

function addRain(){
	$('#righteject_rain strong').addClass("rightejectthis_rain").next("div").animate({height: '+800px'}, "slow");
}
function removeRain(){
	$('#righteject_rain strong').removeClass("rightejectthis_rain").next("div").animate({height: '-800px'}, "slow");
}

function addSluice(){
	$('#righteject_sluice strong').addClass("rightejectthis_sluice").next("div").animate({height: '+800px'}, "slow");
}
function removeSluice(){
	$('#righteject_sluice strong').removeClass("rightejectthis_sluice").next("div").animate({height: '-800px'}, "slow");
}
function addWater(){
	$('#righteject_water strong').addClass("rightejectthis_water").next("div").animate({height: '+800px'}, "slow");
}
function removeWater(){
	$('#righteject_water strong').removeClass("rightejectthis_water").next("div").animate({height: '-800px'}, "slow");
}
function addVideo(){
	$('#right_video strong').addClass("rightthis_video").next("div").animate({height: '+800px'}, "slow");
}
function removeVideo(){
	$('#right_video strong').removeClass("rightthis_video").next("div").animate({height: '-800px'}, "slow");
}



	//实时雨量关系代码段
	function getCurrentSiteRainTable(msg){
		$.ajax({
			url:ctxPath+"/rainDynamicInfo/current_dynamic_info",
			type: "post",
			data: {devicerainCode:msg.deviceRainCode},
			async: false,//非异步
			success: function(msg){
			
					//alert(JSON.stringify(msg) );
					var a = new Array([msg.length]);
					var b = new Array([msg.length]);
					for(var i=0;i<msg.length;i++){
						b[i] = msg[i].totalCapacity;
						a[i] = msg[i].timeName;
					}
					//var reservoirName = msg[0].
					var dom = document.getElementById("current_site_rain_table");
					var myChart = echarts.init(dom);
					var app = {};
					option = null;
					option = {
						
						tooltip: {//这部分与提示框有关，与Y坐标自适应无关
							trigger: 'axis',
							formatter: function (params) {//需要接收一个参数数组
								params = params[0];
								return '时间:' + params.name+'--降雨:'+params.value+'mm';
							},
							axisPointer: {
								animation: true
							}
						},
							
					    xAxis: {
					        type: 'category',
					        data: a,
					        boundaryGap: false,
					         axisLine:{
					         	lineStyle:{
					         		color:'#FFFFFF'
					         	}
					         }
					    },
					    yAxis: {
					        type: 'value',
					         axisLine:{
					         	lineStyle:{
					         		color:'#FFFFFF'
					         	}
					         }
					    },
					    series: [{
					        data: b,
					        type: 'line'
					    }]
					};
					
					if (option && typeof option === "object") {
					    myChart.setOption(option, true);
					}
				}
		});
	}
	
	
	//累积雨量
	function getCurrentSiteTotalRainTable(msg){
		$.ajax({
			url:ctxPath+"/rainDynamicInfo/current_site_total_rain",
			type: "post",
			data: {devicerainCode:msg.deviceRainCode},
			async: false,//非异步
			success: function(msg){
			
					//alert(JSON.stringify(msg) );
					var a = new Array([msg.length]);
					var b = new Array([msg.length]);
					for(var i=0;i<msg.length;i++){
						b[i] = msg[i].totalCapacity;
						a[i] = msg[i].timeName;
					}
					//var reservoirName = msg[0].
					var dom = document.getElementById("current_site_total_rain_table");
					var myChart = echarts.init(dom);
					var app = {};
					option = null;
					option = {
						
						tooltip: {//这部分与提示框有关，与Y坐标自适应无关
							trigger: 'axis',
							formatter: function (params) {//需要接收一个参数数组
								params = params[0];
								return '时间:' + params.name+'--降雨:'+params.value+'mm';
							},
							axisPointer: {
								animation: true
							}
						},
							
					    xAxis: {
					        type: 'category',
					        data: a,
					        boundaryGap: false,
					         axisLine:{
					         	lineStyle:{
					         		color:'#FFFFFF'
					         	}
					         }
					    },
					    yAxis: {
					        type: 'value',
					         axisLine:{
					         	lineStyle:{
					         		color:'#FFFFFF'
					         	}
					         }
					    },
					    series: [{
					        data: b,
					        type: 'line'
					    }]
					};
					
					if (option && typeof option === "object") {
					    myChart.setOption(option, true);
					}
				}
		});
	
	
	}
	
	//current_site_reservoir_table
	//实时水位关系表
	function getCurrentReservoirTable(){
	
		
	
	}
	//水库水位库容关系表数据请求
	function getReservoirHeightCapacityTable(msg){
		$.ajax({
				url:ctxPath+"/reservoir_capacity/get_relation_data",
				type: "post",
				data: {reservoirCode:msg.deviceReservoirCode},
				async: false,//非异步
				success: function(msg){
					//alert(JSON.stringify(msg) );
					var a = new Array([msg.length]);
					var b = new Array([msg.length]);
					for(var i=0;i<msg.length;i++){
						a[i] = msg[i].waterHightLevel;
						b[i] = msg[i].volume;
					}
					//var reservoirName = msg[0].
					var dom = document.getElementById("reservoir_height_capacity_table");
					var myChart = echarts.init(dom);
					var app = {};
					option = null;
					option = {
						
						tooltip: {//这部分与提示框有关，与Y坐标自适应无关
							trigger: 'axis',
							formatter: function (params) {//需要接收一个参数数组
								params = params[0];
								return '水位:' + params.name+'米'+'--库容:'+params.value+'万m3';
							},
							axisPointer: {
								animation: true
							}
						},
							
					    xAxis: {
					        type: 'category',
					        data: a,
					         axisLine:{
					         	lineStyle:{
					         		color:'#FFFFFF'
					         	}
					         }
					    },
					    yAxis: {
					        type: 'value',
					         axisLine:{
					         	lineStyle:{
					         		color:'#FFFFFF'
					         	}
					         }
					    },
					    series: [{
					        data: b,
					        type: 'line'
					    }]
					};
					
					if (option && typeof option === "object") {
					    myChart.setOption(option, true);
					}
				}
				
			});
	}
