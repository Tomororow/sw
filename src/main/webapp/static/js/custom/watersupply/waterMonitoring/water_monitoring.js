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
var monitoring = new Vue({
	el:'#monitoring',
	data:{
		treeMenus:[],
		nodeKey:'',
		name:'',
	},
	methods:{
		handleNodeClick:function(row){
			var _this = this;
			debugger
			if(row.$treeNodeId ==1){
				$(".table-margin1").css("display","block");
				$(".table-margin2").css("display","none");
				$(".table-margin3").css("display","none");
			}else if(row.$treeNodeId ==2){
				$(".table-margin1").css("display","none");
				$(".table-margin2").css("display","block");
				$(".table-margin3").css("display","none");
				_this.name = '村名';
			}else{
				$(".table-margin1").css("display","none");
				$(".table-margin2").css("display","none");
				$(".table-margin3").css("display","block");
				_this.name = '姓名';
			}
			
		},
	},
	created:function(){
		var _this = this;
		$.post(localPath+"/evaporate_survey_site/selectTree","",function(data){
			_this.treeMenus = data.data;
			_this.nodeKey = data.data['0'].children['0'].label;
		});
	},
});