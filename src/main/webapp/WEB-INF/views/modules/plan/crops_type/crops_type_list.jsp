<%@ page language="java" contentType="text/html; charset=utf-8" pageEncoding="utf-8"%>
<%@ include file="/WEB-INF/views/base.jsp"%>

<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
	<meta http-equiv="Content-Type" content="text/html; charset=utf-8">
	<meta http-equiv="X-UA-Compatible" content="IE=Edge">
	<meta name="viewport" content="width=device-width, initial-scale=1,maximum-scale=1, user-scalable=no">
	<title>灌区信息化平台</title>
	<link type="text/css" rel="stylesheet" href="${ctxstc}/adapters/bootstrap/css/bootstrap.min.css" title="" />
	<link type="text/css" rel="stylesheet" href="${ctxstc}/css/body.css" title="" />
	<link type="text/css" rel="stylesheet" href="${ctxstc}/css/style.css" title="" />
	<link type="text/css" rel="stylesheet" href="${ctxstc}/css/dermadefault.css" title="blue" />
	<link type="text/css" rel="stylesheet" href="${ctxstc}/css/templatecss.css" title="" />
	<link type="text/css" rel="stylesheet" href="${ctxstc}/css/ui-layout.css" title="" /><!-- angular ui --->
	<link type="text/css" rel="stylesheet" href="${ctxstc}/css/custom/scroll.css" title="" />
	<link type="text/css" rel="stylesheet" href="${ctxstc}/adapters/ztree/css/zTreeStyle/zTreeStyle.css" /><!-- zTree -->
	<link type="text/css" rel="stylesheet" href="${ctxstc}/adapters/ztree/css/metroStyle/metroStyle.css">

	<script type="text/javascript" src="${ctxstc}/jquery/jquery-1.11.1.min.js"></script>
	<script type="text/javascript" src="${ctxstc}/jquery/jquery.cookie.js"></script>
	<script type="text/javascript" src="${ctxstc}/adapters/bootstrap/js/bootstrap.min.js"></script>
	<script type="text/javascript" src="${ctxstc}/adapters/bootstrap/js/bootstrap-paginator.js"></script>
	<script type="text/javascript" src="${ctxstc}/js/style.js"></script>
	<script type="text/javascript" src="${ctxstc}/js/angular.min.js"></script><!-- angular ui --->
	<script type="text/javascript" src="${ctxstc}/js/ui-layout.js"></script>
	<script type="text/javascript" src="${ctxstc}/adapters/ztree/js/jquery.ztree.core.js"></script><!-- zTree -->
	<script type="text/javascript" src="${ctxstc}/adapters/layui/layer/layer.js" merge="true"></script>
	<script type="text/javascript" src="${ctxstc}/jquery/jquery-form.js" ></script>
	<script type="text/javascript" src="${ctxstc}/js/vue.js"></script>
	<link rel="stylesheet" href="${ctxstc}/js/element-ui/theme-chalk/index.css" type="text/css">
	<script type="text/javascript" src="${ctxstc}/js/element-ui/index.js"></script>
	<style>
		.table-header thead{color:#4b5261;font-weight:600;font-size: 15px }
	</style>
</head>
<body>
	<form  action="" method="post">
	<!-- 页面主体start -->
	<div class="down-main" id="scroll">
		<!-- 页面主体右侧内容start -->
		<div class="right-product right-full">
			<section id="layout" ng-app="doc.ui-layout">
			<div ui-layout class="layout-mock">
				<ui-layout options="{ flow : 'column' }">
				
				<sidebar class="east-back left-back" >
					<ul id="tree" class="nav nav-pills nav-stacked">
						<li><h4 style="margin-left: 10px;">行政区域等级</h4></li>
						<ul id="treeDemo" class="ztree">
						</ul>
					</ul>
				</sidebar>
				
				<div class="center-back right-back">
					<div class="container-fluid">
						<div class="info-center">
							<div class="page-header">
								<div class="pull-left">
									<h4>灌区信息化平台>系统管理>农作物类型管理</h4>
								</div>
							</div>
							
							<div class="search-box row">
								<div class="col-md-12">
									<div class="btn-group pull-left" role="group" aria-label="...">
										<button id="add_crops_type" style="/*display: none*/" type="button" class="btn btn-default" onclick="addCropsType()">
											<span class="glyphicon glyphicon-plus"></span>新增
										</button>
									
<%--										<button id="delete_crops_type" style="display: none" type="button" class="btn btn-default" onclick="delCropsInfo()">
											<span class="glyphicon glyphicon-trash"></span>删除
										</button>--%>
										<span id="edit_crops_type" />
										<span id="detail_crops_type" />
									</div>
								</div>
							</div>
							
							<div class="clearfix"></div>
							<div class="table-margin">
								<table class="table table-bordered table-header">
									<thead>
										<tr>
											<%--<td class="w5"><input type="checkbox" id="selCropsAll" onclick="checkCropsAll()"/></td>--%>
											<td class="w15">作物类型编码</td>
											<td class="w15">所属地区</td>
											<td class="w15">作物类型名称</td>
											<td class="w15">添加时间</td>
											<td class="w15">作物类型描述</td>
											<td class="w15">操作</td>
										</tr>
									</thead>
									
									<tbody id="cropsTableList">
									
									</tbody>
									
									<tfoot>
										<tr>
											<td colspan="8">
												<div class="pull-right">
													<div id="pagination">
														<ul id="pageLimit"></ul>
													</div>
												</div>
											</td>
										</tr>
									</tfoot>
								</table>
							</div>
						</div>
					</div>
				</div>
				</ui-layout>
			</div>
			</section>
		</div>
		<!-- 页面主体右侧内容end -->
	</div>
	<!-- 页面主体end -->

	<!--弹窗添加或修改内容必备的代码-->
	<div id="show">
	    <iframe id="popup" name="popup" marginwidth=0 width="100%" frameBorder=0 scrolling=yes></iframe>
	</div>
</form>	
	<!-- js引入 -->
	<%-- <script type="text/javascript" src="${ctxstc}/js/custom/crops.js"></script> --%>
	<script type="text/javascript" src="${ctxstc}/js/footer.js"></script>
	<script type="text/javascript" src="${ctxstc}/js/custom/water_area_cook.js"></script>
	<script type="text/javascript" src="${ctxstc}/js/custom/permission/show_three_level_permission.js"></script>
	<script >
	/* 相对链接的基准URL */
	var curWwwPath = window.document.location.href;
	var pathName = window.document.location.pathname;
	var pos = curWwwPath.indexOf(pathName);
	var localhostPaht = curWwwPath.substring(0,pos);
	var projectName = pathName.substring(0,pathName.substr(1).indexOf('/')+1);
	var ctxPath = localhostPaht + projectName;

	var scroll = new Vue({
		el:'#scroll',
		data:{

		},
		methods:{
			zTreeOnClick:function(event, treeId, treeNode){
				debugger
				var _this = this;
				debugger
				start(treeNode.id,1,'');
			},
			//树目录菜单初始化
			handleVityTree:function(id,code){
				var _this = this;
				debugger
				var setting={
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
							name:'areaName'
						}
					},
				};
				$.post(ctxPath+'/sysArea/areaTreeList',{waterId:id,waterCode:code},function(result){
					debugger
					if(result!=""&&result!=null) {
						var treeData = JSON.parse(result);
						treeData[0].open = true;
						if(treeData[0].children[0] != undefined){
							treeData[0].children[0].open = true;
						}
						$.fn.zTree.init($('#treeDemo'), setting, treeData);
						start(treeData[0].id,1,'');
					}
				});
			},
		},

		created:function () {

		},
		mounted:function () {
			var _this = this;
			debugger
			_this.handleVityTree();
		},
	})

	//树结构json数据
	// var zNodes=[];
	
