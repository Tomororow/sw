/* 相对链接的基准URL */
var curWwwPath = window.document.location.href;
var pathName = window.document.location.pathname;
var pos = curWwwPath.indexOf(pathName);
var localhostPaht = curWwwPath.substring(0,pos);
var projectName = pathName.substring(0,pathName.substr(1).indexOf('/')+1);
var ctxPath = localhostPaht + projectName;


/**
 * 点击树结构条件查询及重新加载
 */
function loadAreasInfo(id, page,threeLevelPermission){
	// 加载层
	var index = layer.load(2, {shade: 0.5});
	$("#areasTableList").empty();
	$.ajax({
		url:ctxPath+"/sysArea/getAreaList",
		data:{
			id:id, 
			page:page
		},
		type: "POST",
		async: false,//非异步
		success: function(msg){
			layer.close(index);
			for(var i=0; i<msg.length; i++){
				var currentTag = document.getElementById("areasTableList");
					var newTrTag = document.createElement("tr");
						var newTdTag1 = document.createElement("td");
						var newInputTag = document.createElement("input");
							newInputTag.setAttribute("type", "checkbox");
							newInputTag.setAttribute("name", "selectAreasAll");
							newInputTag.setAttribute("value", msg[i].id);
							newTdTag1.appendChild(newInputTag);
							
						var newTdTag2 = document.createElement("td");
							newTdTag2.innerHTML=msg[i].areaCode;
							
						var newTdTag3 = document.createElement("td");
							newTdTag3.innerHTML=msg[i].areaName;
							
						var newTdTag4 = document.createElement("td");
							newTdTag4.innerHTML=msg[i].areaLevel;
							
						var newTdTag5 = document.createElement("td");
							newTdTag5.innerHTML=msg[i].parentAreaName;
							
						var newTdTag6 = document.createElement("td");
							newTdTag6.innerHTML=msg[i].saCreateTime;
							
						var newTdTag7 = document.createElement("td");
							newTdTag7.innerHTML=msg[i].saRemark;
							
						var newTdTag8 = document.createElement("td");
						var aid = JSON.stringify(msg[i].id);
							newTdTag8.innerHTML=showThreeLevelPermission(threeLevelPermission,aid);
						
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
	
	$.post(ctxPath+"/sysArea/getPages").success(function (response) {
		var pageNum = response.pageNum;
		var pages = response.pages;
		/* bootstrap分页样式设置 */
		var options = {
			/* 当前页数 */
		    currentPage: pageNum,
		    /* 总页数  总条数除以每页条数  能整除总页数为商  不能整除商+1页  作为分页总页数  */
		    totalPages: pages,
		    /* 一页显示几个按钮 */
		    numberOfPages:5,
		    /* bootstrap版本指定 */
		    bootstrapMajorVersion:3,
		    /* 样式设置 分页导航条 */
		    itemTexts: function (type, page, current) {
	            switch(type){
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
	            };
	        },
	        onPageClicked: function(event, originalEvent, type, page){
	        	loadAreasInfo(id, page);
	        }
		};
		$('#pageLimit').bootstrapPaginator(options);
	}).error(function (response) {
		layer.msg('列表请求出错!', {icon: 5});
	});
}

/**
 * 行政区域添加弹窗
 * @returns
 */
function addArea(){
	var parentId = "";
	// 判断是否已经存在父区域
	$.ajax({
		url:ctxPath+"/sysArea/getParentAreaByLevel",
		type: "GET",
		async: false,//非异步
		success: function(msg){
			parentId = msg;
		}
	});
	
	// 选中的节点ID
	var treeObj = $.fn.zTree.getZTreeObj("areaZtree");
	var selectedNode = treeObj.getSelectedNodes(true);
    // 获得选中节点的相关属性值
	var id = "";
	var areaLevel = "";
	var name = "";
	for(var i = 0; i < selectedNode.length; i++){
    	id = selectedNode[i].id;
    	areaLevel = selectedNode[i].level;
    	name = selectedNode[i].name;
    }
	
    // 判断是否选中节点  选中则往该区域下新增  否则为根节点
	if(id.length == 0){
		// 判断是否有父区域存在
		if(parentId != null && parentId.length != 0){
			layer.alert('父区域已经存在！', {icon: 0});
			return false;
		}else{
			layer.open({
				id: 'add_area_form', // 弹层唯一标识，防止重复弹出
				type: 2, // 基本层类型
		        title: '新增行政父区域', // 标题栏
		        area: ['435px','315px'], // 弹窗大小(宽高)
		        btn: ['确定', '取消'], // 页面按钮
		        closeBtn: 1, // 显示关闭按钮(右上角)
		        shade: 0.5,	// 遮罩阴影程度
		        resize: false, // 禁止拉伸
		        content: ctxPath + '/sysArea/addPage?id='+null+'&areaLevel='+0,
		   		yes: function(){
		   			// 父页面方法
		   			insertAreaSubmit();
		        }
			});
		}
	}else if(id != null || id.length != 0){
		layer.open({
			id: 'add_area_form', // 弹层唯一标识，防止重复弹出
			type: 2, // 基本层类型
	        title: '新增行政区域,所属父区域【'+name+'】', // 标题栏
	        area: ['435px','315px'], // 弹窗大小(宽高)
	        btn: ['确定', '取消'], // 页面按钮
	        closeBtn: 1, // 显示关闭按钮(右上角)
	        shade: 0.5,	// 遮罩阴影程度
	        resize: false, // 禁止拉伸
	        content: ctxPath + '/sysArea/addPage?id='+id+'&areaLevel='+areaLevel+'',
	   		yes: function(){
	   			// 父页面方法
	   			insertAreaSubmit();
	        }
		});
    }
}

/**
 * 获取子页面提交方法
 */
function insertAreaSubmit(){
	var frameId=document.getElementById('add_area_form').getElementsByTagName("iframe")[0].id;
	$('#'+frameId)[0].contentWindow.areaFormSubmit();
	// 重新加载列表信息页
	window.parent.location.reload();
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
 * 行政区域类型列表页面全选/反选
 */
function checkAreasAll(){
	$("input[name=selectAreasAll]").prop("checked", $("#selAreasAll").is(":checked"));
}

/**
 * 行政区域类型信息删除(包括批量)
 */
function doDelete(id){
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

/**
 * 行政区域信息修改
 * @param id
 */
function doEdit(id){
	layer.open({
		id: 'edit_areas_info',
        type: 2,
        title: '修改行政区域信息',
        area: ['435px','315px'], // 弹窗大小(宽高)
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
	window.location.reload(this);
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