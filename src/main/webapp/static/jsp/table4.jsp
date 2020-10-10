<%@ page language="java" contentType="text/html; charset=utf-8" pageEncoding="utf-8"%>
<%@ include file="/WEB-INF/views/base.jsp"%>

 var dom = document.getElementById("container4");
	 var myChart = echarts.init(dom);
	
	 function randomData(num) {//返回的是json格式的数据，name对应横坐标，是时间，value又是一个数组
			now = new Date(+now + oneDay);
//			console.log(now);
			value =num;
			var minute=now.getMinutes()<10?'0'+now.getMinutes():now.getMinutes();
			var second=now.getSeconds()<10?'0'+now.getSeconds():now.getSeconds();
			return { 
				name: now.toString(),
				value: [
					[now.getFullYear(), now.getMonth()+1, now.getDate()].join('/')+" "+[now.getHours()-1,minute,second].join(':'),
					value
				]
			}
		}

		var data = [];
		var data_test;
		var now = new Date();
		var oneDay =3600;
//		var twoSecond = 2 * 1000;
		var value = 100;
		for (var i = 0; i < 1000; i++) {
			data.push(randomData());//先在其中放1000个数据
		}

		option = {
			title: {
				left: 'center',
				text: '实时水位动态图'
			},
			tooltip: {//这部分与提示框有关，与Y坐标自适应无关
				trigger: 'axis',
				formatter: function (params) {//需要接收一个参数数组
					params = params[0];
					var date = new Date(params.name);//这个就是name，对应的是时间
					return date.getHours()-1 + '时'+date.getMinutes()+ '分'+  date.getSeconds()+'秒       水位:' + params.value[1]+'米';
				},
				axisPointer: {
					animation: true
				}
			},
	     xAxis: {
	         type: 'time',
	         splitLine: {
	             show: false,
	         }
	     },
	     yAxis: {
	         type: 'value',
	         boundaryGap: [0, '100%'],
	         splitLine: {
	             show: true,
	         }
	     },
	     series: [{
	         name: '模拟数据',
	         type: 'line',
	         showSymbol: false,
	         hoverAnimation: false,
	         data: data
	     }]
	 };

		
		
	 setInterval(function () {
	 		var current;
	 
			$.ajax({
			url:"${ctx}/site_water_dynamic_info/current",
			data: {devicewaterCode:'111'},
			type: "post",
			async: false,//非异步
			success: function(msg){
				//alert("aaa");
				//alert(JSON.stringify(msg) );
				current=msg.waterLevel;
			}
		}); 
	 
	 	//只改下面这段代码就行，主要还是修改数据来源函数，把随机产生变成服务器获得
				data.shift();
				data_test=randomData(current);
				//alert(JSON.stringify(data_test));
				//console.log(JSON.stringify(data_test));
				data.push(data_test);

	     myChart.setOption({
	         series: [{
	             data: data
	         }]
	     });
	 },1000);
	 
	 if (option && typeof option === "object") {
	     myChart.setOption(option, true);
	 }