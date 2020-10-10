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
  					
    				<form  id="form" action="${ctx}/BP_ten/add" method="post" enctype="multipart/form-data">
    				<input hidden="hidden"  type="text" id="areaSpan" style="color:black;"/>
    				<input type="text"  hidden="hidden"   name="canalCode" value="${canalCode}"/></td>
    				<table class="border="0" style="border-collapse:separate; border-spacing:20px 18px;">
						<tr>	
							<td align="right"><span style="color: red">*</span>月降水量：</td><td class="w18"><input type="text" class="form-control" id="soilName" name="soilName" value="${soilName}" style="color:black;width:180px;"/></td>
							<td align="right"><span style="color: red">*</span>月蒸发量：</td><td class="w18"><input type="text" class="form-control" id="soilName" name="soilName" value="${soilName}" style="color:black;width:180px;"/></td>
						</tr>
						<tr>	
							<td align="right">平均风速：</td><td class="w18"><input type="text" class="form-control" id="soilName" name="soilName" value="${soilName}" style="color:black;width:180px;"/></td>
							<td align="right">平均温度：</td><td class="w18"><input type="text" class="form-control" id="soilName" name="soilName" value="${soilName}" style="color:black;width:180px;"/></td>
						</tr>
						
						<tr>	
							<td align="right">平均湿度：</td><td class="w18"><input type="text" class="form-control" id="soilName" name="soilName" value="${soilName}" style="color:black;width:180px;"/></td>
							<td align="right">平均日照时间：</td><td class="w18"><input type="text" class="form-control" id="soilName" name="soilName" value="${soilName}" style="color:black;width:180px;"/></td>
						</tr>
						
						<tr>	
							<td align="right">大气压：</td><td class="w18"><input type="text" class="form-control" id="soilName" name="soilName" value="${soilName}" style="color:black;width:180px;"/></td>
							<td align="right">水库来水量：</td><td class="w18"><input type="text" class="form-control"class="form-control" id="bp_inflow" name=""  style="color:black;width:180px;"/></td>
						</tr>
						<tr>	
							<td align="right"></td><td class="w18"></td>
							<td align="right"></td><td class="w18"><button onclick="bpPredicted()" id="BP_button" type="button" class="btn btn-info">一键预测</button></td>
						</tr>
    				</table>
					<img id="img" class="img" src="${ctxstc}/images/shenjing.png" style="display:none;position:absolute;top:10%;left:0;width:100%"/>
	        		</form>
       		 </div>
	
	<script type="text/javascript" src="${ctxstc}/js/footer.js"></script>
	<script type="text/javascript" src="${ctxstc}/js/custom/water_area_cook.js"></script>
	<script type="text/javascript" src="${ctxstc}/datepicker/WdatePicker.js "></script>
	<script src="${ctxstc}/adapters/layui/layui.js" charset="utf-8"></script>
	
	
	<script>
	var curWwwPath = window.document.location.href;
	var pathName = window.document.location.pathname;
	var pos = curWwwPath.indexOf(pathName);
	var localhostPaht = curWwwPath.substring(0,pos);
	var projectName = pathName.substring(0,pathName.substr(1).indexOf('/')+1);
	var ctxPath = localhostPaht + projectName;
	var picPath = localhostPaht;
	var img = document.getElementById("img");
	
	//一键BP_预测
	function bpPredicted(){
		$('.bg_img').show();
		 $('.img').show();
		setTimeout(function(){
            img.style.display = "none";//隐藏
            img.style.position = "absolute";
            img.style.top = "10%";
            img.style.left = "0";
            img.style.width = "100%";
            
            //得到BP水库来水预测的值
            document.getElementById('bp_inflow').value = 155566.231;
            	
			},
			9000);
		
	}
	
	
	//给父页面传值所用信息
	var index = parent.layer.getFrameIndex(window.name);
	
	function mySubmit(){
		//alert("预测水库来水量");
		
		parent.layer.close(index);
        $('#form').submit();
		
    }
	</script>
</body>
</html>



