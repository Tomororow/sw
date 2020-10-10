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
  					
    				<form  id="form" action="${ctx}/cal_canal_info/add_canal_sluice" method="post" enctype="multipart/form-data">
    				
    				<table class="table table-bordered table-header">
	        			<tr>
							<td class="w7">唯一编码</td><td class="w18" ><input type="text"  name="sluiceCode" value="" style="color:black;width:180px;height:25px;"/></td>
							<td class="w7" >闸门类型</td>
							<td id="waterArea" class="w54"  >
								<select style="color:black;width:100px;height:25px;" name="sluiceType">
									<option value="干渠闸">干渠闸</option>
									<option value="支渠闸">支渠闸</option>
									<option value="斗渠闸">斗渠闸</option>
									<option value="毛渠闸">毛渠闸</option>
									<option value="其他">其他</option>
								</select>
							</td>
						</tr>
						
						<tr>	
							<td class="w7">经度</td><td class="w18" ><input type="text"  name="sluiceLongitude" value="" style="color:black;width:180px;height:25px;"/></td>
							<td class="w7">维度</td><td class="w18" ><input type="text"  name="sluiceLatitude" value="" style="color:black;width:180px;height:25px;"/></td>
						<tr>	
							<td class="w7">海拔</td><td class="w18" ><input type="text"  name="sluiceHeight" value="" style="color:black;width:180px;height:25px;"/></td>
							<td class="w7">主要功能</td>
							<td class="w18" >
								<select style="color:black;width:100px;height:25px;" name="sluiceMianFunction">
									<option value="节制">节制</option>
									<option value="进水">进水</option>
									<option value="其他">其他</option>
								</select>
							</td>
						</tr>
						
						<tr>	
							<td class="w7">孔数</td><td class="w18" ><input type="text"  name="holeNumber" value="" style="color:black;width:180px;height:25px;"/></td>
							<td class="w7">启闭机数</td><td class="w18" ><input type="text"  name="openCloseNumber" value="" style="color:black;width:180px;height:25px;"/></td>
						</tr>
						
						<tr>	
							<td class="w7">闸板数</td><td class="w18" ><input type="text"  name="flashboardNumber" value="" style="color:black;width:180px;height:25px;"/></td>
							<td class="w7">丝杆数</td><td class="w18" ><input type="text"  name="leadScrewNumber" value="" style="color:black;width:180px;height:25px;"/></td>
						</tr>
						
						<tr>	
							<td class="w7">机座数</td><td class="w18" ><input type="text"  name="machineCapNumber" value="" style="color:black;width:180px;height:25px;"/></td>
							<td class="w7">铜套数</td><td class="w18" ><input type="text"  name="machineBaseNumber" value="" style="color:black;width:180px;height:25px;"/></td>
						</tr>
						
						<tr>	
							<td class="w7">机帽数</td><td class="w18" ><input type="text"  name="copperSheathingNumber" value="" style="color:black;width:180px;height:25px;"/></td>
							<td class="w7">固定螺丝数</td><td class="w18" ><input type="text"  name="fixScrewNumber" value="" style="color:black;width:180px;height:25px;"/></td>
						</tr>
						
						<tr>
							<td class="w7">启闭形式</td>
							<td class="w18">
							
								<select style="color:black;width:100px;height:25px;" name="openCloseForm">
									<option value="螺杆">螺杆</option>
									<option value="手提">手提</option>
									<option value="其他">其他</option>
								</select>
								
							</td>	
							<td class="w7">完好状况</td>
							<td class="w18" >
								<select style="color:black;width:100px;height:25px;" name="sluicePerfectType">
									<option value="一类">一类</option>
									<option value="二类">二类</option>
									<option value="三类">三类</option>
									<option value="其他">其他</option>
								</select>
							</td>
						</tr>
						
						<tr>
							<td class="w7">修建时间</td><td class="w18" ><input type="text"  name="sluiceBuildTime" value="" onfocus="WdatePicker({'skin':'whyGreen','dateFmt':'yyyy-MM-dd'});" style="color:black;width:180px;height:25px;"/></td>
							
							<td class="w7">维修时间</td><td class="w18" ><input type="text"  name="sluiceRepairTime" value="" onfocus="WdatePicker({'skin':'whyGreen','dateFmt':'yyyy-MM-dd'});" style="color:black;width:180px;height:25px;"/></td>
						</tr>
						<tr>
							<td class="w7">建筑--备注</td>
							<td class="w18"  colspan="3">
								<textarea  name="ccsRemark" cols="80" rows="2" style="color:black;"></textarea> 
							</td>
						</tr>
						
						<tr>
							<td class="w7">照片</td><td class="w18" ><input type="file" name="file" style="color:black;width:180px;"></td>
							<td class="w7">照片编号</td><td class="w18"><input type="text" name="sluicePhotoNo" value="" style="color:black;width:180px;"></td>
						</tr>
						
    				</table>
    				<input hidden="hidden"  type="text" name="canalId" value="${calCanalInfo.id}" style="color:black;"/>
    				
	        		</form>
       		 </div>
	
	<script type="text/javascript" src="${ctxstc}/js/footer.js"></script>
	<script type="text/javascript" src="${ctxstc}/js/custom/water_area_cook.js"></script>
	<script type="text/javascript" src="${ctxstc}/datepicker/WdatePicker.js "></script>
	<script src="${ctxstc}/adapters/layui/layui.js" charset="utf-8"></script>
	
	
	<script>
	
	//给父页面传值所用信息
	var index = parent.layer.getFrameIndex(window.name);
	
	function mySubmit5(){
		//alert("hahahahah");
		//关闭子页面
		parent.layer.close(index);
		//parent.layer.msg('您将标记 成功传送给了父窗口');
        $('#form').submit();
    }
	</script>
</body>
</html>



