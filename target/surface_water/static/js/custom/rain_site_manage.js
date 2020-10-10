/* 相对链接的基准URL */
var curWwwPath = window.document.location.href;
var pathName = window.document.location.pathname;
var pos = curWwwPath.indexOf(pathName);
var localhostPaht = curWwwPath.substring(0,pos);
var projectName = pathName.substring(0,pathName.substr(1).indexOf('/')+1);
var ctxPath = localhostPaht + projectName;
// 图片回显虚拟路径
var picPath = localhostPaht + "/pic/";
/* 树结构数据 */
var zNodes;

$(function (){
	// 初始化获取最大父区域ID
	var maxPid;
	$.ajax({
		url:ctxPath+"/sysArea/getParentAreaByLevel",
		type: "GET",
		async: false,//非异步
		success: function(msg){
			maxPid = msg;
		}
	});
	
	// 初始化树菜单
	/*showNodes();
	$.fn.zTree.init($("#areaZtree"), setting, zNodes);*/
	// 树菜单节点点击
	loadRainSiteByAreaId(maxPid, 1);
});

/**
 * 树菜单配置
 */
var setting = {
    view: {
        selectedMulti: false	// 设置是否允许同时选中多个节点
    },
    check: {
        enable: true	// 设置zTree节点上是否显示CheckBox
    },
    data: {
        simpleData: {
            enable: true	// 使用简单数据格式
        }
    }
};

/**
 * 树结构条件查询 根据行政区域ID获取站点信息
 * @param id
 * @param page
 */
function loadRainSiteByAreaId(id, page){
	// 加载层
	var index = layer.load(2, {shade: 0.5});
	$("#rainSiteList").empty();
	$.ajax({
		url:ctxPath+"/siteRainManage/getRainSiteList",
		data:{
			areaId:id, 
			page:page
		},
		type: "POST",
		async: false,//非异步
		success: function(msg){
			layer.close(index);
			for(var i=0; i<msg.length; i++){
				var currentTag = document.getElementById("rainSiteList");
					var newTrTag = document.createElement("tr");
						var newTdTag1 = document.createElement("td");
						var newInputTag = document.createElement("input");
							newInputTag.setAttribute("type", "checkbox");
							newInputTag.setAttribute("name", "selectRainSiteAll");
							newInputTag.setAttribute("value", msg[i].id);
							newTdTag1.appendChild(newInputTag);
							
						var newTdTag2 = document.createElement("td");
							newTdTag2.innerHTML=msg[i].deviceRainCode;
							
						var newTdTag3 = document.createElement("td");
							newTdTag3.innerHTML=msg[i].deviceRainName;
							
						var newTdTag4 = document.createElement("td");
							newTdTag4.innerHTML=msg[i].deviceName;
						// 
						var newTdTag5 = document.createElement("td");
						var photoBefore = JSON.stringify(msg[i].sriPhotoBefore);
							newTdTag5.innerHTML="<a style='color:#0099CC; cursor:pointer;' onclick='showPhotoInfo("+photoBefore+")'>照片预览</a>"
						
						var newTdTag6 = document.createElement("td");
						var photoAfter = JSON.stringify(msg[i].sriPhotoAfter);
							newTdTag6.innerHTML="<a style='color:#0099CC; cursor:pointer;' onclick='showPhotoInfo("+photoAfter+")'>照片预览</a>"
							
						var newTdTag7 = document.createElement("td");
							newTdTag7.innerHTML=msg[i].sriBuildTime;
							
						var newTdTag8 = document.createElement("td");
						var sid = JSON.stringify(msg[i].id);
						var siteName = JSON.stringify(msg[i].deviceRainName);
							newTdTag8.innerHTML="<a href='javascript\:detailRainSiteInfo("+sid+","+siteName+")'>详情</a> | " +
												"<a href='javascript\:editRainSiteInfo("+sid+")'>修改</a> | " +
												"<a href='javascript\:delRainSiteInfo("+sid+")'>删除</a>"
						
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
	        	loadRainSiteByAreaId(id, page);
	        }
		};
		$('#pageLimit').bootstrapPaginator(options);
	}).error(function (response) {
		layer.msg('列表请求出错!', {icon: 5});
	});
}

/**
 * 雨量站详情信息
 * @param sid
 * @param siteName
 */
function detailRainSiteInfo(sid, siteName){
	var index = layer.open({
		id: 'detail_rain_form', // 弹层唯一标识，防止重复弹出
		type: 2, // 基本层类型
        title: '【'+siteName+'】详情信息', // 标题栏
        area: ['840px','550px'], // 弹窗大小(宽高)
        btn: ['关闭'], // 页面按钮
        closeBtn: 1, // 显示关闭按钮(右上角)
        shade: 0.5,	// 遮罩阴影程度
        resize: false, // 禁止拉伸
        content: ctxPath + '/siteRainManage/detailRainSitePage?sid='+sid,
   		yes: function(){
   			// 确定关闭弹窗
   			parent.layer.close(index);
        }
	});
}

/**
 * 雨量站信息增加
 */
