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
    <link type="text/css" rel="stylesheet" href="${ctxstc}/css/ui-layout.css" title="" /><!-- angular ui --->
    <link type="text/css" rel="stylesheet" href="${ctxstc}/css/style.css" title="" />
    <script type="text/javascript" src="${ctxstc}/jquery/jquery-1.11.1.min.js"></script>
    <script type="text/javascript" src="${ctxstc}/adapters/bootstrap/js/bootstrap.min.js"></script>
    <script type="text/javascript" src="${ctxstc}/adapters/bootstrap/js/bootstrap-paginator.js"></script>
    <script type="text/javascript" src="${ctxstc}/js/style.js"></script>
    <script type="text/javascript" src="${ctxstc}/js/angular.min.js"></script><!-- angular ui --->
    <script type="text/javascript" src="${ctxstc}/js/ui-layout.js"></script>
    <link rel="stylesheet" href="${ctxstc}/adapters/ztree/css/zTreeStyle/zTreeStyle.css" type="text/css">
    <script type="text/javascript" src="${ctxstc}/adapters/ztree/js/jquery.ztree.core.js"></script>
    <link rel="stylesheet" href="${ctxstc}/adapters/ztree/css/metroStyle/metroStyle.css" type="text/css">
    <script type="text/javascript" src="${ctxstc}/js/vue.js"></script>
    <link rel="stylesheet" href="${ctxstc}/js/element-ui/theme-chalk/index.css" type="text/css">
    <script type="text/javascript" src="${ctxstc}/js/element-ui/index.js"></script>
    <%--<script type="text/javascript" src="${ctxstc}/js/aes-js/aes.js"></script>--%>
    <script type="text/javascript" src="${ctxstc}/js/aes-js/aes-min.js"></script>
    <script rel="stylesheet" src="${ctxstc}/adapters/moment/moment.js"></script>
    <link rel="stylesheet" href="${ctxstc}/css/custom/remotecontrol/gateControl.css" type="text/css">
    <!--关于摄像头视频的插件 -->
    <script type="text/javascript" src="${ctxstc}/js/ezuikit.js"></script>
    <script type="text/javascript" src="http://resource.bcevod.com/player/cyberplayer.js"></script>
    <style type="text/css">
        #liTabe table:nth-child(1) thead{display: none}
        .sluiceRealVideo td{width: 100px;position: relative;text-align: center}
        .sluiceRealVideo td div{width: 300px;height: 200px;line-height: 200px;}
        .sluiceRealVideo td video{position: relative;width: 100%;height: 100%;}
        .sluiceRealVideo tr:nth-child(1) td{height: 30px;font-weight:bold;font-size: 15px;}
        .el-popover{left:60%!important;height: 310px;}
    </style>
