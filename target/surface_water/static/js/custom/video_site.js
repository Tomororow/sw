/* 相对链接的基准URL */
var curWwwPath = window.document.location.href;
var pathName = window.document.location.pathname;
var pos = curWwwPath.indexOf(pathName);
var localhostPaht = curWwwPath.substring(0,pos);
var projectName = pathName.substring(0,pathName.substr(1).indexOf('/')+1);
var ctxPath = localhostPaht + projectName;
var picPath = localhostPaht;
/* 树结构数据 */
var zNodes;

/**
 * 加载视频站点信息
 * @param page
 */
function start(canalCode, page,threeLevelPermission){
	// 加载层
	//var index = layer.load(2, {shade: 0.5});
	setCookie("canalCode",canalCode);
	$("#videoSiteList").empty();
	$.ajax({
		url:ctxPath+"/video/getVideoSiteList",
		data: {id: canalCode,page: page},
		type: "POST",
		async: false,//非异步
		success: function(msg){
			for(var i=0; i<msg.length; i++){
				var currentTag = document.getElementById("videoSiteList");
					var newTrTag = document.createElement("tr");
						var newTdTag1 = document.createElement("td");
						var newInputTag = document.createElement("input");
							newInputTag.setAttribute("type", "checkbox");
							newInputTag.setAttribute("name", "selectVideosAll");
							newInputTag.setAttribute("value", msg[i].id);
							newTdTag1.appendChild(newInputTag);
						var newTdTag2 = document.createElement("td");
							newTdTag2.innerHTML=msg[i].deviceVideoCode;
							
						var newTdTag3 = document.createElement("td");
							newTdTag3.innerHTML=msg[i].deviceVideoName;
							
						var newTdTag4 = document.createElement("td");
							newTdTag4.innerHTML=msg[i].sviDevicemodelCode;
							
						/*var newTdTag5 = document.createElement("td");
							newTdTag5.innerHTML=msg[i].sviPhotoBefore;*/
							
						var newTdTag5 = document.createElement("td");
						//图片回显
						var newImgTag1 = document.createElement("img");
							newImgTag1.setAttribute("src", picPath+"/pic/"+msg[i].sviPhotoBefore);
							newImgTag1.setAttribute("id", msg[i].id);
							newImgTag1.setAttribute("width", "50");
							newImgTag1.setAttribute("height", "50");
							var id = JSON.stringify(msg[i].id);
							var ssiPhotoBeforeImg ="\""+picPath+"/pic/"+msg[i].sviPhotoBefore+"\"";
							//alert(canalBuildingImg);
							newImgTag1.setAttribute("onclick", "showPhoto("+id+","+ssiPhotoBeforeImg+")");
							newTdTag5.appendChild(newImgTag1);	
							
							
							
							
						var newTdTag6 = document.createElement("td");
							newTdTag6.innerHTML=msg[i].sviAddr;
						
						var newTdTag7 = document.createElement("td");
							newTdTag7.innerHTML=msg[i].sviBuildTime;
							
						var newTdTag8 = document.createElement("td");
						var vid = JSON.stringify(msg[i].id);
							newTdTag8.innerHTML=showThreeLevelPermission(threeLevelPermission,vid);
						
						newTrTag.appendChild(newTdTag1);
						newTrTag.appendChild(newTdTag2);
						newTrTag.appendChild(newTdTag3);
						newTrTag.appendChild(newTdTag4);
						newTrTag.appendChild(newTdTag5);
						newTrTag.appendChild(newTdTag6);
						newTrTag.appendChild(newTdTag7);
						newTrTag.appendChild(newTdTag8);
						
					currentTag.appendChild(newTrTag);
			};
		}
	});
	
	$.post(ctxPath+"/video/page_nav").success(function (response) {
		// alert("11");
		 var pageNum = response.pageNum;
		// alert(pageNum);
			var pages = response.pages;
			//alert(pages);
			var size = response.size;
			//alert(size);
		    /* bootstrap分页样式设置 */
		    var options = {
		    	size:"small",
		    	alignment:"right",
		    	/* 当前页数 */
		        currentPage: pageNum,
		        /* 总页数  总条数除以每页条数  能整除总页数为商  不能整除商+1页  作为分页总页数  */
		        totalPages: pages,
		        /* 每页条数 */
		        numberOfPages:size,
		        /* bootstrap版本指定 */
		        bootstrapMajorVersion:3,
		        /* 样式设置 分页导航条 */
		        itemTexts: function (type, page, current) {
		            switch (type) {
		                case "first":
		                    return "首页";
		                case "prev":
		                    return "上一页";
		                case "next":
		                    return "下一页";
		                case "last":
		                    return "末页";
		                case "page":
		                    return page;
		            }
		        },
		        onPageClicked: function(event, originalEvent, type, page){
		        	start(canalCode,page,threeLevelPermission);
		        	
		        }
		    };
		    $('#pageLimit').bootstrapPaginator(options);
		}).error(function (response) {
		});
}

/**
 * 视频站点添加弹窗
 * @returns
 */
