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
  					
    				<form  id="form" action="${ctx}/cal_canal_info/edit_canal_building" method="post" enctype="multipart/form-data">
    				
    				<table class="table table-bordered table-header">
	        			<tr>
							<td class="w7">建筑名称</td><td class="w18"><input type="text"  name="buildingName" value="${calCanalBuilding.buildingName}" style="color:black;width:180px;height:25px;"/></td>
						
							<td class="w7">建筑唯一编码</td><td class="w18" ><input type="text"  name="buildingCode" value="${calCanalBuilding.buildingCode}" style="color:black;width:180px;height:25px;"/></td>
						</tr>
						
						<tr>	
							<td class="w7" >建筑类型</td>
							<td  class="w54"  >
								<select id="select20" style="color:black;width:100px;height:25px;" id="buildingType" name="buildingType">
									<option id="no1" value="1">一类</option>
									<option id="no2" value="2">二类</option>
									<option id="no3" value="3">三类</option>
									<option id="no4" value="4">其他</option>
								</select>
							</td>
						
							<td class="w7">经度</td><td class="w18" ><input type="text"  name="buildingLongitude" value="${calCanalBuilding.buildingLongitude}" style="color:black;width:180px;height:25px;"/></td>
						<tr>
							<td class="w7">维度</td><td class="w18" ><input type="text"  name="buildingLatitude" value="${calCanalBuilding.buildingLatitude}" style="color:black;width:180px;height:25px;"/></td>
							<td class="w7">海拔</td><td class="w18" ><input type="text"  name="buildingHeight" value="${calCanalBuilding.buildingHeight}" style="color:black;width:180px;height:25px;"/></td>
						</tr>
						
						<tr>
							<td class="w7">修建时间</td><td class="w18" ><input type="text"  name="buildingBuildTime" value="<fmt:formatDate value='${calCanalBuilding.buildingBuildTime}' type='date' pattern='yyyy-MM-dd'/>" onfocus="WdatePicker({'skin':'whyGreen','dateFmt':'yyyy-MM-dd'});" style="color:black;width:180px;height:25px;"/></td>
							<td class="w7">维修时间</td><td class="w18" ><input type="text"  name="buildingRepairTime" value="<fmt:formatDate value='${calCanalBuilding.buildingRepairTime}' type='date' pattern='yyyy-MM-dd'/>" onfocus="WdatePicker({'skin':'whyGreen','dateFmt':'yyyy-MM-dd'});" style="color:black;width:180px;height:25px;"/></td>
						</tr>
						<tr>
							<td class="w7">建筑--备注</td>
							<td class="w18"  colspan="3">
								<textarea  name="ccbRemark" cols="100" rows="3" style="color:black;">${calCanalBuilding.ccbRemark}</textarea> 
							</td>
						</tr>
						
						<tr>
							<td class="w7">照片</td><td class="w18">
							
							<img src="${picPath}/pic/${calCanalBuilding.buildingPhoto}" height="50" width="50" onclick="showPhoto()"/><br>
							<span>更换照片</span>
							<input type="file" name="file" style="color:black;width:180px;"></td>
							<td class="w7">照片编号</td><td class="w18"><input type="text" name="buildingPhotoNo" value="${calCanalBuilding.buildingPhotoNo}" style="color:black;width:180px;"></td>
						</tr>
						
    				</table>
    				<input hidden="hidden"  type="text" name="id" value="${calCanalBuilding.id}" style="color:black;"/>
    				
	        		</form>
       		 </div>
	
	<script type="text/javascript" src="${ctxstc}/js/footer.js"></script>
	<script type="text/javascript" src="${ctxstc}/js/custom/water_area_cook.js"></script>
	<script type="text/javascript" src="${ctxstc}/datepicker/WdatePicker.js "></script>
	<script src="${ctxstc}/adapters/layui/layui.js" charset="utf-8"></script>
	
	
	<script>
	
	window.onload = function(){
		//下拉框回显
		var buildingType = "${calCanalBuilding.buildingType}";
		switch (buildingType) {
		case "一类":
			document.getElementById("no1").selected=true;
		    break;
		case "二类":
			document.getElementById("no2").selected=true;
		    break;
		case "三类":
			document.getElementById("no3").selected=true;
		    break;
		case "其他":
			document.getElementById("no4").selected=true;
			break;
		default:
			break;
		}
	}
	
	//给父页面传值所用信息
	var index = parent.layer.getFrameIndex(window.name);
	
	function mySubmit4(){
		//关闭子页面
		parent.layer.close(index);
		//parent.layer.msg('您将标记 成功传送给了父窗口');
        $('#form').submit();
    }
	
	//照片点击事件显示照片=====================
	function showPhoto(){
		var buildingPhoto ="${picPath}/pic/${calCanalBuilding.buildingPhoto}";
		//alert(buildingPhoto);
		layer.open({
			  type: 1,
			  title: false,
			  closeBtn: 0,
			  area: ['500px', '300px'],
			  skin: 'layui-layer-nobg', //没有背景色
			  shadeClose: true,
			  content: '<img src="'+buildingPhoto+'" width="500" height="300" alt="渠道照片" />'
		});
	}
	</script>
</body>
</html>