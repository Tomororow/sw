/* 相对链接的基准URL */
var curWwwPath = window.document.location.href;
var pathName = window.document.location.pathname;
var pos = curWwwPath.indexOf(pathName);
var localhostPaht = curWwwPath.substring(0,pos);
var projectName = pathName.substring(0,pathName.substr(1).indexOf('/')+1);
var ctxPath = localhostPaht + projectName;



/**
 * 加载土地类型信息
 * @param page
 */
function loadInfo(page,threeLevelPermission){
	// 加载层
	var index = layer.load(2, {shade: 0.5});
	$("#soilsTableList").empty();
	$.ajax({
		url:ctxPath+"/soils/getSoilslist",
		data: {page: page},
		type: "POST",
		async: false,//非异步
		success: function(msg){
			layer.close(index);
			for(var i=0; i<msg.length; i++){
				var currentTag = document.getElementById("soilsTableList");
					var newTrTag = document.createElement("tr");
						var newTdTag1 = document.createElement("td");
						var newInputTag = document.createElement("input");
							newInputTag.setAttribute("type", "checkbox");
							newInputTag.setAttribute("name", "selectSoilsAll");
							newInputTag.setAttribute("value", msg[i].id);
							newTdTag1.appendChild(newInputTag);
							
						var newTdTag2 = document.createElement("td");
							newTdTag2.innerHTML=msg[i].soilCode;
							
						var newTdTag3 = document.createElement("td");
							newTdTag3.innerHTML=msg[i].soilName;
							
						var newTdTag4 = document.createElement("td");
							newTdTag4.innerHTML=msg[i].stiCreateTime;
							
						var newTdTag5 = document.createElement("td");
							newTdTag5.innerHTML=msg[i].description;
							
						var newTdTag6 = document.createElement("td");
						var sid = JSON.stringify(msg[i].id);
							newTdTag6.innerHTML = showThreeLevelPermission(threeLevelPermission,sid);
						
						newTrTag.appendChild(newTdTag1);
						newTrTag.appendChild(newTdTag2);
						newTrTag.appendChild(newTdTag3);
						newTrTag.appendChild(newTdTag4);
						newTrTag.appendChild(newTdTag5);
						newTrTag.appendChild(newTdTag6);
						
					currentTag.appendChild(newTrTag);
			};
		}
	});
	
	$.post(ctxPath+"/soils/getPages").success(function (response) {
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
	        	loadInfo(page,threeLevelPermission);
	        }
		};
		$('#pageLimit').bootstrapPaginator(options);
	}).error(function (response) {
		layer.msg('列表请求出错!', {icon: 5});
	});
}

/**
 * 土地类型信息添加
 * @returns
 */
function addSoilsInfo(){
	var param;
	var index = layer.open({
		id: 'add_soils_form', // 弹层唯一标识，防止重复弹出
		type: 2, // 基本层类型
        title: '新增土地类型信息', // 标题栏
        area: ['440px','330px'], // 弹窗大小(宽高)
        btn: ['确定', '取消'], // 页面按钮
        closeBtn: 1, // 显示关闭按钮(右上角)
        shade: 0.5,	// 遮罩阴影程度
        resize: false, // 禁止拉伸
        content: ctxPath+'/soils/addPage',
        yes: function(){
        	/*alert("hjasdfhjsd");
        	param = $("#soilsAddForm").formSerialize();
        	alert("结果：" + $("#soilsAddForm").formSerialize());
        	$.ajax({
        		async: false,
   				url: "${ctx}/soils/savesoilsInfo",
   				data: {param:param},
   				type: "POST",
   				success: function(data){
   					// 关闭当前弹出层
   					layer.close(index);
   				    
   					if(data == 1){
   						loadInfo(1);
   						layer.msg('添加信息成功!', {icon: 1});
   					}
   				}
   			});*/
   			// 父页面方法
   			insertSubmit();
        }
	});
}

/**
 * 获取子页面提交方法
 */
function insertSubmit(){
	var frameId=document.getElementById('add_soils_form').getElementsByTagName("iframe")[0].id;
	$('#'+frameId)[0].contentWindow.soilsFormSubmit();
	// 重新加载列表信息页
	window.location.reload();
}

/**
 * 获取添加页面表单并提交
 */
function soilsFormSubmit(){
	// 提交表单数据
    $('#soilsAddForm').submit();
    var index = parent.layer.getFrameIndex(window.name); //先得到当前iframe层的索引
    parent.layer.close(index);
}

/**
 * 土地类型列表页面全选/反选
 */
function checkSoilsAll(){
	$("input[name=selectSoilsAll]").prop("checked", $("#selSoilsAll").is(":checked"));
}

/**
 * 土地类型信息删除(包括批量)
 */
function doDelete(id){
	/*var ids = [];
	if(id){
    	ids.push(id);
    }else{
    	$('input[name=selectSoilsAll]:checked').each(function () {
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
   				url: ctxPath+"/soils/deleteSoilsById",
   				data: {ids:ids.toString()},
   				type: "POST",
   				success: function(data){
   					if(data == 1){
   						loadInfo(1);
   						layer.msg('删除信息成功!', {icon: 1});
   					}else{
   						loadInfo(1);
   						layer.msg('删除信息失败!', {icon: 2});
   					}
   				}
   			});
   			parent.layer.close(index);
        }
	});*/
	$.ajax({
		url: ctxPath+"/soils/delete",
		type: "post",
		data: {id:id},
		async: false,//非异步
		success: function(msg){
			if(msg==1){
				layer.confirm('删除成功', {
	        		  btn: ['确定'] //按钮
	        		},function(){	
      				document.forms[0].action=ctxPath+"/soils/list?state=35";
		    		document.forms[0].submit();
	        	});
			}
		}
	});
}

/**
 * 土地类型信息修改
 * @param id
 */
function doEdit(id){
	layer.open({
		id: 'edit_soils_info',
        type: 2,
        title: '修改土地类型信息',
        area: ['440px','330px'], // 弹窗大小(宽高)
        btn: ['确定', '取消'], // 页面按钮
        closeBtn: 1, // 显示关闭按钮(右上角)
        shade: 0.5,	// 遮罩阴影程度
        resize: false, // 禁止拉伸
        content: ctxPath+'/soils/editSoilsPage?id='+id,
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
	var frameId=document.getElementById('edit_soils_info').getElementsByTagName("iframe")[0].id;
	$('#'+frameId)[0].contentWindow.soilsEditFormSubmit();
	// 重新加载列表信息页
	window.location.reload();
}

/**
 * 获取修改页面表单并提交
 */
function soilsEditFormSubmit(){
	// 提交表单数据
    $('#soilsEditForm').submit();
    var index = parent.layer.getFrameIndex(window.name); //先得到当前iframe层的索引
    parent.layer.close(index);
}