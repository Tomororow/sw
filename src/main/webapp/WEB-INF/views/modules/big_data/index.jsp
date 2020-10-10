<%@ page language="java" contentType="text/html; charset=utf-8" pageEncoding="utf-8"%>
<%@ include file="/WEB-INF/views/base.jsp"%>

<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
    <meta http-equiv="Content-Type" content="text/html; charset=utf-8">
    <meta http-equiv="X-UA-Compatible" content="IE=Edge">
    <meta name="viewport" content="width=device-width, initial-scale=1,maximum-scale=1, user-scalable=no">
    <title>灌区信息化平台</title>
    <link rel="Shortcut Icon" href="${ctxstc}/images/jzlogo.ico" type="image/x-icon" />
    <link href="${ctxstc}/css/bigData/bigData.css" rel="stylesheet" type="text/css" />
    <link rel="stylesheet" href="${ctxstc}/js/element-ui/theme-chalk/index.css" type="text/css">
    <script rel="stylesheet" src="${ctxstc}/adapters/moment/moment.js"></script>
    <script type="text/javascript" src="${ctxstc}/jquery/jquery-1.11.1.min.js"></script>
    <script type="text/javascript" src="${ctxstc}/js/vue.js"></script>
    <script type="text/javascript" src="${ctxstc}/js/element-ui/index.js"></script>
    <script type="text/javascript" src="${ctxstc}/js/echarts/echarts.js"></script>
    <style type="text/css">
        .activeFirst input{text-align: center}
        .activeFirst span:hover{cursor: pointer;}
        .activeFirst table td{border: solid 1px #e4e4e4;text-align: center;border-radius:4px;}
        .activeFirst table thead td{height: 35px;color: #0f0f0f;font-size: 15px;font-weight: bold}
        .activeFirst table tbody td{height: 30px;color: #0f0f0f;font-size: 14px;}
    </style>
<%--    <style type="text/css">
        .el-dialog{height:80%}
        .el-tabs__nav-wrap::after{display: none}
        .el-dialog__body{height: 100%!important;}
        .el-tabs--top{height: 100%;!important;}
        .el-tabs__content{height: 100%;!important;}
        .el-tab-pane{height: 100%;!important;}
    </style>--%>
</head>
<body>
<div id="bigData" v-cloak>
    <!--=== header头部模块设计  ===-->
    <div class="header">
        <ul>
            <li><span>{{nowTime}}</span><i style="margin-left: 8px;">{{week}}</i></li>
            <li class="gradient-text">{{(title)+('地表水资源管理系统')}}</li>
            <li>
                <img id="weatherImg" v-if="weatherImg!=''" v-bind:src="('${ctxstc}/images/bigData/')+(weatherImg)+('.png')"/>{{weather}}
            </li>
            <div style="clear: both"></div>
        </ul>
        <div class="enterSystem" onclick="window.location.href='login/login'">
            <span>进入应用>> </span><span id="go">GO</span>
        </div>
    </div>
    <!--=== content模块  ===-->
    <div class="content">
        <!-- 上边一部分 -->
        <ul>
            <!-- 头部模块设置 -->
            <%--左边部分--%>
            <li>
                <%--左上--%>
                <!-- 引水量曲线图模块顶部标签 -->
                <div class="moduleLabelStyle">
                    <div class="topSign" style="width: 20%"><span>水资源曲线图</span></div>
                    <div style="margin-left: 200px;">
                        <template>
                            <el-select v-model="irrigationModule1Val" id="elSelect" @change="handleQueryClick('001');"  placeholder="请选择">
                                <el-option v-for="item in irrigationDownSelect" :key="item.canalCode" :label="item.canalName" :value="item.canalCode"></el-option>
                            </el-select>
                        </template>
                        <el-button id="query" @click="handleQueryClick('001');" icon="el-icon-search" circle></el-button>
                    </div>
                </div>
                <!-- 引水量曲线图模块内容 -->
                <div id="stackAreaName">
                    <div>
                        <span v-text="'日引水量: '+ totalUseWaterDiversion.dailyWaterDiversion + 'm³'"></span>
                        <span v-text="'月引水量: '+ totalUseWaterDiversion.monthlyWaterDiversion + 'm³'"></span>
                        <span v-text="'年引水量: '+ totalUseWaterDiversion.annualWaterDiversion + 'm³'"></span>
                    </div>
                    <ul>
                        <li v-bind:style="{color:moduleSwichFirst=='0'?'#ffffff':'#146fc7'}" style="font-family: '宋体';cursor: pointer;" @click="moduleSwitchFirstSelect('0')">日引水量曲线图</li>
                        <li style="margin:-15px 10px 0 10px"><img src="${ctxstc}/images/bigData/verline.png"/></li>
                        <li v-bind:style="{color:moduleSwichFirst=='1'?'#ffffff':'#146fc7'}" style="font-family: '宋体';cursor: pointer;" @click="moduleSwitchFirstSelect('1')">月引水量曲线图</li>
                    </ul>
                    <div id="stackContent">
                        <div>
                            <div id="stackDayOrMonthLine" style="width: 100%;height:100%;"></div>
                        </div>
                        <div>
                            <div id="stackBar" style="width: 100%;height:100%;"></div>
                        </div>
                    </div>
                </div>
                <%--左下--%>
                <div class="moduleLabelStyle">
                    <div class="topSign" style="width: 12%"><span>渠 道</span></div>
                    <div style="margin-left: 250px;">
                        <template>
                            <el-select v-model="irrigationModule2Val" id="elSelect" @change="irrigationModule2Click"  placeholder="请选择">
                                <el-option v-for="item in irrigationDownSelect" :key="item.canalCode" :label="item.canalName" :value="item.canalCode"></el-option>
                            </el-select>
                        </template>
                        <el-button id="query" @click="handleQueryClick('003')" icon="el-icon-search" circle></el-button>
                    </div>
                </div>
                <div id="aPlanContent">
                    <div>
                        <span v-text="'干渠: '+ irrigationModule2.mainCanal + '条'"></span>
                        <span v-text="'支渠: '+ irrigationModule2.branchCanal + '条'"></span>
                        <span v-text="'提灌: '+ irrigationModule2.liftIrrigation + '个'"></span>
                    </div>
                    <div><span v-text="irrigationModule2Name"></span></div>
                    <div>
                        <table>
                            <tr>
                                <td v-for="(item,index) in irrigationDistrict" :key="index">
                                    <div>
                                        <el-progress type="circle" :percentage="item.percentage" width="95" stroke-width="15" stroke-linecap="butt" color="#03feff"></el-progress>
                                    </div>
                                    <div>
                                        <span v-text="item.waterName"></span>
                                    </div>
                                </td>
                            </tr>
                        </table>
                    </div>
                </div>
            </li>

            <%--中间部分--%>
            <li>
                <%--水库水源--%>
                <div class="moduleLabelStyle">
                    <div class="topSign" style="width: 15%"><span>水库水源监测</span></div>
                    <div style="margin-left: 240px;">
                        <template>
                            <el-select v-model="reservoirModule1Val" id="elSelect" @change="reserWaterClick(reservoirModule1Val,'reservoirList')"  placeholder="请选择">
                                <el-option v-for="item in reservoirList" :key="item.id" :label="item.restName" :value="item.restName"></el-option>
                            </el-select>
                        </template>
                        <el-button id="query" @click="handleQueryClick('005')" icon="el-icon-search" circle></el-button>
                    </div>
                </div>
                <div id="reservoirWater">
                    <div><span>水库水源总量:</span><span>{{reservoirListData.sumWater==null?'0':reservoirListData.sumWater}}&nbsp;m³</span></div>
                    <ul>
                        <li class="useCess" >
                            <div><span v-text="reservoirListData.waterName+'流入量'"></span></div>
                            <div class="processUse">
                                <div align="right" <%--style="width: 40%"--%> v-bind:style="{width:reservoirListData.waterCess}"></div>
                            </div>
                            <div align="center"><span>{{reservoirListData.waterData==null?'0':reservoirListData.waterData}}m³</span></div>
                        </li>
                        <li class="useCess" >
                            <div><span>{{reservoirListData.drpYear}}年降雨量</span></div>
                            <div class="processUse">
                                <div align="right" <%--style="width: 70%"--%> v-bind:style="{width:reservoirListData.drpCess}"></div>
                            </div>
                            <div align="center"><span>{{reservoirListData.drpData==null?'0':reservoirListData.drpData}}m³</span></div>
                        </li>
                    </ul>
                </div>
                <%--水库库容--%>
                <div id="reservoirCapacity">
                    <div><span v-text="reservoirModule1Name+'实时库容:'"></span><span>&nbsp;&nbsp;3675985m³</span></div>
                    <div>
                        <div id="RLC_DayLine" style="width: 100%;height:100%;"></div>
                    </div>
                    <ul>
                        <li v-bind:style="{color:moduleSwitchSecond=='0'?'#d3d3e0':'#146fc7'}" style="font-family: '宋体';cursor: pointer;" @click="moduleSwitchSecondSelect(0)">较上年库容日比较柱状图</li>
                        <li style="margin:-15px 10px 0 10px"><img src="${ctxstc}/images/bigData/verline.png"/></li>
                        <li v-bind:style="{color:moduleSwitchSecond=='1'?'#d3d3e0':'#146fc7'}" style="font-family: '宋体';cursor: pointer;" @click="moduleSwitchSecondSelect(1)">水库浸润线</li>
                    </ul>
                    <div>
                        <div id="compareCapacityBar" v-if="moduleSwitchSecond=='0'" style="width: 100%;height:100%;"></div>
                        <div id="infiltratioLine" v-if="moduleSwitchSecond=='1'" style="width: 100%;height:100%;"></div>
                    </div>
                </div>
                <%--河道水源--%>
                <div id="riverWater">
                    <div>
                        <span>河道水源总量:{{waterCourseListData.sumWater==null?'0':waterCourseListData.sumWater}}&nbsp;m³</span>
                        <div>
                            <template>
                                <el-select v-model="riverModuleVal" id="elSelect" @change="reserWaterClick(riverModuleVal,'waterCourseList')"  placeholder="请选择">
                                    <el-option v-for="(item,index) in waterCourseList" :key="item.id" :label="item.restName" :value="item.restName"></el-option>
                                </el-select>
                            </template>
                            <el-button id="query"<%-- @click="handleQueryClick('001')"--%> icon="el-icon-search" circle></el-button>
                        </div>
                    </div>
                    <ul>
                        <li class="useCess" >
                            <div><span v-text="waterCourseListData.waterName+'流入量'"></span></div>
                            <div class="processUse">
                                <div align="right" <%--style="width: 40%"--%> v-bind:style="{width:waterCourseList.waterCess}"></div>
                            </div>
                            <div align="center"><span>{{waterCourseListData.waterData==null?'0':waterCourseListData.waterData}}m³</span></div>
                        </li>
                        <li class="useCess" >
                            <div><span>{{waterCourseListData.drpYear}}年降雨量</span></div>
                            <div class="processUse">
                                <div align="right" <%--style="width: 70%"--%> v-bind:style="{width:waterCourseListData.drpCess}"></div>
                            </div>
                            <div align="center"><span>{{waterCourseListData.drpData==null?'0':waterCourseListData.drpData}}m³</span></div>
                        </li>
                    </ul>
                </div>
            </li>

            <%--右边部分--%>
            <li>
                <%--水库来水预测--%>
                <div class="moduleLabelStyle">
                    <div class="topSign" style="width: 12%"><span>调 度</span></div>
                    <div style="margin-left: 240px;">
                        <template>
<%--                            <el-select v-model="reservoirModule2Val" id="elSelect" @change="reservoirModule2Click"  placeholder="请选择">
                                <el-option v-for="item in reservoirDownSelect" :key="item.deviceReservoirCode" :label="item.deviceReservoirName" :value="item.deviceReservoirCode"></el-option>
                            </el-select>--%>
                                <el-select v-model="irrigationModule3Val" id="elSelect" @change="handleQueryClick('009')"  placeholder="请选择">
                                    <el-option v-for="item in irrigationDownSelect" :key="item.canalCode" :label="item.canalName" :value="item.canalCode"></el-option>
                                </el-select>
                        </template>
                        <el-button id="query" @click="handleQueryClick('009')" icon="el-icon-search" circle></el-button>
                    </div>
                </div>
                <div id="waterFlowPredict">
                    <div><span v-text="'来水预测:'"></span></div>
                    <div id="waterFlowPredictLine"></div>
                </div>
                <div id="waterRequirement">
                    <div>
                        <div><span>需水提报</span></div>
                        <%--                        <div>
                                                    <template>
                                                        <el-select v-model="irrigationModule3Val" id="elSelect" &lt;%&ndash;@change="handleQueryClick('001')"&ndash;%&gt;  placeholder="请选择">
                                                            <el-option v-for="item in irrigationDownSelect" :key="item.canalCode" :label="item.canalName" :value="item.canalCode"></el-option>
                                                        </el-select>
                                                    </template>
                                                    <el-button id="query"&lt;%&ndash; @click="handleQueryClick('001')"&ndash;%&gt; icon="el-icon-search" circle></el-button>
                                                </div>--%>
                        <div><span>配水计划</span></div>
                    </div>
                    <div>
                        <div id="waterRequirementPie"></div>
                        <div id="waterDistributionPie"></div>
                    </div>
                </div>

                <%--站点监测--%>
                <div class="moduleLabelStyle">
                    <div class="topSign" style="width: 15%"><span>监测站点</span></div>
                    <div class="topRedSign" style="width:15%">
                        <span>预 警</span>
                        <img src="${ctxstc}/images/bigData/warning.png"/>
                    </div>
                    <div style="margin-left: 115px;">
                        <template>
                            <el-select v-model="irrigationModule4Val" id="elSelect" @change="handleQueryClick('012')" @visible-change="siteMonitorSelectVisibleChange($event)"  placeholder="请选择">
                                <el-option v-if="siteMonitorModule.downSelectSwitchFlag==true" v-for="item in irrigationDownSelect" :key="item.canalCode" :label="item.canalName" :value="item.canalCode"></el-option>
                                <el-option v-else="siteMonitorModule.downSelectSwitchFlag==false" v-for="item in sysAreaDownSelect" :key="item.id" :label="item.areaName" :value="item.id"></el-option>
                            </el-select>
                        </template>
                        <el-button id="query" @click="handleQueryClick('012')" icon="el-icon-search" circle></el-button>
                    </div>
                </div>
                <div id="siteMonitor">
                    <div style="height: 10%">
                        <table>
                            <thead>
                            <tr>
                                <td v-for="(item,index) in siteMonitorModule.siteMonitorThead1" v-bind:style="{color:item.fontColor}"
                                    v-text="item.siteName" @click="theadSiteClick(index)"></td>
                            </tr>
                            </thead>
                        </table>
                        <%--                        <table>
                                                    <thead>
                                                        <tr><td v-for="(item,index) in siteMonitorModule.siteMonitorThead2" v-text="item"></td></tr>
                                                    </thead>
                                                </table>--%>
                    </div>
                    <div id="siteMonitorList" style="height: 90%;overflow-y:scroll">
                        <table>
                            <thead>
                            <tr><td v-for="(item,index) in siteMonitorModule.siteMonitorThead2">{{item}}</td></tr>
                            </thead>
                            <tbody >
                            <tr v-for="(item_tr,index) in siteMonitorModule.siteMonitorList">
                                <td v-for="(item_td,idx) in item_tr" v-text="item_td"></td>
                            </tr>
                            <%-- <tr v-for='ts in 4'><td style='color: #0aa699'>1263</td></tr>--%>
                            </tbody>
                        </table>
                    </div>
                </div>
            </li>
        </ul>
    </div>
        <el-dialog title="数据配置页面" :visible.sync="dialogPageVisible" :close-on-click-modal="false" :close-on-press-escape="false">
            <template>
                <el-tabs v-model="activeName" type="card" <%--@tab-click="handleClick"--%>>
                    <el-tab-pane label="水库水源" name="first"></el-tab-pane>
                    <el-tab-pane label="河道水源" name="second"></el-tab-pane>
                </el-tabs>
            </template>
            <div v-if="activeName=='first'" align="center" class="activeFirst">
                <table width="100%" cellspacing="0" cellpadding="0" >
                    <thead>
                    <tr>
                        <td colspan="2" style="color: #008ff5">2019-2020 降雨量：</td>
                        <td><el-input v-model="reservoirDrp" placeholder="降雨量"></el-input></td>
                    </tr>
                    <tr>
                        <td>水库水源名称</td>
                        <td>水量(m³)</td>
                        <td style="width: 20%">操作</td>
                    </tr>
                    </thead>
                    <tbody>
                    <tr v-for="(tab,index) in reservoirList.slice((currentPage-1)*pagesize,currentPage*pagesize)">
                         <td><el-input v-model="tab.restName" placeholder="水库水源名称"></el-input></td>
                         <td><el-input v-model="tab.restWater" placeholder="水量"></el-input> </td>
                         <td>
                             <el-button type="primary" title="添加" v-if="reservoirList.length==(currentPage*pagesize+index-4)" size="mini" icon="el-icon-plus" @click="handleClickPlusDel('reservoirList','add',index)"></el-button>
                             <el-button type="danger" title="删除" size="mini" icon="el-icon-delete" @click="handleClickPlusDel('reservoirList','del',index)"></el-button>
                         </td>
                     </tr>
                    </tbody>
                </table>
                <el-pagination @size-change="handleSizeChange" @current-change="handleCurrentChange" :page-sizes="[10, 20, 30, 40]" :current-page.sync="currentPage" :page-size="pagesize" layout="total, prev, pager, next" :total="reservoirList.length" align="right" style="margin-top:10px;"></el-pagination>
            </div>
            <div v-if="activeName=='second'" align="center" class="activeFirst">
                <table width="100%" cellspacing="0" cellpadding="0" >
                    <thead>
                    <tr>
                        <td colspan="2" style="color: #008ff5">2019-2020 降雨量：</td>
                        <td><el-input placeholder="降雨量" v-model="waterDrp"></el-input></td>
                    </tr>
                    <tr>
                        <td>河道水源名称</td>
                        <td>水量(m³)</td>
                        <td style="width: 20%">操作</td>
                    </tr>
                    </thead>
                    <tbody>
                    <tr v-for="(tab,index) in waterCourseList.slice((currentPage-1)*pagesize,currentPage*pagesize)">
                        <td><el-input v-model="tab.restName" placeholder="河道水源名称"></el-input></td>
                        <td><el-input v-model="tab.restWater" placeholder="水量"></el-input> </td>
                        <td>
                            <el-button type="primary" title="添加" v-if="waterCourseList.length==(currentPage*pagesize+index-4)" size="mini" icon="el-icon-plus" @click="handleClickPlusDel('waterCourseList','add',index)"></el-button>
                            <el-button type="danger" title="删除" size="mini" icon="el-icon-delete" @click="handleClickPlusDel('waterCourseList','del',index)"></el-button>
                        </td>
                    </tr>
                    </tbody>
                </table>
                <el-pagination @size-change="handleSizeChange" @current-change="handleCurrentChange" :page-sizes="[10, 20, 30, 40]" :current-page.sync="currentPage" :page-size="pagesize" layout="total, prev, pager, next" :total="waterCourseList.length" align="right" style="margin-top:10px;"></el-pagination>
            </div>

            <span slot="footer" class="dialog-footer">
                <el-button @click="dialogPageVisible = false">关 闭 窗 口</el-button>
                <el-button type="primary" @click="handleClickSubMit">确 定 提 交</el-button>
            </span>
        </el-dialog>
        <%--<el-dialog title="配置页面" :visible.sync="dialogPageVisible">
            <template>
                <el-tabs v-model="activeName" type="card" &lt;%&ndash;@tab-click="handleClick"&ndash;%&gt;  style="">
                    <el-tab-pane label="来水预测" name="first">
                        <iframe src="/surface_water/big_data_config/comeWaterModule" width="100%" height="100%" frameborder="0" name="right" scrolling="no"></iframe>
                    </el-tab-pane>
                    <el-tab-pane label="需水/配水" name="second">
                        <iframe src="/surface_water/big_data_config/requiteModule" width="100%" height="93.5%" frameborder="0" name="right" scrolling="no"></iframe>
                    </el-tab-pane>
                </el-tabs>
            </template>
        </el-dialog>--%>

</div>

</body>
<script src="${ctxstc}/js/custom/bigData/bigData.js"></script>
<script src="${ctxstc}/js/custom/bigData/bigDataConfig.js"></script>
</html>