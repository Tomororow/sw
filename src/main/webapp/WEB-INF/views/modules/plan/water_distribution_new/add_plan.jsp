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
  					
    				<form  id="form" action="${ctx}/plan_new/add" method="post" enctype="multipart/form-data">
    					<input type="hidden" id="totalArea" name="totalArea"  value=""/>
    					<input type="hidden" id="canalCode" name="canalCode"  value="${canalCode}"/>
    				<div class="text" style=" text-align:center; ">
    				<font size="3">${canalName}需水提报信息</font></div>
    				<div style="margin:0 auto;  border:1px solid #F00;background:#eff7ff;margin:0 auto; width:480px;">
    					<c:forEach items="${needWaterReportList}" var="needWaterReport" varStatus="st">
							<div>
							<input type="text" style="color:black;width:120px; class="form-control" readonly="readonly" id="soilName" value="${needWaterReport.soilName}" /><nobr/><span style="color: black">&nbsp;&nbsp;--&nbsp;</span>
							<input type="text" style="color:black;width:120px; class="form-control" readonly="readonly" id="cropsName" value="${needWaterReport.cropsName}" /><nobr/><span style="color: black">&nbsp;&nbsp;--&nbsp;</span>
							<input type="text" style="color:black;width:120px; class="form-control" readonly="readonly" id="area" value="${needWaterReport.area}" /><span style="color: black">&nbsp;/亩&nbsp;</span>
							</div>
						</c:forEach>
    				</div>
    				 <!-- <div class="radio" style=" text-align:center;">
							<label>灌水定额模型算法:</label>
							<label>
							<input type="radio" name="optionsRadios" id="optionsRadios1" value="scientific">
								科学计算算法
							</label>
							<label>
							<input type="radio" name="optionsRadios" id="optionsRadios2" value="experience">
								经验总结算法（推荐使用）
							</label>
					</div> -->
    				<table class="border="0" style="border-collapse:separate; border-spacing:20px 18px;">
						<tr>
							 <td align="right"><span style="color: red">&nbsp;&nbsp;*&nbsp;</span>河道名称：</td><td class="w18"><input type="text"  class="form-control" readonly="readonly" value="${canalName}" style="color:black;width:180px;"/></td>
							<td align="right"><span style="color: red">&nbsp;&nbsp;*&nbsp;</span>灌溉名称：</td><td class="w18"><input type="text"  class="form-control"   name="wateringName" value="${wateringName}" style="color:black;width:180px;"/></td>
							
						</tr>
						<tr>	
							<td align="right"><span style="color: red">&nbsp;&nbsp;*&nbsp;</span>轮次：</td><td class="w18"><input type="text" class="form-control"   name="turn" value="${turn}" style="color:black;width:180px;"/></td>
							<td align="right"><span style="color: red">&nbsp;&nbsp;*&nbsp;</span>配水人：</td><td class="w18"><input type="text"  class="form-control"   name="createPeople" value="${createPeople}" style="color:black;width:180px;"/></td>
						</tr>
						
						<%-- <tr>
							<td align="right"><span style="color: red">&nbsp;&nbsp;*&nbsp;</span>开始年份：</td><td class="w18"><input type="text"  class="form-control"  name="startYear" value="${startYear}" style="color:black;width:180px;"/></td>
							<td align="right"><span style="color: red">&nbsp;&nbsp;*&nbsp;</span>结束年份：</td><td class="w18"><input type="text"  class="form-control"  name="endYear" value="${endYear}" style="color:black;width:180px;"/></td>
						
						</tr> --%>
						
						<%-- <tr>
							<td align="right"><span style="color: red">&nbsp;&nbsp;*&nbsp;</span>开始月份：</td><td class="w18"><input type="text"  class="form-control"  name="startMonth" value="${startMonth}" style="color:black;width:180px;"/></td>
						
							<td align="right"><span style="color: red">&nbsp;&nbsp;*&nbsp;</span>开始日期：</td><td class="w18"><input type="text"  class="form-control"   name="startDay" value="${startDay}" style="color:black;width:180px;"/></td>
						
						</tr> --%>
						<tr>
							
							<%-- <td align="right"><span style="color: red">&nbsp;&nbsp;*&nbsp;</span>结束月份：</td><td class="w18"><input type="text" class="form-control"   name="endMonth" value="${endMonth}" style="color:black;width:180px;"/></td>
						 --%>
						 <td align="right"><span style="color: red">&nbsp;&nbsp;*&nbsp;</span>开始日期：</td><td class="w18"><input type="text"  class="form-control" id="startDayTime"  name="startDayTime" value="${startDayTime}" style="color:black;width:180px;"    onfocus="WdatePicker({'skin':'whyGreen','dateFmt':'yyyy-MM-dd'});" /></td>
						 <td align="right"><span style="color: red">&nbsp;&nbsp;*&nbsp;</span>结束日期：</td><td class="w18"><input type="text"  class="form-control" id="endDayTime" onchange="_endDay()"  name="endDayTime" value="${endDayTime}" style="color:black;width:180px;"    onfocus="WdatePicker({'skin':'whyGreen','dateFmt':'yyyy-MM-dd'});" /></td>
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
							<td align="right"><span style="color: red">&nbsp;&nbsp;*&nbsp;</span>其他用水：</td><td class="w18"><input type="text"  class="form-control"  name="otherWaterAmount" value="${otherWaterAmount}" style="color:black;width:180px;"/></td>
							<td align="right"><span style="color: red">&nbsp;&nbsp;*&nbsp;</span>灌水定额：</td><td class="w18"><input type="text"  class="form-control"   name="waterduty" id="waterduty" value="" style="color:black;width:180px;"/></td>
						
						</tr>
							
						<tr>
							<td align="right"><span style="color: red">&nbsp;&nbsp;&nbsp;</span>备注：</td>
							<td class="w18"  colspan="3">
								<textarea  name="remark" class="form-control"  cols="60" rows="1" style="color:black;">${remark}</textarea> 
							</td>
						</tr>
						
    				</table>
    				<div class="radio" style=" text-align:center;">
							<label>灌水定额模型算法:</label>
							<label>
							<input type="radio" name="optionsRadios" id="optionsRadios1" value="scientific">
								科学计算算法
							</label>
							<label>
							<input type="radio" name="optionsRadios" id="optionsRadios2" value="experience">
								经验总结算法（推荐使用）
							</label>
					</div>
	        		</form>
       		 </div>
	
	<script type="text/javascript" src="${ctxstc}/js/footer.js"></script>
	<script type="text/javascript" src="${ctxstc}/js/custom/water_area_cook.js"></script>
	<script type="text/javascript" src="${ctxstc}/datepicker/WdatePicker.js "></script>
	<script src="${ctxstc}/adapters/layui/layui.js" charset="utf-8"></script>
	
	
	<script>
	var canalCode="${canalCode}";
	$(function(){
		var radio=$('input[name="optionsRadios"]');
		radio.change(function(){
			var st=new Date($("#startDayTime").val()).getTime();
			var ed= new Date($("#endDayTime").val()).getTime();
		 	var str =Number(st);
		 	var end =Number(ed);
		 	
		     var  isclient = $(this).val();
		     if((($("#startDayTime").val()!==""&&($("#startDayTime").val()!=="")&& str>end))){
	        	 layer.alert('开始日期不能大于结束日期', {icon: 0});
	        	 // return false;
	        	 $("#optionsRadios1").removeAttr("checked");
	        	 $("#optionsRadios2").removeAttr("checked");
	         }else{
		      if(isclient=='scientific'){
		         if($("#startDayTime").val()==null || $("#startDayTime").val()==""){
		        	 layer.alert('请选择开始日期!', {icon: 0});
		        	 $("#optionsRadios1").removeAttr("checked");
		         }else if($("#endDayTime").val()==null || $("#endDayTime").val()==""){
		        	 layer.alert('请选择结束日期!', {icon: 0});
		        	 $("#optionsRadios1").removeAttr("checked");
		        	 
		         }
		         else{
		         //proof();
		          	var irrigatingWater=0;
			    	 var startDayTime =document.getElementById("startDayTime").value;
			 		 var endDayTime =document.getElementById("endDayTime").value;
			 		 <c:forEach items="${needWaterReportList}" var="needWaterReport">
			 			var soilType="${needWaterReport.soilType}";
			 			var cropsType="${needWaterReport.cropsType}";
			 			var area="${needWaterReport.area}";
			 			//alert(soilType);
			 			/* soilTypes.push(soilType);
			 			cropsTypes.push(cropsType); */
			 			$.ajax({
			 				url:"${ctx}/plan_new/getCropsInfo_scientific",
			 				data: {soilType:soilType,cropsType:cropsType,startDayTime:startDayTime,endDayTime:endDayTime,area:area,canalCode:canalCode},
			 				type: "post",
			 				async: false,//非异步
			 				success: function(msg){
			 					//alert(JSON.stringify(msg));
			 					irrigatingWater=irrigatingWater+msg;
			 					/* for(var i=0;i<msg.length;i++){
			 						s.push(msg[i].consumedWater);
			 					} */
			 					
			 				}
			 			});
			 		 </c:forEach>;
			 		 $("#waterduty").val("");
			 		 $("#waterduty").val(irrigatingWater);
		         }
		      }else{
		    	  if($("#startDayTime").val()==null || $("#startDayTime").val()==""){
			        	 layer.alert('请选择开始日期', {icon: 0});
			        	 $("#optionsRadios2").removeAttr("checked");
		         }else if($("#endDayTime").val()==null || $("#endDayTime").val()==""){
		        	 layer.alert('请选择结束日期', {icon: 0});
		        	 $("#optionsRadios2").removeAttr("checked");
		         }else{ 
			    	 var irrigatingWater=0;
			    	 var startDayTime =document.getElementById("startDayTime").value;
			 		 var endDayTime =document.getElementById("endDayTime").value;
			 		 <c:forEach items="${needWaterReportList}" var="needWaterReport">
			 			var soilType="${needWaterReport.soilType}";
			 			var cropsType="${needWaterReport.cropsType}";
			 			var area="${needWaterReport.area}";
			 			//alert(soilType);
			 			/* soilTypes.push(soilType);
			 			cropsTypes.push(cropsType); */
			 			$.ajax({
			 				url:"${ctx}/plan_new/getCropsInfo_experience",
			 				data: {soilType:soilType,cropsType:cropsType,startDayTime:startDayTime,endDayTime:endDayTime,area:area,canalCode:canalCode},
			 				type: "post",
			 				async: false,//非异步
			 				success: function(msg){
			 					//alert(JSON.stringify(msg));
			 					irrigatingWater=irrigatingWater+msg;
			 					/* for(var i=0;i<msg.length;i++){
			 						s.push(msg[i].consumedWater);
			 					} */
			 				}
			 			});
			 		 </c:forEach>;
			 		 $("#waterduty").val("");
			 		 $("#waterduty").val(irrigatingWater);          
			      }
		    	  
		     }
	         }
		 });
		
		
		var totalArea=0;
		<c:forEach items="${needWaterReportList}" var="needWaterReport">;
			var area= Number("${needWaterReport.area}");
			//alert(area);
		totalArea=totalArea+area;
	 </c:forEach>;
		//alert(totalArea);
		$("#totalArea").val("");
		$("#totalArea").val(totalArea);
	});
	
	
	 
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



