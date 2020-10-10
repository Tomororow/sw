/* 相对链接的基准URL */
var curWwwPath = window.document.location.href;
var pathName = window.document.location.pathname;
var pos = curWwwPath.indexOf(pathName);
var localhostPaht = curWwwPath.substring(0,pos);
var projectName = pathName.substring(0,pathName.substr(1).indexOf('/')+1);
var ctxPath = localhostPaht + projectName;


//添加渠道照片=======================
function addCanalPhoto(){
	var canalId = getCookie("canalId");
	if(canalId=="0"){//第一次进来没有最高级
		
	}else{
		if(canalId==null||canalId==""){
			layer.alert('请选择添加位置！', {icon: 0});
		}else{
		  layer.open({
			 	id: 'add-photo-form'
		        ,type: 2 //此处以iframe举例
		        ,title: '【添加渠道照片】'
		        ,area: ['900px', '500px']
		        ,shade: 0.8
		        ,maxmin: true
		        ,content: ctxPath+"/cal_canal_info/add_canal_photo_page?id="+canalId
		        ,btn: ['确定', '关闭'] //只是为了演示
		        ,yes: function(){
		        	layer.closeAll();
		        	showPhotoPage();
		        		
		        }
		        ,btn2: function(){
		          layer.closeAll();
		        }
		        
		        ,zIndex: layer.zIndex //重点1
		        ,success: function(layero){
		          layer.setTop(layero); //重点2
		        }
		    });
		
		}
	}
	 
}


//删除渠道照片====================
function doDeleteCanalPhoto(id){
	alert(id);
	//var pid = "";
	$.ajax({
		url:ctxPath+"/cal_canal_info/delete_single_canalphoto_byid",
		type: "post",
		data: {id:id},
		async: false,//非异步
		success: function(msg){
			if(msg==1){
				//删除完后继续停留在照片标签内
	    		showPhotoPage();
			}
		}
	});
}

//照片批量删除
function deleteAllPhoto(){
	//alert(111111111);
	 var photoIds = [];
	  $('input[name=selectedPhotoRow]:checked').each(function () {
		  //alert(222222);
		  photoIds.push($(this).val());
	  });
	  $.ajax({
			url:ctxPath+"/cal_canal_info/delete_canalPhotos_byid",
			data: {photoIds:photoIds},
			type: "post",
			async: false,//非异步
			success: function(msg){
				if(msg==photoIds.length){
					showPhotoPage();
				}
			}
		});
	
}

//渠道照片全选、全反选
function doSelectPhotoAll(){
	//jquery 1.6 前
	//$("input[name=selectedRow]").attr("checked", $("#selAll").is(":checked"));
	//prop jquery 1.6+建议使用
	$("input[name=selectedPhotoRow]").prop("checked", $("#selPhotoAll").is(":checked"));		
}
