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
	<link rel="stylesheet" href="${ctxstc}/adapters/layui/css/layui.css" type="text/css">
	
	<script type="text/javascript" src="${ctxstc}/adapters/ztree/js/jquery.ztree.core.js"></script>
	
    <link rel="stylesheet" href="${ctxstc}/adapters/ztree/css/metroStyle/metroStyle.css" type="text/css">
    <script type="text/javascript" src="${ctxstc}/adapters/ztree/js/jquery.ztree.excheck.js"></script>
    <script type="text/javascript" src="${ctxstc}/adapters/ztree/js/jquery.ztree.exedit.js"></script>
	<script type="text/javascript" src="${ctxstc}/datepicker/WdatePicker.js "></script>
	 <script src="${ctxstc}/adapters/layui/layer/layer.js"></script>
	 <script type="text/javascript" src="${ctxstc}/js/custom/water_area_cook.js"></script>
	 
	  <script type="text/javascript" src="${ctxstc}/js/echarts.min.js"></script>

	<style>
		.topbar-nav-item a{color: red;}
		.topbar-nav-item a:hover{color: blue;}
		
		
	  </style>
</head>
<body >
		<div style="padding: 30px; line-height: 22px; background-color: #393D49; color: #fff; font-weight: 300;">
    				<form  id="form" action="${ctx}/waterAuota/add" method="post" enctype="multipart/form-data">
    				
    				<table class="border="0" style="border-collapse:separate; border-spacing:20px 18px;">
    					<tr>
							<td align="right"><span style="color: red">*</span>行政区编码：</td>
							<td><input type="text" name="areaCode" readonly="readonly" value="${areaCode}" class="form-control" style="color:black; width:180px;"/></td>
							<td align="right"><span style="color: red">*</span>行政区名称：</td>
							<td><input type="text"  readonly="readonly" value="${areaName}" class="form-control" style="color:black; width:180px;"/></td>
							
						</tr>
						<tr>
							<td align="right"><span style="color: red">*</span>土质类型</td>
							<td class="w18">
								<select  name="soilTypeCode" id="soilTypeCode" class="form-control" style="color:black;width:180px;height:35px;" onchange="waterAreaChange(this[selectedIndex].value);" >
									<option value="">请选择</option>
									<c:forEach items="${soilTypeInfoList}" var="soilTypeInfo">
									  <option value="${soilTypeInfo.soilCode}">${soilTypeInfo.soilName}</option>
									</c:forEach>
								</select>
							</td>
							
							<td align="right"><span style="color: red">*</span>农作物名称</td>
							<td class="w18">
							<select  name="cropsTypeCode" id="cropsTypeCode" class="form-control" style="color:black;width:180px;height:35px;" onchange="waterAreaChanged(this[selectedIndex].value);">
									<option value="">请选择</option>
									<c:forEach items="${cropsTypeInfoList}" var="cropsTypeInfo">
									  <option value="${cropsTypeInfo.id}">${cropsTypeInfo.cropsName}</option>
									</c:forEach>
							</select>
							</td>
						</tr>
						<tr>
					
						</tr>
						<tr>
						<td align="right" ><span style="color: red">&nbsp;&nbsp;*&nbsp;</span>生育周期：</td>
						 <td id="regions" colspan="3" align="left" valign="middle"   style="border:1px solid white;width:90%;border-radius:10px"></td>
						</tr>
						
						<tr>	
						 	 <td align="right"><span style="color: red">*</span>年份</td><td class="w18"><input class="form-control" readonly="readonly" type="text" id="year"  name="year" style="color:black;width:180px;"/></td>
							<td align="right"><span style="color: red">*</span>灌水定额</td><td class="w18"><input class="form-control"  readonly="readonly" type="text" name="waterQuota" id="waterQuota" value="" style="color:black;width:180px;"/></td>
						</tr>
						<tr>
							<td colspan="5" align="center" ><div id="main" style="width: 600px;height:400px;background-color:#cccccc "></div></td>
						</tr>
						<tr>
							<td align="right">备注</td>
							<td class="w18"  colspan="3">
								<textarea  name="remark" class="form-control" cols="60" rows="1" style="color:black;"></textarea> 
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
	window.onload = function(){
		  var myDate = new Date();
		 var year= myDate.getFullYear()
		$("#year").val(year);
	}
	
	//给父页面传值所用信息
	var index = parent.layer.getFrameIndex(window.name);
	
	function mySubmit(){
		if($("#soilTypeCode option:selected").val()==null||$("#soilTypeCode option:selected").val()==""){
			layer.alert('请选择土质类型！', {icon: 0});
		}else if($("#cropsTypeCode option:selected").val()==null||$("#cropsTypeCode option:selected").val()==""){
			layer.alert('请选择农作物！', {icon: 0});
		}else if(($("input[type='checkbox']").is(':checked'))==false){
			layer.alert('农作物生长周期不能全部为空！', {icon: 0});
			return false;
		}else{
			parent.layer.close(index);
			//parent.layer.msg('您将标记 成功传送给了父窗口');
	        $('#form').submit();
		}
		
    }
	
	 // 基于准备好的dom，初始化echarts实例
    var myChart = echarts.init(document.getElementById('main'));
    var cycleName=[];
    var consumedWater=[];
	function waterAreaChanged(cropsTypeId){
		//alert(cropsTypeId);
		$("#regions").empty();
		$.ajax({
			url:"${ctx}/waterAuota/growthCycleList",
			data: {cropsTypeId:cropsTypeId},
			type: "post",
			async: false,//非异步
			success: function(msg){
				//alert(JSON.stringify(msg));
				for(var i=0; i<msg.length; i++){
					$("#regions").append(
				               "<nobr><label style='margin-left:500'>"
				                   +"<input style=' align=left; ' name='items' type='checkbox' value="+msg[i].id+">"+ 
				                     msg[i].cycleName+"&nbsp"+
				                   "</label></nobr>");
					cycleName.push(msg[i].cycleName);
					consumedWater.push(msg[i].consumedWater);
				}
				
				//alert(cycleName);
				// 指定图表的配置项和数据
			    var option = {
			        title: {
			            text: '作物各生育期内需水统计',
			        },
			        tooltip: {},
			        legend: {
			            data:['生育期内需水量']
			        },
			        xAxis: {
			            data: cycleName
			        },
			        yAxis: {},
			        series: [{
			            name: '生育期内需水量',
			            type: 'bar',
			            data: consumedWater,
			            itemStyle:{  
			                normal:{  
			                  color:'blue', 
			                  label: {
			                         show: true,//是否展示  
			                     }  
			                  } 
			            }
			        }]
			    };
			    // 使用刚指定的配置项和数据显示图表。
			    myChart.setOption(option);
				
			}
		});
		
		_get();
	}
	
	$("#regions").change(function() { 
		_get();
		});
	
	
	
	function _get() {
		var s=[];
		var regis = [];
		var consumedWaterTotale=null;
		 $("input[name='items']").attr("checked", true);
		  $('input[name=items]:checked').each(function () {
			  regis.push($(this).val());
		  });
		  
		//if($("input[type='checkbox']").is(':checked')){
			$.ajax({
				url:"${ctx}/waterAuota/growthCycleConsumedWater",
				data: {regis:regis},
				type: "post",
				async: false,//非异步
				success: function(msg){
					//alert(JSON.stringify(msg));
					for(var i=0;i<msg.length;i++){
						s.push(msg[i].consumedWater);
					}
					
				}
			});
			
		//}
		for(var j=0;j<s.length;j++){
			consumedWaterTotale+=s[j];
		}
		 $("#waterQuota").val("");
		$("#waterQuota").val(consumedWaterTotale); 
	}
	
	
	

    // 指定图表的配置项和数据
    var option = {
        title: {
            text: '农作物各生育期内需水统计',
            
        },
        tooltip: {},
        legend: {
            data:['生育期内需水量']
        },
        xAxis: {
            data: ["播种期","发芽期","拔节期","抽雄期","开花期","吐丝期","成熟期"]
        },
        yAxis: {},
        series: [{
            name: '生育期内需水量',
            type: 'bar',
            data: [5, 20, 55, 50, 45, 30,25],
            /* itemStyle:{  
                normal:{  
                	 label: {  
                         show: true,//是否展示  
                     }  
                } 
            }  */
        }]
    };

    // 使用刚指定的配置项和数据显示图表。
    myChart.setOption(option);
	

	</script>
</body>
</html>



