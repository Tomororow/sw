<%@ page language="java" contentType="text/html; charset=utf-8" pageEncoding="utf-8"%>
<%@ include file="/WEB-INF/views/base.jsp"%>
<!--  实时数据ui-->
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

    <script src="${ctxstc}/adapters/layui/layer/layer.js"></script>
    <script type="text/javascript" src="${ctxstc}/js/vue.js"></script>
    <link rel="stylesheet" href="${ctxstc}/js/element-ui/theme-chalk/index.css" type="text/css">
    <script type="text/javascript" src="${ctxstc}/js/element-ui/index.js"></script>
</head>
<body>
<!-- 页面主体start -->
<div class="down-main" id="reservoirMonitor" style="left:0;" >

    <!-- 页面主体右侧内容start -->
    <div class="right-product right-full">
        <section id="layout" ng-app="doc.ui-layout">
            <div ui-layout class="layout-mock">
                <ui-layout options="{ flow : 'column' }">

                    <sidebar class="east-back left-back" >
                        <ul id="tree" class="nav nav-pills nav-stacked">
                            <li><h4 style="margin-left:10px">渠道等级</h4></li>
                            <ul id="treeDemo" class="ztree"></ul>
                        </ul>
                    </sidebar>

                    <div class="center-back right-back" >
                        <div class="container-fluid">
                            <div class="info-center">
                                <div class="page-header">
                                    <div class="pull-left">
                                        <h4>灌区信息化平台>智慧灌溉>实时水源监测>水库监测</h4>
                                    </div>
                                </div>
                                <%--<div class="clearfix"></div>--%>
                                <!-- 表格 -->
                                <template>
                                    <el-tabs type="card">
                                        <el-tab-pane label="坝体浸润线" name="1">
                                            <%----%>
                                        </el-tab-pane>
                                        <el-tab-pane label="库水位监测" name="2">
                                            <%----%>
                                        </el-tab-pane>
                                        <el-tab-pane label="入库流量监测" name="3">
                                            <%----%>
                                        </el-tab-pane>
                                        <el-tab-pane label="出库流量监测" name="4">
                                            <%----%>
                                        </el-tab-pane>
                                    </el-tabs>
                                </template>
                            </div>
                        </div>
                    </div>
                </ui-layout>
            </div>
        </section>
    </div>
    <!-- 页面主体右侧内容end -->
</div>
<script type="text/javascript" src="${ctxstc}/js/custom/plan/reservoir_monitor/reservoir_monitor.js"></script>
<script type="text/javascript" src="${ctxstc}/js/footer.js"></script>
<script type="text/javascript" src="${ctxstc}/js/custom/province_city/distpicker.data.js"></script>
<script type="text/javascript" src="${ctxstc}/js/custom/province_city/distpicker.js"></script>
<script type="text/javascript" src="${ctxstc}/js/custom/province_city/main.js"></script>
</body>
</html>