function addRainSite(){
	// 选中的节点ID
	var treeObj = $.fn.zTree.getZTreeObj("areaZtree");
	var selectedNode = treeObj.getSelectedNodes(true);
    // 获得选中节点的相关属性值 站点所属区域信息
	var areaId = "";
	var areaLevel = "";
	var areaName = "";
	for(var i = 0; i < selectedNode.length; i++){
		areaId = selectedNode[i].id;
    	areaLevel = selectedNode[i].level;
    	areaName = selectedNode[i].name;
    }
	
    // 判断是否选中节点  未选中不能添加站点信息
	if(areaId.length == 0){
		layer.alert('请选择所属区域！', {icon: 0});
		return false;
	}else if(areaLevel <= 0){
		layer.alert('请在子级区域下添加站点信息！', {icon: 0});
		return false;
	}else if(areaId != null || areaId.length != 0){
		layer.open({
			id: 'add_rain_site_form', // 弹层唯一标识，防止重复弹出
			type: 2, // 基本层类型
	        title: '新增雨量站信息,所属区域【'+areaName+'】', // 标题栏
	        area: ['840px','550px'], // 弹窗大小(宽高)
	        btn: ['确定', '取消'], // 页面按钮
	        closeBtn: 1, // 显示关闭按钮(右上角)
	        shade: 0.5,	// 遮罩阴影程度
	        resize: false, // 禁止拉伸
	        content: ctxPath + '/siteRainManage/addPage?areaId='+areaId,
	   		yes: function(index, layero){
	   			// 父页面方法
	   			rainSiteSubmit();
	        }
		});
    }
}

/**
 * 新增雨量站时 选择站点模式
 */
function chooseSiteModel(){
	// 获取下拉框选中值
	var flag = $("select[name='isNewSite'] option:selected").val();		// name方式
	// var flag = $("#isNewSite option:selected").val();				// id方式
	// 新建站点 隐藏数据提取控件
	if(flag != 0){
		document.getElementById("systemCode").style.visibility="hidden";
		document.getElementById("systemCodeText").style.visibility="hidden";
	}else if(flag == 0){
		document.getElementById("systemCode").style.visibility="visible";
		document.getElementById("systemCodeText").style.visibility="visible";
	}
}

/**
 * 获取子页面提交方法
 */
function rainSiteSubmit(){
	alert(">>>>>>>>>>>>>>>");
	/*$("#addRainSiteForm").click(function(){
		var params = $("#addRainSiteForm").formSerilize();
		alert(params);
	});*/
	
//	$("#siteSubmit").click(function(){
		alert(">>>:" + $("#addRainSiteForm").serialize());
		$.ajax({
           type:'post',        
           url:'#',    
           data:$("#myform").serialize(),    
           cache:false,    
           dataType:'json',    
           success:function(data){
               alert("请求成功");
           }
		})
//	});
	
	
	/*var frameId=document.getElementById('add_rain_site_form').getElementsByTagName("iframe")[0].id;
	$('#'+frameId)[0].contentWindow.rainSiteFormSubmit();*/
}

/**
 * 获取添加页面表单并提交
 */
function rainSiteFormSubmit(){
	// 表单非空验证
	var result = checkNull();
	alert(result);
	if(result == true){
		// 提交表单数据
	    $('#addRainSiteForm').submit();
	    // 关闭当前弹出层
	    var index = parent.layer.getFrameIndex(window.name);
	    parent.layer.close(index);
		// 重新加载列表信息页
		window.parent.location.reload();
	}
}

/**
 * 雨量站表单非空验证
 * @returns {Boolean}
 */
function checkNull(){
	// 表单属性
	var isNewSite = $("select[name='isNewSite'] option:selected").val();
	var systemCode = $("select[name='systemCode'] option:selected").val();
	var deviceCode = $("#deviceRainCode").val().length;
	var deviceName = $("#deviceRainName").val().length;
	var modelCode = $("select[name='sriDevicemodelCode'] option:selected").val();
	var height = $("#sriHeight").val().length;
	var longitude = $("#sriLongitude").val().length;
	var latitude = $("#sriLatitude").val().length;
	
	if(isNewSite == 0 && systemCode == "--请选择提取系统--"){
		layer.alert('请选择数据提取系统！', {icon: 0});
		return false;
	}else if(deviceCode == 0){
		layer.alert('站点编码不能为空！', {icon: 0});
		return false;
	}else if(deviceName == 0){
		layer.alert('站点名称不能为空！', {icon: 0});
		return false;
	}else if(modelCode == "--请选择设备类型--"){
		layer.alert('请选择监测设备类型！', {icon: 0});
		return false;
	}else if(height == 0){
		layer.alert('基面高程不能为空！', {icon: 0});
		return false;
	}else if(longitude == 0){
		layer.alert('站点经度不能为空！', {icon: 0});
		return false;
	}else if(latitude == 0){
		layer.alert('站点纬度不能为空！', {icon: 0});
		return false;
	}
	return true;
}

/**
 * 图片回显
 * @param picUrl
 */
function showPhotoInfo(picName){
	// 回显路径+照片名称
	var imgUrl = picPath+picName;
	if(picName != null && picName.length != 0){
		layer.open({
			type: 1,
			title: false,
			closeBtn: 1,
			shade: 0.5,	// 遮罩阴影程度
			area: ['900px', '600px'],
			skin: 'layui-layer-nobg', //没有背景色
			shadeClose: true,
			content: '<img src='+imgUrl+' width="900" height="600" alt="雨量站照片" />'
		});
	}else{
		layer.alert('此站点暂无照片！', {icon: 0});
		return false;
	}
}