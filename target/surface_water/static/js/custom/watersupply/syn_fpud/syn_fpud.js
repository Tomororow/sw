var curWwwPath = window.document.location.href;
var pathName = window.document.location.pathname;
var pos = curWwwPath.indexOf(pathName);
var localhostPaht = curWwwPath.substring(0,pos);
var projectName = pathName.substring(0,pathName.substr(1).indexOf('/')+1);
var ctxPath = localhostPaht + projectName;
var picPath = localhostPaht;
var tableData = new Vue({
	el:'#tableData',
	data:{
		//页面表格数据集合
		tableList:[],
		imgUrl:'',
		//供水公司分页函数
		currentPage:'1',
		pagesize:'10',
		//水厂分页函数
		currentPage1:'1',
		pagesize1:'10',
		//判断表格类型
		levelType:'',
	},
	methods:{
		updateData:function(index){
			var _this = this;
			layer.open({
			 	id:'syn_fpud_update'
		        ,type: 2 
		        ,title: "修改【"+_this.tableList[index].fpudName+"】信息"
		        ,area: ['770px', '580px']
		        ,shade: 0.8
		        ,maxmin: true
		        ,content: ctxPath+"/syn_fpud/updateData?id="+_this.tableList[index].id
		        ,btn: ['确定', '取消']
		        ,yes: function(index){
		        	debugger
		        	//修改表单数据
		        	updatesubmit();
		        }
		        ,btn2: function(){
		          layer.closeAll();
		        }
		        
		        ,zIndex: layer.zIndex 
		        ,success: function(layero){
		        	layer.setTop(layero); 
		        }
		    });
		},
		//分页函数
		handleSizeChange:function(size,type){
			var _this = this;
			debugger
			switch (type) {
			case "0":
				_this.pagesize = size;
				break;
			case "1":
				_this.pagesize1 = size;
				break;
			default:
				break;
			}
			
		},
		//分页函数
		handleCurrentChange:function(currentPage,type){
			var _this = this;
			debugger
			switch (type) {
			case "0":
				_this.currentPage = currentPage;
				break;
			case "1":
				_this.currentPage1 = currentPage;
				break;
			default:
				break;
			}
		},
		//删除页面数据
		deleteData:function(index){
			var _this = this;
			debugger
			$.post(ctxPath+"/syn_fpud/deleteData",{"id":_this.tableList[index].id},function(data){
				debugger
				if(data.message == "ok"){
					layer.open({
						  title:"成功",
						  content: '删除成功',
						  shade: 0,
						  });     
					_this.tableList.splice(index,1);
				}else{
					layer.open({
						  title:"失败",
						  content: '数据未删除',
						  shade: 0,					
						  });     
				}
			});
		},
	},
	created:function(){
		var _this = this;
		_this.imgUrl = picPath+"/pic/";
		$.post(ctxPath+"/syn_fpud/selectData",{"id":Addid},function(data){
			debugger
			tableData.tableList = data.data;
		});
	},
});

var Addname;
var Addid;
var Addlevel;
function start(id,type,msg,level,name){
	debugger
	Addid = id;
	Addname = name;
	Addlevel = level;
	tableData.levelType = level;
	$.post(ctxPath+"/syn_fpud/selectData",{"id":id},function(data){
		debugger
		tableData.tableList = data.data;
	});
}
//新增模块
function add(){
	debugger
	if(Addname==null||Addname==""){
		layer.alert('请选择相关渠道', {icon: 0});
	}else{
		if(Addlevel=="0.0"){//===================新增供水公司信息
			var inex=parent.layer.getFrameIndex(window.name);
			 layer.open({
				 	id:'syn_fpud'
			        ,type: 2 
			        ,title: "新增【"+Addname+"】信息"
			        ,area: ['770px', '580px']
			        ,shade: 0.8
			        ,maxmin: true
			        ,content: ctxPath+"/syn_fpud/addData?id="+Addid
			        ,btn: ['确定', '取消'] 
			        ,yes: function(){
			        	debugger
			        	//新增
			        	Submit();
			        }
			        ,btn2: function(){
			          layer.closeAll();
			        }
			        ,zIndex: layer.zIndex 
			        ,success: function(layero){
			        }
			    });
		}else if(Addlevel == "1.0"){//===================新增水厂信息
			var inex=parent.layer.getFrameIndex(window.name);
			 layer.open({
				 	id:'water_works'
			        ,type: 2
			        ,title: "新增【"+Addname+"】信息"
			        ,area: ['770px', '580px']
			        ,shade: 0.8
			        ,maxmin: true
			        ,content: ctxPath+"/water_supply/addData?id="+Addid
			        ,btn: ['确定', '取消'] 
			        ,yes: function(){
			        	debugger
			        	//新增
			        	waterSubmit();
			        }
			        ,btn2: function(){
			          layer.closeAll();
			        }
			        ,zIndex: layer.zIndex 
			        ,success: function(layero){
			        }
			    });
		}else if(Addlevel == "2.0"){
			
		}else if(Addlevel == "3.0"){
			
		}else if(Addlevel == "4.0"){
			
		}else if(Addlevel == "5.0"){
			
		}else if(Addlevel == "6.0"){
			
		}
		
	}
}
//修改
function updatesubmit(){
   var frameId=document.getElementById("syn_fpud_update").getElementsByTagName("iframe")[0].id;
   $('#'+frameId)[0].contentWindow.mySubmit();
  
}
//新增
function Submit(){
   var frameId=document.getElementById("syn_fpud").getElementsByTagName("iframe")[0].id;
   $('#'+frameId)[0].contentWindow.mySubmit();
   
}
//水厂信息新增
function waterSubmit(){
	var frameId=document.getElementById("water_works").getElementsByTagName("iframe")[0].id;
	   $('#'+frameId)[0].contentWindow.waterSubmit();
}



