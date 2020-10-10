/* 相对链接的基准URL */
var curWwwPath = window.document.location.href;
var pathName = window.document.location.pathname;
var pos = curWwwPath.indexOf(pathName);
var localhostPaht = curWwwPath.substring(0,pos);
var projectName = pathName.substring(0,pathName.substr(1).indexOf('/')+1);
var ctxPath = localhostPaht + projectName;
var setting;
var scroll = new Vue({
	el:'#scroll',
	data:{
		activeName:'first',
		areasTableData:[],
        currentPage:'1',
        pagesize:'10',
        zTreeData:'',
		activeNode:'',
		areaData:{},
		area:{
			id:'',
			areaName:'',
			areaLevel:'',
			areaCode:'',
			waterAreaName:'',
			waterAreaLevel:'',
			waterAreaCode:'',
		} //当前行政/水管区域数据
	},
	methods:{
        handleSizeChange:function(size){
            var _this = this;
            _this.pagesize = size;
        },
        handleCurrentChange:function(currentPage){
            var _this = this;
            _this.currentPage = currentPage;
        },
		/**
		 * 树菜单的点击事件
		 * @param event
		 * @param treeId
		 * @param treeNode
		 */
		zTreeOnClick:function(event, treeId, treeNode){
			debugger
			var _this = this;
			debugger
			_this.area = treeNode;
			_this.loadAreasInfo(treeNode.id)
		},
		/**
		 * 灌区的树菜单初始化
		 */
		handleTabs:function(){
			var _this = this;
			debugger
			setting={
				view: {
					selectedMulti: false
				},
				check: {
					enable: true
				},
				callback: {
					onClick: _this.zTreeOnClick
				},
				data:{
					simpleData: {
						enable: true
					},
					key:{
						name:_this.activeName=='first'?"areaName":'waterAreaName'
					}
				},

			};
			_this.handleVityTree();
		},
		handleVityTree:function(id,code){
			var _this = this;
			debugger
			_this.areasTableData = [];
			var areaId = _this.activeName=='first'?'#areaZtree':'#waterAreaZtree';
			var url = _this.activeName=='first'?'/sysArea/areaTreeList':'/sys_water_area/water_tree';
			$.post(ctxPath+url,{waterId:id,waterCode:code},function(result){
				debugger
				if(result!=""&&result!=null) {
					var treeData = JSON.parse(result);
					if(treeData.length > 0){
						treeData[0].open = true;
						if(treeData[0].children[0] != undefined){
							treeData[0].children[0].open = true;
						}
						_this.area = treeData[0];
						_this.loadAreasInfo(treeData[0].id);
					}
					$.fn.zTree.init($(areaId), setting, treeData);
				}
			});
		},
		//区域信息查询
		loadAreasInfo:function(id){
			var _this = this;
			var url = _this.activeName=='first'?'/sysArea/getAreaList':'/sys_water_area/page';
			$.post(ctxPath+url,{id:id},function (data) {
				_this.areasTableData = data;
			});
		},
		//时间格式化（"YYYY-MM-DD HH:mm:ss"）
		dateFormat:function(row, column){
			var _this = this;
			var date = row[column.property];
			return moment(date).format("YYYY-MM-DD HH:mm:ss");
		},
		//修改
		doEdit:function(row){
			debugger
			var _this = this;
			let layerId = '';
			let layerTitle = '';
			let layerArea = '';
			let contentUrl = '';

			if(_this.activeName == 'first'){
				layerId = 'edit_areas_info';
				layerTitle = '修改行政区域信息';
				layerArea = ['435px','315px'];
				contentUrl = ctxPath+'/sysArea/editAreasPage?id='+row.id;
			}else if(_this.activeName == 'second'){
				layerId = 'edit_water_area_info';
				layerTitle = '修改水管区域信息';
				layerArea = ['435px','500px'];
				contentUrl = ctxPath+'/sys_water_area/editWaterAreasPage?id='+row.id;
			}
			layer.open({
				id: layerId,
				type: 2,
				title: layerTitle,
				area: layerArea, // 弹窗大小(宽高)
				btn: ['确定', '取消'], // 页面按钮
				closeBtn: 1, // 显示关闭按钮(右上角)
				shade: 0.5,	// 遮罩阴影程度
				resize: false, // 禁止拉伸
				content: contentUrl,
				yes: function(index,layero){
					// 信息修改提交
					_this.editSubmit(index,layero);
				}
			});
		},
		//修改提交
		editSubmit:function(index,layero){
			debugger
			var _this = this;
			// var frameId= '';
			let url = _this.activeName=='first'?ctxPath+"/sysArea/editSaveAreasInfo":ctxPath +'/sys_water_area/editWaterAreaSubmit';
			if(_this.activeName == 'first'){ //行政区
				_this.areaData.id =layero.find("iframe")[0].contentWindow.$("#id").val();
				_this.areaData.areaCode =layero.find("iframe")[0].contentWindow.$("#areaCode").val();
				_this.areaData.areaName =layero.find("iframe")[0].contentWindow.$("#areaName").val();
				_this.areaData.saRemark =layero.find("iframe")[0].contentWindow.$("#saRemark").val();
				// frameId=document.getElementById('edit_areas_info').getElementsByTagName("iframe")[0].id;
				// $('#'+frameId)[0].contentWindow.$('#areasEditForm').submit();
			}else if(_this.activeName == 'second'){ //水管区
				_this.areaData.id =layero.find("iframe")[0].contentWindow.$("#id").val();
				_this.areaData.waterAreaCode =layero.find("iframe")[0].contentWindow.$("#waterAreaCode").val();
				_this.areaData.waterAreaName =layero.find("iframe")[0].contentWindow.$("#waterAreaName").val();
				_this.areaData.waterAreaLevel =layero.find("iframe")[0].contentWindow.$("#waterAreaLevel").val();
				// _this.areaData.swaCreateTime =layero.find("iframe")[0].contentWindow.$("#swaCreateTime").val();
				// _this.areaData.parentWaterareaId =layero.find("iframe")[0].contentWindow.$("#parentWaterareaId").val();
				_this.areaData.swaRemark =layero.find("iframe")[0].contentWindow.$("#swaRemark").val();
			}
			$.post(url,{"result":JSON.stringify(_this.areaData)},function (msg) {
				if(msg == 1){
					_this.$message({
						message: '新增成功',
						type: 'success'
					});
				}else{
					_this.$message({
						message: '新增失败',
						type: 'warning'
					});
				}
				// 重新加载列表信息页
				_this.handleTabs();
				layer.close(index);
			})
		},
		//行政区域/水管区域删除
		doDelete:function (row) {
			debugger
			var _this = this;
			let url =  _this.activeName=='first'?ctxPath+"/sysArea/deleteAreasById":ctxPath+"/sys_water_area/delete_byid";
			let areaName  = _this.activeName=='first'?'行政':'水管';
			this.$confirm('确认删除该'+ areaName+'区域？','删除确认',{
				type: 'warning'
			}).then(() => {
				$.post(url,{id:row.id},function (result) {
					if(result == 1){
						_this.$message({
							message: '删除成功',
							type: 'success'
						});
					}else{
						_this.$message({
							message: '删除失败',
							type: 'warning'
						});
					}
					// _this.loadAreasInfo(_this.areaId);
					_this.handleTabs();
				})
			}).catch(_ => { });
            // 重新加载列表信息页
            // location.reload();
		},

		//新增行政/水管区域
		doAddArea:function () {
			var _this = this;
			debugger
			//当前父区域选中时
			/*if(_this.area.id != null && _this.area.id != ''){*/
				if(_this.activeName=='first'){
					layer.open({
						id: 'add_area_form', // 弹层唯一标识，防止重复弹出
						type: 2, // 基本层类型
						title: '新增行政区域,所属父区域【'+_this.area.areaName+'】', // 标题栏
						area: ['435px','315px'], // 弹窗大小(宽高)
						btn: ['确定', '取消'], // 页面按钮
						closeBtn: 1, // 显示关闭按钮(右上角)
						shade: 0.5,	// 遮罩阴影程度
						resize: false, // 禁止拉伸
						content: ctxPath + '/sysArea/addPage?id='+_this.area.id+'&areaLevel='+_this.area.areaLevel+'&areaCode='+_this.area.areaCode,
						btn1: function(index,layero){
							_this.areaData.parentAreaId =_this.area.id;
							_this.areaData.areaLevel =_this.area.areaLevel+1;//当前父区域的子级（level加一）
							_this.areaData.areaCode =layero.find("iframe")[0].contentWindow.$("#areaCode").val();
							_this.areaData.areaName =layero.find("iframe")[0].contentWindow.$("#areaName").val();
							_this.areaData.saRemark =layero.find("iframe")[0].contentWindow.$("#saRemark").val();
							$.post(ctxPath+"/sysArea/saveAreaInfo",{"result":JSON.stringify(_this.areaData)},function (msg) {
								if(msg == 1){
									_this.$message({
										message: '新增成功',
										type: 'success'
									});
								}else{
									_this.$message({
										message: '新增失败',
										type: 'warning'
									});
								}
								_this.handleTabs();
								layer.close(index);
							})
						},
						btn2:function(index,layero){
							layer.close(index);
						},
                        zIndex: layer.zIndex,//重点1
                        success: function (layero) {
                            layer.setTop(layero); //重点2
                        }
					});
				}else if(_this.activeName=='second'){
					layer.open({
						id: 'add_waterArea_form', //设定一个id，防止重复弹出
						type: 2, // 基本层类型
						title: '新增行政区域,所属父区域【'+_this.area.waterAreaName+'】', // 标题栏
						area: ['435px','315px'], // 弹窗大小(宽高)
						btn: ['确定', '取消'], // 页面按钮
						closeBtn: 1, // 显示关闭按钮(右上角)
						shade: 0.5,	// 遮罩阴影程度
						resize: false, // 禁止拉伸
						content: ctxPath + '/sys_water_area/add_sysWaterArea?id='+_this.area.id+'&waterAreaLevel='+_this.area.waterAreaLevel+'&waterAreaCode='+_this.area.waterAreaCode,
						btn1: function(index,layero){
							_this.areaData.parentWaterareaId =_this.area.id;
							_this.areaData.waterAreaLevel =_this.area.waterAreaLevel+1;
							_this.areaData.waterAreaCode =layero.find("iframe")[0].contentWindow.$("#waterAreaCode").val();
							_this.areaData.waterAreaName =layero.find("iframe")[0].contentWindow.$("#waterAreaName").val();
							_this.areaData.swaRemark =layero.find("iframe")[0].contentWindow.$("#swaRemark").val();
							$.post(ctxPath+"/sys_water_area/add",{"result":JSON.stringify(_this.areaData)},function (msg) {
								if(msg == 1){
									_this.$message({
										message: '新增成功',
										type: 'success'
									});
								}else{
									_this.$message({
										message: '新增失败',
										type: 'warning'
									});
								}
								_this.handleTabs();
								layer.close(index);
							})
						},
						btn2:function(index,layero){
							layer.close(index);
						},
                        zIndex: layer.zIndex,//重点1
                        success: function (layero) {
                            layer.setTop(layero); //重点2
                        }
					});
				}
/*			}else{
				_this.$message({
					message:'请选择'+_this.activeName=='first'?'行政':'水管'+'区域',
					type:'warning'
				})
			}*/
		}
	},
	mounted:function() {
        var _this = this;
        debugger
		_this.handleTabs();
	},
});

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
/*function doDelete(id){
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
}*/