function addVideosInfo(){
	var id = getCookie("canalCode");
	delCookie("canalCode");
	if(id==null||id==""){
		alert("请先选择渠道");
	}else{
		//打开添加窗口
		//alert("111");
		 layer.open({
			 	id: 'add-video-form'
		        ,type: 2 //此处以iframe举例
		        ,title: '新增视频站'
		       ,area: ['700px', '780px']
		        ,shade: 0.8
		        ,maxmin: true
		        ,content: ctxPath+'/video/addPage?id='+id
		        ,btn: ['确定', '关闭'] //只是为了演示
		        ,yes: function(){
		        	//子页面提交
		        	insertSubmit();
		        }
		        ,btn2: function(){
		          layer.closeAll();
		        }
		        
		        ,zIndex: layer.zIndex //重点1
		        ,success: function(layero){
		        	start(id,1,2);
		        	layer.setTop(layero); //重点2
		        }
		    });
	}
}

/**
 * 获取子页面提交方法
 */
function insertSubmit(){	
	//alert(1231313);
	   var frameId=document.getElementById("add-video-form").getElementsByTagName("iframe")[0].id;
	   $('#'+frameId)[0].contentWindow.mySubmit();
	   //重新刷新列表页
	    window.location.replace(ctxPath+"/video/getVideoPage?state="+24);   
}

/**
 * 获取添加页面表单并提交
 */
function areaFormSubmit(){
	// 提交表单数据
    $('#areaAddForm').submit();
    // 关闭当前弹出层
    var index = parent.layer.getFrameIndex(window.name);
    parent.layer.close(index);
}

/**
 * 视频站点类型列表页面全选/反选
 */
function checkAreasAll(){
	$("input[name=selectAreasAll]").prop("checked", $("#selAreasAll").is(":checked"));
}

/**
 * 视频站点类型信息删除(包括批量)
 */
function delAreasInfo(id){
	var ids = [];
	if(id){
    	ids.push(id);
    }else{
    	$('input[name=selectAreasAll]:checked').each(function () {
    		ids.push($(this).val());
    	});
    }
	// 未选中判断
	if (ids.length == 0) {
		layer.alert('请选择需要删除的信息！', {icon: 0});
  	  	return false;
    }
	
	var index = layer.open({
        title: '温馨提示', // 标题栏
        btn: ['确定', '取消'], // 页面按钮
        resize: false, // 禁止拉伸
        content: '确定删除所选信息吗？',
        yes: function(){
        	$.ajax({
        		async: false,
   				url: ctxPath+"/sysArea/deleteAreasById",
   				data: {ids:ids.toString()},
   				type: "POST",
   				success: function(data){
   					if(data == 1){
   						loadAreasInfo(null, 1);
   						layer.msg('删除信息成功!', {icon: 1});
   					}else{
   						loadAreasInfo(null, 1);
   						layer.msg('删除信息失败!', {icon: 2});
   					}
   				}
   			});
   			parent.layer.close(index);
        }
	});
}

function doEdit(id){
	////alert(id);
	layer.open({
	 	id: 'edit-video-form'
        ,type: 2 //此处以iframe举例
        ,title: '你编辑的渠道为'+id
        ,area: ['1000px', '550px']
        ,shade: 0.8
        ,maxmin: true
        ,content: '${ctx}/video/edit_page?id='+id
        ,btn: ['确定', '关闭'] //只是为了演示
        ,yes: function(){
    	//子页面提交
    		editWaterSiteSubmit();
        }
        ,btn2: function(){
          layer.closeAll();
        }      
        ,zIndex: layer.zIndex //重点1
        ,success: function(layero){
        	start(getCookie ("id"),1,2);
          layer.setTop(layero); //重点2
        }
    });
}

//视频站编辑提交
function editWaterSiteSubmit(){
	////alert("haha");
   var frameId=document.getElementById("edit-video-form").getElementsByTagName("iframe")[0].id;
   $('#'+frameId)[0].contentWindow.mySubmit2();
}


/**
 * 视频站点信息修改
 * @param id
 */
function editVideosInfo(id){
	layer.open({
		id: 'edit_areas_info',
        type: 2,
        title: '修改土地类型信息',
        area: ['440px','330px'], // 弹窗大小(宽高)
        btn: ['确定', '取消'], // 页面按钮
        closeBtn: 1, // 显示关闭按钮(右上角)
        shade: 0.5,	// 遮罩阴影程度
        resize: false, // 禁止拉伸
        content: ctxPath+'/sysArea/editAreasPage?id='+id,
        yes: function(){
        	// 信息修改提交
        	editSubmit();
        }
	});
}

/**
 * 获取子页面修改提交方法
 */
function editSubmit(){
	var frameId=document.getElementById('edit_areas_info').getElementsByTagName("iframe")[0].id;
	$('#'+frameId)[0].contentWindow.areasEditFormSubmit();
	// 重新加载列表信息页
	//window.location.reload(ctxPath+"/video/getVideoSiteList?state="+24);
	
}

/**
 * 获取修改页面表单并提交
 */
function areasEditFormSubmit(){
	// 提交表单数据
    $('#areasEditForm').submit();
    var index = parent.layer.getFrameIndex(window.name); //先得到当前iframe层的索引
    parent.layer.close(index);
}


//照片点击事件显示照片=====================
function showPhoto(a,img){
	////alert(a);
	layer.open({
		  type: 1,
		  title: false,
		  closeBtn: 0,
		  area: ['900px', '600px'],
		  skin: 'layui-layer-nobg', //没有背景色
		  shadeClose: true,
		  content: '<img src= '+img+'  width="900" height="600" alt="设备照片" />'
	});
} 

