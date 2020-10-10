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
		moistureList:[{ "id": "1473351606e048b9b9acd7bb06afff03", "moistureName": "康乐村1队5号监测站", 
						"coding": "13268953361", "equipName": "康乐村1队5号井","simClip": "13856948568", 
						"longitude": 87.324234, "latitude": 38.55437653, "elevation": 1252, 
						"administrativeCoding": "62071234","createTime": "2018-05-07", "moistureAddress": "甘肃省-张掖市-民乐县"}
					,{ "id": "1473351606e048b9b9acd7bb06afff03", "moistureName": "康乐村3队2号监测站", 
						"coding": "132689454361", "equipName": "康乐村3队2号井","simClip": "1389878586", 
						"longitude": 87.23324234, "latitude": 38.5534553, "elevation": 1257, 
						"administrativeCoding": "62071234","createTime": "2018-05-07", "moistureAddress": "甘肃省-张掖市-民乐县"}
					,{ "id": "1473351606e048b9b9acd7bb06afff03", "moistureName": "康乐村4队5号监测站", 
						"coding": "143667689461", "equipName": "康乐村4队5号井","simClip": "13823568495", 
						"longitude": 87.2323454, "latitude": 38.56644553, "elevation": 1246, 
						"administrativeCoding": "62071234","createTime": "2018-05-07", "moistureAddress": "甘肃省-张掖市-民乐县"}
					,{ "id": "1473351606e048b9b9acd7bb06afff03", "moistureName": "康乐村5队1号监测站", 
						"coding": "12567543361", "equipName": "康乐村5队1号井","simClip": "13845826589", 
						"longitude": 87.232344, "latitude": 38.5675453, "elevation": 1256, 
						"administrativeCoding": "62071234","createTime": "2018-05-07", "moistureAddress": "甘肃省-张掖市-民乐县"}
					],
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