/*相关链接*/
var curWwwPath = window.document.location.href;
var pathName = window.document.location.pathname;
var pos = curWwwPath.indexOf(pathName);
var localhostPaht = curWwwPath.substring(0,pos);
var projectName = pathName.substring(0,pathName.substr(1).indexOf('/')+1);
var ctxPath = localhostPaht + projectName;
var picPath = localhostPaht;

var leftTopEcharts;
var leftDownEcharts;
var rightTopEcharts;
var rightDownEcharts;

var dataAnalyze= new Vue({
	el:"#dataAnalyze",
	data:{
		canalCode:'',//渠道编码
		echartsData:[],
	},
	methods:{
		//树目录结构加载
		handleVityTree:function(id,code){
			var _this = this;
			debugger
			var setting = {
				view: {
					selectedMulti: false
				},
				check: {
					enable: true
				},
				callback: {
					onClick: _this.zTreeOnClick
				},
				data:{
					simpleData: {
						enable: true
					},
					key:{
						name:'canalName'
					}
				},

			};
			$.post(ctxPath+"/cal_canal_info/tree_canal",{waterId:id,waterCode:code},function(treeData){
				debugger
				if(treeData!=""&&treeData!=null) {
					treeData[0].open = true;
					if(treeData[0].children[0] != undefined){
						treeData[0].children[0].open = true;
					}
					$.fn.zTree.init($('#treeDemo'), setting, treeData);
					_this.canalCode = treeData[0].canalCode;
					_this.echartsDataQuery(_this.canalCode);
				}
			});
		},
		//树菜单点击事件
		zTreeOnClick:function(event, treeId, treeNode){
			var _this = this;
			_this.canalCode = treeNode.canalCode;
			_this.echartsDataQuery(_this.canalCode);
		},
		//
		echartsDataQuery:function (canalCode) {
			$.post(ctxPath+"/dataAnalyze/total_water_consumption_query",{canalCode:canalCode},function (result) {
				if(result != null){
					this.echartsData = JSON.parse(result);
					leftTopEchartsShow(this.echartsData);
					rightTopEchartsShow(this.echartsData);
					leftDownEchartsShow(this.echartsData);
					rightDownEchartsShow(this.echartsData);
				}
			})
		}
	},
	created:function () {
		debugger
		var _this = this;
		_this.handleVityTree();
	},
	mounted:function () {

	}
})


//start---------------------------------------------------
function leftTopEchartsShow(echartsData){
	//初始化echarts实例
	leftTopEcharts = echarts.init(document.getElementById('chartmain1'));
	option = {
		title:{
			text:'渠道用水量统计'
		},
		tooltip:{},
		legend:{
			data:echartsData.currentLegendBar
		},
		grid: {
			// top:'15%',
			left: '3%',
			// right: '4%',
			// bottom: '15%',
			containLabel: true
		},
		xAxis:{
			data:echartsData.xDataBar,
			name:'月份'
		},
		yAxis:{
			min: 0,
			type: 'value',
			axisLabel: {
				formatter: '{value} m³'
			},
			name:'用水量'
		},
		series:[{
			name:echartsData.currentLegendBar,
			type:'bar',
			data:echartsData.currentYDataBar,
			itemStyle:{
				normal:{
					color:'#fe971a',
				}
			}
		}]
	};
	//使用制定的配置项和数据显示图表
	leftTopEcharts.setOption(option);
}

function rightTopEchartsShow(echartsData){
	rightTopEcharts = echarts.init(document.getElementById('chartmain2'));
	option = {
		title:{
			text:'渠道用水量统计'
		},
		tooltip:{},
		legend:{
			data:echartsData.previousLegendBar
		},
		grid: {
			left: '3%',
			containLabel: true
		},
		xAxis:{
			data:echartsData.xDataBar,
			name:'月份'
		},
		yAxis:{
			min: 0,
			type: 'value',
			axisLabel: {
				formatter: '{value} m³'
			},
			name:'用水量'
		},
		series:[{
			name:echartsData.previousLegendBar,
			type:'bar',
			data:echartsData.previousYDataBar,
			itemStyle:{
				normal:{
					color:'#1fa1ff',
				}
			}
		}]
	};
	//使用制定的配置项和数据显示图表
	rightTopEcharts.setOption(option);
}

function leftDownEchartsShow(echartsData){
	leftDownEcharts = echarts.init(document.getElementById('chartmain3'));
	let json = [];
	for (let i = 0; i < echartsData.xDataPie.length; i++) {
		json.push({value:echartsData.currentYDataBar[i],name:echartsData.xDataPie[i]});
	}
	option = {
		title : {
			text: '用水量统计',
			subtext: echartsData.currentLegendBar,
			x:'center'
		},
		tooltip : {
			trigger: 'item',
			formatter: ""
		},
		legend: {
			orient : 'vertical',
			x : 'left'

		},
		toolbox: {
			show : true,
			feature : {
				mark : {show: true},
				dataView : {show: true, readOnly: false},
				magicType : {
					show: true,
					type: ['pie', 'funnel'],
					option: {
						funnel: {
							x: '25%',
							width: '50%',
							funnelAlign: 'left',
							max: 1548
						}
					}
				},
				restore : {show: true},
				saveAsImage : {show: true}
			}
		},
		calculable : true,
		series : [
			{
				name:'用水量',
				type:'pie',
				radius : '55%',//饼图的半径大小
				center: ['50%', '60%'],//饼图的位置
				data:json
			}
		]
	};
	//使用制定的配置项和数据显示图表
	leftDownEcharts.setOption(option);
}


function rightDownEchartsShow(echartsData){
	rightDownEcharts = echarts.init(document.getElementById('chartmain4'));
	let json = [];
	for (let i = 0; i < echartsData.xDataPie.length; i++) {
		json.push({value:echartsData.previousYDataBar[i],name:echartsData.xDataPie[i]});
	}
	option = {
		title : {
			text: '用水量统计',
			subtext: echartsData.previousLegendBar,
			x:'center'
		},
		tooltip : {
			trigger: 'item',
			formatter: ""
		},
		legend: {
			orient : 'vertical',
			x : 'left'

		},
		toolbox: {
			show : true,
			feature : {
				mark : {show: true},
				dataView : {show: true, readOnly: false},
				magicType : {
					show: true,
					type: ['pie', 'funnel'],
					option: {
						funnel: {
							x: '25%',
							width: '50%',
							funnelAlign: 'left',
							max: 1548
						}
					}
				},
				restore : {show: true},
				saveAsImage : {show: true}
			}
		},
		calculable : true,
		series : [
			{
				name:'用水量',
				type:'pie',
				radius : '55%',//饼图的半径大小
				center: ['50%', '60%'],//饼图的位置
				data:json
			}
		]
	};
	//使用制定的配置项和数据显示图表
	rightDownEcharts.setOption(option);
}

//end------------------------------------------------------------------