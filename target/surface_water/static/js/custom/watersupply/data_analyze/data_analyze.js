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
		moistureList:[{ "id": "1473351606e048b9b9acd7bb06afff03", "moistureName": "5445", "coding": "545", "equipName": "54545", "equipCoding": "45454", 
			"simClip": "5454", "simClipOperator": "中国移动", "buildTime": "2018-05-07", "longitude": 545, "latitude": 4545, "elevation": 5454, "administrativeCoding": "62071234",
			"createTime": "2018-05-07", "moistureAddress": "甘肃省-张掖市-甘州区", "moistureImage": "3113ccfb-8c0d-4c5e-ba25-0ef1e5ff3a29.jpg",}
					,{ "id": "1473351606e048b9b9acd7bb06afff03", "moistureName": "5445", "coding": "545", "equipName": "54545", "equipCoding": "45454", 
			"simClip": "5454", "simClipOperator": "中国电信", "buildTime": "2018-05-07", "longitude": 545, "latitude": 4545, "elevation": 5454, "administrativeCoding": "62071234",
			"createTime": "2018-05-07", "moistureAddress": "天津市-天津市郊县", "moistureImage": "3113ccfb-8c0d-4c5e-ba25-0ef1e5ff3a29.jpg",}
					,{ "id": "1473351606e048b9b9acd7bb06afff03", "moistureName": "5445", "coding": "545", "equipName": "54545", "equipCoding": "45454", 
						"simClip": "5454", "simClipOperator": "中国电信", "buildTime": "2018-05-07", "longitude": 545, "latitude": 4545, "elevation": 5454, "administrativeCoding": "62071234",
						"createTime": "2018-05-07", "moistureAddress": "甘肃省-张掖市-民乐县", "moistureImage": "3113ccfb-8c0d-4c5e-ba25-0ef1e5ff3a29.jpg",}
					,{ "id": "1473351606e048b9b9acd7bb06afff03", "moistureName": "5445", "coding": "545", "equipName": "54545", "equipCoding": "45454", 
						"simClip": "5454", "simClipOperator": "中国联通", "buildTime": "2018-05-07", "longitude": 545, "latitude": 4545, "elevation": 5454, "administrativeCoding": "62071234",
						"createTime": "2018-05-07", "moistureAddress": "甘肃省-张掖市-临泽县", "moistureImage": "3113ccfb-8c0d-4c5e-ba25-0ef1e5ff3a29.jpg",}
					,{ "id": "1473351606e048b9b9acd7bb06afff03", "moistureName": "5445", "coding": "545", "equipName": "54545", "equipCoding": "45454", 
						"simClip": "5454", "simClipOperator": "中国移动", "buildTime": "2018-05-07", "longitude": 545, "latitude": 4545, "elevation": 5454, "administrativeCoding": "62071234",
						"createTime": "2018-05-07", "moistureAddress": "甘肃省-张掖市-山丹县", "moistureImage": "1689ac02-0f71-44d1-b69b-7f4868c0ad31.jpg",}
					,{ "id": "1473351606e048b9b9acd7bb06afff03", "moistureName": "5445", "coding": "545", "equipName": "54545", "equipCoding": "45454", 
						"simClip": "5454", "simClipOperator": "中国联通", "buildTime": "2018-05-07", "longitude": 545, "latitude": 4545, "elevation": 5454, "administrativeCoding": "62071234",
						"createTime": "2018-05-07", "moistureAddress": "甘肃省-定西市-岷县", "moistureImage": "be107d7f-2eed-4c53-a9b2-10ac36f22032.jpg",}
					,{ "id": "1473351606e048b9b9acd7bb06afff03", "moistureName": "5445", "coding": "545", "equipName": "54545", "equipCoding": "45454", 
						"simClip": "5454", "simClipOperator": "中国移动", "buildTime": "2018-05-07", "longitude": 545, "latitude": 4545, "elevation": 5454, "administrativeCoding": "62071234",
						"createTime": "2018-05-07", "moistureAddress": "甘肃省-张掖市-肃南县", "moistureImage": "65127e6f-ff2d-4e95-b491-ed89449c20f0.jpg",}],
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
		});
		_this.imagePath = picPath+"/pic/";
	},
});