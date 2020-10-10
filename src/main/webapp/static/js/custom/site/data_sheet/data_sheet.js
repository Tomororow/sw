/* 相对链接的基准URL */
	var curWwwPath = window.document.location.href;
	var pathName = window.document.location.pathname;
	var pos = curWwwPath.indexOf(pathName);
	var localhostPaht = curWwwPath.substring(0,pos);
	var projectName = pathName.substring(0,pathName.substr(1).indexOf('/')+1);
	var ctxPath = localhostPaht + projectName;
	var picPath = localhostPaht;
		var scroller = new Vue({
			el:'#scroller',
			data:{
				swiList:[],
				currentPage:'1',
				pagesize:'10',
				reportYear:'',
				rowList:[],
			},
			methods:{
				formatData:function(row){
					debugger
					var _this = this;
					var totle =  Number(row.january) + Number(row.february) +Number(row.march) +Number(row.april) +Number(row.may) +
					Number(row.june) +Number(row.july) +Number(row.august) +Number(row.september) +Number(row.october) +
					Number(row.november) +Number(row.december);
					return row.sum = totle.toFixed(3);
					
					
				},
				selectDate:function(){
					var _this = this;
					debugger
					if(_this.reportYear!=""){
						var date = moment(_this.reportYear).format("YYYY");
						$.post(ctxPath+"/data_sheet/selectAll",{"year":date},function(data){
							_this.swiList = data.data.swiList;
							dataEveryMonthTraffic(_this.swiList[0]);
							dataSumTraffic(_this.swiList);
						});
					}else{
						_this.$message({
			                message: '警告哦，请输入查询年份！',
			                type: 'warning'
			            });
					}
				},
				handleSizeChange:function(size){
					var _this = this;
					_this.pagesize = size;
				},
				handleCurrentChange:function(currentPage){
					var _this = this;
					_this.currentPage = currentPage;
				},

					//导出Excel方法
				exportExcel:function(){
					var _this = this;
					debugger
					var len = _this.rowList.length;
					var date = "0";
					if(_this.reportYear!=""){
						date = moment(_this.reportYear).format("YYYY");
					}
					if(_this.swiList!=null){
						window.location.href=ctxPath+"/data_sheet/excel_export?year="+date;
					}else{
						_this.$message({
			                message: '警告哦，请先查询相关数据！',
			                type: 'warning'
			            });
					}
					
				},
				//行点击事件
				dataTrafficShow:function (row) {
					dataEveryMonthTraffic(row);
				},
			},
			created:function(){
				var _this = this;
				$.post(ctxPath+"/data_sheet/selectAll","",function(data){
					_this.swiList = data.data.swiList;
					dataEveryMonthTraffic(_this.swiList[0]);
					dataSumTraffic(_this.swiList);
				});
			}
		});

//渠各月流量柱状统计
function dataEveryMonthTraffic(data) {
	debugger
	let myChart = echarts.init(document.getElementById("data_EveryMonth_Traffic"));
	option = {
		color: ['#3398DB'],
		title: {
			text: '各渠月流量统计',
			subtext: data.waterName+'月流量统计',
			left: 'center'
		},
		tooltip: {
			trigger: 'axis',
			axisPointer: {            // 坐标轴指示器，坐标轴触发有效
				type: 'shadow'        // 默认为直线，可选为：'line' | 'shadow'
			}
		},
		grid: {
			left: '3%',
			right: '4%',
			bottom: '3%',
			containLabel: true
		},
		xAxis: [
			{
				type: 'category',
				data: ['一月', '二月', '三月', '四月', '五月', '六月', '七月', '八月', '九月', '十月', '十一月', '十二月'],
				axisTick: {
					alignWithLabel: true
				}
			}
		],
		yAxis: [
			{
				type: 'value',
				name: '流量',
				axisLabel: {
					formatter: '{value}m³'
				}
			}
		],
		series: [
			{
				name: '月流量',
				type: 'bar',
				barWidth: '60%',
				data: [data.january, data.february, data.march, data.april, data.may, data.june, data.july, data.august, data.september, data.october, data.november, data.december]
			}
		]
	};
	//使用刚指定的配置项和数据显示图表
	myChart.setOption(option,true);
}

//渠年流量饼状图
function dataSumTraffic(data) {
	debugger
	var legendData = [];
	var seriesData = [];
	var selected = {};
	for(i in data){
		legendData.push(data[i].waterName);
		seriesData.push({
			name: data[i].waterName,
			value: scroller.formatData(data[i])
		});
		selected[data[i].waterName] = i < 6;
	}
	let myChart = echarts.init(document.getElementById("data_Sum_Traffic"));
	option = {
		title: {
			text: '各渠年流量占比',
			left: 'center'
		},
		tooltip: {
			trigger: 'item',
			formatter: '{a} <br/>{b} : {c} ({d}%)'
		},
		legend: {
			type: 'scroll',
			orient: 'vertical',
			right: 0,
			top: 20,
			bottom: 20,
			data: legendData,
			selected: selected
		},
		series: [
			{
				name: '详细信息',
				type: 'pie',
				radius: '55%',
				center: ['40%', '55%'],
				data: seriesData,
				emphasis: {
					itemStyle: {
						shadowBlur: 10,
						shadowOffsetX: 0,
						shadowColor: 'rgba(0, 0, 0, 0.5)'
					}
				}
			}
		]
	};
	//使用刚指定的配置项和数据显示图表
	myChart.setOption(option,true);
}
