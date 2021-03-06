<%@ page language="java" contentType="text/html; charset=utf-8" pageEncoding="utf-8"%>
<%@ include file="/WEB-INF/views/base.jsp"%>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
  <head>
    <base href="<%=basePath%>">
    
    <title>My JSP 'current_water_height_table.jsp' starting page</title>
    
	<meta http-equiv="pragma" content="no-cache">
	<meta http-equiv="cache-control" content="no-cache">
	<meta http-equiv="expires" content="0">    
	<meta http-equiv="keywords" content="keyword1,keyword2,keyword3">
	<meta http-equiv="description" content="This is my page">
	<script type="text/javascript" src="http://echarts.baidu.com/gallery/vendors/echarts/echarts.min.js"></script>
<script type="text/javascript" src="http://echarts.baidu.com/gallery/vendors/echarts-gl/echarts-gl.min.js"></script>
<script type="text/javascript" src="http://echarts.baidu.com/gallery/vendors/echarts-stat/ecStat.min.js"></script>
<script type="text/javascript" src="http://echarts.baidu.com/gallery/vendors/echarts/extension/dataTool.min.js"></script>
<script type="text/javascript" src="http://echarts.baidu.com/gallery/vendors/echarts/map/js/china.js"></script>
<script type="text/javascript" src="http://echarts.baidu.com/gallery/vendors/echarts/map/js/world.js"></script>
<script type="text/javascript" src="http://api.map.baidu.com/api?v=3.0&ak=BqBbhtroCdoQtxOj1yxrr8NPvPlkMKst"></script>
<script type="text/javascript" src="http://echarts.baidu.com/gallery/vendors/echarts/extension/bmap.min.js"></script>
<script type="text/javascript" src="http://echarts.baidu.com/gallery/vendors/simplex.js"></script>
<script type="text/javascript" src="${ctxstc}/jquery/jquery-1.11.1.min.js"></script>
<script src="${ctxstc}/js/custom/water_area_cook.js"></script>
    
  </head>
  
  <body>
    <!-- 为ECharts准备一个具备大小（宽高）的Dom -->
    <div id="main" style="margin-left:0px;margin-top:-30px;height: 280px;width:100%"></div>
	<script>
			
            var myChart = echarts.init(document.getElementById('main'));
            var frontOneHour = new Date(new Date().getTime());//获取到的当前时间戳
            //js输出日期格式化
            Date.prototype.format = function (format) {
		           var args = {
		               "M+": this.getMonth() + 1,
		               "d+": this.getDate(),
		               "h+": this.getHours(),
		               "m+": this.getMinutes(),
		               "s+": this.getSeconds(),
		               "q+": Math.floor((this.getMonth() + 3) / 3),  //quarter
		               "S": this.getMilliseconds()
		           };
		           if (/(y+)/.test(format))
		               format = format.replace(RegExp.$1, (this.getFullYear() + "").substr(4 - RegExp.$1.length));
		           for (var i in args) {
		               var n = args[i];
		               if (new RegExp("(" + i + ")").test(format))
		                   format = format.replace(RegExp.$1, RegExp.$1.length == 1 ? n : ("00" + n).substr(("" + n).length));
		           }
		           return format;
		       };
            var dangQian=(new Date().format("hh:mm:ss"));//当前时间
            var front5Minutes = new Date(new Date().getTime() - 1 * 60 * 5 * 1000).format("hh:mm:ss");//当前时间的前5分钟
            var front10Minutes = new Date(new Date().getTime() - 1 * 60 * 10 * 1000).format("hh:mm:ss");//当前时间的前10分钟
            var front15Minutes = new Date(new Date().getTime() - 1 * 60 * 15 * 1000).format("hh:mm:ss");//当前时间的前15分钟
            var front20Minutes = new Date(new Date().getTime() - 1 * 60 * 20 * 1000).format("hh:mm:ss");//当前时间的前20分钟
            var front25Minutes = new Date(new Date().getTime() - 1 * 60 * 25 * 1000).format("hh:mm:ss");//当前时间的前25分钟
            var front30Minutes = new Date(new Date().getTime() - 1 * 60 * 30 * 1000).format("hh:mm:ss");//当前时间的前30分钟
            var front35Minutes = new Date(new Date().getTime() - 1 * 60 * 35 * 1000).format("hh:mm:ss");//当前时间的前30分钟
            var front40Minutes = new Date(new Date().getTime() - 1 * 60 * 40 * 1000).format("hh:mm:ss");//当前时间的前40分钟
            var front45Minutes = new Date(new Date().getTime() - 1 * 60 * 45 * 1000).format("hh:mm:ss");//当前时间的前45分钟
            var front50Minutes = new Date(new Date().getTime() - 1 * 60 * 50 * 1000).format("hh:mm:ss");//当前时间的前50分钟
            var front55Minutes = new Date(new Date().getTime() - 1 * 60 * 55 * 1000).format("hh:mm:ss");//当前时间的前55分钟
            var front60Minutes = new Date(new Date().getTime() - 1 * 60 * 60 * 1000).format("hh:mm:ss");//当前时间的前60分钟
            window.onload=function(){ 
                // 初始化内容 
                getCycleDate();
            }
			
			var lastDevicewaterCode="";
			var consumedWater=[];
			function getCycleDate(){
				var devicewaterCode=getCookie("devicewaterCode");
				if(devicewaterCode!=null){//点击图标
					if(lastDevicewaterCode==""){
						$.ajax({
							url:"${ctx}/site_water_dynamic_info/cycleData",//拿到前360秒的数据
							data: {devicewaterCode:devicewaterCode},
							type: "post",
							async: false,//非异步
							success: function(msg){
								//alert(JSON.stringify(msg.waterLevel));
								for(var i=0; i<msg.length; i++){
									//alert(msg[i].waterLevel);
									consumedWater.push(msg[i].waterLevel); 
								}

					            
					            var option = {
					                    tooltip: {},
					                    legend: {
					                        data:['实时水位']
					                    },
					                    xAxis: [{
										axisLabel: {
					            	            show: true,
					            	            textStyle: {
					            	                color: '#8a94a3' // 坐标字体颜色
					            	            },
					            	            rotate: 20 // 坐标倾斜角度
					            	        },
					            	        axisLine: {
					            	            lineStyle: {
					            	                color: '#bdc7da', // x坐标轴颜色
					            	            }
					            	        },
					                        data: [front60Minutes,front55Minutes,front50Minutes,front45Minutes,front40Minutes,front35Minutes,front30Minutes,front25Minutes , front20Minutes, front15Minutes, front10Minutes, front5Minutes, dangQian]
					                    }],
					                    yAxis: {
											type: 'value',
					            	        axisLine: { //坐标轴线条相关设置(颜色等)
					            	            lineStyle: {
					            	                color: '#babced' // y轴颜色
					            	            }
					            	        },
					            	        axisLabel: {
					            	            formatter: '{value}',
					            	            textStyle: {
					            	                color: '#babced'
					            	            }
					            	        },
					            	        splitLine: {
					            	            lineStyle: {
					            	                color: '#57617B' //分隔线颜色设置
					            	            }
					            	        }
										},
					                    series: [{
					                        name: '实时水位',
					                        type: 'line',
					                        data: consumedWater
					                    }]
					                };
					            	
								myChart.setOption(option);
							}
						}); 
						
					}else{
						if(devicewaterCode==lastDevicewaterCode){
														
						}else{//第二次点击图标
							alert(2);
							$.ajax({
								url:"${ctx}/site_water_dynamic_info/cycleData",//拿到前360秒的数据
								data: {devicewaterCode:devicewaterCode}, 	
								type: "post",
								async: false,//非异步
								success: function(msg){
									//alert(JSON.stringify(msg));
									
								}
							  }); 
						}
					}
					lastDevicewaterCode=devicewaterCode;
				}else{
					 clearInterval() ;
				} 
				
			}	
			
			
			
	</script>
</body>
</html>
