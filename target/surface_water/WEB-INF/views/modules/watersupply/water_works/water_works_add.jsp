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

	<link rel="stylesheet" href="${ctxstc}/adapters/ztree/css/zTreeStyle/zTreeStyle.css" type="text/css">
	
	<script type="text/javascript" src="${ctxstc}/adapters/ztree/js/jquery.ztree.core.js"></script>
	
    <link rel="stylesheet" href="${ctxstc}/adapters/ztree/css/metroStyle/metroStyle.css" type="text/css">
    <script type="text/javascript" src="${ctxstc}/adapters/ztree/js/jquery.ztree.excheck.js"></script>
    <script type="text/javascript" src="${ctxstc}/adapters/ztree/js/jquery.ztree.exedit.js"></script>
	
	<script src="${ctxstc}/adapters/layui/layer/layer.js"></script>
	<link rel="stylesheet" href="https://unpkg.com/element-ui@1.4/lib/theme-default/index.css">
	<script type="text/javascript" src="${ctxstc}/js/vue.js"></script>
	<script src="https://unpkg.com/element-ui@1.4/lib/index.js"></script>

</head>
<body>
	<div id="waterworks"  style="padding: 30px; line-height: 22px; background-color: #393D49; color: #fff; font-weight: 300;">
		<form  id="feorm" action="${ctx}/water_supply/insertData"  method="post" enctype="multipart/form-data">
    				<table border="0" style="border-collapse:separate; border-spacing:20px 18px;">
						<tr>	
							<td align="right"><span style="color:red">*</span>水厂名称:</td><td class="w18"><input type="text" class="form-control" id="waterFactoryName" name="waterFactoryName" value="" style="color:black;width:180px;"/></td>
							<td align="right"><span style="color:red">*</span>水厂编码:</td><td class="w18"><input type="text" class="form-control" id="waterworksCoding" name="waterworksCoding" value="" style="color:black;width:180px;"/></td>
						</tr>
						<tr>	
							<td align="right"><span style="color: red">*</span>建设时间:</td><td class="w18"><input class="form-control" type="text" class="form-control" name="buildTime" id="buildTime"  style="color:black;width:180px;" onfocus="WdatePicker({'skin':'whyGreen','dateFmt':'yyyy-MM-dd'});" /></td>
							<td align="right"><span style="color: red">*</span>SIM卡号:</td><td class="w18"><input class="form-control" type="text" class="form-control" name="simClip" id="simClip" style="color:black;width:180px;"/></td>
						 </tr>
						 <tr>	
							<td class="w7" colspan="1"><span style="color: red">*</span>SIM卡号运营商:</td><td class="w18"><input type="text" name="simClipOperator" class="form-control" id="simClipOperator"  style="color:black;width:180px;"/></td>
							<td align="right"><span style="color: red">*</span>经度:</td><td class="w18"><input type="text" class="form-control" id="longitude" name="longitude"  style="color:black;width:180px;"/></td>
						</tr>
						<tr>	
							
							<td align="right"><span style="color: red">*</span>纬度:</td><td class="w18"><input type="text" class="form-control" id="latitude" name="latitude"  style="color:black;width:180px;" /></td>
							<td align="right"><span style="color: red">*</span>高程:</td><td class="w18"><input type="text" class="form-control" id="elevation" name="elevation"  style="color:black;width:180px;" /></td>
						</tr>
						<tr>
							<td align="right"><span style="color: red">*</span>水来源:</td><td class="w18"> <el-select v-model="value5" multiple placeholder="请选择" style="width:180px;"><el-option v-for="item in options" :key="item.value" :label="item.label" :value="item.value"></el-option></el-select></td>
							<td align="right"><span style="color: red">*</span>水厂图片:</td>
								<td class="w18"><input type="file" id="file1" class="form-control" name="file" style="color:black;width:180px;"></td>
						</tr>
						<tr>
							<td align="right"><span style="color: red">*</span>水厂地址:</td>
							<td class="w18"  colspan="3">
								<textarea  name="waterAddress" id="waterAddress" class="form-control" rows="1" cols="60" rows="3" style="color:black;"></textarea> 
							</td>
						</tr>
						<tr>
							<td align="right">备注:</td>
							<td class="w18"  colspan="3">
								 <textarea  name="comm1" id="ssiRemark" class="form-control" rows="1" cols="60" rows="3" style="color:black;"></textarea>
							</td>
						</tr> 
    				</table>
    				 	<input hidden="hidden"  type="text" name="syswaterareaCode" value="${treeId}"  style="color:black;">
    				 	<input hidden="hidden"  id="value5"  type="text" name="value5"   style="color:black;">
	        		</form>
	</div>
	<script type="text/javascript" src="${ctxstc}/js/footer.js"></script>
	<script type="text/javascript" src="${ctxstc}/js/custom/water_area_cook.js"></script>
	<script type="text/javascript" src="${ctxstc}/datepicker/WdatePicker.js "></script>
	<script src="${ctxstc}/adapters/layui/layui.js" charset="utf-8"></script>
	
	<script type="text/javascript" src="${ctxstc}/js/custom/watersupply/syn_fpud/syn_fpud.js"></script>
	<script type="text/javascript" src="${ctxstc}/js/custom/watersupply/water_works/water_works.js"></script>
		<script type="text/javascript">
		var waterworks = new Vue({
			el:'#waterworks',
			data:{
				  options: [{
			          value: '机井',
			          label: '机井'
			        }, {
			          value: '水岸',
			          label: '水岸'
			        }, {
			          value: '自然河道',
			          label: '自然河道'
			        }],
			        value5:'',
			},
			methods:{
				
			},
			created:function(){
				
			},
		});
		var index = parent.layer.getFrameIndex(window.name);
		function waterSubmit(){
			debugger
			if($("#waterFactoryName").val()==null || $("#waterFactoryName").val()==""){
				layer.alert('水厂名称不能为空！', {icon: 0});
			}else if($("#waterworksCoding").val()==null || $("#waterworksCoding").val()==""){
				layer.alert('水厂编码不能为空！', {icon: 0});
			}else if($("#buildTime").val()==null || $("#buildTime").val()==""){
				layer.alert('请选择站点建设时间！', {icon: 0});
			}else if($("#simClip").val()==null || $("#simClip").val()=="") {
				layer.alert('请输入SIM卡号！', {icon: 0});
			}else if($("#simClipOperator").val()==null || $("#simClipOperator").val()=="") {
				layer.alert('请输入运营商名称！', {icon: 0});
			}else if($("#longitude").val()==null && $("#longitude").val()==""&&$("#longitude").val().length>7) {
				layer.alert('经度不能为空或格式输入错误'+"\n"+'正确格式为（0000000.000）！', {icon: 0});
			}else if($("#latitude").val()==null && $("#latitude").val()==""&&$("#latitude").val().length>7) {
				layer.alert('纬度不能为空或格式输入错误'+"\n"+'正确格式为（0000000.000）！', {icon: 0});
			}else if($("#elevation").val()==null&&$("#elevation").val()==""&&$("#elevation").val().length>7) {
				layer.alert('高程不能为空或格式输入错误'+"\n"+'正确格式为（0000000.000）！', {icon: 0});
			}else if($("#file1").val()==null || $("#file1").val()=="") {
				layer.alert('请选择文件！', {icon: 0});
			}else if($("#waterAddress").val()==null || $("#waterAddress").val()=="") {
				layer.alert('请输入详细地址！', {icon: 0});
			}else{
				$("#value5").val(waterworks.value5);
				$("#feorm").submit();
				parent.layer.close(index);
			}
		}
	</script>
</body>
</html>



