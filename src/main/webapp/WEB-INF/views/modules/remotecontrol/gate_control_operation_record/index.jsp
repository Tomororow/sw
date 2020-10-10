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
    <script rel="stylesheet" src="${ctxstc}/adapters/moment/moment.js"></script>
    <style type="text/css">
        .el-table .positive-row {background: #e2f0e4;}
        .el-table thead{color:#4b5261;font-weight:600;font-size: 15px }
    </style>
</head>
<body>
<!-- 页面主体start -->
<div class="down-main" id="operationRecord" style="left:0;" >

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
                                        <h4>灌区信息化平台>自动控制>闸门控制操作记录</h4>
                                    </div>
                                </div>
                                <div class="search-box row">
                                    <div class="demo-input-suffix">
                                        <span style="margin-left: 20px"></span>
<%--                                        按编码查询：
                                        <el-input placeholder="请输入内容" v-model="recordCodeQuery" prefix-icon="el-icon-search" clearable size="mini" style="width:200px;">
                                            <el-button slot="append" icon="el-icon-search" @click="operationRecordQueryByCode"></el-button>
                                        </el-input>--%>
                                        按名称查询：
                                        <el-input placeholder="请输入内容" v-model="recordNameQuery" prefix-icon="el-icon-search" clearable size="mini" style="width:200px;">
                                            <el-button slot="append" icon="el-icon-search" @click="operationRecordQueryByName"></el-button>
                                        </el-input>
                                        <span style="margin-left: 40px"></span>
                                        按操作人员查询：
                                        <el-input placeholder="请输入内容" v-model="recordOperatorQuery" prefix-icon="el-icon-search" clearable size="mini" style="width:200px;">
                                            <el-button slot="append" icon="el-icon-search" @click="operationRecordQueryByOperator"></el-button>
                                        </el-input>
                                    </div>
                                </div>
                                <div class="clearfix"></div>
                                <!-- 表格 -->
                                <div class="table-margin">
                                    <template>
                                        <el-table :data="(operationRecordList || '').slice((currentPage-1)*pageSize,currentPage*pageSize)" stripe border width="100%" size="medium" highlight-current-row
                                                  @expand-change="handleConnectionSearch" :expand-row-keys="expands" :row-key='getRowKeys'>
                                            <el-table-column type="expand">
                                                <template scope="props">
                                                    <el-table :data="props.row.siteSluiceControlOperationRecordList" border size="medium" fit :header-cell-style="{background:'#f0f9eb'}">
                                                        <el-table-column label="闸门编码" prop="sscorSluiceCode" show-overflow-tooltip align="center"></el-table-column>
                                                        <el-table-column label="闸门名称" prop="sscorSluiceName" show-overflow-tooltip align="center" width="230px"></el-table-column>
                                                        <el-table-column label="变化前开度" prop="sluiceHeightChangeBefore" show-overflow-tooltip align="center"></el-table-column>
                                                        <el-table-column label="变化后开度" prop="sluiceHeightChangeAfter" show-overflow-tooltip align="center"></el-table-column>
                                                        <el-table-column label="变化状态" prop="sluiceChangeType" show-overflow-tooltip align="center">
                                                            <template scope="props">
                                                                <span v-if="props.row.sluiceChangeType=='1'" style="color:green;"><i class="el-icon-upload2" ></i> 上升</span>
                                                                <span v-if="props.row.sluiceChangeType=='0'" style="color:red;"><i class="el-icon-download" ></i> 下降</span>
                                                            </template>
                                                        </el-table-column>
                                                        <el-table-column label="操作人员" prop="sluiceOperatorName" show-overflow-tooltip align="center"></el-table-column>
                                                        <el-table-column label="操作来源IP" prop="operatorIp" show-overflow-tooltip align="center"></el-table-column>
                                                        <el-table-column label="操作来源" prop="operatorSource" show-overflow-tooltip align="center">
                                                            <template scope="props">
                                                                <span v-if="props.row.operatorSource=='0'"><img src="${ctxstc}/images/gateControl/IE.png" style="width: 25px;"/>web</span>
                                                                <span v-if="props.row.operatorSource=='1'"><img src="${ctxstc}/images/gateControl/weixin.png" style="width: 18px;"/>微信</span>
                                                                <span v-if="props.row.operatorSource=='2'"><img src="${ctxstc}/images/gateControl/visual_studio.png" style="width: 18px;"/>c/s</span>
                                                            </template>
                                                        </el-table-column>
                                                        <el-table-column label="操作时间" prop="sscorCreateTime" show-overflow-tooltip align="center" :formatter="dateFormat"></el-table-column>
                                                        <el-table-column label="历史数据查询" show-overflow-tooltip align="center" >
                                                            <template scope="props">
                                                                <el-button @click="operationHistoryRecordQuery(props.row)" icon="el-icon-search" size="small" type="text" >查询</el-button>
                                                            </template>
                                                        </el-table-column>
                                                    </el-table>
                                                </template>
                                            </el-table-column>
                                            <el-table-column label="闸门站编码" prop="deviceSluiceCode" show-overflow-tooltip align="center"></el-table-column>
                                            <el-table-column label="闸门站名称" prop="deviceSluiceName" show-overflow-tooltip align="center"></el-table-column>
                                        </el-table>
                                        <el-pagination @size-change="handleSizeChange" @current-change="handleCurrentChange"  :current-page.sync="currentPage" :page-size="pageSize" layout="total, prev, pager, next" :total="operationRecordList!=null?operationRecordList.length:0" align="right"></el-pagination>
                                    </template>
                                </div>
                                <div>
                                    <el-dialog :title="dialogSluiceName+'操作历史记录'" :visible.sync="historyDialogVisible" @close="doCancel('operationRecordHistory')">
                                        <div>
                                            <el-date-picker v-model="queryStartTime" <%--value-format="yyyy-MM-dd HH:mm:ss"--%> format="yyyy-MM-dd HH:mm:ss" type="datetime" placeholder="请选择开始时间" clearable size="small" style="left: 29%;position: absolute"></el-date-picker>
                                            <el-date-picker v-model="queryEndTime" <%--value-format="yyyy-MM-dd HH:mm:ss"--%> format="yyyy-MM-dd HH:mm:ss" type="datetime" placeholder="请选择结束时间" clearable size="small" style="left: 53%;position: relative;"></el-date-picker>
                                            <el-button size="small" @click="historyDataQueryByTime" type="primary" icon="el-icon-search" style="left: 53%; position: relative">查询</el-button>
                                            <el-button size="small" type="primary" @click="sluiceExcelExport" icon="el-icon-share" style="left: 52%; position: relative">报表导出</el-button>
                                        </div>
                                        <div style="margin-top: 10px;">
                                            <span style="font-weight:600; float: left">当前闸门编码:{{dialogSluiceCode}}</span>
                                        </div>
                                        <template>
                                            <el-table :data="(operationRecordHistory || '').slice((dialogCurrentPage-1)*dialogPageSize,dialogCurrentPage*dialogPageSize)"  border :row-class-name="tableRowClassName" style="width: 100%; margin-top:5px" v-loading="loading">
                                                <el-table-column type="index"></el-table-column>
                                                <el-table-column label="变化前开度" prop="sluiceHeightChangeBefore" show-overflow-tooltip align="center"></el-table-column>
                                                <el-table-column label="变化后开度" prop="sluiceHeightChangeAfter" show-overflow-tooltip align="center"></el-table-column>
                                                <el-table-column label="变化状态" prop="type" show-overflow-tooltip align="center">
                                                    <template scope="props">
                                                        <span v-if="props.row.sluiceChangeType=='1'" style="color:green;"><i class="el-icon-upload2" ></i> 上升</span>
                                                        <span v-if="props.row.sluiceChangeType=='0'" style="color:red;"><i class="el-icon-download" ></i> 下降</span>
                                                    </template>
                                                </el-table-column>
                                                <el-table-column label="操作人员" prop="sluiceOperatorName" show-overflow-tooltip align="center"></el-table-column>
                                                <el-table-column label="操作来源IP" prop="operatorIp" show-overflow-tooltip align="center"></el-table-column>
                                                <el-table-column label="操作来源" prop="operatorSource" show-overflow-tooltip align="center">
                                                    <template scope="props">
                                                        <span v-if="props.row.operatorSource=='0'"><img src="${ctxstc}/images/gateControl/IE.png" style="width: 25px;"/>web</span>
                                                        <span v-if="props.row.operatorSource=='1'"><img src="${ctxstc}/images/gateControl/weixin.png" style="width: 18px;"/>微信</span>
                                                        <span v-if="props.row.operatorSource=='2'"><img src="${ctxstc}/images/gateControl/visual_studio.png" style="width: 18px;"/>c/s</span>
                                                    </template>
                                                </el-table-column>
                                                <el-table-column label="操作时间" prop="sscorCreateTime" show-overflow-tooltip align="center" :formatter="dateFormat"></el-table-column>
                                            </el-table>
                                            <el-pagination @size-change="handleDialogSizeChange" @current-change="handleDialogCurrentChange" :page-sizes="[10, 20, 30, 40]" :current-page.sync="dialogCurrentPage" :page-size="dialogPageSize" layout="total, prev, pager, next" :total="operationRecordHistory.length" align="right" style="margin-top:10px;"></el-pagination>
                                        </template>
                                    </el-dialog>
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
<script type="text/javascript" src="${ctxstc}/js/custom/remotecontrol/gate_control_operation_record/gate_control_operation_record.js"></script>
<script type="text/javascript" src="${ctxstc}/js/footer.js"></script>
<script type="text/javascript" src="${ctxstc}/js/custom/province_city/distpicker.data.js"></script>
<script type="text/javascript" src="${ctxstc}/js/custom/province_city/distpicker.js"></script>
<script type="text/javascript" src="${ctxstc}/js/custom/province_city/main.js"></script>
</body>
</html>
