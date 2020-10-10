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
	
	<script type="text/javascript" src="${ctxstc}/adapters/ztree/js/jquery.ztree.core.js"></script>
	
    <link rel="stylesheet" href="${ctxstc}/adapters/ztree/css/metroStyle/metroStyle.css" type="text/css">
    <%--<script type="text/javascript" src="${ctxstc}/adapters/ztree/js/jquery.ztree.excheck.js"></script>--%>
    <script type="text/javascript" src="${ctxstc}/adapters/ztree/js/jquery.ztree.exedit.js"></script>
	
	<script src="${ctxstc}/adapters/layui/layer/layer.js"></script>
	<script type="text/javascript" src="${ctxstc}/js/vue.js"></script>
	<link rel="stylesheet" href="${ctxstc}/js/element-ui/theme-chalk/index.css" type="text/css">
	<script type="text/javascript" src="${ctxstc}/js/element-ui/index.js"></script>
	<style>
	  
		.topbar-nav-item a{color: red;}
		.topbar-nav-item a:hover{color: blue;}
		
		
		::-webkit-scrollbar{
  		display:none;
		}
		#table_thead{color:#4b5261;font-weight:600;font-size: 15px }
		.table-header thead{color:#4b5261;font-weight:600;font-size: 14px }
	  </style>
</head>
<body>
	<form  action="${ctx}/cal_canal_info/list" method="post">

	<!-- 页面主体start -->
	<div class="down-main" id="plan">

		<!-- 页面主体右侧内容start -->
		<div class="right-product right-full" style="/*margin-left:55px*/;">
			<section id="layout" ng-app="doc.ui-layout">
			<div ui-layout class="layout-mock">
				<ui-layout options="{ flow : 'column' }">
				
				
				<sidebar class="east-back left-back" >
					<%-- <ul id="tree" class="nav nav-pills nav-stacked">
						<li><h4 style="margin-left: 10px;">河道</h4>
						</li>
						<div style="margin-left: 10px;">
							<c:forEach items="${calCanalInfoList}" var="calCanalInfo" >
								<h4 onclick="show('${calCanalInfo.id}','${calCanalInfo.canalCode}')">${calCanalInfo.canalName}</h4>
							</c:forEach>
						</div>
						<!-- <ul id="treeDemo" class="ztree">
						</ul> -->
					</ul> --%>
					<ul id="tree" class="nav nav-pills nav-stacked">
						<li><h4 style="margin-left: 10px;">渠道等级</h4></li>
						<ul id="treeDemo" class="ztree"></ul>
					</ul>
					
				</sidebar>
				<div class="center-back right-back">
			        <div class="container-fluid">
			          <div class="info-center">
			            <div class="page-header">
			              	<div class="pull-left">
			                	<h4>灌区信息化平台>智慧灌溉>水源来水预测>水库来水预测</h4>
			            	</div>
			            </div>
			            <div class="clearfix"></div>
			            

			              <div id="tab" class="main left" >
			                <div class="main-left width-100" style="margin-top:0px">
			                    
			                    <!-- tab头 -->
			                    <ul class="nav-tabs left">
			                        <li id="li0" class="active"><a title="TAB-0" href="javascript:void(0)" onclick="forecast()">来水分析</a></li>
			                        <li id="li1"><a title="TAB-1" href="javascript:void(0)" onclick="one()">一月</a></li>
			                        <li id="li2"><a title="TAB-2" href="javascript:void(0)" onclick="two()">二月</a></li>
			                        <li id="li3"><a title="TAB-3" href="javascript:void(0)" onclick="three()">三月</a></li>
			                        <li id="li4"><a title="TAB-4" href="javascript:void(0)" onclick="four()">四月</a></li>
			                        <li id="li5"><a title="TAB-5" href="javascript:void(0)" onclick="five()">五月</a></li>
			                        <li id="li6"><a title="TAB-6" href="javascript:void(0)" onclick="six()">六月</a></li>
			                        <li id="li7"><a title="TAB-7" href="javascript:void(0)" onclick="seven()">七月</a></li>
			                        <li id="li8"><a title="TAB-8" href="javascript:void(0)" onclick="eight()">八月</a></li>
			                        <li id="li9"><a title="TAB-9" href="javascript:void(0)" onclick="nine()">九月</a></li>
			                        <li id="li10"><a title="TAB-10" href="javascript:void(0)" onclick="ten()">十月</a></li>
			                        <li id="li11"><a title="TAB-11" href="javascript:void(0)" onclick="eleven()">十一月</a></li>
			                        <li id="li12"><a title="TAB-12" href="javascript:void(0)" onclick="twelve()">十二月</a></li>
			                    </ul>
			                    <!-- tab对应主体 TAB-1 -->
			                    <div id="TAB-0" class="width left min-tab2" style="width: ">
			                    	<div  class="table-margin">
			                    		<div id="button" class="search-box row" style="width: 100%;">
											<div class="col-md-12">
												<div class="<%--btn-group--%> pull-left" role="group" aria-label="...">
													<button id="add_forecast" style="/*display: none*/" type="button" class="btn btn-default" onclick="addForecast()">
														<span class="glyphicon glyphicon-plus">
														</span>新增来水预测
													</button>
													
<%--													<button id="delete_forecast" style="/*display: none*/" type="button" class="btn btn-default">
														<span class="glyphicon glyphicon-trash"></span>删除历年来水
													</button>--%>
													<span id="edit_forecast" />
													<span id="detail_forecast" />
													
												</div>
											</div>
										</div>
										<div class="clearfix"></div>
										<div class="table-margin">
											<table class="table table-bordered table-header" style="width:100%">
												<thead id="table_thead">
													
												</thead>
												<tbody id="table_list0" >
													
												</tbody>
												<tfoot>
													<tr>
														<td colspan="15">
															<div class="pull-right">
																<div id="Paginator">
																	<ul id="pageLimit0"></ul>
																</div>
															</div>
														</td>
													</tr>
												</tfoot>
											</table>
										</div>
											
									</div>
			                    </div>
			                    <div id="TAB-1" class="width left min-tab" style="width: ">
			                    	<div class="search-box row" style="width: 100%;">
											<div class="col-md-12">
												<div class="btn-group pull-left" role="group" aria-label="...">
													<button id="add_forecast1" style="display: none" type="button" class="btn btn-default" onclick="addFlow(1)">
														<span class="glyphicon glyphicon-plus">
														</span>新增
													</button>
													
													<button id="delete_forecast1" style="display: none" type="button" class="btn btn-default">
														<span class="glyphicon glyphicon-trash"></span>删除
													</button>
													<span id="edit_forecast1" />
													<span id="detail_forecast1" />
												</div>
											</div>
										</div>
										
										<div class="clearfix"></div>
										<div class="table-margin">
											<table class="table table-bordered table-header" style="width: 34%">
												<thead>
													<tr>
														<td class="w5" rowspan="3">序号</td>
														<td class="w5" rowspan="3">年份</td>
														<td class="w5" colspan="3">上旬</td>
														<td class="w5" rowspan="3">P=m/(n+1)</td>
													</tr>
													<tr>
														<td class="w5" rowspan="2">平均流量</td>
														<td class="w5" colspan="2">按递减排列</td>
													</tr>
													<tr>
														<td class="w5">平均流量</td>
														<td class="w5">对应年份</td>
													</tr>
												</thead>
												<tbody id="table_list1_1" >
													
												</tbody>
												<tfoot>
													<tr>
														<td colspan="15">
															<div class="pull-right">
																<div id="Paginator">
																	<ul id="pageLimit1_1"></ul>
																</div>
															</div>
														</td>
													</tr>
												</tfoot>
											</table>
											
											<table  class="table table-bordered table-header" style="position:absolute;top:128px;left:32.5%;width: 31%">
												<thead>
													<tr>
														<td class="w5" rowspan="3">序号</td>
														<td class="w5" rowspan="3">年份</td>
														<td class="w5" colspan="3">中旬</td>
														
														<td class="w5" rowspan="3">P=m/(n+1)</td>
													</tr>
													<tr>
														<td class="w5" rowspan="2">平均流量</td>
														<td class="w5" colspan="2">按递减排列</td>
														
													</tr>
													<tr>
														<td class="w5">平均流量</td>
														<td class="w5">对应年份</td>
														
													</tr>
												</thead>
												<tbody id="table_list1_2" >
													
												</tbody>
												<tfoot>
													<tr>
														<td colspan="15">
															<div class="pull-right">
																<div id="Paginator">
																	<ul id="pageLimit1_2"></ul>
																</div>
															</div>
														</td>
													</tr>
												</tfoot>
											</table>
											<table class="table table-bordered table-header" style="position:absolute;top:128px;left:63.7%;width: 31%">
												<thead>
													<tr>
														<td class="w5" rowspan="3">序号</td>
														<td class="w5" rowspan="3">年份</td>
														<td class="w5" colspan="3">下旬</td>
														
														<td class="w5" rowspan="3">P=m/(n+1)</td>
													</tr>
													<tr>
														<td class="w5" rowspan="2">平均流量</td>
														<td class="w5" colspan="2">按递减排列</td>
														
													</tr>
													<tr>
														<td class="w5">平均流量</td>
														<td class="w5">对应年份</td>
														
													</tr>
												</thead>
												<tbody id="table_list1_3" >
													
												</tbody>
												<tfoot>
													<tr>
														<td colspan="15">
															<div class="pull-right">
																<div id="Paginator">
																	<ul id="pageLimit1_3"></ul>
																</div>
															</div>
														</td>
													</tr>
												</tfoot>
											</table>
										</div>
			                    </div>
			                    <div id="TAB-2" class="width left min-tab" style="width: ">
			                    	<div class="search-box row" style="width: 100%;">
											<div class="col-md-12">
												<div class="btn-group pull-left" role="group" aria-label="...">
													<button id="add_forecast2" style="display: none" type="button" class="btn btn-default" onclick="addFlow(2)">
														<span class="glyphicon glyphicon-plus">
														</span>新增
													</button>
													
													<button id="delete_forecast2" style="display: none" type="button" class="btn btn-default">
														<span class="glyphicon glyphicon-trash"></span>删除
													</button>
													<span id="edit_forecast2" />
													<span id="detail_forecast2" />
												</div>
											</div>
										</div>
										
										<div class="clearfix"></div>
										<div class="table-margin">
											<table class="table table-bordered table-header" style="width: 34%">
												<thead>
													<tr>
														<td class="w5" rowspan="3">序号</td>
														<td class="w5" rowspan="3">年份</td>
														<td class="w5" colspan="3">上旬</td>
														<td class="w5" rowspan="3">P=m/(n+1)</td>
													</tr>
													<tr>
														<td class="w5" rowspan="2">平均流量</td>
														<td class="w5" colspan="2">按递减排列</td>
													</tr>
													<tr>
														<td class="w5">平均流量</td>
														<td class="w5">对应年份</td>
													</tr>
												</thead>
												<tbody id="table_list2_1" >
													
												</tbody>
												<tfoot>
													<tr>
														<td colspan="15">
															<div class="pull-right">
																<div id="Paginator">
																	<ul id="pageLimit2_1"></ul>
																</div>
															</div>
														</td>
													</tr>
												</tfoot>
											</table>
											
											<table  class="table table-bordered table-header" style="position:absolute;top:128px;left:32.5%;width: 31%">
												<thead>
													<tr>
														<td class="w5" rowspan="3">序号</td>
														<td class="w5" rowspan="3">年份</td>
														<td class="w5" colspan="3">中旬</td>
														
														<td class="w5" rowspan="3">P=m/(n+1)</td>
													</tr>
													<tr>
														<td class="w5" rowspan="2">平均流量</td>
														<td class="w5" colspan="2">按递减排列</td>
														
													</tr>
													<tr>
														<td class="w5">平均流量</td>
														<td class="w5">对应年份</td>
														
													</tr>
												</thead>
												<tbody id="table_list2_2" >
													
												</tbody>
												<tfoot>
													<tr>
														<td colspan="15">
															<div class="pull-right">
																<div id="Paginator">
																	<ul id="pageLimit2_2"></ul>
																</div>
															</div>
														</td>
													</tr>
												</tfoot>
											</table>
											<table class="table table-bordered table-header" style="position:absolute;top:128px;left:63.7%;width: 31%">
												<thead>
													<tr>
														<td class="w5" rowspan="3">序号</td>
														<td class="w5" rowspan="3">年份</td>
														<td class="w5" colspan="3">下旬</td>
														
														<td class="w5" rowspan="3">P=m/(n+1)</td>
													</tr>
													<tr>
														<td class="w5" rowspan="2">平均流量</td>
														<td class="w5" colspan="2">按递减排列</td>
														
													</tr>
													<tr>
														<td class="w5">平均流量</td>
														<td class="w5">对应年份</td>
														
													</tr>
												</thead>
												<tbody id="table_list2_3" >
													
												</tbody>
												<tfoot>
													<tr>
														<td colspan="15">
															<div class="pull-right">
																<div id="Paginator">
																	<ul id="pageLimit2_3"></ul>
																</div>
															</div>
														</td>
													</tr>
												</tfoot>
											</table>
										</div>
			                    </div>
			                    <div id="TAB-3" class="width left min-tab"  style="width: ">
			                    	<div class="search-box row" style="width: 100%;">
											<div class="col-md-12">
												<div class="btn-group pull-left" role="group" aria-label="...">
													<button id="add_forecast3" style="display: none" type="button" class="btn btn-default" onclick="addFlow(3)">
														<span class="glyphicon glyphicon-plus">
														</span>新增
													</button>
													
													<button id="delete_forecast3" style="display: none" type="button" class="btn btn-default">
														<span class="glyphicon glyphicon-trash"></span>删除
													</button>
													<span id="edit_forecast3" />
													<span id="detail_forecast3" />
												</div>
											</div>
										</div>
										
										<div class="clearfix"></div>
										<div class="table-margin">
											<table class="table table-bordered table-header" style="width: 34%">
												<thead>
													<tr>
														<td class="w5" rowspan="3">序号</td>
														<td class="w5" rowspan="3">年份</td>
														<td class="w5" colspan="3">上旬</td>
														<td class="w5" rowspan="3">P=m/(n+1)</td>
													</tr>
													<tr>
														<td class="w5" rowspan="2">平均流量</td>
														<td class="w5" colspan="2">按递减排列</td>
													</tr>
													<tr>
														<td class="w5">平均流量</td>
														<td class="w5">对应年份</td>
													</tr>
												</thead>
												<tbody id="table_list3_1" >
													
												</tbody>
												<tfoot>
													<tr>
														<td colspan="15">
															<div class="pull-right">
																<div id="Paginator">
																	<ul id="pageLimit3_1"></ul>
																</div>
															</div>
														</td>
													</tr>
												</tfoot>
											</table>
											
											<table  class="table table-bordered table-header" style="position:absolute;top:128px;left:32.5%;width: 31%">
												<thead>
													<tr>
														<td class="w5" rowspan="3">序号</td>
														<td class="w5" rowspan="3">年份</td>
														<td class="w5" colspan="3">中旬</td>
														
														<td class="w5" rowspan="3">P=m/(n+1)</td>
													</tr>
													<tr>
														<td class="w5" rowspan="2">平均流量</td>
														<td class="w5" colspan="2">按递减排列</td>
														
													</tr>
													<tr>
														<td class="w5">平均流量</td>
														<td class="w5">对应年份</td>
														
													</tr>
												</thead>
												<tbody id="table_list3_2" >
													
												</tbody>
												<tfoot>
													<tr>
														<td colspan="15">
															<div class="pull-right">
																<div id="Paginator">
																	<ul id="pageLimit3_2"></ul>
																</div>
															</div>
														</td>
													</tr>
												</tfoot>
											</table>
											<table class="table table-bordered table-header" style="position:absolute;top:128px;left:63.7%;width: 31%">
												<thead>
													<tr>
														<td class="w5" rowspan="3">序号</td>
														<td class="w5" rowspan="3">年份</td>
														<td class="w5" colspan="3">下旬</td>
														
														<td class="w5" rowspan="3">P=m/(n+1)</td>
													</tr>
													<tr>
														<td class="w5" rowspan="2">平均流量</td>
														<td class="w5" colspan="2">按递减排列</td>
														
													</tr>
													<tr>
														<td class="w5">平均流量</td>
														<td class="w5">对应年份</td>
														
													</tr>
												</thead>
												<tbody id="table_list3_3" >
													
												</tbody>
												<tfoot>
													<tr>
														<td colspan="15">
															<div class="pull-right">
																<div id="Paginator">
																	<ul id="pageLimit3_3"></ul>
																</div>
															</div>
														</td>
													</tr>
												</tfoot>
											</table>
										</div>
			                    </div>
			                    <div id="TAB-4" class="width left min-tab" style="width: ">
			                    	<div class="search-box row" style="width: 100%;">
											<div class="col-md-12">
												<div class="btn-group pull-left" role="group" aria-label="...">
													<button id="add_forecast4" style="display: none" type="button" class="btn btn-default" onclick="addFlow(4)">
														<span class="glyphicon glyphicon-plus">
														</span>新增
													</button>
													
													<button id="delete_forecast4" style="display: none" type="button" class="btn btn-default">
														<span class="glyphicon glyphicon-trash"></span>删除
													</button>
													<span id="edit_forecast4" />
													<span id="detail_forecast4" />
												</div>
											</div>
										</div>
										
										<div class="clearfix"></div>
										<div class="table-margin">
											<table class="table table-bordered table-header" style="width: 34%">
												<thead>
													<tr>
														<td class="w5" rowspan="3">序号</td>
														<td class="w5" rowspan="3">年份</td>
														<td class="w5" colspan="3">上旬</td>
														<td class="w5" rowspan="3">P=m/(n+1)</td>
													</tr>
													<tr>
														<td class="w5" rowspan="2">平均流量</td>
														<td class="w5" colspan="2">按递减排列</td>
													</tr>
													<tr>
														<td class="w5">平均流量</td>
														<td class="w5">对应年份</td>
													</tr>
												</thead>
												<tbody id="table_list4_1" >
													
												</tbody>
												<tfoot>
													<tr>
														<td colspan="15">
															<div class="pull-right">
																<div id="Paginator">
																	<ul id="pageLimit4_1"></ul>
																</div>
															</div>
														</td>
													</tr>
												</tfoot>
											</table>
											
											<table  class="table table-bordered table-header" style="position:absolute;top:128px;left:32.5%;width: 31%">
												<thead>
													<tr>
														<td class="w5" rowspan="3">序号</td>
														<td class="w5" rowspan="3">年份</td>
														<td class="w5" colspan="3">中旬</td>
														
														<td class="w5" rowspan="3">P=m/(n+1)</td>
													</tr>
													<tr>
														<td class="w5" rowspan="2">平均流量</td>
														<td class="w5" colspan="2">按递减排列</td>
														
													</tr>
													<tr>
														<td class="w5">平均流量</td>
														<td class="w5">对应年份</td>
														
													</tr>
												</thead>
												<tbody id="table_list4_2" >
													
												</tbody>
												<tfoot>
													<tr>
														<td colspan="15">
															<div class="pull-right">
																<div id="Paginator">
																	<ul id="pageLimit4_2"></ul>
																</div>
															</div>
														</td>
													</tr>
												</tfoot>
											</table>
											<table class="table table-bordered table-header" style="position:absolute;top:128px;left:63.7%;width: 31%">
												<thead>
													<tr>
														<td class="w5" rowspan="3">序号</td>
														<td class="w5" rowspan="3">年份</td>
														<td class="w5" colspan="3">下旬</td>
														
														<td class="w5" rowspan="3">P=m/(n+1)</td>
													</tr>
													<tr>
														<td class="w5" rowspan="2">平均流量</td>
														<td class="w5" colspan="2">按递减排列</td>
														
													</tr>
													<tr>
														<td class="w5">平均流量</td>
														<td class="w5">对应年份</td>
														
													</tr>
												</thead>
												<tbody id="table_list4_3" >
													
												</tbody>
												<tfoot>
													<tr>
														<td colspan="15">
															<div class="pull-right">
																<div id="Paginator">
																	<ul id="pageLimit4_3"></ul>
																</div>
															</div>
														</td>
													</tr>
												</tfoot>
											</table>
										</div>
			                    </div>
			                    <!-- tab对应主体 TAB-5 -->
			                    <div id="TAB-5"  class="width left min-tab">
			                    	 <div class="search-box row" style="width: 100%;">
											<div class="col-md-12">
												<div class="btn-group pull-left" role="group" aria-label="...">
													<button id="add_forecast5" style="display: none" type="button" class="btn btn-default" onclick="addFlow(5)">
														<span class="glyphicon glyphicon-plus">
														</span>新增
													</button>
													
													<button id="delete_forecast5" style="display: none" type="button" class="btn btn-default">
														<span class="glyphicon glyphicon-trash"></span>删除
													</button>
													<span id="edit_forecast5" />
													<span id="detail_forecast5" />
												</div>
											</div>
										</div>
										
										<div class="clearfix"></div>
										<div class="table-margin">
											<table class="table table-bordered table-header" style="width: 34%">
												<thead>
													<tr>
														<td class="w5" rowspan="3">序号</td>
														<td class="w5" rowspan="3">年份</td>
														<td class="w5" colspan="3">上旬</td>
														<td class="w5" rowspan="3">P=m/(n+1)</td>
													</tr>
													<tr>
														<td class="w5" rowspan="2">平均流量</td>
														<td class="w5" colspan="2">按递减排列</td>
													</tr>
													<tr>
														<td class="w5">平均流量</td>
														<td class="w5">对应年份</td>
													</tr>
												</thead>
												<tbody id="table_list5_1" >
													
												</tbody>
												<tfoot>
													<tr>
														<td colspan="15">
															<div class="pull-right">
																<div id="Paginator">
																	<ul id="pageLimit5_1"></ul>
																</div>
															</div>
														</td>
													</tr>
												</tfoot>
											</table>
											
											<table  class="table table-bordered table-header" style="position:absolute;top:128px;left:32.5%;width: 31%">
												<thead>
													<tr>
														<td class="w5" rowspan="3">序号</td>
														<td class="w5" rowspan="3">年份</td>
														<td class="w5" colspan="3">中旬</td>
														
														<td class="w5" rowspan="3">P=m/(n+1)</td>
													</tr>
													<tr>
														<td class="w5" rowspan="2">平均流量</td>
														<td class="w5" colspan="2">按递减排列</td>
														
													</tr>
													<tr>
														<td class="w5">平均流量</td>
														<td class="w5">对应年份</td>
														
													</tr>
												</thead>
												<tbody id="table_list5_2" >
													
												</tbody>
												<tfoot>
													<tr>
														<td colspan="15">
															<div class="pull-right">
																<div id="Paginator">
																	<ul id="pageLimit5_2"></ul>
																</div>
															</div>
														</td>
													</tr>
												</tfoot>
											</table>
											<table class="table table-bordered table-header" style="position:absolute;top:128px;left:63.7%;width: 31%">
												<thead>
													<tr>
														<td class="w5" rowspan="3">序号</td>
														<td class="w5" rowspan="3">年份</td>
														<td class="w5" colspan="3">下旬</td>
														
														<td class="w5" rowspan="3">P=m/(n+1)</td>
													</tr>
													<tr>
														<td class="w5" rowspan="2">平均流量</td>
														<td class="w5" colspan="2">按递减排列</td>
														
													</tr>
													<tr>
														<td class="w5">平均流量</td>
														<td class="w5">对应年份</td>
														
													</tr>
												</thead>
												<tbody id="table_list5_3" >
													
												</tbody>
												<tfoot>
													<tr>
														<td colspan="15">
															<div class="pull-right">
																<div id="Paginator">
																	<ul id="pageLimit5_3"></ul>
																</div>
															</div>
														</td>
													</tr>
												</tfoot>
											</table>
										</div>
			                    </div>
			                    <!-- tab对应主体 TAB-3 -->
			                    <div id="TAB-6" class="width left min-tab">
			                    	<div class="search-box row" style="width: 100%;">
											<div class="col-md-12">
												<div class="btn-group pull-left" role="group" aria-label="...">
													<button id="add_forecast6" style="display: none" type="button" class="btn btn-default" onclick="addFlow(6)">
														<span class="glyphicon glyphicon-plus">
														</span>新增
													</button>
													
													<button id="delete_forecast6" style="display: none" type="button" class="btn btn-default">
														<span class="glyphicon glyphicon-trash"></span>删除
													</button>
													<span id="edit_forecast6" />
													<span id="detail_forecast6" />
												</div>
											</div>
										</div>
										
										<div class="clearfix"></div>
										<div class="table-margin">
											<table class="table table-bordered table-header" style="width: 34%">
												<thead>
													<tr>
														<td class="w5" rowspan="3">序号</td>
														<td class="w5" rowspan="3">年份</td>
														<td class="w5" colspan="3">上旬</td>
														<td class="w5" rowspan="3">P=m/(n+1)</td>
													</tr>
													<tr>
														<td class="w5" rowspan="2">平均流量</td>
														<td class="w5" colspan="2">按递减排列</td>
													</tr>
													<tr>
														<td class="w5">平均流量</td>
														<td class="w5">对应年份</td>
													</tr>
												</thead>
												<tbody id="table_list6_1" >
													
												</tbody>
												<tfoot>
													<tr>
														<td colspan="15">
															<div class="pull-right">
																<div id="Paginator">
																	<ul id="pageLimit6_1"></ul>
																</div>
															</div>
														</td>
													</tr>
												</tfoot>
											</table>
											
											<table  class="table table-bordered table-header" style="position:absolute;top:128px;left:32.5%;width: 31%">
												<thead>
													<tr>
														<td class="w5" rowspan="3">序号</td>
														<td class="w5" rowspan="3">年份</td>
														<td class="w5" colspan="3">中旬</td>
														
														<td class="w5" rowspan="3">P=m/(n+1)</td>
													</tr>
													<tr>
														<td class="w5" rowspan="2">平均流量</td>
														<td class="w5" colspan="2">按递减排列</td>
														
													</tr>
													<tr>
														<td class="w5">平均流量</td>
														<td class="w5">对应年份</td>
														
													</tr>
												</thead>
												<tbody id="table_list6_2" >
													
												</tbody>
												<tfoot>
													<tr>
														<td colspan="15">
															<div class="pull-right">
																<div id="Paginator">
																	<ul id="pageLimit6_2"></ul>
																</div>
															</div>
														</td>
													</tr>
												</tfoot>
											</table>
											<table class="table table-bordered table-header" style="position:absolute;top:128px;left:63.7%;width: 31%">
												<thead>
													<tr>
														<td class="w5" rowspan="3">序号</td>
														<td class="w5" rowspan="3">年份</td>
														<td class="w5" colspan="3">下旬</td>
														
														<td class="w5" rowspan="3">P=m/(n+1)</td>
													</tr>
													<tr>
														<td class="w5" rowspan="2">平均流量</td>
														<td class="w5" colspan="2">按递减排列</td>
														
													</tr>
													<tr>
														<td class="w5">平均流量</td>
														<td class="w5">对应年份</td>
														
													</tr>
												</thead>
												<tbody id="table_list6_3" >
													
												</tbody>
												<tfoot>
													<tr>
														<td colspan="15">
															<div class="pull-right">
																<div id="Paginator">
																	<ul id="pageLimit6_3"></ul>
																</div>
															</div>
														</td>
													</tr>
												</tfoot>
											</table>
										</div>
			                    </div>
			                    <div id="TAB-7" class="width left min-tab">
			                    	<div class="search-box row" style="width: 100%;">
											<div class="col-md-12">
												<div class="btn-group pull-left" role="group" aria-label="...">
													<button id="add_forecast7" style="display: none" type="button" class="btn btn-default" onclick="addFlow(7)">
														<span class="glyphicon glyphicon-plus">
														</span>新增
													</button>
													
													<button id="delete_forecast7" style="display: none" type="button" class="btn btn-default">
														<span class="glyphicon glyphicon-trash"></span>删除
													</button>
													<span id="edit_forecast7" />
													<span id="detail_forecast7" />
												</div>
											</div>
										</div>
										
										<div class="clearfix"></div>
										<div class="table-margin">
											<table class="table table-bordered table-header" style="width: 34%">
												<thead>
													<tr>
														<td class="w5" rowspan="3">序号</td>
														<td class="w5" rowspan="3">年份</td>
														<td class="w5" colspan="3">上旬</td>
														<td class="w5" rowspan="3">P=m/(n+1)</td>
													</tr>
													<tr>
														<td class="w5" rowspan="2">平均流量</td>
														<td class="w5" colspan="2">按递减排列</td>
													</tr>
													<tr>
														<td class="w5">平均流量</td>
														<td class="w5">对应年份</td>
													</tr>
												</thead>
												<tbody id="table_list7_1" >
													
												</tbody>
												<tfoot>
													<tr>
														<td colspan="15">
															<div class="pull-right">
																<div id="Paginator">
																	<ul id="pageLimit7_1"></ul>
																</div>
															</div>
														</td>
													</tr>
												</tfoot>
											</table>
											
											<table  class="table table-bordered table-header" style="position:absolute;top:128px;left:32.5%;width: 31%">
												<thead>
													<tr>
														<td class="w5" rowspan="3">序号</td>
														<td class="w5" rowspan="3">年份</td>
														<td class="w5" colspan="3">中旬</td>
														
														<td class="w5" rowspan="3">P=m/(n+1)</td>
													</tr>
													<tr>
														<td class="w5" rowspan="2">平均流量</td>
														<td class="w5" colspan="2">按递减排列</td>
														
													</tr>
													<tr>
														<td class="w5">平均流量</td>
														<td class="w5">对应年份</td>
														
													</tr>
												</thead>
												<tbody id="table_list7_2" >
													
												</tbody>
												<tfoot>
													<tr>
														<td colspan="15">
															<div class="pull-right">
																<div id="Paginator">
																	<ul id="pageLimit7_2"></ul>
																</div>
															</div>
														</td>
													</tr>
												</tfoot>
											</table>
											<table class="table table-bordered table-header" style="position:absolute;top:128px;left:63.7%;width: 31%">
												<thead>
													<tr>
														<td class="w5" rowspan="3">序号</td>
														<td class="w5" rowspan="3">年份</td>
														<td class="w5" colspan="3">下旬</td>
														
														<td class="w5" rowspan="3">P=m/(n+1)</td>
													</tr>
													<tr>
														<td class="w5" rowspan="2">平均流量</td>
														<td class="w5" colspan="2">按递减排列</td>
														
													</tr>
													<tr>
														<td class="w5">平均流量</td>
														<td class="w5">对应年份</td>
														
													</tr>
												</thead>
												<tbody id="table_list7_3" >
													
												</tbody>
												<tfoot>
													<tr>
														<td colspan="15">
															<div class="pull-right">
																<div id="Paginator">
																	<ul id="pageLimit7_3"></ul>
																</div>
															</div>
														</td>
													</tr>
												</tfoot>
											</table>
										</div>
			                    </div>
			                    <div id="TAB-8" class="width left min-tab">
			                    	<div class="search-box row" style="width: 100%;">
											<div class="col-md-12">
												<div class="btn-group pull-left" role="group" aria-label="...">
													<button id="add_forecast8" style="display: none" type="button" class="btn btn-default" onclick="addFlow(8)">
														<span class="glyphicon glyphicon-plus">
														</span>新增
													</button>
													
													<button id="delete_forecast8" style="display: none" type="button" class="btn btn-default">
														<span class="glyphicon glyphicon-trash"></span>删除
													</button>
													<span id="edit_forecast8" />
													<span id="detail_forecast8" />
												</div>
											</div>
										</div>
										
										<div class="clearfix"></div>
										<div class="table-margin">
											<table class="table table-bordered table-header" style="width: 34%">
												<thead>
													<tr>
														<td class="w5" rowspan="3">序号</td>
														<td class="w5" rowspan="3">年份</td>
														<td class="w5" colspan="3">上旬</td>
														<td class="w5" rowspan="3">P=m/(n+1)</td>
													</tr>
													<tr>
														<td class="w5" rowspan="2">平均流量</td>
														<td class="w5" colspan="2">按递减排列</td>
													</tr>
													<tr>
														<td class="w5">平均流量</td>
														<td class="w5">对应年份</td>
													</tr>
												</thead>
												<tbody id="table_list8_1" >
													
												</tbody>
												<tfoot>
													<tr>
														<td colspan="15">
															<div class="pull-right">
																<div id="Paginator">
																	<ul id="pageLimit8_1"></ul>
																</div>
															</div>
														</td>
													</tr>
												</tfoot>
											</table>
											
											<table  class="table table-bordered table-header" style="position:absolute;top:128px;left:32.5%;width: 31%">
												<thead>
													<tr>
														<td class="w5" rowspan="3">序号</td>
														<td class="w5" rowspan="3">年份</td>
														<td class="w5" colspan="3">中旬</td>
														
														<td class="w5" rowspan="3">P=m/(n+1)</td>
													</tr>
													<tr>
														<td class="w5" rowspan="2">平均流量</td>
														<td class="w5" colspan="2">按递减排列</td>
														
													</tr>
													<tr>
														<td class="w5">平均流量</td>
														<td class="w5">对应年份</td>
														
													</tr>
												</thead>
												<tbody id="table_list8_2" >
													
												</tbody>
												<tfoot>
													<tr>
														<td colspan="15">
															<div class="pull-right">
																<div id="Paginator">
																	<ul id="pageLimit8_2"></ul>
																</div>
															</div>
														</td>
													</tr>
												</tfoot>
											</table>
											<table class="table table-bordered table-header" style="position:absolute;top:128px;left:63.7%;width: 31%">
												<thead>
													<tr>
														<td class="w5" rowspan="3">序号</td>
														<td class="w5" rowspan="3">年份</td>
														<td class="w5" colspan="3">下旬</td>
														
														<td class="w5" rowspan="3">P=m/(n+1)</td>
													</tr>
													<tr>
														<td class="w5" rowspan="2">平均流量</td>
														<td class="w5" colspan="2">按递减排列</td>
														
													</tr>
													<tr>
														<td class="w5">平均流量</td>
														<td class="w5">对应年份</td>
														
													</tr>
												</thead>
												<tbody id="table_list8_3" >
													
												</tbody>
												<tfoot>
													<tr>
														<td colspan="15">
															<div class="pull-right">
																<div id="Paginator">
																	<ul id="pageLimit8_3"></ul>
																</div>
															</div>
														</td>
													</tr>
												</tfoot>
											</table>
										</div>
			                    </div>
			                    <div id="TAB-9" class="width left min-tab">
			                    	<div class="search-box row" style="width: 100%;">
											<div class="col-md-12">
												<div class="btn-group pull-left" role="group" aria-label="...">
													<button id="add_forecast9" style="display: none" type="button" class="btn btn-default" onclick="addFlow(9)">
														<span class="glyphicon glyphicon-plus">
														</span>新增
													</button>
													
													<button id="delete_forecast9" style="display: none" type="button" class="btn btn-default">
														<span class="glyphicon glyphicon-trash"></span>删除
													</button>
													<span id="edit_forecast9" />
													<span id="detail_forecast9" />
												</div>
											</div>
										</div>
										
										<div class="clearfix"></div>
										<div class="table-margin">
											<table class="table table-bordered table-header" style="width: 34%">
												<thead>
													<tr>
														<td class="w5" rowspan="3">序号</td>
														<td class="w5" rowspan="3">年份</td>
														<td class="w5" colspan="3">上旬</td>
														<td class="w5" rowspan="3">P=m/(n+1)</td>
													</tr>
													<tr>
														<td class="w5" rowspan="2">平均流量</td>
														<td class="w5" colspan="2">按递减排列</td>
													</tr>
													<tr>
														<td class="w5">平均流量</td>
														<td class="w5">对应年份</td>
													</tr>
												</thead>
												<tbody id="table_list9_1" >
													
												</tbody>
												<tfoot>
													<tr>
														<td colspan="15">
															<div class="pull-right">
																<div id="Paginator">
																	<ul id="pageLimit9_1"></ul>
																</div>
															</div>
														</td>
													</tr>
												</tfoot>
											</table>
											
											<table  class="table table-bordered table-header" style="position:absolute;top:128px;left:32.5%;width: 31%">
												<thead>
													<tr>
														<td class="w5" rowspan="3">序号</td>
														<td class="w5" rowspan="3">年份</td>
														<td class="w5" colspan="3">中旬</td>
														
														<td class="w5" rowspan="3">P=m/(n+1)</td>
													</tr>
													<tr>
														<td class="w5" rowspan="2">平均流量</td>
														<td class="w5" colspan="2">按递减排列</td>
														
													</tr>
													<tr>
														<td class="w5">平均流量</td>
														<td class="w5">对应年份</td>
														
													</tr>
												</thead>
												<tbody id="table_list9_2" >
													
												</tbody>
												<tfoot>
													<tr>
														<td colspan="15">
															<div class="pull-right">
																<div id="Paginator">
																	<ul id="pageLimit9_2"></ul>
																</div>
															</div>
														</td>
													</tr>
												</tfoot>
											</table>
											<table class="table table-bordered table-header" style="position:absolute;top:128px;left:63.7%;width: 31%">
												<thead>
													<tr>
														<td class="w5" rowspan="3">序号</td>
														<td class="w5" rowspan="3">年份</td>
														<td class="w5" colspan="3">下旬</td>
														
														<td class="w5" rowspan="3">P=m/(n+1)</td>
													</tr>
													<tr>
														<td class="w5" rowspan="2">平均流量</td>
														<td class="w5" colspan="2">按递减排列</td>
														
													</tr>
													<tr>
														<td class="w5">平均流量</td>
														<td class="w5">对应年份</td>
														
													</tr>
												</thead>
												<tbody id="table_list9_3" >
													
												</tbody>
												<tfoot>
													<tr>
														<td colspan="15">
															<div class="pull-right">
																<div id="Paginator">
																	<ul id="pageLimit9_3"></ul>
																</div>
															</div>
														</td>
													</tr>
												</tfoot>
											</table>
										</div>
			                    </div>
			                    <div id="TAB-10" class="width left min-tab">
			                    	<div class="search-box row" style="width: 100%;">
											<div class="col-md-12">
												<div class="btn-group pull-left" role="group" aria-label="...">
													<button id="add_forecast10" style="display: none" type="button" class="btn btn-default" onclick="addFlow(10)">
														<span class="glyphicon glyphicon-plus">
														</span>新增
													</button>
													
													<button id="delete_forecast10" style="display: none" type="button" class="btn btn-default">
														<span class="glyphicon glyphicon-trash"></span>删除
													</button>
													<span id="edit_forecast10" />
													<span id="detail_forecast10" />
												</div>
											</div>
										</div>
										
										<div class="clearfix"></div>
										<div class="table-margin">
											<table class="table table-bordered table-header" style="width: 34%">
												<thead>
													<tr>
														<td class="w5" rowspan="3">序号</td>
														<td class="w5" rowspan="3">年份</td>
														<td class="w5" colspan="3">上旬</td>
														<td class="w5" rowspan="3">P=m/(n+1)</td>
													</tr>
													<tr>
														<td class="w5" rowspan="2">平均流量</td>
														<td class="w5" colspan="2">按递减排列</td>
													</tr>
													<tr>
														<td class="w5">平均流量</td>
														<td class="w5">对应年份</td>
													</tr>
												</thead>
												<tbody id="table_list10_1" >
													
												</tbody>
												<tfoot>
													<tr>
														<td colspan="15">
															<div class="pull-right">
																<div id="Paginator">
																	<ul id="pageLimit10_1"></ul>
																</div>
															</div>
														</td>
													</tr>
												</tfoot>
											</table>
											
											<table  class="table table-bordered table-header" style="position:absolute;top:128px;left:32.5%;width: 31%">
												<thead>
													<tr>
														<td class="w5" rowspan="3">序号</td>
														<td class="w5" rowspan="3">年份</td>
														<td class="w5" colspan="3">中旬</td>
														
														<td class="w5" rowspan="3">P=m/(n+1)</td>
													</tr>
													<tr>
														<td class="w5" rowspan="2">平均流量</td>
														<td class="w5" colspan="2">按递减排列</td>
														
													</tr>
													<tr>
														<td class="w5">平均流量</td>
														<td class="w5">对应年份</td>
														
													</tr>
												</thead>
												<tbody id="table_list10_2" >
													
												</tbody>
												<tfoot>
													<tr>
														<td colspan="15">
															<div class="pull-right">
																<div id="Paginator">
																	<ul id="pageLimit10_2"></ul>
																</div>
															</div>
														</td>
													</tr>
												</tfoot>
											</table>
											<table class="table table-bordered table-header" style="position:absolute;top:128px;left:63.7%;width: 31%">
												<thead>
													<tr>
														<td class="w5" rowspan="3">序号</td>
														<td class="w5" rowspan="3">年份</td>
														<td class="w5" colspan="3">下旬</td>
														
														<td class="w5" rowspan="3">P=m/(n+1)</td>
													</tr>
													<tr>
														<td class="w5" rowspan="2">平均流量</td>
														<td class="w5" colspan="2">按递减排列</td>
														
													</tr>
													<tr>
														<td class="w5">平均流量</td>
														<td class="w5">对应年份</td>
														
													</tr>
												</thead>
												<tbody id="table_list10_3" >
													
												</tbody>
												<tfoot>
													<tr>
														<td colspan="15">
															<div class="pull-right">
																<div id="Paginator">
																	<ul id="pageLimit10_3"></ul>
																</div>
															</div>
														</td>
													</tr>
												</tfoot>
											</table>
										</div>
			                    </div>
			                    <div id="TAB-11" class="width left min-tab">
			                    	<div class="search-box row" style="width: 100%;">
											<div class="col-md-12">
												<div class="btn-group pull-left" role="group" aria-label="...">
													<button id="add_forecast11" style="display: none" type="button" class="btn btn-default" onclick="addFlow(11)">
														<span class="glyphicon glyphicon-plus">
														</span>新增
													</button>
													
													<button id="delete_forecast11" style="display: none" type="button" class="btn btn-default">
														<span class="glyphicon glyphicon-trash"></span>删除
													</button>
													<span id="edit_forecast11" />
													<span id="detail_forecast11" />
												</div>
											</div>
										</div>
										
										<div class="clearfix"></div>
										<div class="table-margin">
											<table class="table table-bordered table-header" style="width: 34%">
												<thead>
													<tr>
														<td class="w5" rowspan="3">序号</td>
														<td class="w5" rowspan="3">年份</td>
														<td class="w5" colspan="3">上旬</td>
														<td class="w5" rowspan="3">P=m/(n+1)</td>
													</tr>
													<tr>
														<td class="w5" rowspan="2">平均流量</td>
														<td class="w5" colspan="2">按递减排列</td>
													</tr>
													<tr>
														<td class="w5">平均流量</td>
														<td class="w5">对应年份</td>
													</tr>
												</thead>
												<tbody id="table_list11_1" >
													
												</tbody>
												<tfoot>
													<tr>
														<td colspan="15">
															<div class="pull-right">
																<div id="Paginator">
																	<ul id="pageLimit11_1"></ul>
																</div>
															</div>
														</td>
													</tr>
												</tfoot>
											</table>
											
											<table  class="table table-bordered table-header" style="position:absolute;top:128px;left:32.5%;width: 31%">
												<thead>
													<tr>
														<td class="w5" rowspan="3">序号</td>
														<td class="w5" rowspan="3">年份</td>
														<td class="w5" colspan="3">中旬</td>
														
														<td class="w5" rowspan="3">P=m/(n+1)</td>
													</tr>
													<tr>
														<td class="w5" rowspan="2">平均流量</td>
														<td class="w5" colspan="2">按递减排列</td>
														
													</tr>
													<tr>
														<td class="w5">平均流量</td>
														<td class="w5">对应年份</td>
														
													</tr>
												</thead>
												<tbody id="table_list11_2" >
													
												</tbody>
												<tfoot>
													<tr>
														<td colspan="15">
															<div class="pull-right">
																<div id="Paginator">
																	<ul id="pageLimit11_2"></ul>
																</div>
															</div>
														</td>
													</tr>
												</tfoot>
											</table>
											<table class="table table-bordered table-header" style="position:absolute;top:128px;left:63.7%;width: 31%">
												<thead>
													<tr>
														<td class="w5" rowspan="3">序号</td>
														<td class="w5" rowspan="3">年份</td>
														<td class="w5" colspan="3">下旬</td>
														
														<td class="w5" rowspan="3">P=m/(n+1)</td>
													</tr>
													<tr>
														<td class="w5" rowspan="2">平均流量</td>
														<td class="w5" colspan="2">按递减排列</td>
														
													</tr>
													<tr>
														<td class="w5">平均流量</td>
														<td class="w5">对应年份</td>
														
													</tr>
												</thead>
												<tbody id="table_list11_3" >
													
												</tbody>
												<tfoot>
													<tr>
														<td colspan="15">
															<div class="pull-right">
																<div id="Paginator">
																	<ul id="pageLimit11_3"></ul>
																</div>
															</div>
														</td>
													</tr>
												</tfoot>
											</table>
										</div>
			                    </div>
			                    <div id="TAB-12" class="width left min-tab">
			                    	<div class="search-box row" style="width: 100%;">
											<div class="col-md-12">
												<div class="btn-group pull-left" role="group" aria-label="...">
													<button id="add_forecast12" style="display: none" type="button" class="btn btn-default" onclick="addFlow(12)">
														<span class="glyphicon glyphicon-plus">
														</span>新增
													</button>
													
													<button id="delete_forecast12" style="display: none" type="button" class="btn btn-default">
														<span class="glyphicon glyphicon-trash"></span>删除
													</button>
													<span id="edit_forecast12" />
													<span id="detail_forecast12" />
												</div>
											</div>
										</div>
										
										<div class="clearfix"></div>
										<div class="table-margin">
											<table class="table table-bordered table-header" style="width: 34%">
												<thead>
													<tr>
														<td class="w5" rowspan="3">序号</td>
														<td class="w5" rowspan="3">年份</td>
														<td class="w5" colspan="3">上旬</td>
														<td class="w5" rowspan="3">P=m/(n+1)</td>
													</tr>
													<tr>
														<td class="w5" rowspan="2">平均流量</td>
														<td class="w5" colspan="2">按递减排列</td>
													</tr>
													<tr>
														<td class="w5">平均流量</td>
														<td class="w5">对应年份</td>
													</tr>
												</thead>
												<tbody id="table_list12_1" >
													
												</tbody>
												<tfoot>
													<tr>
														<td colspan="15">
															<div class="pull-right">
																<div id="Paginator">
																	<ul id="pageLimit12_1"></ul>
																</div>
															</div>
														</td>
													</tr>
												</tfoot>
											</table>
											
											<table  class="table table-bordered table-header" style="position:absolute;top:128px;left:32.5%;width: 31%">
												<thead>
													<tr>
														<td class="w5" rowspan="3">序号</td>
														<td class="w5" rowspan="3">年份</td>
														<td class="w5" colspan="3">中旬</td>
														
														<td class="w5" rowspan="3">P=m/(n+1)</td>
													</tr>
													<tr>
														<td class="w5" rowspan="2">平均流量</td>
														<td class="w5" colspan="2">按递减排列</td>
														
													</tr>
													<tr>
														<td class="w5">平均流量</td>
														<td class="w5">对应年份</td>
														
													</tr>
												</thead>
												<tbody id="table_list12_2" >
													
												</tbody>
												<tfoot>
													<tr>
														<td colspan="15">
															<div class="pull-right">
																<div id="Paginator">
																	<ul id="pageLimit12_2"></ul>
																</div>
															</div>
														</td>
													</tr>
												</tfoot>
											</table>
											<table class="table table-bordered table-header" style="position:absolute;top:128px;left:63.7%;width: 31%">
												<thead>
													<tr>
														<td class="w5" rowspan="3">序号</td>
														<td class="w5" rowspan="3">年份</td>
														<td class="w5" colspan="3">下旬</td>
														
														<td class="w5" rowspan="3">P=m/(n+1)</td>
													</tr>
													<tr>
														<td class="w5" rowspan="2">平均流量</td>
														<td class="w5" colspan="2">按递减排列</td>
														
													</tr>
													<tr>
														<td class="w5">平均流量</td>
														<td class="w5">对应年份</td>
														
													</tr>
												</thead>
												<tbody id="table_list12_3">
												
												
													
												</tbody>
												<tfoot>
													<tr>
														<td colspan="15">
															<div class="pull-right">
																<div id="Paginator">
																	<ul id="pageLimit12_3"></ul>
																</div>
															</div>
														</td>
													</tr>
												</tfoot>
											</table>
										</div>
			                    </div>
			                </div>
						  </div> 
			          </div>
			          </div>
			        </div>
				</ui-layout>
			</div>
			</section>
		</div>
		<!-- 页面主体右侧内容end -->
	</div>
	<!-- 页面主体end -->
	</form>
	<!-- js引入 -->
	<script type="text/javascript" src="${ctxstc}/js/footer.js"></script>
	<script type="text/javascript" src="${ctxstc}/js/custom/water_area_cook.js"></script>
	<script type="text/javascript" src="${ctxstc}/js/custom/plan/ten.js"></script>
	<script type="text/javascript" src="${ctxstc}/datepicker/WdatePicker.js "></script>
	<script type="text/javascript" src="${ctxstc}/js/custom/permission/show_three_level_permission.js"></script>
	<script>
	//树结构json数据
	
	
	/*function load(){
		//==修改tab  css内联样式==================
		var tab = document.getElementById("tab");
		tab.setAttribute("style", "width:100%");
		//======================================
			
			
		//三级权限code数组============================================================
		var threeLevelPermission = [];
		//拿到三级权限的的列表
		<c:forEach items="${threeLevelPermissions}" var="sysPermission">
			var menuNameCode = "${sysPermission.menuNameCode}";
			//拿到页面三级权限对应的标签
			var tag = document.getElementById(menuNameCode);
			var tag1 = document.getElementById(menuNameCode+"1");
			var tag2 = document.getElementById(menuNameCode+"2");
			var tag3 = document.getElementById(menuNameCode+"3");
			var tag4 = document.getElementById(menuNameCode+"4");
			var tag5 = document.getElementById(menuNameCode+"5");
			var tag6 = document.getElementById(menuNameCode+"6");
			var tag7 = document.getElementById(menuNameCode+"7");
			var tag8 = document.getElementById(menuNameCode+"8");
			var tag9 = document.getElementById(menuNameCode+"9");
			var tag10 = document.getElementById(menuNameCode+"10");
			var tag11 = document.getElementById(menuNameCode+"11");
			var tag12 = document.getElementById(menuNameCode+"12");
			
			if(tag!=null){//如果有权限就将他显示
				tag.style.display="block";
				tag1.style.display="block";
				tag2.style.display="block";
				tag3.style.display="block";
				tag4.style.display="block";
				tag5.style.display="block";
				tag6.style.display="block";
				tag7.style.display="block";
				tag8.style.display="block";
				tag9.style.display="block";
				tag10.style.display="block";
				tag11.style.display="block";
				tag12.style.display="block";
				threeLevelPermission.push(menuNameCode);
			}
		</c:forEach>
		//start(1,threeLevelPermission);	
		//startForecast();	
			
		showNodes(threeLevelPermission);
		$.fn.zTree.init($("#treeDemo"), setting, zNodes);	
			
		var canalCode = getCookie("currentRiverCode");
	//alert(canalCode);
		if(canalCode!=null){
			//alert(canalCode);
			startForecast(canalCode,1,threeLevelPermission);
		}else{
			var canalCode2 = "${calCanalCode}";
			//alert(canalCode2);
			setCookie("currentRiverCode",canalCode2);
			startForecast(canalCode2,1,threeLevelPermission);
		}
		delCookie("currentRiverCode");
	};*/

	

	//导航树的配置
/*	var setting = {
            view: {
                
                selectedMulti: false
            },
            check: {
                //enable: true
            },
            data: {
                simpleData: {
                    enable: true
                }
            },
            edit: {
                //enable: true
            }
	};*/
	
	//树结构json数据
	var zNodes=[];
	
	//树结构json数据
	
	<%-- <ul id="tree" class="nav nav-pills nav-stacked">
						<li><h4 style="margin-left: 10px;">河道</h4>
						</li>
						<div style="margin-left: 10px;">
							<c:forEach items="${calCanalInfoList}" var="calCanalInfo" >
								<h4 onclick="show('${calCanalInfo.id}','${calCanalInfo.canalCode}')">${calCanalInfo.canalName}</h4>
							</c:forEach>
						</div>
						<!-- <ul id="treeDemo" class="ztree">
						</ul> -->
					</ul> --%>
	
	
	//拿到后台的json数据赋值给zNodes
/*	function showNodes(threeLevelPermission){
		var zNode;
		<c:forEach items="${calCanalInfoList2}" var="calCanalInfo">
			var id   ="${calCanalInfo.id}";
			var pId  ="${calCanalInfo.canalParentId}";
			var name ="${calCanalInfo.canalName}";
			var level="${calCanalInfo.canallevelCode}";
			if(level<3){
				zNode={id:id, pId:pId, name:name,click:"show('${calCanalInfo.id}','${calCanalInfo.canalCode}','"+threeLevelPermission+"');", open:true};
				zNodes.push(zNode);
			}
		</c:forEach>
	}*/
	
/*	var newCount = 1;
	function addHoverDom(treeId, treeNode) {
	    var sObj = $("#" + treeNode.tId + "_span");
	    if (treeNode.editNameFlag || $("#addBtn_"+treeNode.tId).length>0) return;
	    var addStr = "<span class='button add' id='addBtn_" + treeNode.tId
	        + "' title='add node' onfocus='this.blur();'></span>";
	    sObj.after(addStr);
	    var btn = $("#addBtn_"+treeNode.tId);
	    if (btn) btn.bind("click", function(){
	    	addWaterArea();
	        var zTree = $.fn.zTree.getZTreeObj("treeDemo");
	       // zTree.addNodes(treeNode, {id:(100 + newCount), pId:treeNode.id, name:"new node"+ (newCount++),click:"hello()"});
	        return false;
	    });
	};*/
	function removeHoverDom(treeId, treeNode) {
	    $("#addBtn_"+treeNode.tId).unbind().remove();
	};
	
	
	
	</script>
</body>
</html>