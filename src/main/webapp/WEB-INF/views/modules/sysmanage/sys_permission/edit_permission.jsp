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
    <%-- <link rel="stylesheet" href="${ctxstc}/adapters/ztree/css/demo.css" type="text/css"> --%>
	<link rel="stylesheet" href="${ctxstc}/adapters/ztree/css/zTreeStyle/zTreeStyle.css" type="text/css">
	
	<script src="${ctxstc}/adapters/layui/layer/layer.js"></script>

	<style>
	  
		.topbar-nav-item a{color: red;}
		.topbar-nav-item a:hover{color: blue;}
	  
	  </style>
</head>
<body >
		<div style="padding: 30px; line-height: 22px; background-color: #393D49; color: #fff; font-weight: 300;">
  					
    				<form  id="form" action="${ctx}/permission/edit" method="post" enctype="multipart/form-data">
    				
    				<table border="0" cellspacing="50px" style="line-height: 35px; border-collapse:separate; border-spacing:0px 10px;">
    					
						<tr>	
							<td class="w7"><span style="color: red">&nbsp;&nbsp;*&nbsp;</span>菜单编码：</td><td class="w18"><input type="text" id="menuCode" class="form-control" name="menuCode" value="${sysPermission.menuCode}" style="color:black;width:180px;"/></td>
							<td class="w7"><span style="color: red">&nbsp;&nbsp;*&nbsp;</span>菜单名称：</td><td class="w18"><input type="text" id="menuName" class="form-control" name="menuName" value="${sysPermission.menuName}" style="color:black;width:180px;"/></td>
							
						</tr>
						
						<tr>	
							<td class="w7"><span style="color: red">&nbsp;&nbsp;*&nbsp;</span>菜单排序：</td><td class="w18"><input type="text" id="menuOrder" class="form-control"  name="menuOrder" value="${sysPermission.menuOrder}" style="color:black;width:180px;"/></td>
							<td class="w7"><span style="color: red">&nbsp;&nbsp;*&nbsp;</span>菜单链接：</td><td class="w18"><input type="text" id="menuHref" class="form-control"  name="menuHref" value="${sysPermission.menuHref}" style="color:black;width:180px;"/></td>
						</tr>
						
						<%-- <tr>
							<td class="w7">是否菜单</td><td class="w18"><input type="text"   name="userName" value="${userName}" style="color:black;width:180px;"/></td>
							<td class="w7">是否启用</td><td class="w18"><input type="text"  name="userPwd" value="${userPwd}" style="color:black;width:180px;"/></td>
						</tr> --%>
						<tr>
	<%--						<td class="w7"><span style="color: red">&nbsp;&nbsp;&nbsp;</span>更换图标：</td>
							<td>
								<img src="${picPath}/pic/${sysPermission.menuIcon}" height="25" width="25" onclick="showPhoto('${picPath}/pic/${sysPermission.menuIcon}')"/>
								
								<input type="file" class="form-control" name="file"  style="color:black;width:180px;">
							</td>--%>
						
							<td class="w7"><span style="color: red">&nbsp;&nbsp;&nbsp;</span>菜单名称编码：</td><td class="w18"><input type="text"  class="form-control"  name="menuNameCode" value="${sysPermission.menuNameCode}" style="color:black;width:180px;"/></td>
						</tr>
<%--						<tr>
							
							<td class="w7"><span style="color: red">&nbsp;&nbsp;&nbsp;</span>菜单备注：</td><td class="w18" colspan="3"><input type="text" class="form-control"  name="smRemark" value="${sysPermission.smRemark}" style="color:black;width:460px;"/></td>
						</tr>--%>
						
    				</table>
    						<input hidden="hidden"  type="text" name="parentMenuId" value="${sysPermission.parentMenuId}" style="color:black;"/><!--父菜单id  -->
	        				<input hidden="hidden"  type="text" name="menuLevel"    value="${sysPermission.menuLevel}" style="color:black;"/><!--菜单级别  -->
    						<input hidden="hidden"  type="text" name="id"    value="${sysPermission.id}" style="color:black;"/>
	        		</form>
       		 </div>
	
	<script type="text/javascript" src="${ctxstc}/js/footer.js"></script>
	<script type="text/javascript" src="${ctxstc}/js/custom/water_area_cook.js"></script>
	<script type="text/javascript" src="${ctxstc}/datepicker/WdatePicker.js "></script>
	<%-- <script type="text/javascript" src="${ctxstc}/adapters/ztree/js/jquery-1.4.4.min.js"></script> --%>
	<script type="text/javascript" src="${ctxstc}/adapters/ztree/js/jquery.ztree.core.js"></script>
	<script type="text/javascript" src="${ctxstc}/adapters/ztree/js/jquery.ztree.excheck.js"></script>
	<script>
		
		//给父页面传值所用信息
		var index = parent.layer.getFrameIndex(window.name);
		
		function mySubmit(){
			if($("#menuCode").val()=="" ){
				layer.alert("菜单编码不能为空！", {icon: 0});
			}else if($("#menuName").val() == ""){
				layer.alert('菜单名称不能为空！', {icon: 0});
				
			}else if($("#menuOrder").val() == ""){
				layer.alert('菜单排序不能为空！', {icon: 0});
			}else if($("#menuHref").val() == ""){
				layer.alert('菜单链接不能为空！', {icon: 0});
			}else{
				//关闭子页面
				parent.layer.close(index);
				//parent.layer.msg('您将标记 成功传送给了父窗口');
		       $('#form').submit();
			}
	    }
		
		
		
		//照片点击事件显示照片=====================
		function showPhoto(photoImg){
			//alert(a);
			layer.open({
				  type: 1,
				  title: false,
				  closeBtn: 0,
				  area: ['150px', '150px'],
				  skin: 'layui-layer-nobg', //没有背景色
				  shadeClose: true,
				  content: '<img src= '+photoImg+'  width="150" height="150" alt="渠道照片" />'
			});
		}
	</script>
</body>
</html>



