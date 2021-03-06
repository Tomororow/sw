<%@ page language="java" contentType="text/html; charset=utf-8" pageEncoding="utf-8"%>
<%@ include file="/WEB-INF/views/base.jsp"%>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
  <head>
    <base href="<%=basePath%>">
    
    <title>My JSP 'current_sulice_water_table.jsp' starting page</title>
    
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
			var a=0;
            var myChart = echarts.init(document.getElementById('main'));
			//这是一个产生随机数的函数，相对独立
			 function randomData(num) {//返回的是json格式的数据，name对应横坐标，是时间，value又是一个数组
				now = new Date(+now + oneDay);
				value =num;
				var minute=now.getMinutes()<10?'0'+now.getMinutes():now.getMinutes();
				var second=now.getSeconds()<10?'0'+now.getSeconds():now.getSeconds();
				
				return { 
					name: now.toString(),
					value: [[now.getFullYear(), now.getMonth(), now.getDate()].join('/')+" "+[now.getHours(),minute,second].join(':'),value]
				}
				console.log("value:"+value);
			} 
			var data = [];
			var data_test;
			var now1 = new Date();
			var oneDay1 = 120*1000;
			var now = new Date(+now1-oneDay1);
			var oneDay = 1000;
			//更换水位站是的数据
			var now2 = new Date(+now1+1000);
//			var twoSecond = 2 * 1000;
			var value = 1000;
			/* for (var i = 0; i < 120; i++) {
				data.push(randomData());//先在其中放1000个数据
			} */
			option = {
				tooltip: {//这部分与提示框有关，与Y坐标自适应无关
					trigger: 'axis',
					formatter: function (params){//需要接收一个参数数组(格式化以坐标显示的内容)
						params = params[0];
						var date = new Date(params.name );//这个就是name，对应的是时间
						return date.getHours()-1 + '时'+date.getMinutes()+ '分'+  date.getSeconds()+'秒       水位:' + params.value[1]+'米';
					},
					axisPointer: {//坐标轴指示器
						animation: true//坐标轴触发有效
					}
				},
				xAxis: {//横坐标
					type: 'time',//显示方式为时间
					splitLine: {
						show: false//分割线（是否显示）
					},
					axisLine:{
		         		lineStyle:{//坐标轴线
		         			color:'#FFFFFF'
		         		}
		         	}
				},
				 yAxis: { //纵坐标
					type: 'value', //
					splitLine: {
						show: true//代表横向分隔线
					},
					axisLine:{
		         		lineStyle:{//坐标轴线
		         			color:'#FFFFFF'
		         		}
		         	},	
		         	/* axisLabel: {           // 坐标轴文本标签，详见axis.axisLabel
		                show: true,
		                interval: 'auto',
		                rotate: 0,
		                margin: 8,
		                // formatter: null,
		                textStyle: {       // 其余属性默认使用全局文本样式，详见TEXTSTYLE
		                    color: '#333'
		                }
		            }, */
				},
				 series: [{
					name: '模拟数据',
					type: 'line',
					showSymbol: false,
					hoverAnimation: false,
					data: data
				}], 
			};
	
			myChart.setOption(option);
			setInterval(function () {
				getCycleDate();
			}, 100000);
			
			var lastDevicewaterCode="";
			function getCycleDate(){
				
				//alert(1);
				var devicewaterCode=getCookie("canCode");
				//var time = new Date();
				//alert(Date.parse(time));
				//alert(1111);
				if(devicewaterCode!=null){//点击图标
					if(lastDevicewaterCode==""){
						//alert(1);
						$.ajax({
							url:"${ctx}/site_water_dynamic_info/cycle_data",//拿到前360秒的数据
							data: {devicewaterCode:devicewaterCode,time:120,type:1},
							type: "post",
							async: false,//非异步
							success: function(msg){
								//alert(JSON.stringify(msg));
								a=1;
								for(var i=0;i<msg.length;i++){
									//data.shift();
									//alert(msg[i].totalCapacity);
									data.push(randomData(msg[i].totalCapacity));
								}
								//alert(JSON.stringify(msg));
							}
						}); 
						
					}else{
						if(devicewaterCode==lastDevicewaterCode){
														
						}else{//第二次点击图标
							//alert(2);
							$.ajax({
								url:"${ctx}/site_water_dynamic_info/cycle_data",//拿到前360秒的数据
								data: {devicewaterCode:devicewaterCode,time:120,type:1}, 	
								type: "post",
								async: false,//非异步
								success: function(msg){
									//alert(JSON.stringify(msg));
									//data=[];
									for(var i=0;i<msg.length;i++){
										//将数据库里面查出的站点的历史数据把date里面的数据替换
										data[data.length-(msg.length-i)].value[1]=msg[i].totalCapacity;
										//data.push(randomData(msg[i].totalCapacity));
										//data.shift();
									}
									//alert(JSON.stringify(msg) );
								}
							  }); 
						}
					}
					lastDevicewaterCode=devicewaterCode;
				}else{
					 clearInterval() ;
				} 
				//只改下面这段代码就行，主要还是修改数据来源函数，把随机产生变成服务器获得
				var current;
				$.ajax({
					url:"${ctx}/siteSluiceDynamicInfo/current",
					data: {canCode:devicewaterCode,type:1}, 	
					type: "post",
					async: false,//非异步
					success: function(waterLevel){
				       data.shift();
				       data_test=randomData(waterLevel);
				       data.push(data_test);
				       myChart.setOption({
				         series: [{
				             data: data
				         }]
				      });
					}
			   }); 
				
				
			}		
	</script>
</body>
</html>