/**
 * 行政区域信息修改
 * @param id
 */
/*function doEdit(row){
	debugger
	var _this = this;
	if(scroll.activeName == 'first'){
		layer.open({
			id: 'edit_areas_info',
			type: 2,
			title: '修改行政区域信息',
			area: ['435px','315px'], // 弹窗大小(宽高)
			btn: ['确定', '取消'], // 页面按钮
			closeBtn: 1, // 显示关闭按钮(右上角)
			shade: 0.5,	// 遮罩阴影程度
			resize: false, // 禁止拉伸
			content: ctxPath+'/sysArea/editAreasPage?id='+row.id,
			yes: function(){
				// 信息修改提交
				editSubmit();
			}
		});
	}else if(scroll.activeName == 'second'){
		layer.open({
			id: 'edit_water_area_info',
			type: 2,
			title: '修改水管区域信息',
			area: ['435px','500px'], // 弹窗大小(宽高)
			btn: ['确定', '取消'], // 页面按钮
			closeBtn: 1, // 显示关闭按钮(右上角)
			shade: 0.5,	// 遮罩阴影程度
			resize: false, // 禁止拉伸
			content: ctxPath+'/sys_water_area/editWaterAreasPage?id='+row.id,
			yes: function(){
				// 信息修改提交
				editSubmit();
			}
		});
	}
}*/
/**
 * 获取子页面修改提交方法
 */
/*function editSubmit(){
	var frameId= '';
	if(scroll.activeName == 'first'){ //行政区
		 frameId=document.getElementById('edit_areas_info').getElementsByTagName("iframe")[0].id;
		$('#'+frameId)[0].contentWindow.areasEditFormSubmit();
	}else if(scroll.activeName == 'second'){ //水管区
		 frameId=document.getElementById('edit_water_area_info').getElementsByTagName("iframe")[0].id;
		$('#'+frameId)[0].contentWindow.areasEditFormSubmit();
	}
	scroll.loadAreasInfo(scroll.areaId);
	// 重新加载列表信息页
	// window.location.reload(this);
}*/

/**
 * 获取修改页面表单并提交
 */
/*function areasEditFormSubmit(){
	if(scroll.activeName == 'first') { //行政区
		// 提交表单数据
		$('#areasEditForm').submit();
	}else if(scroll.activeName == 'second') { //水管区
		// 提交表单数据
		$('#waterAreasEditForm').submit();
	}
    var index = parent.layer.getFrameIndex(window.name); //先得到当前iframe层的索引
    parent.layer.close(index);
}*/

