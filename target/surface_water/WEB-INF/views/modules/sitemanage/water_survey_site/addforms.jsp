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
		label{font-weight:100;}
		#imagesWater .el-form-item__content,#address .el-form-item__content{width:480px;}
		.form-inline .form-group{width:117px;} 
		.form-inline .form-control{width:116px;padding:0;}
		#fileText .el-upload-list{display:none;}
		.form-control{border:1px solid #bfcbd9;border-radius:4px;height:35px;}
		#see:hover{border:solid 4px #1E9FFF;color:#ffffff;background-color: #1E9FFF}
	</style>
</head>
<body style="background-color: #FFFFFF;font-weight:none;">
	<div id="addForms" style="margin-top:50px;">
		<el-form :model="ruleForm" :inline="true" ref="ruleForm" :rules="rules" label-width="100px" class="demo-ruleForm" align="center">
  			<el-form-item label="监测站名称"  :status-icon="true" prop="monitorName"><el-input type="text" placeholder="监测站名称" v-model="ruleForm.monitorName"></el-input></el-form-item>
  			<el-form-item label="监测站编码" prop="coding"><el-input type="text" placeholder="监测站编码" v-model="ruleForm.coding"  auto-complete="off"></el-input></el-form-item>
  			<el-form-item label="设备编码"  :status-icon="true" prop="equipCoding"><el-input type="text" placeholder="设备编码" v-model="ruleForm.equipCoding"></el-input></el-form-item>
  			<el-form-item label="SIM卡号" prop="simClip"><el-input type="text" placeholder="SIM卡号" v-model="ruleForm.simClip"  auto-complete="off"></el-input></el-form-item>
  			<el-form-item label="运营商"  :status-icon="true" prop="simClipOperator">
  				<el-select v-model="ruleForm.simClipOperator" placeholder="请选择" style="width:180px;">
    				<el-option v-for="item in options" :key="item.value" :label="item.label" :value="item.value"></el-option>
  				</el-select>
  			</el-form-item>
  			<el-form-item label="修建时间" prop="buildTime">
  				<el-date-picker v-model="ruleForm.buildTime" type="datetime" placeholder="选择日期时间" style="width:180px;"></el-date-picker>
  			</el-form-item>
  			<el-form-item label="经度" required prop="longitude" >
  				<el-input type="number" placeholder="经度" v-model="ruleForm.longitude" auto-complete="off" >
  					<template slot="append">度</template>
  				</el-input>
  			</el-form-item>
  			<el-form-item label="纬度" required prop="latitude">
    			<el-input type="number" placeholder="请输入纬度" v-model="ruleForm.latitude" auto-complete="off" >
    				<template slot="append">度</template>
    			</el-input>
    		</el-form-item>
  			<el-form-item label="高程" prop="elevation"><el-input type="number" placeholder="高程"  v-model="ruleForm.elevation"  auto-complete="off"></el-input></el-form-item>
  			<el-form-item label="行政区编码" prop="administrativeCoding" required><el-input type="text" readonly placeholder="行政区编码" v-model="ruleForm.administrativeCoding"  auto-complete="off"></el-input></el-form-item>
  			<el-form-item label="河道编码" prop="riverwayCoding" required><el-input type="text" readonly placeholder="河道编码" v-model="ruleForm.riverwayCoding"  auto-complete="off"></el-input></el-form-item>
  			<el-form-item label="水质等级 " prop="waterGrade">
  			<template slot-scope="scope">
  			  <div class="block">
  				<span class="demonstration" style="font-size: 14px;color: #48576a;" ></span>
    				<el-slider v-model="ruleForm.waterGrade"  :step="20" :max="100" :format-tooltip="formatTooltip" show-stops style="width:180px"></el-slider>
  				</div>
  			</template>
  			</el-form-item>
  			<!-- <el-form-item label="监测站地址" required id="distpicker">
  					<div class="form-inline" >
  			 			<div data-toggle="distpicker" >
  			 				<el-col :span="8">
  			 					<el-form-item prop="province">
  			 						<div class="form-group" style="display:table;" ><select class="form-control" v-model="ruleForm.province" id="province"></select></div>
  			 					</el-form-item>
  			 				</el-col>
  			 				<el-col :span="8">
  			 					<el-form-item prop="city">
  			 						<div class="form-group" style="display:table;"><select class="form-control" v-model="ruleForm.city" id="city"></select></div>
  			 					</el-form-item>
  			 				</el-col>
  			 				<el-col :span="8">
  			 					<el-form-item>
  			 						<div class="form-group" style="display:table;"><select class="form-control" v-model="ruleForm.district"  id="district"></select></div>
  			 					</el-form-item>
  			 				</el-col>
  						</div>
  					</div> 
  			</el-form-item> -->
  			<el-form-item label="详细地址" prop="detailAddress" id="address">
  				<el-input placeholder="请输入详细地址" type="textarea" v-model="ruleForm.detailAddress"></el-input>
  			</el-form-item>
  			<el-form-item label="监测站图片" prop="waterImage" id="imagesWater">
  				<el-input type="text" id="fileText" v-model="ruleForm.waterImage" disabled   placeholder="只能上传jpg/png文件，且不超过2MB"   auto-complete="off">
  					<template slot="append">
  						<el-upload class="upload-demo" :data="map" :on-success="handleSuccess" :on-change="handleChange" :action="imageUrl" ref="upload" :auto-upload="false"   list-type="picture">
							<el-button size="small" id="see" :disabled="disaled" type="primary">点击上传</el-button>
						</el-upload>
  					</template>
  				</el-input>
  			</el-form-item>
  			<el-form-item>
  				<el-button type="primary" @click="submitForm('ruleForm')">提交</el-button>
  				<el-button @click="resetForm('ruleForm')">重置</el-button>
  			</el-form-item>
  		</el-form>
	</div>
</body>
<script type="text/javascript" src="${ctxstc}/js/custom/sitemanage/water_survey_site/addForm.js"></script>
</html>









