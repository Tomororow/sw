/* 相对链接的基准URL */
var curWwwPath = window.document.location.href;
var pathName = window.document.location.pathname;
var pos = curWwwPath.indexOf(pathName);
var localhostPaht = curWwwPath.substring(0,pos);
var projectName = pathName.substring(0,pathName.substr(1).indexOf('/')+1);
var ctxPath = localhostPaht + projectName;
var picPath = localhostPaht;
var url ;
   for(var i=0;i<4;i++){
	  url=window.location.href.indexOf("/",url+1);
   }
   var localPath = window.location.href.substring(0,url);
var driven = new Vue({
	el:'#driven',
	//初始化数据类型
	data:{
		treeMenus:[],
		moistureList:[{ "number": "1", "name": "大堵麻水厂 ", 
						"lastMonthCumulative": "8723.651", "monthCumulative": "9058.653",
						"monethUseWater": "9058.653", 
						"monthWaterFee": "16758.51", "time": "2018-1-3", "note": ""}
					,{ "number": "2", "name": "海潮坝水厂", 
						"lastMonthCumulative": "9235.124", "monthCumulative": "8968.983", 
						"monethUseWater": "8968.983", 
						"monthWaterFee": "16592.62", "time": "2018-1-3", "note": ""}
					,{ "number": "3", "name": "童子寺水厂", 
						"lastMonthCumulative": "7956.891", "monthCumulative": "8562.325",
						"monethUseWater": "8562.325", 
						"monthWaterFee": "15840.30", "time": "2018-1-3", "note": ""}
					,{ "number": "4", "name": "小堵麻水厂", 
						"lastMonthCumulative": "9026.452", "monthCumulative": "9256.654", 
						"monethUseWater": "9256.654", 
						"monthWaterFee": "17124.81", "time": "2018-1-3", "note": ""}
					],
			//树结构默认展开节点
			nodeKey:'',
			//分页函数
			currentPage:'1',
			pagesize:'10',
	},
	
	//页面方法集锦
	methods:{
		handleNodeClick:function(row){
			var _this = this;
		},
		handleSizeChange:function(pagesize){
			var _this = this;
			_this.pagesize = pagesize;
		},
		handleCurrentChange:function(currentPage){
			var _this = this;
			_this.currentPage = currentPage;
		},
	},
	//初始化页面
	created:function(){
		var _this = this;
		$.post(localPath+"/driven_survey_site/selectTree","",function(data){
			_this.treeMenus = data.data;
			_this.nodeKey = data.data['0'].children['0'].label;
		});
		_this.imagePath = picPath+"/pic/";
	},
});