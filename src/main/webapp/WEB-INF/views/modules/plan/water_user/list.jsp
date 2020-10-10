<%@ page language="java" contentType="text/html; charset=utf-8" pageEncoding="utf-8"%>
<%@ include file="/WEB-INF/views/base.jsp"%>

<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
	<meta http-equiv="Content-Type" content="text/html; charset=utf-8">
	<meta http-equiv="X-UA-Compatible" content="IE=Edge">
	<meta name="viewport" content="width=device-width, initial-scale=1,maximum-scale=1, user-scalable=no">
	<title>灌区信息化平台</title>
	<link type="text/css" rel="stylesheet" href="${ctxstc}/adapters/bootstrap/css/Copy of bootstrap.min.css" title="" />
	<link type="text/css" rel="stylesheet" href="${ctxstc}/css/body.css" title="" />
	<link type="text/css" rel="stylesheet" href="${ctxstc}/css/style.css" title="" />
	<link type="text/css" rel="stylesheet" href="${ctxstc}/css/dermadefault.css" title="blue" />
	<link type="text/css" rel="stylesheet" href="${ctxstc}/css/templatecss.css" title="" />
	<link type="text/css" rel="stylesheet" href="${ctxstc}/css/ui-layout.css" title="" /><!-- angular ui --->
	<link type="text/css" rel="stylesheet" href="${ctxstc}/css/custom/scroll.css" title="" /><!-- 滚动条样式 --->
	
	<script type="text/javascript" src="${ctxstc}/jquery/jquery-1.11.1.min.js"></script>
	<script type="text/javascript" src="${ctxstc}/jquery/jquery.cookie.js"></script>
	<script type="text/javascript" src="${ctxstc}/adapters/bootstrap/js/bootstrap.min.js"></script>
	<script type="text/javascript" src="${ctxstc}/adapters/bootstrap/js/bootstrap-paginator.js"></script>
	<script type="text/javascript" src="${ctxstc}/js/style.js"></script>
	<script type="text/javascript" src="${ctxstc}/js/angular.min.js"></script><!-- angular ui --->
	<script type="text/javascript" src="${ctxstc}/js/ui-layout.js"></script>

	<!--  
	<link rel="stylesheet" href="${ctxstc}/adapters/ztree/css/demo.css" type="text/css">-->
	<link rel="stylesheet" href="${ctxstc}/adapters/ztree/css/zTreeStyle/zTreeStyle.css" type="text/css">
	
	<script type="text/javascript" src="${ctxstc}/adapters/ztree/js/jquery.ztree.core.js"></script>
	
    <link rel="stylesheet" href="${ctxstc}/adapters/ztree/css/metroStyle/metroStyle.css" type="text/css">
    <%--<script type="text/javascript" src="${ctxstc}/adapters/ztree/js/jquery.ztree.excheck.js"></script>--%>
    <script type="text/javascript" src="${ctxstc}/adapters/ztree/js/jquery.ztree.exedit.js"></script>
    <link type="text/css" rel="stylesheet" href="${ctxstc}/css/selfdefault.css" title="" />
	<script type="text/javascript" src="${ctxstc}/js/vue.js"></script>
	<link rel="stylesheet" href="${ctxstc}/js/element-ui/theme-chalk/index.css" type="text/css">
	<script type="text/javascript" src="${ctxstc}/js/element-ui/index.js"></script>
	 <script src="${ctxstc}/adapters/layui/layer/layer.js" merge="true"></script>

	<style>
	  
		.topbar-nav-item a{color: red;}
		.topbar-nav-item a:hover{color: blue;}
		.upload-demo .el-upload-list{display:none;}
		.table-header thead{color:#4b5261;font-weight:600;font-size: 15px }
	  </style>
</head>
<body>
	<form  action="${ctx}/cal_canal_info/list" method="post">

	<!-- 页面主体start -->
	<div class="down-main" id="excelPoi">
		
		<!-- 页面主体右侧内容start -->
		<div class="right-product right-full" style="/*margin-left:55px*/;">
			<section id="layout" ng-app="doc.ui-layout">
			<div ui-layout class="layout-mock">
				<ui-layout options="{ flow : 'column' }">
				
				<sidebar class="east-back left-back" >
					<ul id="tree" class="nav nav-pills nav-stacked">
						<li><h4 style="margin-left: 10px;">行政区域等级</h4></li>
						<li id="treeDemo" class="ztree"></li>
					</ul>
				</sidebar>
				
				<div class="center-back right-back" >
					<div class="container-fluid">
						<div class="info-center">
							<div class="page-header">
								<div class="pull-left">
									<h4>灌区信息化平台>系统管理>用水户管理</h4>
								</div>
							</div>
							
							<div class="search-box row">
								<div class="col-md-12">
									<div class="<%--btn-group--%> pull-left" role="group" aria-label="..." style="margin-right:60px;">
										<button  id="add_water_user" <%--style="display: none"--%> type="button" class="btn btn-default" onclick="addWaterUser()" >
											<span class="glyphicon glyphicon-plus">
											</span>
											<a href="javascript:void(0)"  >新增</a>
										</button>
										<button id="delete_water_user" style="display: none" type="button" class="btn btn-default" onclick="deleteCanalMaterials()">
											<span class="glyphicon glyphicon-trash"></span>删除
										</button>
										<span id="edit_water_user" />
										<span id="detail_water_user" />
									</div>
									<!-- ===========Excel导入 ============-->
									<div>
		                         		<div id="excelFrom" style="display:inline">
				                         	 <input id="labelText" type="text" style="font-size:14px;text-indent:1em;display:inline;" />
					                         <el-upload class="upload-demo" :on-success="handleSuccess" ref="upload" :on-change="handleChange" action="${ctx}/water_user/ExcelImport" :auto-upload="false" style="display:inline;margin-left:-90px;">
												  <el-button id="labelForm" slot="trigger" size="small" >选取文件</el-button>&nbsp;&nbsp;>>>
												  <el-button id="#uploadExcel" style="margin-left: 10px;height:33px;" size="medium" type="primary" @click="submitUpload">点击上传</el-button>
		 									 </el-upload>
										</div>
	 									<div style="display:inline;position: absolute;right: 25%;top:-1px;" >
	 										<el-button type="primary" style="height:34px;" @click="downloadExcel">下载Excel模板</el-button>
	 									</div>
 							</div>
								</div>
							</div>
							<div class="clearfix"></div>
							<div class="table-margin">
								<table class="table table-bordered table-header">
									<thead>
										<tr>
											<%--<td><input type="checkbox" id="selAll" onclick="doSelectAll()" /></td>--%>
											<td class="w10">姓名</td>
											<td class="w10">电话</td>
											<td class="w10">账号</td>
											<td class="w10">密码</td>
											<td class="w10">水权面积</td>
											<td class="w10">实有面积</td>
											<td class="w10">居住地址</td>
											<td class="w10">备注</td>
											<td class="w10">操作</td>
										</tr>
									</thead>
									<tbody id="table_list">
										
									</tbody>
									
									<tfoot>
										<tr>
											<td colspan="10">
												<div class="pull-right">
													<div id="Paginator">
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
	</form>
	<!-- js引入 -->
	<script type="text/javascript" src="${ctxstc}/js/footer.js"></script>
	<script type="text/javascript" src="${ctxstc}/js/custom/water_area_cook.js"></script>
	<script type="text/javascript" src="${ctxstc}/js/custom/permission/show_three_level_permission.js"></script>
	<script>
    /* 相对链接的基准URL */
    var curWwwPath = window.document.location.href;
    var pathName = window.document.location.pathname;
    var pos = curWwwPath.indexOf(pathName);
    var localhostPaht = curWwwPath.substring(0,pos);
    var projectName = pathName.substring(0,pathName.substr(1).indexOf('/')+1);
    var ctxPath = localhostPaht + projectName;

	var excelPoi = new Vue({
		el:'#excelPoi',
		data:{
			isExcel:'',
			map:{},
		},
		methods:{
			submitUpload:function(){
				debugger
				 var _this = this;
				if(_this.isExcel == false){
					_this.$message.error('Excel文件格式错误，请选择正确格式的Excel文件!');
				}else{
					_this.$refs.upload.submit();
				}
				
			},
			handleSuccess:function(response, file, fileList){
				debugger
				var _this = this;
				if(response=="success"){
					_this.$message.success('Excel文件上传成功!');
				}else{
					_this.$message.error("第"+(Number(response)+3)+"行,第1列表格为空或填写不规范，请重新审查提交！");
				}
			},
			//下载Excel模板
			downloadExcel:function(){
				debugger
				var _this = this;
				window.location.href="${ctx}/water_user/downLoadExcel";
			},
			handleChange:function(file, fileList){
				var _this = this;
				debugger
				const isExcel = (file.name.substring(file.name.lastIndexOf(".")+1)=="xlsx")||(file.name.substring(file.name.lastIndexOf(".")+1)=="xls");
		        if (!isExcel) {
		        	_this.$message.error('请选择正确格式的Excel文件!');
		        }
		        $("#labelText").val(file.name);
		        _this.isExcel = isExcel;
		        return isExcel;
			},
			//树菜单点击方法
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
		created:function(){
		var _this = this;
		},
		mounted:function () {
			var _this = this;
			debugger
			_this.handleVityTree();
		},
	});
	//树结构json数据
	// var zNodes=[];
	
	/*function load(id){
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
		
		/!* var areaId2 = "${waterUserList[0].id}"; *!/
		//alert(areaId2);
		start("",1,threeLevelPermission);
		/!* delCookie("areaId"); *!/
		
	};*/
	//添加区域弹窗
	 function addWaterUser(){
		 var areaId = getCookie("areaId");
			//alert(areaId);
			delCookie("areaId");
			if(areaId==null||areaId==""){
				layer.alert('请先选择行政区！', {icon: 0});
			}else{
				//打开添加窗口
				//alert("111");
				 layer.open({
					 	id: 'insert-water—user-form'
				        ,type: 2 //此处以iframe举例
				        ,title: '行政区为：'+areaId
				        ,area: ['700px', '440px']
				        ,shade: 0.8
				        ,maxmin: true
				        ,content: '${ctx}/water_user/add_page?areaId='+areaId
				        ,btn: ['确定', '关闭'] //只是为了演示
				        ,yes: function(){
				        	//子页面提交
				        	insertSubmit();
				        	layer.confirm('你的预测添加成功', {
				        		  btn: ['确定'] //按钮
				        		}, function(){	
			        			document.forms[0].action="${ctx}/water_user/list";
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
			   var frameId=document.getElementById("insert-water—user-form").getElementsByTagName("iframe")[0].id;
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
	/*function showNodes(threeLevelPermission){
		var zNode;
		<c:forEach items="${waterUserList}" var="waterUser">
		var id   ="${waterUser.id}";
		var pId  ="${waterUser.parentLevelId}";
		var name ="${waterUser.treeName}";
		var level="${waterUser.treeLevel}";
			if(level==0||level==1){
				zNode={id:id, pId:pId, name:name,click:"start('${waterUser.id}',1,'"+threeLevelPermission+"');", open:true};
			}else{
				zNode={id:id, pId:pId, name:name,click:"start('${waterUser.id}',1,'"+threeLevelPermission+"');", open:false};
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
		$("#table_list").empty();
		$.ajax({
			url:"${ctx}/water_user/page",
			data: {id:id,page:page},
			type: "post",
			async: false,//非异步
			success: function(msg){
				//alert(JSON.stringify(msg) );
				var table = msg;
				for(var i=0;i<msg.length;i++){
					var currentTag = document.getElementById("table_list");
						var newTrTag = document.createElement("tr");
/*							var newTdTag1 = document.createElement("td");
								var newInputTag = document.createElement("input");
								newInputTag.setAttribute("type", "checkbox");
								newInputTag.setAttribute("name", "selectedRow");
								newInputTag.setAttribute("value", msg[i].id);
								
								newTdTag1.appendChild(newInputTag);*/
							var newTdTag2 = document.createElement("td");
								newTdTag2.innerHTML=msg[i].name;
							var newTdTag3 = document.createElement("td");
								newTdTag3.innerHTML=msg[i].phonenumber;
							var newTdTag4 = document.createElement("td");
								newTdTag4.innerHTML=msg[i].account;
							var newTdTag5 = document.createElement("td");
								newTdTag5.innerHTML=msg[i].password;
							var newTdTag6 = document.createElement("td");
								newTdTag6.innerHTML=msg[i].waterRightArea;
							var newTdTag7 = document.createElement("td");
								newTdTag7.innerHTML=msg[i].realArea;
							var newTdTag8 = document.createElement("td");
								newTdTag8.innerHTML=msg[i].address;
							var newTdTag9 = document.createElement("td");
								newTdTag9.innerHTML=msg[i].dwpcRemark;
							var newTdTag10= document.createElement("td");
								var sonid = JSON.stringify(msg[i].id);
								newTdTag10.innerHTML=showThreeLevelPermission(threeLevelPermission,sonid);
								/*newTrTag.appendChild(newTdTag1);*/
								newTrTag.appendChild(newTdTag2);
								newTrTag.appendChild(newTdTag3);
								newTrTag.appendChild(newTdTag4);
								newTrTag.appendChild(newTdTag5);
								newTrTag.appendChild(newTdTag6);
								newTrTag.appendChild(newTdTag7);
								newTrTag.appendChild(newTdTag8);
								newTrTag.appendChild(newTdTag9);
								newTrTag.appendChild(newTdTag10);
							currentTag.appendChild(newTrTag);
				
				}
				
			}
		});
		
		 $.post("${ctx}/water_user/page_nav").success(function (response) {
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
	function doEdit(sonid){
		//alert(sonid);
		layer.open({
		 	id: 'edit-water-form'
	        ,type: 2 //此处以iframe举例
	        ,title: '编辑用户信息'
	        ,area: ['700px', '440px']
	        ,shade: 0.8
	        ,maxmin: true
	        ,content: '${ctx}/water_user/edit_page?sonid='+sonid
	        ,btn: ['确定', '关闭'] //只是为了演示
	        ,yes: function(){
        	//子页面提交
        		editSluiceSiteSubmit();
        		layer.confirm('你的预测编辑成功', {
	        		  btn: ['确定'] //按钮
	        		}, function(){	
      			document.forms[0].action="${ctx}/water_user/list";
		    		document.forms[0].submit();
	        	});
	        }
	        ,btn2: function(){
	          layer.closeAll();
	        }
	        
	        ,zIndex: layer.zIndex //重点1
	        ,success: function(layero){
	        	//start(getCookie ("${areaId}"),1);
	          layer.setTop(layero); //重点2
	        }
	    });
	}
	//编辑提交
	function editSluiceSiteSubmit(){
		////alert("haha");
	   var frameId=document.getElementById("edit-water-form").getElementsByTagName("iframe")[0].id;
	   $('#'+frameId)[0].contentWindow.mySubmit();
	}
	
	//删除
	function doDelete(id){
		$.ajax({
			url:"${ctx}/water_user/delete",
			type: "post",
			data: {id:id},
			async: false,//非异步
			success: function(msg){
				if(msg==1){
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