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
  					
    				<form  id="form" action="${ctx}/plan/add" method="post" enctype="multipart/form-data">
    				
    				<table border="0" cellspacing="50px" style="line-height: 35px; border-collapse:separate; border-spacing:0px 10px;">
						
						<tr>	
							<td align="right"><span style="color: red">&nbsp;&nbsp;*&nbsp;</span>所属河道：</td><td class="w18"><input type="text" class="form-control" readonly="readonly" name="canalCode" value="${canalCode}" style="color:black;width:180px;"/></td>
							<td align="right"><span style="color: red">&nbsp;&nbsp;*&nbsp;</span>灌溉名称：</td><td class="w18"><input type="text"  class="form-control"   name="wateringName" value="${wateringName}" style="color:black;width:180px;"/></td>
						
						</tr>
						<tr>	
							<td align="right"><span style="color: red">&nbsp;&nbsp;*&nbsp;</span>轮次：</td><td class="w18"><input type="text" class="form-control"   name="turn" value="${turn}" style="color:black;width:180px;"/></td>
						
							<td align="right"><span style="color: red">&nbsp;&nbsp;*&nbsp;</span>配水人：</td><td class="w18"><input type="text"  class="form-control"   name="createPeople" value="${createPeople}" style="color:black;width:180px;"/></td>
						</tr>
						
						<tr>
							<td align="right"><span style="color: red">&nbsp;&nbsp;*&nbsp;</span>开始年份：</td><td class="w18"><input type="text"  class="form-control"  name="startYear" value="${startYear}" style="color:black;width:180px;"/></td>
							<td align="right"><span style="color: red">&nbsp;&nbsp;*&nbsp;</span>结束年份：</td><td class="w18"><input type="text"  class="form-control"  name="endYear" value="${endYear}" style="color:black;width:180px;"/></td>
						
						</tr>
						
						<tr>
							<td align="right"><span style="color: red">&nbsp;&nbsp;*&nbsp;</span>开始月份：</td><td class="w18"><input type="text"  class="form-control"  name="startMonth" value="${startMonth}" style="color:black;width:180px;"/></td>
						
							<td align="right"><span style="color: red">&nbsp;&nbsp;*&nbsp;</span>开始日期：</td><td class="w18"><input type="text"  class="form-control"   name="startDay" value="${startDay}" style="color:black;width:180px;"/></td>
						</tr>
						<tr>	
							<td align="right"><span style="color: red">&nbsp;&nbsp;*&nbsp;</span>结束月份：</td><td class="w18"><input type="text" class="form-control"   name="endMonth" value="${endMonth}" style="color:black;width:180px;"/></td>
						
							<td align="right"><span style="color: red">&nbsp;&nbsp;*&nbsp;</span>结束日期：</td><td class="w18"><input type="text"  class="form-control"   name="endDay" value="${startDay}" style="color:black;width:180px;"/></td>
						</tr>
						<tr>
							<td align="right"><span style="color: red">&nbsp;&nbsp;*&nbsp;</span>利用率：</td><td class="w18"><input type="text"  class="form-control"  name="soilWaterNetAmountRatio" value="${soilWaterNetAmountRatio}" style="color:black;width:180px;"/></td>
						
							<td align="right"><span style="color: red">&nbsp;&nbsp;*&nbsp;</span>生活用水：</td><td class="w18"><input type="text"  class="form-control"   name="lifeWaterAmount" value="${lifeWaterAmount}" style="color:black;width:180px;"/></td>
						</tr>
						<tr>
							<td align="right"><span style="color: red">&nbsp;&nbsp;*&nbsp;</span>工程用水：</td><td class="w18"><input type="text"  class="form-control"  name="machineWaterAmount" value="${machineWaterAmount}" style="color:black;width:180px;"/></td>
						
							<td align="right"><span style="color: red">&nbsp;&nbsp;*&nbsp;</span>林草用水：</td><td class="w18"><input type="text"  class="form-control"   name="forestWaterAmount" value="${forestWaterAmount}" style="color:black;width:180px;"/></td>
						</tr>
						<tr>	
							<td align="right"><span style="color: red">&nbsp;&nbsp;*&nbsp;</span>其他用水：</td><td class="w18" colspan="3"><input type="text"  class="form-control"  name="otherWaterAmount" value="${otherWaterAmount}" style="color:black;width:180px;"/></td>
						</tr>
							
						<tr>
							<td align="right"><span style="color: red">&nbsp;&nbsp;&nbsp;</span>备注：</td>
							<td class="w18"  colspan="3">
								<textarea  name="remark" class="form-control"  cols="60" rows="1" style="color:black;">${remark}</textarea> 
							</td>
						</tr>
						
    				</table>
    				
	        		</form>
       		 </div>
	
	<script type="text/javascript" src="${ctxstc}/js/footer.js"></script>
	<script type="text/javascript" src="${ctxstc}/js/custom/water_area_cook.js"></script>
	<script type="text/javascript" src="${ctxstc}/datepicker/WdatePicker.js "></script>
	<script src="${ctxstc}/adapters/layui/layui.js" charset="utf-8"></script>
	
	
	<script>
	
	
	//给父页面传值所用信息
	var index = parent.layer.getFrameIndex(window.name);
	
	function mySubmit(){
		
		//关闭子页面
		parent.layer.close(index);
		//parent.layer.msg('您将标记 成功传送给了父窗口');
        $('#form').submit();
    }
	</script>
</body>
</html>



