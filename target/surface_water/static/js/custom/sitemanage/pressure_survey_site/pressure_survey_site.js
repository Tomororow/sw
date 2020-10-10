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
   
var pressure_survey_site = new Vue({
	el:'#pressure_survey_site',
	//初始化数据类型
	
		data:{
			treeMenus:[],
			nodeKey:'',
			list:[ { "istrative":"民乐县", 
					"siteName": "丰乐乡压力1号站", 
					"siteCode": "ml_014516", 
					"longitude": "100.85",
					"Latitude": "38.43", 
					"equipmentModel": "Y-60T", 
					"siteAddress": "民乐县-丰乐乡-康乐村" ,
					},
				{ "istrative":"民乐县", 
					"siteName": "丰乐乡压力4号站", 
					"siteCode": "ml_029843", 
					"longitude": "101.55",
					"Latitude": "39.52", 
					"equipmentModel": "Y-100", 
					"siteAddress": "民乐县-丰乐乡-下寨村" ,
					},
				{ "istrative":"民乐县", 
					"siteName": "顺化乡压力3号站", 
					"siteCode": "ml_036485", 
					"longitude": "102.65",
					"Latitude": "37.25", 
					"equipmentModel": "Y-60T", 
					"siteAddress": "民乐县-顺化乡-古城村" ,
					},
				{ "istrative":"民乐县", 
					"siteName": "顺化乡压力6号站", 
					"siteCode": "ml_033584", 
					"longitude": "102.32",
					"Latitude": "37.56", 
					"equipmentModel": "Y-60T", 
					"siteAddress": "民乐县-顺化乡-古城村" ,
					},
				{ "istrative":"民乐县", 
					"siteName": "顺化乡压力9号站", 
					"siteCode": "ml_031434", 
					"longitude": "102.36",
					"Latitude": "38.98", 
					"equipmentModel": "Y-100", 
					"siteAddress": "民乐县-顺化乡-古城村" ,
					},
				{ "istrative":"民乐县", 
					"siteName": "洪水镇压力2号站", 
					"siteCode": "ml_053212", 
					"longitude": "101.35",
					"Latitude": "38.82", 
					"equipmentModel": "Y-60T", 
					"siteAddress": "民乐县-洪水镇-胜利村" ,
					},
				{ "istrative":"民乐县", 
					"siteName": "洪水镇压力6号站", 
					"siteCode": "ml_0512341", 
					"longitude": "101.59",
					"Latitude": "38.56", 
					"equipmentModel": "Y-60T", 
					"siteAddress": "民乐县-洪水镇-胜利村" ,
					},
				{ "istrative":"民乐县", 
					"siteName": "南古镇压力11号站", 
					"siteCode": "ml_066532", 
					"longitude": "103.56",
					"Latitude": "38.15", 
					"equipmentModel": "Y-60T", 
					"siteAddress": "民乐县-南古镇-陈寨村" ,
					},
				{ "istrative":"民乐县", 
					"siteName": "南古镇压力31号站", 
					"siteCode": "ml_062841", 
					"longitude": "103.26",
					"Latitude": "38.20", 
					"equipmentModel": "Y-60T", 
					"siteAddress": "民乐县-南古镇-陈寨村" ,
					},
				{ "istrative":"民乐县", 
					"siteName": "南古镇压力2号站", 
					"siteCode": "ml_057281", 
					"longitude": "102.54",
					"Latitude": "37.15", 
					"equipmentModel": "Y-100", 
					"siteAddress": "民乐县-南古镇-陈寨村" ,
					},
				{ "istrative":"民乐县", 
					"siteName": "新天镇压力1号站", 
					"siteCode": "ml_075931", 
					"longitude": "104.52",
					"Latitude": "38.51", 
					"equipmentModel": "Y-100", 
					"siteAddress": "民乐县-新天镇-东沟村" ,
					},
				{ "istrative":"民乐县", 
					"siteName": "新天镇压力4号站", 
					"siteCode": "ml_072356", 
					"longitude": "102.35",
					"Latitude": "38.49", 
					"equipmentModel": "Y-100", 
					"siteAddress": "民乐县-新天镇-东沟村" ,
					},
														
				],
			pagesize:'10',
		    currentPage:'1',
		},
		

	//页面方法集锦
	methods:{
		//Element树形控件回调函数
		handleNodeClick:function(trees,node,self){
		},
		handleSizeChange:function(size){
			var _this = this;
			_this.pagesize = size;
		},
		handleCurrentChange:function(currentPage){
			var _this = this;
			_this.currentPage = currentPage;
		},
	},
	//页面初始化
	created:function(){
		var _this = this;
		debugger
		$.post(localPath+"/pressure_survey_site/district","",function(result){
			console.log(result)
			_this.treeMenus = result;
			_this.nodeKey = result['0'].children['0'].label;
			
		});
	},
});


















