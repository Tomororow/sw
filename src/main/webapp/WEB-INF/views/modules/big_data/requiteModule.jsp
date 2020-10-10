<%@ page language="java" contentType="text/html; charset=utf-8" pageEncoding="utf-8"%>
<%@ include file="/WEB-INF/views/base.jsp"%>

<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
    <script rel="stylesheet" src="${ctxstc}/adapters/moment/moment.js"></script>
    <script type="text/javascript" src="${ctxstc}/jquery/jquery-1.11.1.min.js"></script>
    <script type="text/javascript" src="${ctxstc}/js/vue.js"></script>
    <script type="text/javascript" src="${ctxstc}/js/element-ui/index.js"></script>
    <link rel="stylesheet" href="${ctxstc}/js/element-ui/theme-chalk/index.css" type="text/css">

</head>
<body style="height: 100%">
    <div id="requiteModule">
        <template>
            <el-tabs <%--@tab-click="leftTabClick"--%> <%--tab-position="left"--%> <%--style="width: 8%"--%> v-model="leftType"<%-- v-if="activeName == 'second'"--%>>
                <el-tab-pane label="需水管理" name="first"></el-tab-pane>
                <el-tab-pane label="配水计划" name="second"></el-tab-pane>
            </el-tabs>
        </template>
        <ul v-if="leftType =='first'">
            <li  style="float: left" v-for="(item,index) in (waterRequirementModule.irrigationRequireWaterList)" :style="{marginLeft:(index)%2!=0?'15%':0}" >
                <%-- <span v-text="item.canalName+'需水(m³)：'"></span>--%>
                <el-input placeholder="请输入灌区名称" style="width: 150px" size="mini" clearable autofocus v-model="item.canalName"></el-input>
                <el-input placeholder="请输入需水量" style="width: 120px" size="mini" clearable autofocus></el-input>
                <el-button icon="el-icon-plus" type="text" size="small" v-if="index == waterRequirementModule.irrigationRequireWaterList.length-1" @Click="addWaterRequire('first')"></el-button>
                <%--<el-button icon="el-icon-edit" type="text" size="small"></el-button>--%>
                <el-button icon="el-icon-delete" type="text" size="small" @Click="deleteWaterRequire('first',index)"></el-button>
            </li>
        </ul>
        <ul v-if="leftType =='second'">
            <li style="float: left" v-for="(item,index) in (waterConfigPlanModule.irrigationConfigPlanList)" :style="{marginLeft:(index)%2!=0?'15%':0}" >
                <el-input placeholder="请输入灌区名称" style="width: 150px" size="mini" clearable autofocus v-model="item.canalName"></el-input>
                <el-input placeholder="请输入配水量" style="width: 120px" size="mini" clearable autofocus></el-input>
                <el-button icon="el-icon-plus" type="text" size="small" v-if="index == waterConfigPlanModule.irrigationConfigPlanList.length-1" @Click="addWaterRequire('second')"></el-button>
                <el-button icon="el-icon-delete" type="text" size="small" @Click="deleteWaterRequire('second',index)"></el-button>
            </li>
        </ul>
    </div>
</body>
<script src="${ctxstc}/js/custom/bigData/requiteModule.js"></script>
</html>
