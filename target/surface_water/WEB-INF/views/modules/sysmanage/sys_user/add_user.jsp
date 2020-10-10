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

	<!--  
	<link rel="stylesheet" href="${ctxstc}/adapters/ztree/css/demo.css" type="text/css">-->
	<link rel="stylesheet" href="${ctxstc}/adapters/ztree/css/zTreeStyle/zTreeStyle.css" type="text/css">
	<link rel="stylesheet" href="${ctxstc}/adapters/layui/css/layui.css" type="text/css">
	
	<script type="text/javascript" src="${ctxstc}/adapters/ztree/js/jquery.ztree.core.js"></script>
	
    <link rel="stylesheet" href="${ctxstc}/adapters/ztree/css/metroStyle/metroStyle.css" type="text/css">
    <script type="text/javascript" src="${ctxstc}/adapters/ztree/js/jquery.ztree.excheck.js"></script>
    <script type="text/javascript" src="${ctxstc}/adapters/ztree/js/jquery.ztree.exedit.js"></script>
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
  					
    				<form  id="form" action="${ctx}/user/add" method="post" enctype="multipart/form-data">
    				
    				<table border="0" cellspacing="50px" style="line-height: 35px; border-collapse:separate; border-spacing:0px 10px;">
    					<tr>
							<td  align="right" ><span style="color: red">&nbsp;&nbsp;*&nbsp;</span>所属行政区：</td>
							<td id="area" class="w54"  colspan="3">
								<select id="select10" style="color:black;width:100px;height:30px;" onchange="areaChange(this[selectedIndex].value);">
									<option value="area,0,0">请选择</option>
									<c:forEach items="${sysAreaList}" var="sysArea">
									 	 <option value="${sysArea.id},${sysArea.areaLevel},${sysArea.areaName}">${sysArea.areaName}</option>
									</c:forEach>
								</select>
								<span id="span10">--</span>
								<input id="areaSure" class="layui-btn layui-btn-normal layui-btn-sm" value="确定" type="button" onclick="getAreaIdAndLevel()" />
							</td>
							
						</tr>
						 <tr hidden="hidden">
							<td class="w54"  colspan="3">
								<span id="areaSpan">无<span>
							</td>
							
						</tr> 
    					<tr>	
							<td align="right" ><span style="color: red">&nbsp;&nbsp;*&nbsp;</span>所属水管区：</td>
							<td id="waterArea" class="w54"  colspan="3">
								<select id="select20" style="color:black;width:100px;height:30px;" onchange="waterAreaChange(this[selectedIndex].value);">
									<option value="waterArea,0,0">请选择</option>
									<c:forEach items="${sysWaterAreaList}" var="sysWaterArea">
									  <option value="${sysWaterArea.id},${sysWaterArea.waterAreaLevel},${sysWaterArea.waterAreaName}">${sysWaterArea.waterAreaName}</option>
									</c:forEach>
								</select>
								<span id="span20">--</span>
								<input id="waterAreaSure" class="layui-btn layui-btn-normal layui-btn-sm" value="确定" type="button" onclick="getWaterAreaIdAndLevel()"/>
							</td>
						</tr>
						 <tr hidden="hidden">
							<td class="w54"  colspan="3">
								<span id="waterAreaSpan">无<span>
							</td>
							
						</tr> 
						
						<tr>	
							<td align="right"><span style="color: red">&nbsp;&nbsp;*&nbsp;</span>行政区编码：</td><td class="w18"><input type="text" readonly="true" class="form-control" id="sysareaCode" name="sysareaCode" value="" style="color:black;width:180px;"/></td>
							<td align="right"><span style="color: red">&nbsp;&nbsp;*&nbsp;</span>水管区编码：</td><td class="w18"><input type="text" readonly="true"  class="form-control" id="syswaterareaCode" name="syswaterareaCode" value="" style="color:black;width:180px;"/></td>
							
						</tr>
						
						<tr>	
							<td align="right"><span style="color: red">&nbsp;&nbsp;*&nbsp;</span>系统编码：</td><td class="w18"><input type="text"  class="form-control" id="systemCode"  name="systemCode" value="${systemCode}" style="color:black;width:180px;"/></td>
							<td align="right"><span style="color: red">&nbsp;&nbsp;*&nbsp;</span>用户编码：</td><td class="w18"><input type="text"  class="form-control" id="userCode"  name="userCode" value="${userCode}" style="color:black;width:180px;"/></td>
						</tr>
						
						<tr>
							<td align="right"><span style="color: red">&nbsp;&nbsp;*&nbsp;</span>用户名：</td><td class="w18"><input type="text"  class="form-control" id="userName"  name="userName" value="${userName}" style="color:black;width:180px;"/></td>
							<td align="right"><span style="color: red">&nbsp;&nbsp;*&nbsp;</span>用户密码：</td><td class="w18"><input type="text"  class="form-control" id="userPwd" name="userPwd" value="${userPwd}" style="color:black;width:180px;"/></td>
						</tr>
						<tr>
							<td align="right" ><span style="color: red">&nbsp;&nbsp;&nbsp;</span>用户姓名：</td><td class="w18"><input type="text"   class="form-control" id="realName"  name="realName" value="${realName}" style="color:black;width:180px;"/></td>
					
							<td align="right"><span style="color: red">&nbsp;&nbsp;&nbsp;</span>用户电话：</td><td class="w18"><input type="text"  class="form-control" id="mobile"  name="mobile" value="${mobile}" style="color:black;width:180px;"/></td>
						</tr>
						<tr>
							<td align="right"><span style="color: red">&nbsp;&nbsp;&nbsp;</span>其他联系方式：</td><td class="w18"><input type="text"  class="form-control" id="otherContactWay"  name="otherContactWay" value="${otherContactWay}" style="color:black;width:180px;"/></td>
							
						</tr>
						<tr>
							<td align="right" ><span style="color: red">&nbsp;&nbsp;*&nbsp;</span>用户角色：</td><td class="w18" colspan="3">
								<c:forEach items="${roleList}" var="role">
									<input type="checkbox" name="id" value="${role.id}" style="color:black;"/>${role.roleName}&nbsp;
								</c:forEach>	
							</td>
					
						</tr>
						
						<tr>
							<td align="right"><span style="color: red">&nbsp;&nbsp;&nbsp;</span>地址：</td>
							<td class="w18"  colspan="3">
								<textarea  name="address"  class="form-control" cols="25" rows="1" style="color:black;">${address}</textarea> 
							</td>
						</tr>
						
							
						<tr>
							<td align="right"><span style="color: red">&nbsp;&nbsp;&nbsp;</span>备注：</td>
							<td class="w18"  colspan="3">
								<textarea  name="suRemark" class="form-control"  cols="60" rows="1" style="color:black;">${suRemark}</textarea> 
							</td>
						</tr>
						
    				</table>
    				
	        		</form>
       		 </div>
	
	<script type="text/javascript" src="${ctxstc}/js/footer.js"></script>
	<script type="text/javascript" src="${ctxstc}/js/custom/water_area_cook.js"></script>
	<script type="text/javascript" src="${ctxstc}/js/custom/user/add_user.js"></script>
	<script type="text/javascript" src="${ctxstc}/datepicker/WdatePicker.js "></script>
	<script src="${ctxstc}/adapters/layui/layui.js" charset="utf-8"></script>
	<script>
	//给父页面传值所用信息
	var index = parent.layer.getFrameIndex(window.name);
	
	function mySubmit(){
		
		var roleIds = [];
		  $('input[name=id]:checked').each(function () {
			  roleIds.push($(this).val());
		  });
		  
		  
		if($("#sysareaCode").val()=="" ){
			layer.alert("行政区编码不能为空！", {icon: 0});
		}else if($("#syswaterareaCode").val() == ""){
			layer.alert("水管区编码不能为空！", {icon: 0});
			
		}else if($("#systemCode").val() == ""){
			layer.alert("系统编码不能为空！", {icon: 0});
		}else if($("#userCode").val() == ""){
			layer.alert("用户编码不能为空！", {icon: 0});
		}else if($("#userName").val() == ""){
			layer.alert("用户名不能为空！", {icon: 0});
		}else if($("#userPwd").val() == ""){
			layer.alert("用户密码不能为空！", {icon: 0});
		}else if(roleIds.length == 0){
			layer.alert("用户角色不能为空！", {icon: 0});
			
		}else{
			  $.ajax({
					url:"${ctx}/user/add_user_role",
					data: {roleIds:roleIds},
					type: "post",
					async: false,//非异步
					success: function(msg){
						if(msg==roleIds.length){
							//关闭子页面
							parent.layer.close(index);
							//parent.layer.msg('您将标记 成功传送给了父窗口');
					        $('#form').submit();
					}
				}
			});
		}
    }
	</script>
</body>
</html>



