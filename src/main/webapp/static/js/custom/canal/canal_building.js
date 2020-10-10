/* 相对链接的基准URL */
var curWwwPath = window.document.location.href;
var pathName = window.document.location.pathname;
var pos = curWwwPath.indexOf(pathName);
var localhostPaht = curWwwPath.substring(0,pos);
var projectName = pathName.substring(0,pathName.substr(1).indexOf('/')+1);
var ctxPath = localhostPaht + projectName;


//添加渠道建筑物=============================	
function addCanalBuilding(){
	  var id = getCookie ("currentNodeId");
	 	delCookie("currentNodeId");
	  	layer.open({
		 	id: 'add-building-form'
	        ,type: 2 //此处以iframe举例
	        ,title: '你添加建筑物的渠道为'+id
	        ,area: ['900px', '500px']
	        ,shade: 0.8
	        ,maxmin: true
	        ,content: ctxPath+"/cal_canal_info/add_canal_building_page?id="+id
	        ,btn: ['确定', '关闭'] //只是为了演示
	        ,yes: function(){
	        	
			     addBuildingSubmit();
	        }
	        ,btn2: function(){
	          layer.closeAll();
	        }
	        ,zIndex: layer.zIndex //重点1
	        ,success: function(layero){
	        	//alert("success");
	        	showBuildingPage();
	          layer.setTop(layero); //重点2
	        }
	    });
	  
}

//获取添加建筑物子页面的提交方法
function addBuildingSubmit(){
	   var frameId=document.getElementById("add-building-form").getElementsByTagName("iframe")[0].id;
	   $('#'+frameId)[0].contentWindow.mySubmit3();
	   
}

//渠道建筑物信息编辑
function doEditCanalBuilding(id){
	 layer.open({
		 	id: 'edit-building-form'
	        ,type: 2 //此处以iframe举例
	        ,title: '你编辑的渠道为'+id
	        ,area: ['1000px', '550px']
	        ,shade: 0.8
	        ,maxmin: true
	        ,content:ctxPath+"/cal_canal_info/edit_canal_building_page?id="+id
	        ,btn: ['确定', '关闭'] //只是为了演示
	        ,yes: function(){
       	//子页面提交
       	editCanalBuildingSubmit();
	        		
	        }
	        ,btn2: function(){
	          layer.closeAll();
	        }
	        
	        ,zIndex: layer.zIndex //重点1
	        ,success: function(layero){
	          showBuildingPage();
	          layer.setTop(layero); //重点2
	        }
	    });
}
//渠道建筑物编辑父页面提交子页面
function editCanalBuildingSubmit(){
	  //父页面控制子页面
	   var frameId=document.getElementById("edit-building-form").getElementsByTagName("iframe")[0].id;
	   $('#'+frameId)[0].contentWindow.mySubmit4();
 }

//渠道建筑物删除
function doDeleteCanalBuilding(id){
	$.ajax({
		url:ctxPath+"/cal_canal_info/delete_single_canalbuilding_byid",
		type: "post",
		data: {id:id},
		async: false,//非异步
		success: function(msg){
			if(msg==1){
				//删除完后继续停留在照片标签内
	    		showBuildingPage();
			}
		}
	});
	
}
//渠道建筑物批量删除
function deleteAllBuilding(){
	alert(111111111);
	 var buildingIds = [];
	  $('input[name=selectedBuildingRow]:checked').each(function () {
		  //alert(222222);
		  buildingIds.push($(this).val());
	  });
	  $.ajax({
			url:ctxPath+"/cal_canal_info/delete_canalBuildings_byid",
			data: {buildingIds:buildingIds},
			type: "post",
			async: false,//非异步
			success: function(msg){
				if(msg==buildingIds.length){
					showBuildingPage();
				}
			}
		});
	
}
function doSelectBuildingAll(){
	$("input[name=selectedBuildingRow]").prop("checked", $("#selBuildingAll").is(":checked"));
}
