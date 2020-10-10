<%@ page language="java" contentType="text/html; charset=utf-8" pageEncoding="utf-8"%>
<%@ include file="/WEB-INF/views/base.jsp"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
	<meta http-equiv="X-UA-Compatible" content="IE=Edge">
	<meta name="viewport" content="width=device-width, initial-scale=1,maximum-scale=1, user-scalable=no">
	<meta http-equiv="Content-Type" content="multipart/form-data; charset=utf-8" />
	<script type="text/javascript" src="${ctxstc}/jquery/jquery-1.11.1.min.js"></script>
	<script src="${ctxstc}/adapters/layui/layer/layer.js"></script> 
	<link type="text/css" rel="stylesheet" href="${ctxstc}/css/layui.css" media="all">
	<script type="text/javascript" src="${ctxstc}/js/layui.js"></script>
	<link rel="stylesheet" href="https://unpkg.com/element-ui@1.4/lib/theme-default/index.css">
	<script type="text/javascript" src="${ctxstc}/js/vue.js"></script>
	<script src="https://unpkg.com/element-ui@1.4/lib/index.js"></script>
	<script src="${ctxstc}/js/custom/province_city/distpicker.data.js"></script>
	<script src="${ctxstc}/js/custom/province_city/distpicker.js"></script>
	<script src="${ctxstc}/js/custom/province_city/main.js"></script>
	<title></title>
	<style>
		.el-form-item__content{width:180px;}
		#imagesWater .el-form-item__content,#address .el-form-item__content{width:480px;}
		label{font-weight:100;}
		.form-inline .form-group{width:117px;} 
		.form-inline .form-control{width:116px;padding:0;}
		#fileText .el-upload-list{display:none;}
		.form-control{border:1px solid #bfcbd9;border-radius:4px;height:35px;}
		#see:hover{border:solid 4px #1E9FFF;color:#ffffff;background-color: #1E9FFF}
	</style>
</head>
<body style="background-color: #FFFFFF;font-weight:none;">
	<div id="updateForm">
									 <el-form id="elFrom" :model="updateData" ref="updateData"  :inline="true"  label-width="100px" class="demo-ruleForm" align="center" style="margin-top:30px;" >
    									<el-form-item label="监测站名称" required prop="monitorName" >
      										<el-input  auto-complete="off" v-model="updateData.monitorName"></el-input>
    									</el-form-item>
    									<el-form-item label="监测站编码" required prop="coding">
      										<el-input  auto-complete="off" v-model="updateData.coding"></el-input>
    									</el-form-item>
    									<el-form-item label="设备编码" required  :status-icon="true" prop="equipCoding" ><el-input type="text" placeholder="设备编码" v-model="updateData.equipCoding"></el-input></el-form-item>
  										<el-form-item label="SIM卡号" required prop="simClip"><el-input type="text" placeholder="SIM卡号" v-model="updateData.simClip"  auto-complete="off"></el-input></el-form-item>
  										<el-form-item label="运营商" required  :status-icon="true" prop="simClipOperator">
  											<el-select v-model="updateData.simClipOperator" placeholder="请选择">
    											<el-option v-for="item in options" :key="item.value" :label="item.label" :value="item.value"></el-option>
  											</el-select>
  										</el-form-item>
  										<el-form-item label="修建时间" required prop="buildTime">
  											<el-date-picker v-model="updateData.buildTime" type="datetime" placeholder="选择日期时间" style="width:180px;"></el-date-picker>
  										</el-form-item>
    									<el-form-item label="经度" required prop="longitude">
  												<el-input type="number" placeholder="经度" v-model="updateData.longitude" auto-complete="off" >
  													<template slot="append">度</template>
  												</el-input>
  										</el-form-item>
    									<el-form-item prop="latitude" required label="纬度">
    											<el-input type="number" placeholder="纬度" v-model="updateData.latitude" auto-complete="off" >
    												<template slot="append">度</template>
    											</el-input>
    									</el-form-item>
  									<el-form-item label="高程" required prop="elevation"><el-input type="number" placeholder="高程"  v-model="updateData.elevation"  auto-complete="off"></el-input></el-form-item>
  									<el-form-item label="水质等级 " required  prop="waterGrade" >
  										<template slot-scope="scope">
  			 							 <div class="block">
  											<span class="demonstration" style="font-size: 14px;color: #48576a;" ></span>
    											<el-slider v-model.number=" updateData.waterGrade" @change="changeUpdate" :format-tooltip="formatTooletip"  :step="20" :max="100"   show-stops ></el-slider>
  										</div>
  										</template>
  									</el-form-item>
  									 <!-- <el-form-item label="监测站地址" required id="distpicker" style="margin-right:30px;">
  									<div class="form-inline" >
  			 								<div data-toggle="distpicker" >
  			 									<el-col :span="8">
  			 									<el-form-item prop="province">
  			 										<div class="form-group" style="display:table;" ><select class="form-control"  v-model="updateData.province" id="province"></select></div>
  			 									</el-form-item>
  			 									</el-col>
  			 									<el-col :span="8">
  			 								<el-form-item prop="city">
  			 									<div class="form-group" style="display:table;"><select class="form-control" v-model="updateData.city" id="city"></select></div>
  			 								</el-form-item>
  			 								</el-col>
  			 								<el-col :span="8">
  			 									<el-form-item>
  			 										<div class="form-group" style="display:table;"><select class="form-control" v-model="updateData.district"  id="district"></select></div>
  			 									</el-form-item>
  			 								</el-col>
  										</div>
  									</div>
  									</el-form-item> -->
  									<el-form-item label="详细地址" required prop="detailAddress" id="address" >
  										<el-input placeholder="请输入详细地址" type="textarea" v-model="updateData.detailAddress"></el-input>
  									</el-form-item>
  								<!-- 	<el-form-item label=""  prop=""></el-form-item>
  									</el-form> -->
									<div >
    									<el-button type="primary" @click="submitForm()">提 交</el-button>
  									</div>

	</div>
</body>
<script type="text/javascript" src="${ctxstc}/js/custom/sitemanage/water_survey_site/updateForm.js"></script>
</html>