/*	function load(id){
		//三级权限code数组============================================================
		var threeLevelPermission = [];
		//拿到三级权限的的列表
		<c:forEach items="${threeLevelPermissions}" var="sysPermission">
			var menuNameCode = "${sysPermission.menuNameCode}";
			//拿到页面三级权限对应的标签
			var tag = document.getElementById(menuNameCode);
			if(tag!=null){//如果有权限就将他显示
				tag.style.display="block";
				threeLevelPermission.push(menuNameCode);
			}
		</c:forEach>
		
		
		
		showNodes(threeLevelPermission); 
		$.fn.zTree.init($("#treeDemo"), setting, zNodes);
		
		var areaId2 = "${areaId}";
		//alert(areaId2);
		start(areaId2,1,threeLevelPermission);
		delCookie("areaId");
		
	};*/
	//添加区域弹窗
	 function addCropsType(){
		 var areaId = getCookie("areaId");
			//alert(areaId);
			delCookie("areaId");
			if(areaId==null||areaId==""){
				layer.alert('请先选择行政区！', {icon: 0});
			}else{
				//打开添加窗口
				//alert("111");
				 layer.open({
					 	id: 'insert-crops_type-form'
				        ,type: 2 //此处以iframe举例
				        ,title: '行政区为：'+areaId
				        ,area: ['600px', '330px']
				        ,shade: 0.8
				        ,maxmin: true
				        ,content: '${ctx}/crops/addPage?areaId='+areaId
				        ,btn: ['确定', '关闭'] //只是为了演示
				        ,yes: function(){
				        	//子页面提交
				        	insertSubmit();
				        	layer.confirm('你的预测添加成功', {
				        		  btn: ['确定'] //按钮
				        		}, function(){	
			        			document.forms[0].action="${ctx}/crops/list";
					    		document.forms[0].submit();
				        		layer.msg('的确很重要', {icon: 1})
				        	});
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
		 function insertSubmit(){
			   var frameId=document.getElementById("insert-crops_type-form").getElementsByTagName("iframe")[0].id;
			   $('#'+frameId)[0].contentWindow.mySubmit();
		  }
	
	//导航树的配置
	/*var setting = {
            view: {

                selectedMulti: false
            },
            check: {
                //enable: true
            },
            data: {
                simpleData: {
                    enable: true
                }
            },
            edit: {
                //enable: true
            }
	};*/
	
	//树结构json数据
	// var zNodes=[];

	//拿到后台的json数据赋值给zNodes
/*	function showNodes(threeLevelPermission){
		var zNode;
		<c:forEach items="${sysAreaList}" var="sysArea">
			var id="${sysArea.id}";
			var pId="${sysArea.parentAreaId}";
			var name="${sysArea.areaName}";
			var level="${sysArea.areaLevel}";
			if(level==0||level==1){
				zNode={id:id, pId:pId, name:name,click:"start('${sysArea.id}',1,'"+threeLevelPermission+"');", open:true};
			}else{
				zNode={id:id, pId:pId, name:name,click:"start('${sysArea.id}',1,'"+threeLevelPermission+"');", open:false};
			}
			zNodes.push(zNode);
		</c:forEach>
	}*/
	
	var newCount = 1;
	function addHoverDom(treeId, treeNode) {
	    var sObj = $("#" + treeNode.tId + "_span");
	    if (treeNode.editNameFlag || $("#addBtn_"+treeNode.tId).length>0) return;
	    var addStr = "<span class='button add' id='addBtn_" + treeNode.tId
	        + "' title='add node' onfocus='this.blur();'></span>";
	    sObj.after(addStr);
	    var btn = $("#addBtn_"+treeNode.tId);
	    if (btn) btn.bind("click", function(){
	    	addWaterArea();
	        var zTree = $.fn.zTree.getZTreeObj("treeDemo");
	        return false;
	    });
	};
	function removeHoverDom(treeId, treeNode) {
	    $("#addBtn_"+treeNode.tId).unbind().remove();
	};
	


	//当点击某一级树目录触发
	function start(id,page,threeLevelPermission){
		//alert(id+"-------");
		//将获取的id放到cook中
		setCookie("areaId",id);
		
		//每次进来清除之前的查询结果
		$("#cropsTableList").empty();
		$.ajax({
			url:"${ctx}/crops/getCropslist",
			data: {id:id,page:page},
			type: "post",
			async: false,//非异步
			success: function(msg){
				//layer.close(index);
				for(var i=0; i<msg.length; i++){
					var currentTag = document.getElementById("cropsTableList");
						var newTrTag = document.createElement("tr");
/*							var newTdTag1 = document.createElement("td");
							var newInputTag = document.createElement("input");
								newInputTag.setAttribute("type", "checkbox");
								newInputTag.setAttribute("name", "selectCropsAll");
								newInputTag.setAttribute("value", msg[i].id);
								newTdTag1.appendChild(newInputTag);*/
								
								
							
								
							var newTdTag2 = document.createElement("td");
								newTdTag2.innerHTML=msg[i].cropsCode;
								
							var newTdTag3 = document.createElement("td");
								newTdTag3.innerHTML=msg[i].sysareaCode;	
								
							var newTdTag4 = document.createElement("td");
								newTdTag4.innerHTML=msg[i].cropsName;
								
							var newTdTag5 = document.createElement("td");
								newTdTag5.innerHTML=msg[i].ctiCreateTime;
								
							var newTdTag6 = document.createElement("td");
								newTdTag6.innerHTML=msg[i].description;
								
							var newTdTag7 = document.createElement("td");
							var cid = JSON.stringify(msg[i].id);
								newTdTag7.innerHTML=showThreeLevelPermission(threeLevelPermission,cid);
							
							/*newTrTag.appendChild(newTdTag1);*/
							newTrTag.appendChild(newTdTag2);
							newTrTag.appendChild(newTdTag3);
							newTrTag.appendChild(newTdTag4);
							newTrTag.appendChild(newTdTag5);
							newTrTag.appendChild(newTdTag6);
							newTrTag.appendChild(newTdTag7);
							currentTag.appendChild(newTrTag);
				}
				
			}
		});
		
		 $.post("${ctx}/crops/getPages").success(function (response) {
			// ////alert(JSON.stringify(response));
			    var pageNum = response.pageNum;
				var pages = response.pages;
				var size = response.size;
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
			        	//alert(JSON.stringify(page));
			        	//var id = getCookie ("areaId");
			        	start(id,page,threeLevelPermission);
			        	
			        }
			    };
			    $('#pageLimit').bootstrapPaginator(options);
			}).error(function (response) {
			    ////alert("列表请求出错");
			});
		
	}
	
	//编辑
	function doEdit(id){
		layer.open({
			id: 'edit_crops_info',
			type: 2,
			title: '修改农作物信息',
			area: ['460px','340px'], // 弹窗大小(宽高)
			btn: ['确定', '取消'], // 页面按钮
			closeBtn: 1, // 显示关闭按钮(右上角)
			shade: 0.5,	// 遮罩阴影程度
			resize: false, // 禁止拉伸
			content: ctxPath+'/crops/editCropsPage?id='+id,
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
		var frameId=document.getElementById('edit_crops_info').getElementsByTagName("iframe")[0].id;
		$('#'+frameId)[0].contentWindow.cropsEditFormSubmit();
		// 重新加载列表信息页
		window.location.reload();
	}
	/**
	 * 获取修改页面表单并提交
	 */
	function cropsEditFormSubmit(){
		// 提交表单数据
		$('#cropsEditForm').submit();
		var index = parent.layer.getFrameIndex(window.name); //先得到当前iframe层的索引
		parent.layer.close(index);
	}
	//删除
	function doDelete(id){
		$.ajax({
			url:"${ctx}/crops/deleteCropsById",
			type: "post",
			data: {id:id},
			async: false,//非异步
			success: function(msg){
				if(msg==1){
					layer.confirm('删除成功', {
		        		  btn: ['确定'] //按钮
		        		}, function(){	
	      			document.forms[0].action="${ctx}/crops/list";
			    		document.forms[0].submit();
		        	});
				}
			}
		});
		
	}
	//批量删除
	function deleteCanalMaterials(){
		//alert("asdfasdf");
		var ids = [];
		  $('input[name=selectedRow]:checked').each(function () {
			  ids.push($(this).val());
		  });
		  $.ajax({
				url:"${ctx}/water_user/deletes",
				data: {ids:ids},
				type: "post",
				async: false,//非异步
				success: function(msg){
					//alert(JSON.stringify(msg));
					if(msg==ids.length){
					//	start(1);
						layer.confirm('删除成功', {
			        		  btn: ['确定'] //按钮
			        		}, function(){	
		      			document.forms[0].action="${ctx}/water_user/list";
				    		document.forms[0].submit();
			        	});
					}
				}
			});
	}
	function doSelectAll(){
		$("input[name=selectedRow]").prop("checked", $("#selAll").is(":checked"));
	}
	
	</script>
</body>
</html>