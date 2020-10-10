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
	<script type="text/javascript" src="${ctxstc}/js/vue.js"></script>
	<script src="${ctxstc}/adapters/elementui/1.4.3/index.js"></script>
	<link rel="stylesheet" href="${ctxstc}/adapters/elementui/1.4.3/theme-default/index.css">
	<script src="${ctxstc}/js/custom/province_city/distpicker.data.js"></script>
	<script src="${ctxstc}/js/custom/province_city/distpicker.js"></script>
	<script src="${ctxstc}/js/custom/province_city/main.js"></script>
</head>
<body>
	<div id="waterFlow">
		<template>
            <div>
                <el-table :data="calList" border  style="width:100%">
                    <el-table-column prop="upperLimit" label="上限" align="center">
                        <template  slot-scope="scope">
                            <el-input v-model="calList[scope.$index].upperLimit" placeholder="上限" ></el-input>
                        </template>
                    </el-table-column>
                    <el-table-column prop="downerLimit" label="下限" align="center">
                        <template  slot-scope="scope">
                            <el-input v-model="calList[scope.$index].downerLimit" placeholder="下限" ></el-input>
                        </template>
                    </el-table-column>
                    <el-table-column prop="flow" label="流量" align="center">
                        <template  slot-scope="scope">
                            <el-input v-model="calList[scope.$index].flow" placeholder="流量" ></el-input>
                        </template>
                    </el-table-column>
                  </el-table>
             </div>
        </template>
	</div>
</body>
</html>
<script type="text/javascript">
var url ;
for(var i=0;i<4;i++){
	  url=window.location.href.indexOf("/",url+1);
}
var localPath = window.location.href.substring(0,url);
	var waterFlow = new Vue({
		el:'#waterFlow',
		data:{
			calList:[{
				upperLimit:'',
				downerLimit:'',
				flow:'',
			}],
		},
		methods:{
			submitForm:function(){
				var _this = this;
				_this.openFullScreen();
				debugger
				$.post(localPath+"/site_water_manage/edit_page_update",{"calList":JSON.stringify(_this.calList)},function(data){
					debugger
					 if(data.state==1){
						layer.open({
						  title:"成功",
						  content: '水位流量关系表修改成功',
						  shade: 0,//遮罩层
						  yes: function(index, layero){
							  parent.layer.close(index);
							  window.parent.location.reload(); 
							}
						
						}); 
						
					}else{
						layer.open({
						  title:"失败",
						  content: '水位流量关系表修改失败',
						  shade: 0,//遮罩层
						  yes: function(index, layero){
							  parent.layer.close(index);
							  }
						});
					} 
				});
			},
			  openFullScreen:function() {
		        const loading = this.$loading({
		          lock: true,
		          text: 'Loading',
		          spinner: 'el-icon-loading',
		          background: 'rgba(0, 0, 0, 0.7)'
		        });
		      }
		},
		created:function(){
			var _this = this;
			debugger
			$.post(localPath+"/site_water_manage/edit_page_data",{"id":"${waterId}","type":0},function(data){
				_this.calList = data.data;
				if(_this.calList==null){
					layer.open({
						  title:"失败",
						  content: '未查询到该站的水位流量关系表',
						  shade: 0,//遮罩层
						  yes: function(index, layero){
							  parent.layer.close(inex);
							  }
						}); 
				}
			});
		}
	});
</script>
