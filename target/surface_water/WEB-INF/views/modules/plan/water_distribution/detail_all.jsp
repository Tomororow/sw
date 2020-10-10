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
    				
    				<!-- <table border="0" cellspacing="50px" style="line-height: 35px; border-collapse:separate; border-spacing:0px 10px;"> -->
						
						<table class="table table-bordered table-header">
									<thead>
											<tr>
												<td colspan="22">大堵麻河灌区二0一七年轮廓配水计划表</td>
											</tr>
											<tr>
												<td class="w4" rowspan="3">灌溉类别</td>
												<td class="w4" colspan="2">轮期</td>
												<td class="w4" colspan="2">日期</td>
												<td class="w4" colspan="3">预计可供水量(万m3)</td>
												<td class="w4" rowspan="3">判定面积</td>
												<td class="w4" rowspan="3">配水比例(%)</td>
												<td class="w4" rowspan="3">实配面积(亩次)</td>
												<td class="w4" rowspan="3">灌水定额(m3/亩)</td>
												<td class="w4" rowspan="3">农田净用水量(万m3)</td>
												<td class="w4" rowspan="3">灌溉利用率(%)</td>
												<td class="w4" rowspan="3">农田毛用水量(万m3)</td>
												<td class="w4" colspan="6">实配水量(万m3)</td>
												<td class="w4" rowspan="3">轮次末水库蓄水(万m3)</td>
											</tr>	
											<tr>			
												<td class="w4" rowspan="2">轮次</td>
												<td class="w4" rowspan="2">天数</td>
												<td class="w4" rowspan="2">开始日期</td>
												<td class="w4" rowspan="2">结束日期</td>
												<td class="w4" rowspan="2">合计</td>
												<td class="w4" colspan="2">其中</td>
												<td class="w4" rowspan="2">水库需供水量(万m3)</td>
												<td class="w4" rowspan="2">合计用水水量(万m3)</td>
												<td class="w4" colspan="4">其中</td>
											</tr>	
											<tr>		
														
												<td class="w4">河源产水(万m3)</td>
												<td class="w4">水库库容(万m3)</td>
												<td class="w4">农田用水(万m3)</td>
												<td class="w4">生活用水(万m3)</td>
												<td class="w4">工程用水(万m3)</td>
												<td class="w4">林草用水(万m3)</td>
											</tr>
											
									</thead>
									<tbody id="table_list">
										 
									</tbody>
									
									<tfoot>
										<tr>
											<td colspan="22">
												<div class="pull-right">
													<div id="Paginator">
														<ul id="pageLimit"></ul>
													</div>
												</div>
											</td>
										</tr>
									</tfoot>
								</table>
    				
	        		</form>
       		 </div>
	
	<script type="text/javascript" src="${ctxstc}/js/footer.js"></script>
	<script type="text/javascript" src="${ctxstc}/js/custom/water_area_cook.js"></script>
	<script type="text/javascript" src="${ctxstc}/datepicker/WdatePicker.js "></script>
	<script src="${ctxstc}/adapters/layui/layui.js" charset="utf-8"></script>
	
	
	<script>
	
	window.onload = function(){
		var canalCode = "${canalCode}";
		var startYear = "${startYear}";
		start(canalCode,startYear);
	}
	function start(canalCode,startYear){
		$("#table_list").empty();
		$.ajax({
			url:"${ctx}/plan/detail_page",
			data: {canalCode:canalCode,startYear:startYear},
			type: "post",
			async: false,//非异步
			success: function(msg){
				//alert(JSON.stringify(msg));
				var table = msg;
					//动态建立渠道列表
						for(var i=0;i<msg.length;i++){
							var currentTag = document.getElementById("table_list");
								var newTrTag = document.createElement("tr");
									//var newTdTag1 = document.createElement("td");
									//	var newInputTag = document.createElement("input");
									//	newInputTag.setAttribute("type", "checkbox");
										
									//	newTdTag1.appendChild(newInputTag);
									var newTdTag2 = document.createElement("td");
										newTdTag2.innerHTML=msg[i].wateringName;
									var newTdTag3 = document.createElement("td");
										newTdTag3.innerHTML=msg[i].turn;
									
									var newTdTag4 = document.createElement("td");
										newTdTag4.innerHTML=msg[i].totalDays;
										
									var newTdTag5 = document.createElement("td");
										newTdTag5.innerHTML=msg[i].startMonth+"/"+msg[i].startDay;
									var newTdTag6 = document.createElement("td");
										newTdTag6.innerHTML=msg[i].endMonth+"/"+msg[i].endDay;
									//合计
									var newTdTag7 = document.createElement("td");
										newTdTag7.innerHTML="";
										
									var newTdTag8 = document.createElement("td");
										newTdTag8.innerHTML=msg[i].riverComeWater;		
									
									var newTdTag9 = document.createElement("td");
										newTdTag9.innerHTML=msg[i].lastTurnCapacity;
										
									var newTdTag10 = document.createElement("td");
										newTdTag10.innerHTML=msg[i].canalDecisionArea;	
									var newTdTag11 = document.createElement("td");
										newTdTag11.innerHTML=msg[i].matching;	
										
									var newTdTag12 = document.createElement("td");
										newTdTag12.innerHTML=msg[i].realityArea;	
									var newTdTag13 = document.createElement("td");
										newTdTag13.innerHTML=msg[i].waterDistributionQuota;	
										
									var newTdTag14 = document.createElement("td");
										newTdTag14.innerHTML=msg[i].soilWaterNetAmount;	
									var newTdTag15 = document.createElement("td");
										newTdTag15.innerHTML=msg[i].soilWaterNetAmountRatio;
									
										
										
									var newTdTag16 = document.createElement("td");
										newTdTag16.innerHTML=msg[i].soilWaterAllAmount;	
										
										
										
									var newTdTag17 = document.createElement("td");
										newTdTag17.innerHTML=msg[i].needReservoirWaterAmount;
										
									var newTdTag23 = document.createElement("td");
										newTdTag23.innerHTML="";
									var newTdTag24 = document.createElement("td");
										newTdTag24.innerHTML=msg[i].soilWaterAllAmount;
										
									var newTdTag18 = document.createElement("td");
										newTdTag18.innerHTML=msg[i].lifeWaterAmount;	
										
									var newTdTag19 = document.createElement("td");
										newTdTag19.innerHTML=msg[i].machineWaterAmount;	
									var newTdTag20 = document.createElement("td");
										newTdTag20.innerHTML=msg[i].forestWaterAmount;	
									var newTdTag21 = document.createElement("td");
										newTdTag21.innerHTML=msg[i].otherWaterAmount;	
									var newTdTag22 = document.createElement("td");
										newTdTag22.innerHTML=msg[i].ownTurnCapacity;	
									
										//newTrTag.appendChild(newTdTag1);
										newTrTag.appendChild(newTdTag2);
										newTrTag.appendChild(newTdTag3);
										newTrTag.appendChild(newTdTag4);
										newTrTag.appendChild(newTdTag5);
										newTrTag.appendChild(newTdTag6);
										newTrTag.appendChild(newTdTag7);
										newTrTag.appendChild(newTdTag8);
										newTrTag.appendChild(newTdTag9);
										newTrTag.appendChild(newTdTag10);
										newTrTag.appendChild(newTdTag11);
										newTrTag.appendChild(newTdTag12);
										newTrTag.appendChild(newTdTag13);
										newTrTag.appendChild(newTdTag14);
										newTrTag.appendChild(newTdTag15);
										newTrTag.appendChild(newTdTag16);
										newTrTag.appendChild(newTdTag17);
										newTrTag.appendChild(newTdTag23);
										newTrTag.appendChild(newTdTag24);
										newTrTag.appendChild(newTdTag18);
										newTrTag.appendChild(newTdTag19);
										newTrTag.appendChild(newTdTag20);
										//newTrTag.appendChild(newTdTag21);
										newTrTag.appendChild(newTdTag22);
										
									currentTag.appendChild(newTrTag);
				}
				
			}
		});
		
		 $.post("${ctx}/plan/detail_page_nav").success(function (response) {
			// alert("11");
			 var pageNum = response.pageNum;
			 //alert("33");
				var pages = response.pages;
				//alert("44");
				var size = response.size;
				//alert("55");
			    /* bootstrap分页样式设置 */
			    var options = {
			    	size:"small",
			    	alignment:"right",
			    	/* 当前页数 */
			        currentPage: pageNum,
			        /* 总页数  总条数除以每页条数  能整除总页数为商  不能整除商+1页  作为分页总页数  */
			        totalPages: pages,
			        /* 每页条数 */
			        numberOfPages:size,
			        /* bootstrap版本指定 */
			        bootstrapMajorVersion:3,
			        /* 样式设置 分页导航条 */
			        itemTexts: function (type, page, current) {
			            switch (type) {
			                case "first":
			                    return "首页";
			                case "prev":
			                    return "上一页";
			                case "next":
			                    return "下一页";
			                case "last":
			                    return "末页";
			                case "page":
			                    return page;
			            }
			        },
			        onPageClicked: function(event, originalEvent, type, page){
			        	//alert("22");
			        	//alert(JSON.stringify(page));
			        	//var id = getCookie ("canalId");
			        	start(canalCode,startYear);
			        	
			        }
			    };
			    $('#pageLimit').bootstrapPaginator(options);
			}).error(function (response) {
			    alert("列表请求出错");
			});
	}
	
	
	
	
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



