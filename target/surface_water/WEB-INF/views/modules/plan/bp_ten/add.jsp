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
		<div style="padding: 30px; line-height: 22px; background-color: #6495ED; color: #fff; font-weight: 300;">
  					
    				<form  id="form" action="${ctx}/forecast/add" method="post" enctype="multipart/form-data">
    				
    				<table class="table table-bordered table-header">
    						<tr>BP-神经网络算法</tr>
							<thead>
													<tr>
														<td class="w5">月份</td>
														<td class="w5">月降水量</td>
														<td class="w5">月蒸发量</td>
														<td class="w5">平均温度</td>
														<td class="w5">平均风速</td>
														<td class="w5">平均湿度</td>
														<td class="w5">平均日照时间</td>
														<td class="w5">大气压</td>
														<td class="w5">预计水库来水量</td>
														<td class="w5">月份</td>
														<td class="w5">月降水量</td>
														<td class="w5">月蒸发量</td>
														<td class="w5">平均温度</td>
														<td class="w5">平均风速</td>
														<td class="w5">平均湿度</td>
														<td class="w5">平均日照时间</td>
														<td class="w5">大气压</td>
														<td class="w5">预计水库来水量</td>
													</tr>
												</thead>
												<tbody >
													<tr>
														<td class="w5" rowspan="3">一月</td>
														<td class="w5">
															<input id="" type="text" name="" value="" style="color:black;width:40px;">
														</td>
														<td class="w5">
															<input id="" type="text" name="" value="" style="color:black;width:40px;">
														</td>
														<td class="w5" id="oneEarlyDay">
															<input id="" type="text" name="" value="" style="color:black;width:40px;">
														</td>
														<td class="w5" id="oneEarly">
															<input id="" type="text" name="" value="" style="color:black;width:40px;">
														</td>
														<td class="w5" >
															<input id="" type="text" name="" value="" style="color:black;width:40px;">
														</td>
														<td class="w5" rowspan="3">
															<input id="" type="text" name="" value="" style="color:black;width:40px;">
															<br><br>
															<!-- <input type="button" value="确定" onclick="oneSure()"style="color:black;width:40px;"> -->
														</td>
														
														<td class="w5" rowspan="3">
															<input id="" type="text" name="" value="" style="color:black;width:40px;">
															<br><br>
															<!-- <input type="button" value="确定" onclick="oneSure()"style="color:black;width:40px;"> -->
														</td>
														
														<td class="w5" rowspan="3" id="oneFlow">
															<!-- <input id="" type="text" name="" value="" style="color:black;width:40px;"> -->0
														</td>
														<td class="w5" rowspan="3">七月</td>
														<td class="w5">
															<input id="" type="text" name="" value="" style="color:black;width:40px;">
														</td>
														<td class="w5">
															<input id="" type="text" name="" value="" style="color:black;width:40px;">
														</td>
														<td class="w5" id="sevenEarlyDay">
															<input id="" type="text" name="" value="" style="color:black;width:40px;">
														</td>
														<td class="w5" id="sevenEarly">
															<input id="" type="text" name="" value="" style="color:black;width:40px;">
														</td>
														<td class="w5">
															<input id="" type="text" name="" value="" style="color:black;width:40px;">
														</td>
														<td class="w5" rowspan="3">
															<input id="" type="text" name="" value="" style="color:black;width:40px;">
															<br><br>
															<!-- <input type="button" value="确定" onclick="sevenSure()"style="color:black;width:40px;"> -->
														</td>
														
														<td class="w5" rowspan="3">
															<input id="" type="text" name="" value="" style="color:black;width:40px;">
															<br><br>
															<!-- <input type="button" value="确定" onclick="sevenSure()"style="color:black;width:40px;"> -->
														</td>
														
														
														<td class="w5" rowspan="3" id="sevenFlow">0</td>
													</tr>
													<tr>
														
													</tr>
													<tr>
														
													</tr>
													<tr>
														<td class="w5" rowspan="3">二月</td>
														<td class="w5">
															<input id="" type="text" name="" value="" style="color:black;width:40px;">
														</td>
														<td class="w5">
															<input id="" type="text" name="" value="" style="color:black;width:40px;">
														</td>
														<td class="w5" id="twoEarlyDay">
															<input id="" type="text" name="" value="" style="color:black;width:40px;">
														</td>
														<td class="w5" id="twoEarly">
															<input id="" type="text" name="" value="" style="color:black;width:40px;">
														</td>
														<td class="w5" >
															<input id="" type="text" name="" value="" style="color:black;width:40px;">
														</td>
														<td class="w5" rowspan="3">
															<input id="" type="text" name="" value="" style="color:black;width:40px;">
															<br><br>
															<!-- <input type="button" value="确定" onclick="twoSure()"style="color:black;width:40px;"> -->
														</td>
														
														<td class="w5" rowspan="3">
															<input id="" type="text" name="" value="" style="color:black;width:40px;">
															<br><br>
															<!-- <input type="button" value="确定" onclick="twoSure()"style="color:black;width:40px;"> -->
														</td>
														
														<td class="w5" rowspan="3" id="twoFlow">0</td>
														<td class="w5" rowspan="3"> 八月</td>
														<td class="w5">
															<input id="" type="text" name="" value="" style="color:black;width:40px;">
														</td>
														<td class="w5">
															<input id="" type="text" name="" value="" style="color:black;width:40px;">
														</td>
														<td class="w5" id="eightEarlyDay">
															<input id="" type="text" name="" value="" style="color:black;width:40px;">
														</td>
														<td class="w5" id="eightEarly">
															<input id="" type="text" name="" value="" style="color:black;width:40px;">
														</td>
														<td class="w5">
															<input id="" type="text" name="" value="" style="color:black;width:40px;">
														</td>
														<td class="w5" rowspan="3">
															<input id="" type="text" name="" value="" style="color:black;width:40px;">
															<br><br>
															<!-- <input type="button" value="确定" onclick="eightSure()"style="color:black;width:40px;"> -->
														</td>
														
														<td class="w5" rowspan="3">
															<input id="" type="text" name="" value="" style="color:black;width:40px;">
															<br><br>
														</td>
														
														<td class="w5" rowspan="3" id="eightFlow">0</td>
													</tr>
													<tr>
														
													</tr>
													<tr>
														
													</tr>
													
													<tr>
														<td class="w5" rowspan="3">三月</td>
														<td class="w5">
															<input id="" type="text" name="" value="" style="color:black;width:40px;">
														</td>
														<td class="w5">
															<input id="" type="text" name="" value="" style="color:black;width:40px;">
														</td>
														<td class="w5" id="threeEarlyDay">
															<input id="" type="text" name="" value="" style="color:black;width:40px;">
														</td>
														<td class="w5" id="threeEarly">
															<input id="" type="text" name="" value="" style="color:black;width:40px;">
														</td>
														<td class="w5" >
															<input id="" type="text" name="" value="" style="color:black;width:40px;">
														</td>
														<td class="w5" rowspan="3">
															<input id="" type="text" name="" value="" style="color:black;width:40px;">
															<br><br>
															<!-- <input type="button" value="确定" onclick="threeSure()"style="color:black;width:40px;"> -->
														</td>
														
														<td class="w5" rowspan="3">
															<input id="" type="text" name="" value="" style="color:black;width:40px;">
															<br><br>
															<!-- <input type="button" value="确定" onclick="threeSure()"style="color:black;width:40px;"> -->
														</td>
														
														
														
														<td class="w5" rowspan="3" id="threeFlow">0</td>
														<td class="w5" rowspan="3"> 九月</td>
														<td class="w5">
															<input id="" type="text" name="" value="" style="color:black;width:40px;">
														</td>
														<td class="w5">
															<input id="" type="text" name="" value="" style="color:black;width:40px;">
														</td>
														<td class="w5" id="nineEarlyDay">
															<input id="" type="text" name="" value="" style="color:black;width:40px;">
														</td>
														<td class="w5" id="nineEarly">
															<input id="" type="text" name="" value="" style="color:black;width:40px;">
														</td>
														<td class="w5">
															<input id="" type="text" name="" value="" style="color:black;width:40px;">
														</td>
														<td class="w5" rowspan="3">
															<input id="" type="text" name="" value="" style="color:black;width:40px;">
															<br><br>
															<!-- <input type="button" value="确定" onclick="nineSure()"style="color:black;width:40px;"> -->
														</td>
														
														<td class="w5" rowspan="3">
															<input id="" type="text" name="" value="" style="color:black;width:40px;">
															<br><br>
															<!-- <input type="button" value="确定" onclick="nineSure()"style="color:black;width:40px;"> -->
														</td>
														
														<td class="w5" rowspan="3" id="nineFlow">0</td>
													</tr>
													<tr>
														
													</tr>
													<tr>
														
													</tr>
													
													<tr>
														<td class="w5" rowspan="3">四月</td>
														<td class="w5">
															<input id="" type="text" name="" value="" style="color:black;width:40px;">
														</td>
														<td class="w5">
															<input id="" type="text" name="" value="" style="color:black;width:40px;">
														</td>
														<td class="w5" id="fourEarlyDay">
															<input id="" type="text" name="" value="" style="color:black;width:40px;">
														</td>
														<td class="w5" id="fourEarly">
															<input id="" type="text" name="" value="" style="color:black;width:40px;">
														</td>
														<td class="w5" >
															<input id="" type="text" name="" value="" style="color:black;width:40px;">
														</td>
														<td class="w5" rowspan="3">
															<input id="" type="text" name="" value="" style="color:black;width:40px;">
															<br><br>
															<!-- <input type="button" value="确定" onclick="fourSure()"style="color:black;width:40px;"> -->
														</td>
														<td class="w5" rowspan="3">
															<input id="" type="text" name="" value="" style="color:black;width:40px;">
															<br><br>
															<!-- <input type="button" value="确定" onclick="fourSure()"style="color:black;width:40px;"> -->
														</td>
														
														
														
														<td class="w5" rowspan="3" id="fourFlow">0</td>
														<td class="w5" rowspan="3"> 十月</td>
														<td class="w5">
															<input id="" type="text" name="" value="" style="color:black;width:40px;">
														</td>
														<td class="w5">
															<input id="" type="text" name="" value="" style="color:black;width:40px;">
														</td>
														<td class="w5" id="tenEarlyDay">
															<input id="" type="text" name="" value="" style="color:black;width:40px;">
														</td>
														<td class="w5" id="tenEarly">
															<input id="" type="text" name="" value="" style="color:black;width:40px;">
														</td>
														<td class="w5">
															<input id="" type="text" name="" value="" style="color:black;width:40px;">
														</td>
														<td class="w5" rowspan="3">
															<input id="" type="text" name="" value="" style="color:black;width:40px;">
															<br><br>
															<!-- <input type="button" value="确定" onclick="tenSure()"style="color:black;width:40px;"> -->
														</td>
														<td class="w5" rowspan="3">
															<input id="" type="text" name="" value="" style="color:black;width:40px;">
															<br><br>
															<!-- <input type="button" value="确定" onclick="tenSure()"style="color:black;width:40px;"> -->
														</td>
														
														<td class="w5" rowspan="3" id="tenFlow">0</td>
													</tr>
													<tr>
														
													</tr>
													<tr>
														
													</tr>
													
													<tr>
														<td class="w5" rowspan="3">五月</td>
														<td class="w5">
															<input id="" type="text" name="" value="" style="color:black;width:40px;">
														</td>
														<td class="w5">
															<input id="" type="text" name="" value="" style="color:black;width:40px;">
														</td>
														<td class="w5" id="fiveEarlyDay">
															<input id="" type="text" name="" value="" style="color:black;width:40px;">
														</td>
														<td class="w5" id="fiveEarly">
															<input id="" type="text" name="" value="" style="color:black;width:40px;">
														</td>
														<td class="w5" >
															<input id="" type="text" name="" value="" style="color:black;width:40px;">
														</td>
														<td class="w5" rowspan="3">
															<input id="" type="text" name="" value="" style="color:black;width:40px;">
															<br><br>
															<!-- <input type="button" value="确定" onclick="fiveSure()"style="color:black;width:40px;"> -->
														</td>
														<td class="w5" rowspan="3">
															<input id="" type="text" name="" value="" style="color:black;width:40px;">
															<br><br>
															<!-- <input type="button" value="确定" onclick="fiveSure()"style="color:black;width:40px;"> -->
														</td>
														
														<td class="w5" rowspan="3" id="fiveFlow">0</td>
														<td class="w5" rowspan="3"> 十一月</td>
														<td class="w5">
															<input id="" type="text" name="" value="" style="color:black;width:40px;">
														</td>
														<td class="w5">
															<input id="" type="text" name="" value="" style="color:black;width:40px;">
														</td>
														<td class="w5" id="elevenEarlyDay">
															<input id="" type="text" name="" value="" style="color:black;width:40px;">
														</td>
														<td class="w5" id="elevenEarly">
															<input id="" type="text" name="" value="" style="color:black;width:40px;">
														</td>
														<td class="w5">
															<input id="" type="text" name="" value="" style="color:black;width:40px;">
														</td>
														<td class="w5" rowspan="3">
															<input id="" type="text" name="" value="" style="color:black;width:40px;">
															<br><br>
															<!-- <input type="button" value="确定" onclick="elevenSure()"style="color:black;width:40px;"> -->
														</td>
														<td class="w5" rowspan="3">
															<input id="" type="text" name="" value="" style="color:black;width:40px;">
															<br><br>
															<!-- <input type="button" value="确定" onclick="elevenSure()"style="color:black;width:40px;"> -->
														</td>
														
														<td class="w5" rowspan="3" id="elevenFlow">0</td>
														
													</tr>
													<tr>
														
													</tr>
													<tr>
														
													</tr>
													
													<tr>
														<td class="w5" rowspan="3">六月</td>
														<td class="w5">
															<input id="" type="text" name="" value="" style="color:black;width:40px;">
														</td>
														<td class="w5">
															<input id="" type="text" name="" value="" style="color:black;width:40px;">
														</td>
														<td class="w5" id="sixEarlyDay">
															<input id="" type="text" name="" value="" style="color:black;width:40px;">
														</td>
														<td class="w5" id="sixEarly">
															<input id="" type="text" name="" value="" style="color:black;width:40px;">
														</td>
														<td class="w5" >
															<input id="" type="text" name="" value="" style="color:black;width:40px;">
														</td>
														<td class="w5" rowspan="3">
															<input id="" type="text" name="" value="" style="color:black;width:40px;">
															<br><br>
															<!-- <input type="button" value="确定" onclick="sixSure()"style="color:black;width:40px;"> -->
														</td>
														<td class="w5" rowspan="3" id="sixFlow">
															<input id="" type="text" name="" value="" style="color:black;width:40px;">
														</td>
														<td class="w5" rowspan="3" id="twelveFlow">0</td>
														
														<td class="w5" rowspan="3"> 十二月</td>
														<td class="w5">
															<input id="" type="text" name="" value="" style="color:black;width:40px;">
														</td>
														<td class="w5">
															<input id="" type="text" name="" value="" style="color:black;width:40px;">
														</td>
														<td class="w5" id="twelveEarlyDay">
															<input id="" type="text" name="" value="" style="color:black;width:40px;">
														</td>
														<td class="w5" id="twelveEarly">
															<input id="" type="text" name="" value="" style="color:black;width:40px;">
														</td>
														<td class="w5">
															<input id="" type="text" name="" value="" style="color:black;width:40px;">
														</td>
														<td class="w5" rowspan="3">
															<input id="" type="text" name="" value="" style="color:black;width:40px;">
															<br><br>
															<!-- <input type="button" value="确定" onclick="twelveSure()"style="color:black;width:40px;"> -->
														</td>
														
														<td class="w5" rowspan="3">
															<input id="" type="text" name="" value="" style="color:black;width:40px;">
															<br><br>
															<!-- <input type="button" value="确定" onclick="twelveSure()"style="color:black;width:40px;"> -->
														</td>
														
														<td class="w5" rowspan="3" id="twelveFlow">0</td>
														
													</tr>
													<tr>
														
													</tr>
													<tr>
														
													</tr>
													<tr>
														<!-- <td colspan="2">年份：</td>
														<td colspan="3">
															<select name="year" style="color:black;width:180px;height:30px;" >
																	<option value="0">请选择</option>
																	<option value="2018">2018</option>
																	<option value="2019">2019</option>
																	<option value="2020">2020</option>
															</select>
														</td> -->
													
														<td colspan="2">备注：</td>
														<td colspan="7">
															<input type="text" name="remark" value="" style="color:black;width:200px;"/></td>
														</td>
														<td colspan="2">制表人：</td>
														<td colspan="7">
															<input type="text" name="createPeople" value="" style="color:black;width:180px;">
														</td>
													</tr>
													
												</tbody>
    								</table>
    								<input type="text" hidden="hidden" name="canalCode" value="${canalCode}" style="color:black;width:580px;"/></td>	
    				
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
        $('#form').submit();
    }
	
	
	
	//一键预测
	
	function oneKeyforecast(){
		
		
		if(document.getElementById("oneFrequency").value!=""){
			oneSure();
		}
		
		if(document.getElementById("twoFrequency").value!=""){
			twoSure();
		}
		
		if(document.getElementById("threeFrequency").value!=""){
			threeSure();
		}
		if(document.getElementById("fourFrequency").value!=""){
			fourSure();
		}
		if(document.getElementById("fiveFrequency").value!=""){
			fiveSure();
		}
		if(document.getElementById("sixFrequency").value!=""){
			sixSure();
		}
		if(document.getElementById("sevenFrequency").value!=""){
			sevenSure();
		}
		if(document.getElementById("eightFrequency").value!=""){
			eightSure();
		}
		if(document.getElementById("nineFrequency").value!=""){
			nineSure();
		}
		if(document.getElementById("tenFrequency").value!=""){
			tenSure();
		}
		if(document.getElementById("elevenFrequency").value!=""){
			elevenSure();
		}
		if(document.getElementById("twelveFrequency").value!=""){
			twelveSure();
		}
	}
	
	
	
		
	//一月
	function oneSure(){
		var canalCode = "${canalCode}";
		//alert(canalCode);
		var frequency = document.getElementById("oneFrequency").value;
		$.ajax({
			url:"${ctx}/ten/get_flow",
			type: "post",
			data: {frequency:frequency,canalCode:canalCode,month:1},
			async: false,//非异步
			success: function(msg){
				setValue(msg,1,"oneEarlyFlow","oneEarlyDay","oneEarly","oneEarlyYear","oneMiddleFlow","oneMiddleDay","oneMiddle","oneMiddleYear","oneLastFlow","oneLastDay","oneLast","oneLastYear","oneFlow");
			}
		});
	}
	
	//二月
	function twoSure(){
		var canalCode = "${canalCode}";
		//alert(canalCode);
		var frequency = document.getElementById("twoFrequency").value;
		$.ajax({
			url:"${ctx}/ten/get_flow",
			type: "post",
			data: {frequency:frequency,canalCode:canalCode,month:2},
			async: false,//非异步
			success: function(msg){
				setValue(msg,2,"twoEarlyFlow","twoEarlyDay","twoEarly","twoEarlyYear","twoMiddleFlow","twoMiddleDay","twoMiddle","twoMiddleYear","twoLastFlow","twoLastDay","twoLast","twoLastYear","twoFlow");
			}
		});
	}
	
	//三月
	function threeSure(){
		var canalCode = "${canalCode}";
		//alert(canalCode);
		var frequency = document.getElementById("threeFrequency").value;
		$.ajax({
			url:"${ctx}/ten/get_flow",
			type: "post",
			data: {frequency:frequency,canalCode:canalCode,month:3},
			async: false,//非异步
			success: function(msg){
				setValue(msg,3,"threeEarlyFlow","threeEarlyDay","threeEarly","threeEarlyYear","threeMiddleFlow","threeMiddleDay","threeMiddle","threeMiddleYear","threeLastFlow","threeLastDay","threeLast","threeLastYear","threeFlow");
			}
		});
	}
	
	
	//四月
	function fourSure(){
		var canalCode = "${canalCode}";
		//alert(canalCode);
		var frequency = document.getElementById("fourFrequency").value;
		$.ajax({
			url:"${ctx}/ten/get_flow",
			type: "post",
			data: {frequency:frequency,canalCode:canalCode,month:4},
			async: false,//非异步
			success: function(msg){
				setValue(msg,4,"fourEarlyFlow","fourEarlyDay","fourEarly","fourEarlyYear","fourMiddleFlow","fourMiddleDay","fourMiddle","fourMiddleYear","fourLastFlow","fourLastDay","fourLast","fourLastYear","fourFlow");
			}
		});
	}
	
	//五月
	function fiveSure(){
		var canalCode = "${canalCode}";
		//alert(canalCode);
		var frequency = document.getElementById("fiveFrequency").value;
		$.ajax({
			url:"${ctx}/ten/get_flow",
			type: "post",
			data: {frequency:frequency,canalCode:canalCode,month:5},
			async: false,//非异步
			success: function(msg){
				setValue(msg,5,"fiveEarlyFlow","fiveEarlyDay","fiveEarly","fiveEarlyYear","fiveMiddleFlow","fiveMiddleDay","fiveMiddle","fiveMiddleYear","fiveLastFlow","fiveLastDay","fiveLast","fiveLastYear","fiveFlow");
			}
		});
	}
	
	//六月
	function sixSure(){
		var canalCode = "${canalCode}";
		//alert(canalCode);
		var frequency = document.getElementById("sixFrequency").value;
		$.ajax({
			url:"${ctx}/ten/get_flow",
			type: "post",
			data: {frequency:frequency,canalCode:canalCode,month:6},
			async: false,//非异步
			success: function(msg){
				setValue(msg,6,"sixEarlyFlow","sixEarlyDay","sixEarly","sixEarlyYear","sixMiddleFlow","sixMiddleDay","sixMiddle","sixMiddleYear","sixLastFlow","sixLastDay","sixLast","sixLastYear","sixFlow");
			}
		});
	}
	
	
	//七月
	function sevenSure(){
		var canalCode = "${canalCode}";
		//alert(canalCode);
		var frequency = document.getElementById("sevenFrequency").value;
		$.ajax({
			url:"${ctx}/ten/get_flow",
			type: "post",
			data: {frequency:frequency,canalCode:canalCode,month:7},
			async: false,//非异步
			success: function(msg){
				setValue(msg,7,"sevenEarlyFlow","sevenEarlyDay","sevenEarly","sevenEarlyYear","sevenMiddleFlow","sevenMiddleDay","sevenMiddle","sevenMiddleYear","sevenLastFlow","sevenLastDay","sevenLast","sevenLastYear","sevenFlow");
			}
		});
	}
	
	
	//八月
	function eightSure(){
		var canalCode = "${canalCode}";
		//alert(canalCode);
		var frequency = document.getElementById("eightFrequency").value;
		$.ajax({
			url:"${ctx}/ten/get_flow",
			type: "post",
			data: {frequency:frequency,canalCode:canalCode,month:8},
			async: false,//非异步
			success: function(msg){
				setValue(msg,8,"eightEarlyFlow","eightEarlyDay","eightEarly","eightEarlyYear","eightMiddleFlow","eightMiddleDay","eightMiddle","eightMiddleYear","eightLastFlow","eightLastDay","eightLast","eightLastYear","eightFlow");
			}
		});
	}
	
	//九月
	function nineSure(){
		var canalCode = "${canalCode}";
		//alert(canalCode);
		var frequency = document.getElementById("nineFrequency").value;
		$.ajax({
			url:"${ctx}/ten/get_flow",
			type: "post",
			data: {frequency:frequency,canalCode:canalCode,month:9},
			async: false,//非异步
			success: function(msg){
				setValue(msg,9,"nineEarlyFlow","nineEarlyDay","nineEarly","nineEarlyYear","nineMiddleFlow","nineMiddleDay","nineMiddle","nineMiddleYear","nineLastFlow","nineLastDay","nineLast","nineLastYear","nineFlow");
			}
		});
	}
	
	//十月
	function tenSure(){
		var canalCode = "${canalCode}";
		//alert(canalCode);
		var frequency = document.getElementById("tenFrequency").value;
		$.ajax({
			url:"${ctx}/ten/get_flow",
			type: "post",
			data: {frequency:frequency,canalCode:canalCode,month:10},
			async: false,//非异步
			success: function(msg){
				setValue(msg,10,"tenEarlyFlow","tenEarlyDay","tenEarly","tenEarlyYear","tenMiddleFlow","tenMiddleDay","tenMiddle","tenMiddleYear","tenLastFlow","tenLastDay","tenLast","tenLastYear","tenFlow");
			}
		});
	}
	
	//十一月
	function elevenSure(){
		var canalCode = "${canalCode}";
		//alert(canalCode);
		var frequency = document.getElementById("elevenFrequency").value;
		$.ajax({
			url:"${ctx}/ten/get_flow",
			type: "post",
			data: {frequency:frequency,canalCode:canalCode,month:11},
			async: false,//非异步
			success: function(msg){
				setValue(msg,11,"elevenEarlyFlow","elevenEarlyDay","elevenEarly","elevenEarlyYear","elevenMiddleFlow","elevenMiddleDay","elevenMiddle","elevenMiddleYear","elevenLastFlow","elevenLastDay","elevenLast","elevenLastYear","elevenFlow");
			}
		});
	}
	//十二月
	function twelveSure(){
		var canalCode = "${canalCode}";
		//alert(canalCode);
		var frequency = document.getElementById("twelveFrequency").value;
		$.ajax({
			url:"${ctx}/ten/get_flow",
			type: "post",
			data: {frequency:frequency,canalCode:canalCode,month:12},
			async: false,//非异步
			success: function(msg){
				setValue(msg,12,"twelveEarlyFlow","twelveEarlyDay","twelveEarly","twelveEarlyYear","twelveMiddleFlow","twelveMiddleDay","twelveMiddle","twelveMiddleYear","twelveLastFlow","twelveLastDay","twelveLast","twelveLastYear","twelveFlow");
			}
		});
	}
	
	//earlyFlow,earlyDay,early,earlyYear,middleFlow,middleDay,middle,middleYear,lastFlow,lastDay,last,lastYear,flow
	//a1       ,a2      ,a3   ,a4       ,b1        ,b2       ,b3	,b4		   ,c1	    ,c2     ,c3  ,c4      ,m
	function setValue(msg,month,a1,a2,a3,a4,b1,b2,b3,b4,c1,c2,c3,c4,m){
		//alert(JSON.stringify(msg));
		//上旬
		var earlyFlow = document.getElementById(a1);
			earlyFlow.value=msg[0].descendingArrangement;
		var earlyDay = document.getElementById(a2);	
			earlyDay.innerHTML=(msg[0].descendingArrangement)*3600*24/10000;
		var early = document.getElementById(a3);	
			early.innerHTML=(msg[0].descendingArrangement)*3600*24*10/10000;	
		var earlyYear = document.getElementById(a4);	
			earlyYear.value=msg[0].contrastYear;		
		//中旬
		var middleFlow = document.getElementById(b1);
			middleFlow.value=msg[1].descendingArrangement;
		var middleDay = document.getElementById(b2);	
			middleDay.innerHTML=(msg[1].descendingArrangement)*3600*24/10000;
		var middle = document.getElementById(b3);	
			middle.innerHTML=(msg[1].descendingArrangement)*3600*24*10/10000;	
		var middleYear = document.getElementById(b4);	
			middleYear.value=msg[1].contrastYear;			
		//下旬
		var lastFlow = document.getElementById(c1);
			lastFlow.value=msg[2].descendingArrangement;
		var lastDay = document.getElementById(c2);	
			lastDay.innerHTML=(msg[2].descendingArrangement)*3600*24/10000;
		var last = document.getElementById(c3);	
			last.innerHTML=(msg[2].descendingArrangement)*3600*24*11/10000;	
		var lastYear = document.getElementById(c4);	
			lastYear.value=msg[2].contrastYear;
			
			
		var oneFlow = document.getElementById(m);	
			oneFlow.innerHTML=(msg[0].descendingArrangement)*3600*24*10/10000+(msg[1].descendingArrangement)*3600*24*10/10000+(msg[2].descendingArrangement)*3600*24*11/10000;
	}
	
	
	
	</script>
</body>
</html>



