
 var dom = document.getElementById("container");
	 var myChart = echarts.init(dom);
	
	 function randomData() {//返回的是json格式的数据，name对应横坐标，是时间，value又是一个数组
			now = new Date(+now + oneDay);
//			console.log(now);
			value =100;
			var minute=now.getMinutes()<10?'0'+now.getMinutes():now.getMinutes();
			var second=now.getSeconds()<10?'0'+now.getSeconds():now.getSeconds();
			return { 
				name: now.toString(),
				value: [
					[now.getFullYear(), now.getMonth(), now.getDate()].join('/')+" "+[now.getHours(),minute,second].join(':'),
					value
				]
			}
		}

		var data = [];
		var data_test;
		var now = new Date();
		var oneDay =1000;
//		var twoSecond = 2 * 1000;
		var value = 100;
		for (var i = 0; i < 1000; i++) {
			data.push(randomData());//先在其中放1000个数据
		}

		option = {
			title: {
				text: '每秒水位动态图'
			},
			tooltip: {//这部分与提示框有关，与Y坐标自适应无关
				trigger: 'axis',
				formatter: function (params) {//需要接收一个参数数组
					params = params[0];
					var date = new Date(params.name);//这个就是name，对应的是时间
					return date.getHours()+ '时'+date.getMinutes()+ '分'+  date.getSeconds()+'秒       水位:' + params.value[1]+'米';
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
		 	alert("aaaa");
		//只改下面这段代码就行，主要还是修改数据来源函数，把随机产生变成服务器获得
			data.shift();
			data_test=randomData();
//			console.log(JSON.stringify(data_test));
			data.push(data_test);

	     myChart.setOption({
	         series: [{
	             data: data
	         }]
	     });
	 },2000);
	 
	 
	 
	 if (option && typeof option === "object") {
	     myChart.setOption(option, true);
	 }