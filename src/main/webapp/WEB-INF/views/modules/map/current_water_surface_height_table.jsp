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
							url:"${ctx}/data_sheet/addUpData",
							data: {devicewaterCode:devicewaterCode},
							type: "post",
							async: false,//非异步
							success: function(msg){
								//alert(JSON.stringify(msg.january));
								consumedWater.push(msg.january); 
								consumedWater.push(msg.february);
								consumedWater.push(msg.march);
								consumedWater.push(msg.april);
								consumedWater.push(msg.may);
								consumedWater.push(msg.june);
								consumedWater.push(msg.july);
								consumedWater.push(msg.august);
								consumedWater.push(msg.september);
								consumedWater.push(msg.october);
								consumedWater.push(msg.november);
								consumedWater.push(msg.december);
					            
					            var option = {
					                    tooltip: {},
					                    legend: {
					                        data:['累计水量']
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
					            	        axisTick: {
					            	            alignWithLabel: true
					            	        },
					                        data: ['一月','二月','三月','四月','五月','六月','七月','八月','九月','十月','十一月','十二月']
					                    }],
					                    color : ['#ff7f50','#87cefa', '#61a0a8', '#d48265', '#91c7ae','#749f83',  '#ca8622', '#bda29a','#6e7074', '#546570', '#c4ccd3'],
					                    yAxis: [{
											type: 'value',
					            	        axisLine: { //坐标轴线条相关设置(颜色等)
					            	            lineStyle: {
					            	                color: '#babced' // y轴颜色
					            	            }
					            	        },
					            	       /*  axisLabel: {
					            	            formatter: '{value}',
					            	            textStyle: {
					            	                color: '#babced'
					            	            }
					            	        }, */
					            	        splitLine: {
					            	            lineStyle: {
					            	                color: '#57617B' //分隔线颜色设置
					            	            }
					            	        }
										}],
										itemStyle: {
								            normal: {
								                // 随机显示
								                //color:function(d){return "#"+Math.floor(Math.random()*(256*256*256-1)).toString(16);}
								              
								                // 定制显示（按顺序）
								                color: function(params) { 
								                    var colorList = ['#C33531','#EFE42A','#64BD3D','#EE9201','#29AAE3', '#B74AE5','#0AAF9F','#E89589','#16A085','#4A235A','#C39BD3 ','#F9E79F','#BA4A00','#ECF0F1','#616A6B','#EAF2F8','#4A235A','#3498DB' ]; 
								                    return colorList[params.dataIndex] 
								                },
								                label: {
								                	show: false
								                	} 
								            },
								        },
					                    series: [{
					                        name: '累计水量',
					                        type: 'bar',
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
								url:"${ctx}/data_sheet/addUpData",//拿到前360秒的数据
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