</head>
<body>
<!-- 页面主体start -->
<div class="down-main" id="gateContol" style="left:0;" >
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
                    <div class="center-back right-back">
                        <div class="container-fluid">
                            <div class="info-center">
                                <div class="page-header">
                                    <div class="pull-left">
                                        <h4>灌区信息化平台>自动控制>闸门远程控制</h4>
                                    </div>
                                </div>
                                <div class="search-box row">

                                    <div class="demo-input-suffix">
                                        <span style="margin-left: 20px"></span>
                                        按闸门站编码查询：
                                        <el-input placeholder="请输入编码" v-model="sluiceCodeSelect" prefix-icon="el-icon-search" clearable size="mini" style="width:200px;">
                                            <el-button slot="append" icon="el-icon-search" @click="sluiceCodeQuery"></el-button>
                                        </el-input>
                                        <span style="margin-left: 40px"></span>
                                        按闸门站名称查询：
                                        <el-input placeholder="请输入名称" v-model="sluiceNameSelect" prefix-icon="el-icon-search" clearable size="mini" style="width:200px;">
                                            <el-button slot="append" icon="el-icon-search" @click="sluiceNameQuery"></el-button>
                                        </el-input>
                                    </div>
                                </div>
                                <!-- 表格 -->
                                <div class="table-margin">
                                    <template>
                                        <el-table :data="tableData" stripe border width="100%" size="medium" highlight-current-row @expand-change="handleConnectionSearch"
                                                  :expand-row-keys="expands" :row-key='getRowKeys' @row-click="tableRowClick" ref="refTable">
                                            <el-table-column type="expand">
                                                <template scope="props">
                                                    <el-table :data="props.row.siteSluiceGateInfoList" border size="medium" fit :header-cell-style="{background:'#f0f9eb'}">
                                                        <el-table-column label="闸门编码" prop="ssgiSluiceGateCode" fixed show-overflow-tooltip align="center"></el-table-column>
                                                        <el-table-column label="闸门名称" prop="ssgiSluiceGateName" fixed show-overflow-tooltip align="center"></el-table-column>
                                                        <%--<el-table-column label="设备状态" prop="props.row.siteSluiceGateInfoList.siteSluiceJzMiddDevice.ssjmdSluicGateType" show-overflow-tooltip align="center"></el-table-column>--%>
                                                        <el-table-column label="设备状态" show-overflow-tooltip align="center">
                                                            <template slot-scope="scope">
                                                                <span v-if="scope.row.siteSluiceJzMiddDevice.ssjmdSluicGateType=='1'" style="color:green;"><i class="el-icon-circle-check" ></i> 在线</span>
                                                                <span v-if="scope.row.siteSluiceJzMiddDevice.ssjmdSluicGateType=='0'" style="color:red;"><i class="el-icon-circle-close" ></i> 离线</span>
                                                            </template>
                                                        </el-table-column>
                                                        <el-table-column label="开度(cm)" align="center">
                                                            <el-table-column label="当前" show-overflow-tooltip align="center" prop="siteSluiceJzMiddDevice.ssjmdSluiceHeight"></el-table-column>
                                                            <el-table-column label="上限" show-overflow-tooltip align="center" prop="siteSluiceJzMiddDevice.ssjmdOpenCeiling"></el-table-column>
                                                            <el-table-column label="下限" show-overflow-tooltip align="center" prop="siteSluiceJzMiddDevice.ssjmdOpenLower"></el-table-column>
                                                        </el-table-column>
                                                        <el-table-column label="闸前水位(cm)" show-overflow-tooltip align="center" prop="siteSluiceJzMiddDevice.ssjmdBeforeWaterLevel"></el-table-column>
                                                        <el-table-column label="过闸流量(m/s)" show-overflow-tooltip align="center">
                                                            <el-table-column label="实时" align="center" prop="siteSluiceJzMiddDevice.ssjmdSluiceInstantFlow">
                                                                <template slot-scope="scope">
                                                                    <span>{{scope.row.siteSluiceJzMiddDevice.ssjmdSluiceInstantFlow}}</span>
                                                                </template>
                                                            </el-table-column>
                                                            <el-table-column label="计算" align="center">
                                                                <template slot-scope="scope">
                                                                    <span></span>
                                                                </template>
                                                            </el-table-column>
                                                        </el-table-column>
                                                        <el-table-column label="荷重(吨)" align="center">
                                                            <el-table-column label="单路荷重" align="center">
                                                                <el-table-column label="当前" align="center" prop="siteSluiceJzMiddDevice.ssjmdARoadLoad">
                                                                    <template slot-scope="scope">
                                                                        <span>{{(scope.row.siteSluiceJzMiddDevice.ssjmdARoadLoad)/10}}</span>
                                                                    </template>
                                                                </el-table-column>
                                                                <el-table-column label="下限" align="center" prop="siteSluiceJzMiddDevice.ssjmdARoadLoad90">
                                                                    <template slot-scope="scope">
                                                                        <span>{{(scope.row.siteSluiceJzMiddDevice.ssjmdARoadLoad90)/10}}</span>
                                                                    </template>
                                                                </el-table-column>
                                                                <el-table-column label="上限" align="center" prop="siteSluiceJzMiddDevice.ssjmdARoadLoad110">
                                                                    <template slot-scope="scope">
                                                                        <span>{{(scope.row.siteSluiceJzMiddDevice.ssjmdARoadLoad110)/10}}</span>
                                                                    </template>
                                                                </el-table-column>
                                                            </el-table-column>
                                                            <el-table-column label="双路荷重" align="center">
                                                                <el-table-column label="当前" align="center" prop="siteSluiceJzMiddDevice.ssjmdBRoadLoad">
                                                                    <template slot-scope="scope">
                                                                        <span>{{(scope.row.siteSluiceJzMiddDevice.ssjmdBRoadLoad)/10}}</span>
                                                                    </template>
                                                                </el-table-column>
                                                                <el-table-column label="下限" align="center" prop="siteSluiceJzMiddDevice.ssjmdBRoadLoad90">
                                                                    <template slot-scope="scope">
                                                                        <span>{{(scope.row.siteSluiceJzMiddDevice.ssjmdBRoadLoad90)/10}}</span>
                                                                    </template>
                                                                </el-table-column>
                                                                <el-table-column label="上限" align="center" prop="siteSluiceJzMiddDevice.ssjmdBRoadLoad110">
                                                                    <template slot-scope="scope">
                                                                        <span>{{(scope.row.siteSluiceJzMiddDevice.ssjmdBRoadLoad110)/10}}</span>
                                                                    </template>
                                                                </el-table-column>
                                                            </el-table-column>
                                                        </el-table-column>
                                                        <el-table-column label="实时录像"  show-overflow-tooltip fixed="right" align="center" width="90">
                                                            <template scope="props">
                                                                <div @click.stop>
                                                                    <el-popover title="" placement="bottom"  @show="getLabelInfo(props.row)" width="auto" trigger="click">
                                                                       <%-- <table class="sluiceRealVideo" cellspacing="5" border="1">
                                                                            <tr>
                                                                                <td v-for="sli in realVideoData">{{sli.deviceVideoName}}</td>
                                                                            </tr>
                                                                            <tr>
                                                                                <td v-for="(sli,index) in realVideoData">
                                                                                    <div>
                                                                                        <video :id="'props'+(props.row.ssgiSluiceGateCode)+(index)" v-if="sli.ezopenLive!=''" controls poster=""  playsInline webkit-playsinline >
                                                                                            <source src="" type=""/>
                                                                                        </video>
                                                                                        <span v-if="sli.ezopenLive==null||sli.ezopenLive==''">暂无视频地址</span>
                                                                                    </div>
                                                                                </td>
                                                                            </tr>
                                                                        </table>--%>
                                                                           <iframe id="iFramse" v-if="realVideoData.length>0" src="/surface_water/site_sluice_manage/videoFrame"
                                                                                   width="100%" height="93.5%" frameborder="0" name="right" scrolling="no" ></iframe>
                                                                        <div slot="reference" class="realVideo">
                                                                            <img src="${ctxstc}/images/video/realVideo.png" title="查看实时录像" style="width: 30px;vertical-align:sub"/>
                                                                        </div>
                                                                    </el-popover>
                                                                </div>
                                                            </template>
                                                        </el-table-column>
                                                        <el-table-column label="操作" show-overflow-tooltip align="center" fixed="right" width="120">
                                                            <template scope="scope">
                                                                <el-button size="mini" type="primary" icon="el-icon-s-cooperation" :disabled="scope.row.siteSluiceJzMiddDevice.ssjmdSluicGateType=='0'" @click="handleControlBefore(scope.$index, scope.row)">远程控制</el-button>
                                                            </template>
                                                        </el-table-column>
                                                    </el-table>
                                                </template>
                                            </el-table-column>
                                            <el-table-column label="闸门站编码" prop="deviceSluiceCode" show-overflow-tooltip align="center"></el-table-column>
                                            <el-table-column label="闸门站名称" prop="deviceSluiceName" show-overflow-tooltip align="center"></el-table-column>
                                            <el-table-column label="闸门状态 || 设备类型" prop="siteSluiceGateInfoList" show-overflow-tooltip align="center">
                                                <template scope="props">
                                                    <el-table :data="props.row.siteSluiceGateInfoList" row-key="id" stripe border width="100%" size="mini" id="liTabe">
                                                        <el-table-column prop="ssgiSluiceGateName" show-overflow-tooltip align="center"></el-table-column>
                                                        <el-table-column prop="siteSluiceJzMiddDevice.ssjmdSluicGateType" show-overflow-tooltip align="center">
                                                            <template scope="props">
																<span :style="{color:props.row.siteSluiceJzMiddDevice.ssjmdSluicGateType=='0'?'red':'green'}">
																	<i :class="props.row.siteSluiceJzMiddDevice.ssjmdSluicGateType=='0'?'el-icon-circle-close':'el-icon-circle-check'" ></i>{{props.row.siteSluiceJzMiddDevice.ssjmdSluicGateType=='0'?'离线':'在线'}}
																</span>
                                                            </template>
                                                        </el-table-column>
                                                        <el-table-column prop="ssgiSluiceTypeName" show-overflow-tooltip align="center">
                                                            <template scope="props">
																<span style="color:#43a5ea ">
																	{{props.row.ssgiSluiceTypeName}}
																</span>
                                                            </template>
                                                        </el-table-column>
                                                    </el-table>
                                                </template>
                                            </el-table-column>
                                            <el-table-column label="详细地址" prop="ssiAddr" show-overflow-tooltip align="center"></el-table-column>
                                            <el-table-column label="建设时间" prop="ssiBuildTime" show-overflow-tooltip align="center" :formatter="dateFormat"></el-table-column>
                                        </el-table>
                                        <el-pagination @size-change="handleSizeChange" @current-change="handleCurrentChange"  :current-page.sync="currentPage" :page-size="pageSize" layout="total, prev, pager, next" :total="tableData!=null?tableData.length:0" align="right"></el-pagination>
                                    </template>
                                </div>
                            </div>
                        </div>
                    </div>
                </ui-layout>
            </div>
        </section>
    </div>
    <!-- 模态框（Modal） -->
    <el-dialog :title="title" :visible.sync="dialogVisible" width="70%" :close-on-click-modal="false" :close-on-press-escape="false" :before-close="doCancelBefore" <%--@close="doCancel"--%>>
        <%-- =====正文部分=====--%>
        <span v-text="'当前展示设备：' + videoControl.videoDeviceName" style="font-size: 12px"></span>
        <table>
            <tr>
                <div class="contEnt">
                    <%--视频部分--%>
                    <div @mouseenter="mouseenter" @mouseleave="mouseleave">
                        <div>
                            <template>
                                <el-carousel indicator-position="outside" arrow="hover" indicator-position="none" :autoplay="false" @change=carouselChange>
                                    <el-carousel-item v-for="(item,index) in videoControl.videoData" :key="item">
                                        <video v-bind:id="('myPlayer')+(index)" controls poster="" playsInline autoplay webkit-playsinline width="100%" height="100%">
                                            <source src="" type=""/>
                                        </video>
                                    </el-carousel-item>
                                </el-carousel>
                            </template>
                            <div id="videoCtr" style="z-index:999">
                                <el-popover placement="bottom" title="云台控制" width="150" trigger="click" close-delay="50">
                                    <div id="yuntai" style="width: 110px;height:110px;margin:20px auto 0 auto;position: relative">
                                        <i class="el-icon-caret-top" @click="yuntaiControl(0,videoControl.videoDeviceSerial)"></i>
                                        <i class="el-icon-caret-right"  @click="yuntaiControl(3,videoControl.videoDeviceSerial)"></i>
                                        <i class="el-icon-caret-bottom"  @click="yuntaiControl(1,videoControl.videoDeviceSerial)"></i>
                                        <i class="el-icon-caret-left"  @click="yuntaiControl(2,videoControl.videoDeviceSerial)"></i>
                                        <div style="width: 50px;height:50px;margin:25% auto 25% auto;"></div>
                                    </div>
                                    <img src="${ctxstc}/images/videoCtr.png" slot="reference" title="云台控制" style="width: 18px;height: 17px;cursor: pointer;margin:25%">
                                </el-popover>
                            </div>
                        </div>
                    </div>

                    <%--动画及控制部分--%>
                    <div>
                        <div style="height: 70%">
                            <%--<canvas id="tutorial" width="150" height="150"></canvas>--%>
                            <div>
                                <img src="${ctxstc}/images/gateControl/channel_image.png" style="width: 400px;margin: 0 18%;"/>
                                <div id="channelGateId">
                                    <img src="${ctxstc}/images/gateControl/channel_gate.png" style="width: 400px;margin:-283px 18%;position: relative"/>
                                </div>
                            </div>
                        </div>
                        <div style="float: left;width: 50%;line-height: 26px;margin-left: 30px;">
                            <div style="text-align: center">
                                <span style="font-size: 15px; color: cornflowerblue;text-align: center">>>设备状态<<</span>
                            </div>
                            <div style="float: left;width: 50%;text-align: left;">
                                <span style="">闸门状态：{{sluiceData.ssjmdSluicGateType == 1?'在线':'离线'}}</span><br>
                                <span style="">开度上限(cm)：{{sluiceData.ssjmdOpenCeiling}}</span><br>
                                <span style="">开度下限(cm)：{{sluiceData.ssjmdOpenLower}}</span>
                            </div>
                            <div style="float: left;width: 50%;text-align: left;">
                                <span style="">单路荷重(吨)：{{sluiceData.ssjmdARoadLoad}}</span><br>
                                <span style="">双路荷重(吨)：{{sluiceData.ssjmdBRoadLoad}}</span>
                            </div>
                        </div>

                        <div style="float: left;width: 35%;">
                            <div style="width: 100%;">
                                <span style="font-weight:800;">闸门开度：{{sluiceData.ssjmdSluiceHeight}}</span><br>
                                <span style="font-weight:600;">开度预值:</span>
                                <el-input style="width: 130px;margin-top:15px" size="small" clearable v-model="preGateOpening" placeholder="请输入开度值"></el-input>
                            </div>
                            <div style="width: 100%;text-align: center;">
                                <el-button size="small" style="margin-top:15px" type="success" @click="openGateControl" :disabled="openGateControlBtnDisabled">执行</el-button>
                                <el-button size="small" type="danger" @click="closeGateControl" :disabled="closeGateControlBtnDisabled">停止</el-button>
                            </div>
                        </div>
                    </div>
                </div>
            </tr>
            <tr>
                <%--注意事项--%>
                <span style="font-weight: 600">注意：</span>
                <span>请确保当前视频能够正常播放,否则将不能进行远程闸门控制操作！</span>
            </tr>
        </table>
    </el-dialog>
</div>
    <!-- 页面主体右侧内容end -->
<script type="text/javascript" src="${ctxstc}/js/custom/remotecontrol/gateControl/gateControl.js"></script>
<script type="text/javascript" src="${ctxstc}/js/custom/common/yuntaiControl.js"></script>
<script type="text/javascript" src="${ctxstc}/js/footer.js"></script>
</body>
</html>
