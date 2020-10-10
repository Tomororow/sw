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
  					
    				<form  id="form" action="${ctx}/forecast/add" method="post" enctype="multipart/form-data">
    				
    				<table class="table table-bordered table-header">
							<thead>
													
													<tr>
														<td class="w5">月份</td>
														<td class="w5">旬</td>
														<td class="w5">Q旬(m3/s)</td>
														<td class="w5">W日(万m3)</td>
														<td class="w5">W旬(万m3)</td>
														<td class="w5">对应年份</td>
														<td class="w5">采用频率(%)</td>
														<td class="w5">W月(万m3)</td>
														<td class="w5">月份</td>
														<td class="w5">旬</td>
														<td class="w5">Q旬(m3/s)</td>
														<td class="w5">W日(万m3)</td>
														<td class="w5">W旬(万m3)</td>
														<td class="w5">对应年份</td>
														<td class="w5">采用频率(%)</td>
														<td class="w5">W月(万m3)</td>
													</tr>
													
												</thead>
												<tbody >
													<tr>
														<td class="w5" rowspan="3">一月</td>
														<td class="w5">上旬</td>
														<td class="w5">
															<input id="oneEarlyFlow" readonly="true" type="text" name="oneEarlyFlow" value="0" style="border:none;background-color:transparent;color:white;width:40px;">
														</td>
														<td class="w5" id="oneEarlyDay">0</td>
														<td class="w5" id="oneEarly">0</td>
														<td class="w5" >
															<input id="oneEarlyYear" readonly="true" type="text" name="oneEarlyYear" value="0" style="border:none;background-color:transparent;color:white;width:40px;">
														</td>
														<td class="w5" rowspan="3">
															<input id="oneFrequency" type="text" name="oneFrequency" value="" style="color:black;width:40px;">
															<br><br>
															<!-- <input type="button" value="确定" onclick="oneSure()"style="color:black;width:40px;"> -->
														</td>
														<td class="w5" rowspan="3" id="oneFlow">0</td>
														<td class="w5" rowspan="3">七月</td>
														<td class="w5">上旬</td>
														<td class="w5">
															<input id="sevenEarlyFlow" readonly="true" type="text" name="sevenEarlyFlow" value="0" style="border:none;background-color:transparent;color:white;width:40px;">
														</td>
														<td class="w5" id="sevenEarlyDay">0</td>
														<td class="w5" id="sevenEarly">0</td>
														<td class="w5">
															<input id="sevenEarlyYear" readonly="true" type="text" name="sevenEarlyYear" value="0" style="border:none;background-color:transparent;color:white;width:40px;">
														</td>
														<td class="w5" rowspan="3">
															<input id="sevenFrequency" type="text" name="sevenFrequency" value="" style="color:black;width:40px;">
															<br><br>
															<!-- <input type="button" value="确定" onclick="sevenSure()"style="color:black;width:40px;"> -->
														</td>
														<td class="w5" rowspan="3" id="sevenFlow">0</td>
													</tr>
													<tr>
														<td class="w5">中旬</td>
														<td class="w5">
															<input id="oneMiddleFlow" readonly="true" type="text" name="oneMiddleFlow" value="0" style="border:none;background-color:transparent;color:white;width:40px;">
														</td>
														<td class="w5" id="oneMiddleDay">0</td>
														<td class="w5" id="oneMiddle">0</td>
														<td class="w5">
															<input id="oneMiddleYear" readonly="true" type="text" name="oneMiddleYear" value="0" style="border:none;background-color:transparent;color:white;width:40px;">
														</td>
														<td class="w5">中旬</td>
														<td class="w5">
															<input id="sevenMiddleFlow" readonly="true" type="text" name="sevenMiddleFlow" value="0" style="border:none;background-color:transparent;color:white;width:40px;">
														</td>
														<td class="w5" id="sevenMiddleDay">0</td>
														<td class="w5" id="sevenMiddle">0</td>
														<td class="w5">
															<input id="sevenMiddleYear" readonly="true" type="text" name="sevenMiddleYear" value="0" style="border:none;background-color:transparent;color:white;width:40px;">
														</td>
													</tr>
													<tr>
														<td class="w5">下旬</td>
														<td class="w5">
															<input id="oneLastFlow" readonly="true" type="text" name="oneLastFlow" value="0" style="border:none;background-color:transparent;color:white;width:40px;">
														</td>
														<td class="w5" id="oneLastDay">0</td>
														<td class="w5" id="oneLast">0</td>
														<td class="w5" >
															<input id="oneLastYear" readonly="true" type="text" name="oneLastYear" value="0" style="border:none;background-color:transparent;color:white;width:40px;">
														</td>
														<td class="w5">下旬</td>
														<td class="w5">
															<input id="sevenLastFlow" readonly="true" type="text" name="sevenLastFlow" value="0" style="border:none;background-color:transparent;color:white;width:40px;">
														</td>
														<td class="w5" id="sevenLastDay">0</td>
														<td class="w5" id="sevenLast">0</td>
														<td class="w5">
															<input id="sevenLastYear" readonly="true" type="text" name="sevenLastYear" value="0" style="border:none;background-color:transparent;color:white;width:40px;">
														</td>
													</tr>
													<tr>
														<td class="w5" rowspan="3">二月</td>
														<td class="w5">上旬</td>
														<td class="w5">
															<input id="twoEarlyFlow" readonly="true" type="text" name="twoEarlyFlow" value="0" style="border:none;background-color:transparent;color:white;width:40px;">
														</td>
														<td class="w5" id="twoEarlyDay">0</td>
														<td class="w5" id="twoEarly">0</td>
														<td class="w5" >
															<input id="twoEarlyYear" readonly="true" type="text" name="twoEarlyYear" value="0" style="border:none;background-color:transparent;color:white;width:40px;">
														</td>
														<td class="w5" rowspan="3">
															<input id="twoFrequency" type="text" name="twoFrequency" value="" style="color:black;width:40px;">
															<br><br>
															<!-- <input type="button" value="确定" onclick="twoSure()"style="color:black;width:40px;"> -->
														</td>
														<td class="w5" rowspan="3" id="twoFlow">0</td>
														<td class="w5" rowspan="3"> 八月</td>
														<td class="w5">上旬</td>
														<td class="w5">
															<input id="eightEarlyFlow" readonly="true" type="text" name="eightEarlyFlow" value="0" style="border:none;background-color:transparent;color:white;width:40px;">
														</td>
														<td class="w5" id="eightEarlyDay">0</td>
														<td class="w5" id="eightEarly">0</td>
														<td class="w5">
															<input id="eightEarlyYear" readonly="true" type="text" name="eightEarlyYear" value="0" style="border:none;background-color:transparent;color:white;width:40px;">
														</td>
														<td class="w5" rowspan="3">
															<input id="eightFrequency" type="text" name="eightFrequency" value="" style="color:black;width:40px;">
															<br><br>
															<!-- <input type="button" value="确定" onclick="eightSure()"style="color:black;width:40px;"> -->
														</td>
														<td class="w5" rowspan="3" id="eightFlow">0</td>
													</tr>
													<tr>
														<td class="w5">中旬</td>
														<td class="w5">
															<input id="twoMiddleFlow" readonly="true" type="text" name="twoMiddleFlow" value="0" style="border:none;background-color:transparent;color:white;width:40px;">
														</td>
														<td class="w5" id="twoMiddleDay">0</td>
														<td class="w5" id="twoMiddle">0</td>
														<td class="w5">
															<input id="twoMiddleYear" readonly="true" type="text" name="twoMiddleYear" value="0" style="border:none;background-color:transparent;color:white;width:40px;">
														</td>
														<td class="w5">中旬</td>
														<td class="w5">
															<input id="eightMiddleFlow" readonly="true" type="text" name="eightMiddleFlow" value="0" style="border:none;background-color:transparent;color:white;width:40px;">
														</td>
														<td class="w5" id="eightMiddleDay">0</td>
														<td class="w5" id="eightMiddle">0</td>
														<td class="w5">
															<input id="eightMiddleYear" readonly="true" type="text" name="eightMiddleYear" value="0" style="border:none;background-color:transparent;color:white;width:40px;">
														</td>
													</tr>
													<tr>
														<td class="w5">下旬</td>
														<td class="w5">
															<input id="twoLastFlow" readonly="true" type="text" name="twoLastFlow" value="0" style="border:none;background-color:transparent;color:white;width:40px;">
														</td>
														<td class="w5" id="twoLastDay">0</td>
														<td class="w5" id="twoLast">0</td>
														<td class="w5" >
															<input id="twoLastYear" readonly="true" type="text" name="twoLastYear" value="0" style="border:none;background-color:transparent;color:white;width:40px;">
														</td>
														<td class="w5">下旬</td>
														<td class="w5">
															<input id="eightLastFlow" readonly="true" type="text" name="eightLastFlow" value="0" style="border:none;background-color:transparent;color:white;width:40px;">
														</td>
														<td class="w5" id="eightLastDay">0</td>
														<td class="w5" id="eightLast">0</td>
														<td class="w5">
															<input id="eightLastYear" readonly="true" type="text" name="eightLastYear" value="0" style="border:none;background-color:transparent;color:white;width:40px;">
														</td>
													</tr>
													
													<tr>
														<td class="w5" rowspan="3">三月</td>
														<td class="w5">上旬</td>
														<td class="w5">
															<input id="threeEarlyFlow" readonly="true" type="text" name="threeEarlyFlow" value="0" style="border:none;background-color:transparent;color:white;width:40px;">
														</td>
														<td class="w5" id="threeEarlyDay">0</td>
														<td class="w5" id="threeEarly">0</td>
														<td class="w5" >
															<input id="threeEarlyYear" readonly="true" type="text" name="threeEarlyYear" value="0" style="border:none;background-color:transparent;color:white;width:40px;">
														</td>
														<td class="w5" rowspan="3">
															<input id="threeFrequency" type="text" name="threeFrequency" value="" style="color:black;width:40px;">
															<br><br>
															<!-- <input type="button" value="确定" onclick="threeSure()"style="color:black;width:40px;"> -->
														</td>
														<td class="w5" rowspan="3" id="threeFlow">0</td>
														<td class="w5" rowspan="3"> 九月</td>
														<td class="w5">上旬</td>
														<td class="w5">
															<input id="nineEarlyFlow" readonly="true" type="text" name="nineEarlyFlow" value="0" style="border:none;background-color:transparent;color:white;width:40px;">
														</td>
														<td class="w5" id="nineEarlyDay">0</td>
														<td class="w5" id="nineEarly">0</td>
														<td class="w5">
															<input id="nineEarlyYear" readonly="true" type="text" name="nineEarlyYear" value="0" style="border:none;background-color:transparent;color:white;width:40px;">
														</td>
														<td class="w5" rowspan="3">
															<input id="nineFrequency" type="text" name="nineFrequency" value="" style="color:black;width:40px;">
															<br><br>
															<!-- <input type="button" value="确定" onclick="nineSure()"style="color:black;width:40px;"> -->
														</td>
														<td class="w5" rowspan="3" id="nineFlow">0</td>
													</tr>
													<tr>
														<td class="w5">中旬</td>
														<td class="w5">
															<input id="threeMiddleFlow" readonly="true" type="text" name="threeMiddleFlow" value="0" style="border:none;background-color:transparent;color:white;width:40px;">
														</td>
														<td class="w5" id="threeMiddleDay">0</td>
														<td class="w5" id="threeMiddle">0</td>
														<td class="w5">
															<input id="threeMiddleYear" readonly="true" type="text" name="threeMiddleYear" value="0" style="border:none;background-color:transparent;color:white;width:40px;">
														</td>
														<td class="w5">中旬</td>
														<td class="w5">
															<input id="nineMiddleFlow" readonly="true" type="text" name="nineMiddleFlow" value="0" style="border:none;background-color:transparent;color:white;width:40px;">
														</td>
														<td class="w5" id="nineMiddleDay">0</td>
														<td class="w5" id="nineMiddle">0</td>
														<td class="w5">
															<input id="nineMiddleYear" readonly="true" type="text" name="nineMiddleYear" value="0" style="border:none;background-color:transparent;color:white;width:40px;">
														</td>
													</tr>
													<tr>
														<td class="w5">下旬</td>
														<td class="w5">
															<input id="threeLastFlow" readonly="true" type="text" name="threeLastFlow" value="0" style="border:none;background-color:transparent;color:white;width:40px;">
														</td>
														<td class="w5" id="threeLastDay">0</td>
														<td class="w5" id="threeLast">0</td>
														<td class="w5" >
															<input id="threeLastYear" readonly="true" type="text" name="threeLastYear" value="0" style="border:none;background-color:transparent;color:white;width:40px;">
														</td>
														<td class="w5">下旬</td>
														<td class="w5">
															<input id="nineLastFlow" readonly="true" type="text" name="nineLastFlow" value="0" style="border:none;background-color:transparent;color:white;width:40px;">
														</td>
														<td class="w5" id="nineLastDay">0</td>
														<td class="w5" id="nineLast">0</td>
														<td class="w5">
															<input id="nineLastYear" readonly="true" type="text" name="nineLastYear" value="0" style="border:none;background-color:transparent;color:white;width:40px;">
														</td>
													</tr>
													
													<tr>
														<td class="w5" rowspan="3">四月</td>
														<td class="w5">上旬</td>
														<td class="w5">
															<input id="fourEarlyFlow" readonly="true" type="text" name="fourEarlyFlow" value="0" style="border:none;background-color:transparent;color:white;width:40px;">
														</td>
														<td class="w5" id="fourEarlyDay">0</td>
														<td class="w5" id="fourEarly">0</td>
														<td class="w5" >
															<input id="fourEarlyYear" readonly="true" type="text" name="fourEarlyYear" value="0" style="border:none;background-color:transparent;color:white;width:40px;">
														</td>
														<td class="w5" rowspan="3">
															<input id="fourFrequency" type="text" name="fourFrequency" value="" style="color:black;width:40px;">
															<br><br>
															<!-- <input type="button" value="确定" onclick="fourSure()"style="color:black;width:40px;"> -->
														</td>
														<td class="w5" rowspan="3" id="fourFlow">0</td>
														<td class="w5" rowspan="3"> 十月</td>
														<td class="w5">上旬</td>
														<td class="w5">
															<input id="tenEarlyFlow" readonly="true" type="text" name="tenEarlyFlow" value="0" style="border:none;background-color:transparent;color:white;width:40px;">
														</td>
														<td class="w5" id="tenEarlyDay">0</td>
														<td class="w5" id="tenEarly">0</td>
														<td class="w5">
															<input id="tenEarlyYear" readonly="true" type="text" name="tenEarlyYear" value="0" style="border:none;background-color:transparent;color:white;width:40px;">
														</td>
														<td class="w5" rowspan="3">
															<input id="tenFrequency" type="text" name="tenFrequency" value="" style="color:black;width:40px;">
															<br><br>
															<!-- <input type="button" value="确定" onclick="tenSure()"style="color:black;width:40px;"> -->
														</td>
														<td class="w5" rowspan="3" id="tenFlow">0</td>
													</tr>
													<tr>
														<td class="w5">中旬</td>
														<td class="w5">
															<input id="fourMiddleFlow" readonly="true" type="text" name="fourMiddleFlow" value="0" style="border:none;background-color:transparent;color:white;width:40px;">
														</td>
														<td class="w5" id="fourMiddleDay">0</td>
														<td class="w5" id="fourMiddle">0</td>
														<td class="w5">
															<input id="fourMiddleYear" readonly="true" type="text" name="fourMiddleYear" value="0" style="border:none;background-color:transparent;color:white;width:40px;">
														</td>
														<td class="w5">中旬</td>
														<td class="w5">
															<input id="tenMiddleFlow" readonly="true" type="text" name="tenMiddleFlow" value="0" style="border:none;background-color:transparent;color:white;width:40px;">
														</td>
														<td class="w5" id="tenMiddleDay">0</td>
														<td class="w5" id="tenMiddle">0</td>
														<td class="w5">
															<input id="tenMiddleYear" readonly="true" type="text" name="tenMiddleYear" value="0" style="border:none;background-color:transparent;color:white;width:40px;">
														</td>
													</tr>
													<tr>
														<td class="w5">下旬</td>
														<td class="w5">
															<input id="fourLastFlow" readonly="true" type="text" name="fourLastFlow" value="0" style="border:none;background-color:transparent;color:white;width:40px;">
														</td>
														<td class="w5" id="fourLastDay">0</td>
														<td class="w5" id="fourLast">0</td>
														<td class="w5" >
															<input id="fourLastYear" readonly="true" type="text" name="fourLastYear" value="0" style="border:none;background-color:transparent;color:white;width:40px;">
														</td>
														<td class="w5">下旬</td>
														<td class="w5">
															<input id="tenLastFlow" readonly="true" type="text" name="tenLastFlow" value="0" style="border:none;background-color:transparent;color:white;width:40px;">
														</td>
														<td class="w5" id="tenLastDay">0</td>
														<td class="w5" id="tenLast">0</td>
														<td class="w5">
															<input id="tenLastYear" readonly="true" type="text" name="tenLastYear" value="0" style="border:none;background-color:transparent;color:white;width:40px;">
														</td>
													</tr>
													
													<tr>
														<td class="w5" rowspan="3">五月</td>
														<td class="w5">上旬</td>
														<td class="w5">
															<input id="fiveEarlyFlow" readonly="true" type="text" name="fiveEarlyFlow" value="0" style="border:none;background-color:transparent;color:white;width:40px;">
														</td>
														<td class="w5" id="fiveEarlyDay">0</td>
														<td class="w5" id="fiveEarly">0</td>
														<td class="w5" >
															<input id="fiveEarlyYear" readonly="true" type="text" name="fiveEarlyYear" value="0" style="border:none;background-color:transparent;color:white;width:40px;">
														</td>
														<td class="w5" rowspan="3">
															<input id="fiveFrequency" type="text" name="fiveFrequency" value="" style="color:black;width:40px;">
															<br><br>
															<!-- <input type="button" value="确定" onclick="fiveSure()"style="color:black;width:40px;"> -->
														</td>
														<td class="w5" rowspan="3" id="fiveFlow">0</td>
														<td class="w5" rowspan="3"> 十一月</td>
														<td class="w5">上旬</td>
														<td class="w5">
															<input id="elevenEarlyFlow" readonly="true" type="text" name="elevenEarlyFlow" value="0" style="border:none;background-color:transparent;color:white;width:40px;">
														</td>
														<td class="w5" id="elevenEarlyDay">0</td>
														<td class="w5" id="elevenEarly">0</td>
														<td class="w5">
															<input id="elevenEarlyYear" readonly="true" type="text" name="elevenEarlyYear" value="0" style="border:none;background-color:transparent;color:white;width:40px;">
														</td>
														<td class="w5" rowspan="3">
															<input id="elevenFrequency" type="text" name="elevenFrequency" value="" style="color:black;width:40px;">
															<br><br>
															<!-- <input type="button" value="确定" onclick="elevenSure()"style="color:black;width:40px;"> -->
														</td>
														<td class="w5" rowspan="3" id="elevenFlow">0</td>
														
													</tr>
													<tr>
														<td class="w5">中旬</td>
														<td class="w5">
															<input id="fiveMiddleFlow" readonly="true" type="text" name="fiveMiddleFlow" value="0" style="border:none;background-color:transparent;color:white;width:40px;">
														</td>
														<td class="w5" id="fiveMiddleDay">0</td>
														<td class="w5" id="fiveMiddle">0</td>
														<td class="w5">
															<input id="fiveMiddleYear" readonly="true" type="text" name="fiveMiddleYear" value="0" style="border:none;background-color:transparent;color:white;width:40px;">
														</td>
														<td class="w5">中旬</td>
														<td class="w5">
															<input id="elevenMiddleFlow" readonly="true" type="text" name="elevenMiddleFlow" value="0" style="border:none;background-color:transparent;color:white;width:40px;">
														</td>
														<td class="w5" id="elevenMiddleDay">0</td>
														<td class="w5" id="elevenMiddle">0</td>
														<td class="w5">
															<input id="elevenMiddleYear" readonly="true" type="text" name="elevenMiddleYear" value="0" style="border:none;background-color:transparent;color:white;width:40px;">
														</td>
													</tr>
													<tr>
														<td class="w5">下旬</td>
														<td class="w5">
															<input id="fiveLastFlow" readonly="true" type="text" name="fiveLastFlow" value="0" style="border:none;background-color:transparent;color:white;width:40px;">
														</td>
														<td class="w5" id="fiveLastDay">0</td>
														<td class="w5" id="fiveLast">0</td>
														<td class="w5" >
															<input id="fiveLastYear" readonly="true" type="text" name="fiveLastYear" value="0" style="border:none;background-color:transparent;color:white;width:40px;">
														</td>
														<td class="w5">下旬</td>
														<td class="w5">
															<input id="elevenLastFlow" readonly="true" type="text" name="elevenLastFlow" value="0" style="border:none;background-color:transparent;color:white;width:40px;">
														</td>
														<td class="w5" id="elevenLastDay">0</td>
														<td class="w5" id="elevenLast">0</td>
														<td class="w5">
															<input id="elevenLastYear" readonly="true" type="text" name="elevenLastYear" value="0" style="border:none;background-color:transparent;color:white;width:40px;">
														</td>
													</tr>
													
													<tr>
														<td class="w5" rowspan="3">六月</td>
														<td class="w5">上旬</td>
														<td class="w5">
															<input id="sixEarlyFlow" readonly="true" type="text" name="sixEarlyFlow" value="0" style="border:none;background-color:transparent;color:white;width:40px;">
														</td>
														<td class="w5" id="sixEarlyDay">0</td>
														<td class="w5" id="sixEarly">0</td>
														<td class="w5" >
															<input id="sixEarlyYear" readonly="true" type="text" name="sixEarlyYear" value="0" style="border:none;background-color:transparent;color:white;width:40px;">
														</td>
														<td class="w5" rowspan="3">
															<input id="sixFrequency" type="text" name="sixFrequency" value="" style="color:black;width:40px;">
															<br><br>
															<!-- <input type="button" value="确定" onclick="sixSure()"style="color:black;width:40px;"> -->
														</td>
														<td class="w5" rowspan="3" id="sixFlow">0</td>
														<td class="w5" rowspan="3"> 十二月</td>
														<td class="w5">上旬</td>
														<td class="w5">
															<input id="twelveEarlyFlow" readonly="true" type="text" name="twelveEarlyFlow" value="0" style="border:none;background-color:transparent;color:white;width:40px;">
														</td>
														<td class="w5" id="twelveEarlyDay">0</td>
														<td class="w5" id="twelveEarly">0</td>
														<td class="w5">
															<input id="twelveEarlyYear" readonly="true" type="text" name="twelveEarlyYear" value="0" style="border:none;background-color:transparent;color:white;width:40px;">
														</td>
														<td class="w5" rowspan="3">
															<input id="twelveFrequency" type="text" name="twelveFrequency" value="" style="color:black;width:40px;">
															<br><br>
															<!-- <input type="button" value="确定" onclick="twelveSure()"style="color:black;width:40px;"> -->
														</td>
														<td class="w5" rowspan="3" id="twelveFlow">0</td>
														
													</tr>
													<tr>
														<td class="w5">中旬</td>
														<td class="w5">
															<input id="sixMiddleFlow" readonly="true" type="text" name="sixMiddleFlow" value="0" style="border:none;background-color:transparent;color:white;width:40px;">
														</td>
														<td class="w5" id="sixMiddleDay">0</td>
														<td class="w5" id="sixMiddle">0</td>
														<td class="w5">
															<input id="sixMiddleYear" readonly="true" type="text" name="sixMiddleYear" value="0" style="border:none;background-color:transparent;color:white;width:40px;">
														</td>
														<td class="w5">中旬</td>
														<td class="w5">
															<input id="twelveMiddleFlow" readonly="true" type="text" name="twelveMiddleFlow" value="0" style="border:none;background-color:transparent;color:white;width:40px;">
														</td>
														<td class="w5" id="twelveMiddleDay">0</td>
														<td class="w5" id="twelveMiddle">0</td>
														<td class="w5">
															<input id="twelveMiddleYear" readonly="true" type="text" name="twelveMiddleYear" value="0" style="border:none;background-color:transparent;color:white;width:40px;">
														</td>
													</tr>
													<tr>
														<td class="w5">下旬</td>
														<td class="w5">
															<input id="sixLastFlow" readonly="true" type="text" name="sixLastFlow" value="0" style="border:none;background-color:transparent;color:white;width:40px;">
														</td>
														<td class="w5" id="sixLastDay">0</td>
														<td class="w5" id="sixLast">0</td>
														<td class="w5" >
															<input id="sixLastYear" readonly="true" type="text" name="sixLastYear" value="0" style="border:none;background-color:transparent;color:white;width:40px;">
														</td>
														<td class="w5">下旬</td>
														<td class="w5">
															<input id="twelveLastFlow" readonly="true" type="text" name="twelveLastFlow" value="0" style="border:none;background-color:transparent;color:white;width:40px;">
														</td>
														<td class="w5" id="twelveLastDay">0</td>
														<td class="w5" id="twelveLast">0</td>
														<td class="w5">
															<input id="twelveLastYear" readonly="true" type="text" name="twelveLastYear" value="0" style="border:none;background-color:transparent;color:white;width:40px;">
														</td>
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



