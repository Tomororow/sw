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
	<link type="text/css" rel="stylesheet" href="${ctxstc}/css/custom/scroll.css" title="" /><!-- 滚动条样式 --->
	
	<script type="text/javascript" src="${ctxstc}/jquery/jquery-1.11.1.min.js"></script>
	
	<script type="text/javascript" src="${ctxstc}/jquery/jquery.cookie.js"></script>
	<script type="text/javascript" src="${ctxstc}/adapters/bootstrap/js/bootstrap.min.js"></script>
	<script type="text/javascript" src="${ctxstc}/adapters/bootstrap/js/bootstrap-paginator.js"></script>
	<script type="text/javascript" src="${ctxstc}/js/style.js"></script>
	<script type="text/javascript" src="${ctxstc}/js/angular.min.js"></script><!-- angular ui --->
	<script type="text/javascript" src="${ctxstc}/js/ui-layout.js"></script>

	<link rel="stylesheet" href="${ctxstc}/adapters/layui/css/layui.css" type="text/css">
	
	
	 <link rel="stylesheet" href="${ctxstc}/adapters/ztree/css/demo.css" type="text/css">
	<link rel="stylesheet" href="${ctxstc}/adapters/ztree/css/zTreeStyle/zTreeStyle.css" type="text/css">
	
	
	<script type="text/javascript" src="${ctxstc}/datepicker/WdatePicker.js "></script>
	 <script src="${ctxstc}/adapters/layui/layer/layer.js"></script>
	 <script type="text/javascript" src="${ctxstc}/js/custom/water_area_cook.js"></script>

	<style>
		.topbar-nav-item a{color: red;}
		.topbar-nav-item a:hover{color: blue;}
	  </style>
</head>
<body >
		<div style="padding: 30px; line-height: 22px; background-color: #393D49; color: #fff; font-weight: 300;">
  					
    				<form  id="form" action="${ctx}/role/add" method="post" enctype="multipart/form-data">
    				
    				<table border="0" cellspacing="50px" style="line-height: 35px; border-collapse:separate; border-spacing:0px 10px;">
						
						<tr>	
							<td class="w7"><span style="color: red">&nbsp;&nbsp;*&nbsp;</span>角色编码：</td><td class="w18"><input type="text" class="form-control" id="roleCode" name="roleCode" value="${roleCode}" style="color:black;width:220px;"/></td>
							
							
						</tr>
						<tr>
							<td class="w7"><span style="color: red">&nbsp;&nbsp;*&nbsp;</span>角色名称：</td><td class="w18"><input type="text" class="form-control" id="roleName" name="roleName" value="${roleName}" style="color:black;width:220px;"/></td>
						
						</tr>
							
						<tr>
							<td class="w7"><span style="color: red">&nbsp;&nbsp;&nbsp;</span>角色备注：</td><td class="w18"><input type="text" class="form-control" id="roleCode" name="srRemark" value="${srRemark}" style="color:black;width:220px;"/></td>
							
						</tr>
						<tr>
							<td class="w7" style="position: absolute;top:180px"><span style="color: red">&nbsp;&nbsp;&nbsp;</span>角色权限：</td>
							<td class="w18">
								<ul id="treeDemo"  class="ztree" style="border-radius:5px;"></ul>
							</td>
						</tr>
    				</table>
    				
	        		</form>
       		 </div>
	
	<script type="text/javascript" src="${ctxstc}/js/footer.js"></script>
	<script type="text/javascript" src="${ctxstc}/js/custom/water_area_cook.js"></script>
	<script type="text/javascript" src="${ctxstc}/datepicker/WdatePicker.js "></script>
	<script src="${ctxstc}/adapters/layui/layui.js" charset="utf-8"></script>
	
	<script type="text/javascript" src="${ctxstc}/adapters/ztree/js/jquery.ztree.core.js"></script>
	<script type="text/javascript" src="${ctxstc}/adapters/ztree/js/jquery.ztree.excheck.js"></script>
	
	
	<script>
	var setting = {
		check: {
			enable: true
		},
		data: {
			simpleData: {
				enable: true
			}
		},  
        callback:{  
            onCheck:onCheck  
        }  
	};
	var zNodes =[];
	
	function showNodes(){
		var zNode;
		<c:forEach items="${sysPermissionList}" var="sysPermission">
			var id   ="${sysPermission.id}";
			var pId  ="${sysPermission.parentMenuId}";
			var name ="${sysPermission.menuName}";
			var level="${sysPermission.menuLevel}";
			//alert(id);
			if(level==0||level==1){
				zNode={id:id, pId:pId, name:name,click:"start('${sysPermission.id}',"+level+");", open:true};
			}else{
				zNode={id:id, pId:pId, name:name,click:"start('${sysPermission.id}',"+level+");", open:false};
			}
			zNodes.push(zNode);
		</c:forEach>
	}
	var code;
	function setCheck() {
		var zTree = $.fn.zTree.getZTreeObj("treeDemo"),
		py = $("#py").attr("checked")? "p":"",
		sy = $("#sy").attr("checked")? "s":"",
		pn = $("#pn").attr("checked")? "p":"",
		sn = $("#sn").attr("checked")? "s":"",
		type = { "Y":py + sy, "N":pn + sn};
		zTree.setting.check.chkboxType = {"Y":"p","N":"ps"};
	}
	function showCode(str) {
		if (!code) code = $("#code");
		code.empty();
		code.append("<li>"+str+"</li>");
	}
	$(document).ready(function(){
		showNodes();
		$.fn.zTree.init($("#treeDemo"), setting, zNodes);
		setCheck();
		$("#py").bind("change", setCheck);
		$("#sy").bind("change", setCheck);
		$("#pn").bind("change", setCheck);
		$("#sn").bind("change", setCheck);
	});
	
	var selectIds = [];
	
	//选中节点的数据
	function onCheck(e,treeId,treeNode){
		selectIds=[];
        var treeObj=$.fn.zTree.getZTreeObj("treeDemo"),  
        nodes=treeObj.getCheckedNodes(true),  
        v="";  
        for(var i=0;i<nodes.length;i++){  
        v+=nodes[i].name + ",";  
       // alert(nodes[i].id); //获取选中节点的值  
        selectIds.push(nodes[i].id);
      }      
   }  
	
	
	//给父页面传值所用信息
	var index = parent.layer.getFrameIndex(window.name);
	
	function mySubmit(){
		
		if($("#roleCode").val()=="" ){
			layer.alert("角色编码不能为空！", {icon: 0});
		}else if($("#roleName").val() == ""){
			layer.alert("角色名称不能为空！", {icon: 0});
		}else{
			 $.ajax({
					url:"${ctx}/role/add_role_permission",
					data: {selectIds:selectIds},
					type: "post",
					async: false,//非异步
					success: function(msg){
						//alert(JSON.stringify(msg) );
						if(msg==selectIds.length){
							//关闭子页面
							 $('#form').submit();
							parent.layer.close(index);
					}
				}
			});
		}
    }
	</script>
</body>
</html>



