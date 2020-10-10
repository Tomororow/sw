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
	<link type="text/css" rel="stylesheet" href="${ctxstc}/css/custom/scroll.css" title="" />
	<link type="text/css" rel="stylesheet" href="${ctxstc}/adapters/ztree/css/zTreeStyle/zTreeStyle.css" /><!-- zTree -->
	<link type="text/css" rel="stylesheet" href="${ctxstc}/adapters/ztree/css/metroStyle/metroStyle.css">

	<script type="text/javascript" src="${ctxstc}/jquery/jquery-1.11.1.min.js"></script>
	<script type="text/javascript" src="${ctxstc}/jquery/jquery.cookie.js"></script>
	<script type="text/javascript" src="${ctxstc}/adapters/bootstrap/js/bootstrap.min.js"></script>
	<script type="text/javascript" src="${ctxstc}/adapters/bootstrap/js/bootstrap-paginator.js"></script>
	<script type="text/javascript" src="${ctxstc}/js/style.js"></script>
	<script type="text/javascript" src="${ctxstc}/js/angular.min.js"></script><!-- angular ui --->
	<script type="text/javascript" src="${ctxstc}/js/ui-layout.js"></script>
	<script type="text/javascript" src="${ctxstc}/adapters/ztree/js/jquery.ztree.core.js"></script><!-- zTree -->
	<script type="text/javascript" src="${ctxstc}/adapters/layui/layer/layer.js" merge="true"></script>
	<script type="text/javascript" src="${ctxstc}/js/vue.js"></script>
	<link rel="stylesheet" href="${ctxstc}/js/element-ui/theme-chalk/index.css" type="text/css">
	<script type="text/javascript" src="${ctxstc}/js/element-ui/index.js"></script>
	<script rel="stylesheet" src="${ctxstc}/adapters/moment/moment.js"></script>
	<style>
		.el-table thead{color:#4b5261;font-weight:600;font-size: 15px }
	</style>
</head>
<body>
	<!-- 页面主体start -->
	<div class="down-main" id="scroll">

		<!-- 页面主体右侧内容start -->
		<div class="right-product right-full">
			<section id="layout" ng-app="doc.ui-layout">
			<div ui-layout class="layout-mock">
				<ui-layout options="{ flow : 'column' }">
				<!-- 左侧三级菜单start -->
				<sidebar class="east-back left-back">
					<%--{{activeName}}--%>
					<ul class="nav nav-pills nav-stacked" v-if="activeName=='first'">
						<li><h4 style="margin-top: 20px; margin-left:20px;">行政区域</h4></li>
						<li id="areaZtree" class="ztree" style="margin-left:20px;" v-if="activeName=='first'"></li>
					</ul>
					<ul class="nav nav-pills nav-stacked" v-if="activeName=='second'">
						<li><h4 style="margin-top: 20px; margin-left:20px;">水管区域</h4></li>
						<li id="waterAreaZtree" class="ztree" style="margin-left:20px;" v-if="activeName=='second'"></li>
					</ul>

				</sidebar>
				<!-- 左侧三级菜单end  -->

				<div class="center-back right-back">
					<div class="container-fluid">
						<div class="info-center">
							<div class="page-header">
								<div class="pull-left">
									<h4>灌区信息化平台>系统管理>区域管理</h4>
								</div>
							</div>

							<div class="search-box row">
								<div class="col-md-12">
									<div class="btn-group pull-left" role="group" aria-label="...">
										<button id="add_area" <%--style="display: none"--%> type="button" class="btn btn-default" @click="doAddArea">
											<span class="glyphicon glyphicon-plus"></span>新增
										</button>

<%--										<button id="delete_area" &lt;%&ndash;style="display: none"&ndash;%&gt; type="button" class="btn btn-default" onclick="doDelete()">
											<span class="glyphicon glyphicon-trash"></span>删除
										</button>--%>
										<span id="edit_area" />
										<span id="detail_area" />

									</div>
								</div>
							</div>

							<div class="clearfix"></div>
							<div class="table-margin">
							<%--<table class="table table-bordered table-header">
									<thead>
									<tr>
										<td class="w5"><input type="checkbox" id="selAreasAll" onclick="checkAreasAll()"/></td>
										<td class="w15">区域编码</td>
										<td class="w20">区域名称</td>
										<td class="w10">区域级别</td>
										<td class="w10">父区域</td>
										<td class="w15">添加时间</td>
										<td class="w15">备注</td>
										<td class="w10">操作</td>
									</tr>
									</thead>

									<tbody id="areasTableList">
									</tbody>

									<tfoot>
									<tr>
										<td colspan="8">
											<div class="pull-right">
												<div id="pagination">
													<ul id="pageLimit"></ul>
												</div>
											</div>
										</td>
									</tr>
									</tfoot>
								</table>--%>
								<template>
									<el-tabs v-model="activeName"  type="card" @tab-click="handleTabs">
										<el-tab-pane label="行政区域" name="first">
											<el-table :data="areasTableData.slice((currentPage-1)*pagesize,currentPage*pagesize)" stripe border width="100%" size="small" >
												<el-table-column label="区域编码" align="center" show-overflow-tooltip prop="areaCode"></el-table-column>
												<el-table-column label="区域名称" align="center" show-overflow-tooltip prop="areaName"></el-table-column>
												<el-table-column label="区域级别" align="center" show-overflow-tooltip prop="areaLevel"></el-table-column>
												<%--<el-table-column label="父区域" align="center" show-overflow-tooltip prop="parentAreaName"></el-table-column>--%>
												<el-table-column label="添加时间" align="center" show-overflow-tooltip prop="saCreateTime"></el-table-column>
												<%--<el-table-column label="备注" align="center" show-overflow-tooltip prop="saRemark"></el-table-column>--%>
												<el-table-column label="操作" align="center" show-overflow-tooltip prop="">
													<template slot-scope="scope">
														<el-button type="text" size="small" @click="doEdit(scope.row)">修改</el-button>
														<el-button type="text" size="small" @click="doDelete(scope.row)">删除</el-button>
														<%--<el-button type="text" size="small" @click="">详情</el-button>--%>
													</template>
												</el-table-column>
											</el-table>
											<el-pagination @size-change="handleSizeChange" @current-change="handleCurrentChange"  :current-page.sync="currentPage" :page-size="pagesize" layout="total, prev, pager, next" :total="areasTableData.length" align="right"></el-pagination>
										</el-tab-pane>
										<el-tab-pane label="水管区域" name="second">
                                            <el-table :data="areasTableData.slice((currentPage-1)*pagesize,currentPage*pagesize)" stripe border width="100%" size="small" >
                                                <el-table-column label="区域编码" align="center" show-overflow-tooltip prop="waterAreaCode"></el-table-column>
                                                <el-table-column label="区域名称" align="center" show-overflow-tooltip prop="waterAreaName"></el-table-column>
                                                <el-table-column label="区域级别" align="center" show-overflow-tooltip prop="waterAreaLevel"></el-table-column>
                                                <%--<el-table-column label="父区域" align="center" show-overflow-tooltip prop="parentAreaName"></el-table-column>--%>
                                                <el-table-column label="添加时间" align="center" show-overflow-tooltip prop="swaCreateTime" :formatter="dateFormat"></el-table-column>
                                                <%--<el-table-column label="备注" align="center" show-overflow-tooltip prop="swaRemark"></el-table-column>--%>
                                                <el-table-column label="操作" align="center" show-overflow-tooltip prop="">
                                                    <template slot-scope="scope">
                                                        <el-button type="text" size="small" @click="doEdit(scope.row)">修改</el-button>
                                                        <el-button type="text" size="small" @click="doDelete(scope.row)">删除</el-button>
                                                        <%--<el-button type="text" size="small" @click="">详情</el-button>--%>
                                                    </template>
                                                </el-table-column>
                                            </el-table>
                                            <el-pagination @size-change="handleSizeChange" @current-change="handleCurrentChange"  :current-page.sync="currentPage" :page-size="pagesize" layout="total, prev, pager, next" :total="areasTableData.length" align="right"></el-pagination>
										</el-tab-pane>
									</el-tabs>
								</template>
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

	<!--弹窗添加或修改内容必备的代码-->
	<div id="show">
	    <iframe id="popup" name="popup" marginwidth=0 width="100%" frameBorder=0 scrolling=yes></iframe>
	</div>
	<script type="text/javascript" src="${ctxstc}/js/footer.js"></script>
	<script type="text/javascript" src="${ctxstc}/js/custom/permission/show_three_level_permission.js"></script>
    <script type="text/javascript" src="${ctxstc}/js/custom/sysarea.js"></script>
</body>
</html>