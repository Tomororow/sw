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
		nodeKey:'',
		moistureList:[{  "moistureName": "配水泵机组", "coding": "机组设备正常",
						 "simClip": "设备维修部", "equipName": "罗勇", 
						 "latitude": "2018-4-6", "longitude": "无异常"}
					,{  "moistureName": "高压配电柜", "coding": "机组设备正常",
						 "simClip": "设备维修部", "equipName": "罗勇", 
						 "latitude": "2018-4-6", "longitude": "无异常"},
					 {  "moistureName": "低压配电柜", "coding": "机组设备正常",
						 "simClip": "设备维修部", "equipName": "罗勇", 
						 "latitude": "2018-4-6", "longitude": "无异常"},
					 {  "moistureName": "加氯间", "coding": "机组设备正常",
						 "simClip": "设备维修部", "equipName": "罗勇", 
						 "latitude": "2018-4-6", "longitude": "无异常"},
					 {  "moistureName": "清水池", "coding": "机组设备正常",
						 "simClip": "设备维修部", "equipName": "罗勇", 
						 "latitude": "2018-4-6", "longitude": "无异常"},
					 {  "moistureName": "水源井设备", "coding": "机组设备正常",
						 "simClip": "设备维修部", "equipName": "罗勇", 
						 "latitude": "2018-4-6", "longitude": "无异常"}],
			//分页函数
			currentPage:'1',
			pagesize:'10',
	},
	
	//页面方法集锦
	methods:{
		handleNodeClick:function(row){
			var _this = this;
			debugger
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