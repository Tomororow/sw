/* 相对链接的基准URL */
var curWwwPath = window.document.location.href;
var pathName = window.document.location.pathname;
var pos = curWwwPath.indexOf(pathName);
var localhostPaht = curWwwPath.substring(0,pos);
var projectName = pathName.substring(0,pathName.substr(1).indexOf('/')+1);
var ctxPath = localhostPaht + projectName;

//添加渠道闸门
function addCanalSluice(){
	
	var canalId = getCookie("canalId");
	if(canalId=="0"){//第一次进来没有最高级
		
	}else{
		
		if(canalId==null||canalId==""){
			layer.alert('请选择添加位置！', {icon: 0});
		}else{
			layer.open({
			 	id: 'add-sluice-form'
		        ,type: 2 //此处以iframe举例
		        ,title: '你添加闸门的渠道为'+canalId
		        ,area: ['800px', '500px']
		        ,shade: 0.8
		        ,maxmin: true
		        ,content: ctxPath+"/cal_canal_info/add_canal_sluice_page?id="+canalId
		        ,btn: ['确定', '关闭'] //只是为了演示
		        ,yes: function(){
	        			//数据提交完成后
		        		addSluiceSubmit();
		        }
		        ,btn2: function(){
		          layer.closeAll();
		        }
		        ,zIndex: layer.zIndex //重点1
		        ,success: function(layero){
			          showSluicePage();
			          layer.setTop(layero); //重点2
		        }
		    }); 
		}
	}
}
//获取添加闸门子页面的提交方法
function addSluiceSubmit(){
	   var frameId=document.getElementById("add-sluice-form").getElementsByTagName("iframe")[0].id;
	   $('#'+frameId)[0].contentWindow.mySubmit5();
	   
}

//渠道闸门信息编辑
function doEditCanalSluice(id){
	 layer.open({
		 	id: 'edit-sluice-form'
	        ,type: 2 //此处以iframe举例
	        ,title: '你编辑的渠道为'+id
	        ,area: ['1000px', '550px']
	        ,shade: 0.8
	        ,maxmin: true
	        ,content: ctxPath+"/cal_canal_info/edit_canal_sluice_page?id="+id
	        ,btn: ['确定', '关闭'] //只是为了演示
	        ,yes: function(){
       	//子页面提交
       	//alert("hahahahah");
       	editCanalSluiceSubmit();
       	//alert("hahahahah");	
	        }
	        ,btn2: function(){
	          layer.closeAll();
	        }
	        
	        ,zIndex: layer.zIndex //重点1
	        ,success: function(layero){
	        	
	          showSluicePage();
	          layer.setTop(layero); //重点2
	        }
	    });
}
//渠道闸门编辑父页面提交子页面
function editCanalSluiceSubmit(){
	  //父页面控制子页面
	   var frameId=document.getElementById("edit-sluice-form").getElementsByTagName("iframe")[0].id;
	   $('#'+frameId)[0].contentWindow.mySubmit8();
 }

//渠道闸门单个删除
function doDeleteCanalSluice(id){
	alert("hahah");
	$.ajax({
		url: ctxPath+"/cal_canal_info/delete_single_canalsluice_byid",
		type: "post",
		data: {id:id},
		async: false,//非异步
		success: function(msg){
			if(msg==1){
				//删除完后继续停留在照片标签内
	    		showSluicePage();
			}
		}
	});
}

//渠道闸门批量删除
function deleteAllSluice(){
	alert(111111111);
 var sluiceIds = [];
  $('input[name=selectedSluiceRow]:checked').each(function () {
	  //alert(222222);
	  sluiceIds.push($(this).val());
  });
  $.ajax({
		url: ctxPath+"/cal_canal_info/delete_canalSluices_byid",
		data: {sluiceIds:sluiceIds},
		type: "post",
		async: false,//非异步
		success: function(msg){
			if(msg==sluiceIds.length){
				showSluicePage();
			}
		}
	});
}
//渠道闸门全选和反选
function doSelectSluiceAll(){
	$("input[name=selectedSluiceRow]").prop("checked", $("#selSluiceAll").is(":checked"));
}
