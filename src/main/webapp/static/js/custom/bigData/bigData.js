var curWwwPath = window.document.location.href;
var pathName = window.document.location.pathname;
var pos = curWwwPath.indexOf(pathName);
var localhostPaht = curWwwPath.substring(0,pos);
var projectName = pathName.substring(0,pathName.substr(1).indexOf('/')+1);
var ctxPath = localhostPaht + projectName;
var peopTabs;
var stackDayOrMonthEcharts;//日饮水量曲线图
var stackBarEcharts; //总用水量柱状图
var compareDayLineEcharts;//库水位库容日变化曲线图
var capacityBarEcharts;//较上年库容日比较柱状图
var infiltratioLineEcharts;//水库浸润线
var predictLineEcharts;//水库来水预测
var requirementPieEcharts;//需水提报
var distributionPieEcharts;//配水计划
var bigData = new Vue({
    el:'#bigData',
    data:{
        /*header*/
        nowTime:'',//顶部时间
        week:'',//星期几
        title:'高台县',//标题
        clockTime:null,//时间定时器
        cityid:'101160701',//额济纳旗的行政区ID
        weather:'',//顶部右上角天气
        weatherImg:'',//天气的各种图片
        irrigationDownSelect:[],//灌区下拉框
        irrigationModule1Val:'',
        irrigationModule2Val:'',
        irrigationModule2Name:'',
        irrigationModule3Val:'',
        irrigationModule4Val:'',
        reservoirDownSelect:[],//水库下拉框
        reservoirModule1Val:'',
        reservoirModule1Name:'',
        reservoirModule1RiverName:'',
        reservoirModule2Val:'',
        reservoirModule2Name:'',
        riverDownSelect:['黑河'],//河道下拉框
        riverModuleVal:'',
        sysAreaDownSelect:[],//行政区下拉框
        /*左边模块*/
        moduleSwichFirst:0,//区分是否日引（0）水曲线还是月引水曲线（1）
        useWaterLine:'',//引水量曲线
        useWaterLineList:{},//引水量数据的数组
        totalUseWaterDiversion:{
            dailyWaterDiversion:0,//日引水量
            monthlyWaterDiversion:0,//月引水量
            annualWaterDiversion:0,//年引水量
            totalUseWaterLineList:{},//总引水量数据的数组
        },
        irrigationModule2:{
            mainCanal:'',//干渠
            branchCanal:'',//支渠
            liftIrrigation:0,//提灌
            irrigationDistrictList:[],//灌区下各干渠引水量数组
            irrigationTotalFlow:0,//该灌区总引水量
        },
        irrigationDistrictArray:[],//页面展示的各干渠引水量数组总个数
        irrigationDistrict:[],//页面展示的各干渠引水量数组分量
        mainChannelUseWaterTimer:{},//干渠引水量切换任务任务
        /*中间模块*/
        moduleSwitchSecond:0,//较上年库容日比较柱状图（0）水库浸润线（1）
        RLC_DayLineList:{},
        compareCapacityBarList:{},
        reservoirWaterSource:{
            reservoirModule1RiverName:'',
            riverInFlowPercent:'',
            rainInFlowPercent:'',
        },
        waterMonitoring:{ //中间水源监测模块
            reservoirWater:[
                {reservoirModule1RiverName:'大野口河',riverInFlowPercent:'60%',rainInFlowPercent:'20%'},
                {reservoirModule1RiverName:'酥油口河',riverInFlowPercent:'80%',rainInFlowPercent:'5%'},
                {reservoirModule1RiverName:'梨园河',riverInFlowPercent:'60%',rainInFlowPercent:'20%'},
            ],
            compareDayLineEchartsData:{//水库库水位库容日变化曲线图数据
                dayXsiaData:['0:00-1:00','1:00-2:00','2:00-3:00','3:00-4:00','4:00-5:00','5:00-6:00','6:00-7:00','7:00-8:00','8:00-9:00','9:00-10:00','10:00-11:00','11:00-12:00',
                    '12:00-13:00','13:00-14:00','14:00-15:00','15:00-16:00','16:00-17:00','17:00-18:00','18:00-19:00','19:00-20:00','20:00-21:00','21:00-22:00','22:00-23:00','23:00-24:00'],
                dayYsiaDataA:[
                    [0, 0, 0, 0, 0, 0, 0, 0, 0, 0,0, 0, 0, 0, 0, 0, 0, 0, 0, 0,0, 0, 0, 0, 0, 0, 0, 0, 0, 0]
                ],
                dayYsiaDataB:[
                    [0, 0, 0, 0, 0, 0, 0, 0, 0, 0,0, 0, 0, 0, 0, 0, 0, 0, 0, 0,0, 0, 0, 0, 0, 0, 0, 0, 0, 0]
                ]
            },
            capacityBarEchartsData:{//较上年库容日比较柱状图数据
                dayXsiaData:['1日','2日','3日','4日','5日','6日','7日','8日','9日','10日','11日','12日', '13日','14日','15日','16日','17日','18日','19日','20日','21日','22日','23日','24日','25日','26日','27日','28日','29日','30日'],
                dayYsiaDataA:[
                    [0, 0, 0, 0, 0, 0, 0, 0, 0, 0,0, 0, 0, 0, 0, 0, 0, 0, 0, 0,0, 0, 0, 0, 0, 0, 0, 0, 0, 0]
                ],
                dayYsiaDataB:[
                    [0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0,0, 0, 0, 0, 0, 0, 0, 0, 0, 0]
                ]
            },
            infiltratioLineEchartsData:{//水库浸润线数据
                dayXsiaData:['坝顶坝体','一级马道坝体','二级马道坝体'],
                dayYsiaDataA:[
                    [0,0,0]
                ],
                dayYsiaDataB:[
                    [0,0,0]
                ],
            },
        },

        /*右边模块*/
        waterFlowPredictLineList:{},//水库来水预测
        waterRequirementPieList:{},//需水提报的数组
        waterDistributionPieList:{},//配水计划的数组
        siteMonitorModule:{//监测站点模块
            siteSwitchTimer:{},//站点切换定时任务
            siteDataScrollTimer:{},//站点数据定时滚动任务
            siteMonitorThead1:[
                {siteName:'雷达站',fontColor:'#fff'},
                {siteName:'明渠站',fontColor:'#1365c1'},
                {siteName:'视频站',fontColor:'#1365c1'},
                {siteName:'闸门站',fontColor:'#1365c1'},
/*                {siteName:'水质监测站',fontColor:'#1365c1'},
                {siteName:'气象站',fontColor:'#1365c1'},
                {siteName:'墒情站',fontColor:'#1365c1'},
                {siteName:'蒸发站',fontColor:'#1365c1'},*/
            ],
            /*siteMonitorThead1:['雷达站','明渠站','视频站','闸门站','水质监测站','气象站','墒情站','蒸发站'],*/
            siteMonitorThead2:[],
            siteMonitorList:[],//监测站点模块的数组
            siteMonitorIndex:0,//当前所在站点下标
            downSelectSwitchFlag:true,//默认初始化不变的下标
            siteMonitorTimerFlag:false,//判断定时任务是否开启flag
        },
        dialogPageVisible:false,
        activeName:'first',
        pagesize:5,
        currentPage:1,
        reservoirList:[],//水库水源
        reservoirDrp:'0',//水库降雨量
        waterCourseList:[],//河道水源
        waterDrp:'0',//河道降雨量
        reservoirListData:{//水库水源数据监测
            sumWater:'',
            waterName:'',
            waterData:'',
            waterCess:'',
            drpYear:'',
            drpData:'',
            drpCess:'',
        },
        waterCourseListData:{//河道水源数据监测

        },
        timerDataReser:0,
        timerDataWater:0,
    },
    methods:{
        //天气API
        weatherAPI:function () {
            var _this = this;
            _this.clockTime = setInterval("refreshClock()",1000);//开启时钟定时器
            var url = 'https://tianqiapi.com/api?version=v6&appid=57276933&appsecret=6963znIW&cityid='+_this.cityid;//和调用天气的API
            $.get(url,function(data){
                debugger
                _this.weatherImg = data.wea_img;
                _this.weather = "\r\n"+data.wea+"\r\n"+data.win+"\r\n"+data.win_speed+"\r\n"+"气温\r\n"+data.tem+"°"+"\r\n空气质量\r\n"+data.air_level+"\r\nPM2.5:\r\n"+data.air_pm25;
            });
        },

        /*分页方法*/
        handleSizeChange:function(size){
            var _this = this;
            _this.pagesize = size;
        },
        /*分页方法*/
        handleCurrentChange:function(currentpage){
            var _this = this;
            _this.currentPage = currentpage;
        },
        peopTabsTimerData:function(){
            var _this = this;
            debugger
            for(var i = 0;i<2;i++){
                var sign = i==0?'reservoirList':'waterCourseList';
                var timer = i==0?'timerDataReser':'timerDataWater';
                timer = _this[timer];
                _this[sign+"Data"].sumWater = _this[sign][timer].sumWater;
                _this[sign+"Data"].waterName = _this[sign][timer].restName;
                _this[sign+"Data"].waterData = _this[sign][timer].restWater;
                 _this[sign+"Data"].waterCess = _this[sign][timer].restWater/_this[sign].sumWater*100;
                 _this[sign+"Data"].drpYear = _this[sign][timer].year;
                 _this[sign+"Data"].drpData = _this[sign][timer].drp;
                 _this[sign+"Data"].drpCess = _this[sign][timer].drp/_this[sign].sumWater*100;
            }
            _this.timerDataReser+=1;
            _this.timerDataWater+=1;
            if(_this.timerDataReser == _this.reservoirList.length){
                _this.timerDataReser = 0;
            }
            if(_this.timerDataWater == _this.waterCourseList.length){
                _this.timerDataWater = 0;
            }
        },
        //查询水库水源的list和河道水源的List
        handleClickVityList:function(){
            var _this = this;
            debugger
            $.post(ctxPath + "/big_data_config/config_data_query","",function(result){
                debugger
                if(result!=null&&result!=""){
                    result = JSON.parse(result);
                    _this.reservoirList = result.reservoirList;
                    _this.waterCourseList = result.waterCourseList;
                    if(_this.reservoirList.length==0){
                        _this.reservoirList.push({restName:'',restWater:0});
                    }
                    if(_this.waterCourseList.length==0){
                        _this.waterCourseList.push({restName:'',restWater:0});
                    }
                }
                _this.peopTabsTimerData();
            });

        },

        //配置数据查询
        handleClickMethod:function(sign,restName){
            var _this = this;
            debugger
            $.post(ctxPath + "/big_data/selTyQuery",{sign:sign,restName:restName},function(result){
                if(typeof (result[sign])=='undefined'){//水库水源
                    _this[sign].push({restName:'',restWater:0});
                }else{
                    _this[sign] = result[sign];
                }
            });
        },
        reserWaterClick:function(sign,type){
            var _this = this;
            debugger
            for(var i=0;i<_this[type].length;i++){
                if(_this[type][i].restName==sign){
                    _this[type+"Data"].sumWater = _this[type][i].restWater;
                    _this[type+"Data"].waterName = _this[type][i].restName;
                    _this[type+"Data"].waterData = _this[type][i].restWater;
                    _this[type+"Data"].waterCess = _this[type][i].restWater/_this[sign].sumWater*100;
                    _this[type+"Data"].drpYear = _this[type][i].year;
                    _this[type+"Data"].drpData = _this[type][i].drp;
                    _this[type+"Data"].drpCess = _this[type][i].drp/_this[sign].sumWater*100;
                }
            }
        },
        /**
         * 新增或删除某记录
         */
        handleClickPlusDel:function(sign,type,index){
            var _this = this;
            debugger
            var index = _this.pagesize*_this.currentPage+index-_this.pagesize;
            switch (type) {
                case 'add':
                    if(sign=='waterCourseList'){
                        if(_this[sign][index].EnginName==""){
                            _this.onMessage("请将信息填写完整...","warning");
                            return;
                        }
                        _this[sign].push({restName:'',restWater:0});
                    }else if(sign=="reservoirList"){
                        if(_this[sign][index].restName==""){
                            _this.onMessage("请将信息填写完整...","warning");
                            return;
                        }
                        _this[sign].push({restName:'',restWater:0});
                    }
                    break;
                case 'del':
                    if(_this[sign][index].id!="" && typeof (_this[sign][index].id)!='undefined'){
                        $.post(ctxPath + "/big_data_config/water_moniter_delete",{id:_this[sign][index].id},function(result){
                            if(result==1){
                                _this.onMessage("数据已删除...","success");
                            }
                        });
                    }
                    _this[sign].splice(index,1);
                    break;
            }
        },
        /**
         * 提交弹框内的修改和新增信息
         */
        handleClickSubMit:function(){
            var _this = this;
            $.post(ctxPath + "/big_data_config/enWscInsert",{reservoirList:JSON.stringify(_this.reservoirList),waterCourseList:JSON.stringify(_this.waterCourseList),reservoirDrp:_this.reservoirDrp,waterDrp:_this.waterDrp},function(result){
                if(result==1){
                    _this.onMessage("数据已更改...","success");
                    _this.handleClickVityList();
                }else{
                    _this.handleClickVityList();
                }
                _this.dialogPageVisible = false;
            });
        },
        /**
         * 消息弹出框
         */
        onMessage:function (text,icon){
            var _this = this;
            _this.$message({
                showClose: true,
                message: text,
                type: icon,
                duration:1500
            });
        },
        /**
         * 查询方法（公共）
         */
        handleQueryClick:function(sign){
            var _this = this;
            switch (sign) {
                case '001'://日/月引水量
                    _this.handlePostQuerty(_this.moduleSwichFirst=='0'?'/day_water_consumption_query':'/month_water_consumption_query',{canalCode:_this.irrigationModule1Val},"useWaterLineList","useWaterLine");
                    break;
                case '002'://总用水量
                    _this.handlePostQuerty('/total_water_consumption_query',{canalCode:_this.irrigationModule1Val},"totalUseWaterLineList","totalUseWaterLine");
                    break;
                case '003'://干渠引水量
                    _this.handlePostQuerty('/main_channel_consumption_query',{canalCode:_this.irrigationModule2Val},"","mainChannelUseWater");
                    break;
                case '004'://水库水源
                    _this.reservoirWaterSource.reservoirModule1RiverName = _this.waterMonitoring.reservoirWater[0].reservoirModule1RiverName;
                    _this.reservoirWaterSource.riverInFlowPercent = _this.waterMonitoring.reservoirWater[0].riverInFlowPercent;
                    _this.reservoirWaterSource.rainInFlowPercent = _this.waterMonitoring.reservoirWater[0].rainInFlowPercent;
                    break;
                case '005'://库水位库容日变化曲线图
                    _this.handlePostQuerty('/reservoir_capacity_day_change',{reservoirCode:_this.reservoirModule1Val},"RLC_DayLineList","RLC_DayLine");
                    if(_this.moduleSwitchSecond == '0'){
                        _this.handleQueryClick('006')
                    }else{
                        _this.handleQueryClick('007')
                    }
                    break;
                case '006'://较上年库容日比较柱状图
                    _this.handlePostQuerty('/reservoir_capacity_day_compare',{reservoirCode:_this.reservoirModule1Val},"compareCapacityBarList","compareCapacityBar");
                    break;
                case '007'://水库浸润线 /reservoir_infiltration_line
                    _this.handlePostQuerty('','',"infiltratioLineList","infiltratioLine");
                    break;
                case '008'://河道水源

                    break;
                case '009'://来水预测
                    _this.handlePostQuerty('/water_flow_predict_query',{canalCode:_this.irrigationModule3Val},"waterFlowPredictLineList","waterFlowPredictLine");
                    break;
                case '010'://需水提报
                    _this.handlePostQuerty('/water_require_plan_query',{canalCode:_this.irrigationModule3Val},"waterRequirementPieList","waterRequirementPie");
                    break;
                case '011'://配水计划
                    _this.handlePostQuerty('','',"waterDistributionPieList","waterDistributionPie");
                    break;
                case '012'://站点监测
                    _this.handlePostQuerty('/site_monitor_query',{downSelectVal:_this.irrigationModule4Val,index:_this.siteMonitorModule.siteMonitorIndex},"siteMonitorList","siteMonitor");
            }
        },

        //post请求的封装方法
        handlePostQuerty:function(url,data,sign,type){
            var _this = this;
            if(url == ''){
                url = '/data';//TODO
            }
            if(data == ''){
                data = '';//TODO
            }
            $.post(ctxPath + "/big_data"+url,data,function(result){
                // if(result!=""&&result!=null){
                // _this[sign] = JSON.parse(result);
                let resultData = '';
                switch (type) {
                    case 'useWaterLine'://日/月引水量曲线图
                        resultData = JSON.parse(result);
                        stackDayOrMonthEchartsShow(resultData);
                        break;
                    case 'totalUseWaterLine'://总用水量柱状图
                        resultData = JSON.parse(result);
                        _this.totalUseWaterDiversion.dailyWaterDiversion = resultData.dailyWaterDiversion[0];//日引水量
                        _this.totalUseWaterDiversion.monthlyWaterDiversion = resultData.monthlyWaterDiversion[0];//月引水量
                        _this.totalUseWaterDiversion.annualWaterDiversion = resultData.annualWaterDiversion[0];//年引水量
                        stackBarEchartsShow(resultData);
                        break;
                    case 'mainChannelUseWater'://干渠引水量
                        resultData = JSON.parse(result);
                        _this.handleMainChannelUseWater(resultData);
                        break;
                    case 'RLC_DayLine':
                        // resultData = JSON.parse(result);
                        compareDayLineEchartsShow(resultData);//库水位库容日变化曲线图
                        break;
                    case 'compareCapacityBar':
                        // resultData = JSON.parse(result);
                        capacityBarEchartsShow(resultData);//较上年库容日比较柱状图
                        break;
                    case 'infiltratioLine':
                        infiltratioLineEchartsShow();
                        break;
                    case 'waterFlowPredictLine':
                        resultData = JSON.parse(result);
                        predictLineEchartsShow(resultData);//水库来水预测
                        break;
                    case 'waterRequirementPie':
                        resultData = JSON.parse(result);
                        requirementPieEchartsShow(resultData);//需水提报
                        distributionPieEchartsShow(resultData);//配水计划
                        break;
                    case 'waterDistributionPie':
                        // distributionPieEchartsShow();//配水计划
                        break;
                    case 'siteMonitor':
                        resultData = JSON.parse(result);
                        _this.siteSwitchTimerStart(resultData);//站点监测站点切换定时任务开启
                        _this.siteDataScrollTimerStart();//站点监测数据滚动定时任务开启
                        break;
                }
                // }
            })
        },

        //下拉框数据查询
        dropDownBoxQuery:function () {
            var _this = this;
            $.ajaxSettings.async = false
            //灌区下拉选
            $.post(ctxPath + "/big_data/down_select_irrigation_query",function(result){
                if(result != null){
                    _this.irrigationDownSelect = JSON.parse(result);
                    _this.irrigationModule1Val = _this.irrigationDownSelect[0].canalCode;
                    _this.irrigationModule2Val = _this.irrigationDownSelect[0].canalCode;
                    _this.irrigationModule3Val = _this.irrigationDownSelect[0].canalCode;
                    _this.irrigationModule4Val = _this.irrigationDownSelect[0].canalCode;
                    _this.irrigationModule2Name = _this.irrigationDownSelect[0].canalName;
                    _this.dropDownBoxQueryAfterMethod('irrigation');
                    _this.dropDownBoxQueryAfterMethod('reservoir');//TODO
                }
            });
            //水库下拉选
            /*            $.post(ctxPath + "/big_data/down_select_reservoir_query",function(result){
                            if(result != null){
                                _this.reservoirDownSelect = JSON.parse(result);
                                _this.reservoirModule1Val = _this.reservoirModule2Val = _this.reservoirDownSelect[0].deviceReservoirCode;
                                _this.reservoirModule1Name = _this.reservoirModule2Name =  _this.reservoirDownSelect[0].deviceReservoirName;
                            }
                            _this.dropDownBoxQueryAfterMethod('reservoir');
                        });*/
            //河道下拉选
            $.post(ctxPath + "/big_data/down_select_river_query",function(result){
                if(result != null){
                    // _this.riverDownSelect = JSON.parse(result);
                    //_this.riverModuleVal = _this.riverDownSelect[0];//TODO
                }
            });
            //行政区下拉选
            $.post(ctxPath + "/big_data/down_select_sysArea_query",function(result){
                if(result != null){
                    _this.sysAreaDownSelect = JSON.parse(result);
                }
            });
            $.ajaxSettings.async = true;
        },
        dropDownBoxQueryAfterMethod:function (sign) {
            var _this = this;
            if(sign == 'irrigation'){
                _this.handleQueryClick('001');
                _this.handleQueryClick('002');
                _this.handleQueryClick('003');
                _this.handleQueryClick('009');//TODO
                _this.handleQueryClick('010');
                // _this.handleQueryClick('011');
                _this.handleQueryClick('012');
            }else if(sign == 'reservoir'){
                // _this.handleQueryClick('004');
                _this.handleQueryClick('005');
                _this.handleQueryClick('006');
                // _this.handleQueryClick('007');
                //_this.handleQueryClick('009');
            }else{
                _this.handleQueryClick('008');
            }
        },
        /*水资源曲线模块-------------------START--------------------*/
        //日饮水量曲线图与月引水量曲线图切换
        moduleSwitchFirstSelect:function (sign) {
            var _this = this;
            _this.moduleSwichFirst = sign;
            _this.handleQueryClick('001');
        },
        /*水资源曲线模块------------------END----------------------*/

        /*渠道模块----------------------START---------------------*/
        //左下角干渠引水量下拉框点击事件
        irrigationModule2Click:function(event){
            var _this = this;
            let obj = _this.irrigationDownSelect.find(function(item){
                return item.canalCode === event
            });
            _this.irrigationModule2Name = obj.canalName;
            _this.mainChannelUseWaterTimerStop();//干渠引水量切换任务任务关闭
            _this.irrigationDistrict = [];
            _this.handleQueryClick('003');
        },
        //左下角干渠引水量
        handleMainChannelUseWater:function (resultData) {
            var _this = this;
            _this.irrigationDistrict = [];
            //干渠数量
            _this.irrigationModule2.mainCanal = resultData.mainCanalNum;
            //支渠数量
            _this.irrigationModule2.branchCanal = resultData.branchCanalNum;
            //提灌数量
            _this.irrigationModule2.liftIrrigation = resultData.liftIrrigationNum;
            //灌区下各干渠引水量数组
            _this.irrigationModule2.irrigationDistrictList = resultData.irrigationDistrictList;
            let irrigationData = _this.irrigationModule2.irrigationDistrictList;
            //该灌区总引水量
            _this.irrigationModule2.irrigationTotalFlow = resultData.irrigationTotalFlow;
            //数据封装
            for(let i=1; i<=irrigationData.length; i++){
                _this.irrigationDistrict.push(irrigationData[i-1]);
                if(i%4 == 0 || i == irrigationData.length){
                    _this.irrigationDistrictArray.push(_this.irrigationDistrict);
                    _this.irrigationDistrict = [];
                }
            }
            _this.irrigationDistrict = _this.irrigationDistrictArray[0];
            // _this.mainChannelUseWaterTimerStart();//干渠引水量切换任务任务开启
        },
        //渠道引水量滚动定时任务开启
        mainChannelUseWaterTimerStart:function () {
            var _this = this;
            let length = _this.irrigationDistrictArray.length;
            let count = 1;
            _this.mainChannelUseWaterTimer = setInterval(function () {
                for(let i=0; i < _this.irrigationDistrictArray[count].length; i++){
                    _this.$set(_this.irrigationDistrict,i,_this.irrigationDistrictArray[count][i]);
                }
                count += 1;
                if(count == length){
                    count=0;
                }
            }, 5000);
        },
        //渠道引水量滚动定时任务停止
        mainChannelUseWaterTimerStop:function () {
            var _this = this;
            window.clearInterval(_this.mainChannelUseWaterTimer);
        },
        /*渠道模块--------------------END-----------------------*/

        /*水源监测模块------------------------START---------------------------*/
        //较上年库容日比较柱状图与水库浸润线切换事件
        moduleSwitchSecondSelect:function(sign){
            var _this = this;
            _this.moduleSwitchSecond = sign;
            if(sign == '0'){
                _this.handleQueryClick('006');
            }else{
                _this.handleQueryClick('007');
            }
        },
        //中间水源监测下拉框点击事件
        reservoirModule1Click:function(event){
            var _this = this;
            let obj = _this.reservoirDownSelect.find(function(item){
                return item.deviceReservoirCode === event
            });
            _this.reservoirModule1Name = obj.deviceReservoirName;
            switch (_this.reservoirModule1Val) {
                case "620722000001":
                    _this.reservoirWaterSource.reservoirModule1RiverName = _this.waterMonitoring.reservoirWater[0].reservoirModule1RiverName;
                    _this.reservoirWaterSource.riverInFlowPercent = _this.waterMonitoring.reservoirWater[0].riverInFlowPercent;
                    _this.reservoirWaterSource.rainInFlowPercent = _this.waterMonitoring.reservoirWater[0].rainInFlowPercent;
                    break;
                case "620722000002":
                    _this.reservoirWaterSource.reservoirModule1RiverName = _this.waterMonitoring.reservoirWater[1].reservoirModule1RiverName;
                    _this.reservoirWaterSource.riverInFlowPercent = _this.waterMonitoring.reservoirWater[1].riverInFlowPercent;
                    _this.reservoirWaterSource.rainInFlowPercent = _this.waterMonitoring.reservoirWater[1].rainInFlowPercent;
                    break;
                case "620722000003":
                    _this.reservoirWaterSource.reservoirModule1RiverName = _this.waterMonitoring.reservoirWater[2].reservoirModule1RiverName;
                    _this.reservoirWaterSource.riverInFlowPercent = _this.waterMonitoring.reservoirWater[2].riverInFlowPercent;
                    _this.reservoirWaterSource.rainInFlowPercent = _this.waterMonitoring.reservoirWater[2].rainInFlowPercent;
                    break;
            }
            _this.handleQueryClick('005');
        },
        /*水源监测模块------------------------END---------------------------*/

        /*调度模块------------------------START---------------------------*/
        reservoirModule2Click:function(event){
            var _this = this;
            let obj = _this.reservoirDownSelect.find(function(item){
                return item.deviceReservoirCode === event
            });
            _this.reservoirModule2Name = obj.deviceReservoirName;
            _this.handleQueryClick('009');
        },
        /*调度模块------------------------END---------------------------*/

        /*站点监测--------------------START-----------------------*/
        siteMonitorSelectVisibleChange:function(event){
            var _this = this;
            debugger
            if(event){
                this.siteSwitchTimerStop();//站点监测站点切换定时任务停止
                this.siteDataScrollTimerStop(); //站点监测数据滚动定时任务停止
            }else{
                setTimeout(function () {
                    if(_this.siteMonitorModule.siteMonitorTimerFlag == false){//定时任务未开启
                        _this.siteSwitchTimerStart(_this.siteMonitorModule);//站点监测站点切换定时任务开启
                        _this.siteDataScrollTimerStart(); //站点监测数据滚动定时任务开启
                    }
                },5000)
            }
        },
        //站点点击事件
        theadSiteClick:function(index){
            var _this = this;
            //灌区
            if(index == 0 || index == 1 || index == 2 || index == 3){
                _this.irrigationModule4Val = _this.irrigationDownSelect[0].canalCode;
                _this.siteMonitorModule.downSelectSwitchFlag =true;
            }else{//行政区
                _this.irrigationModule4Val = _this.sysAreaDownSelect[0].id;
                _this.siteMonitorModule.downSelectSwitchFlag =false;
            }
            _this.siteDataScrollTimerStop(); //站点监测数据滚动定时任务停止
            _this.siteSwitchTimerStop();//站点监测站点切换定时任务停止
            _this.siteMonitorModule.siteMonitorIndex = index;
            _this.siteMonitorModule.siteMonitorList = [];
            let len = _this.siteMonitorModule.siteMonitorThead1.length;
            for(let i = 0; i < len; i++){
                _this.$set(_this.siteMonitorModule.siteMonitorThead1[i],'fontColor','#1365c1');
            }
            _this.$set(_this.siteMonitorModule.siteMonitorThead1[index],'fontColor','#fff');
            _this.handleQueryClick('012');
        },
        //站点监测站点切换定时任务开启
        siteSwitchTimerStart:function(resultData){
            var _this = this;
            _this.siteMonitorModule.siteMonitorThead2 = resultData.siteMonitorThead2;
            _this.siteMonitorModule.siteMonitorList = resultData.siteMonitorList;
            let len =2;
            if(resultData.siteMonitorList != null){
                len =resultData.siteMonitorList.length;
            }
            _this.siteMonitorModule.siteSwitchTimer = setInterval(function () {
                if(_this.siteMonitorModule.siteMonitorIndex ==_this.siteMonitorModule.siteMonitorThead1.length-1){
                    _this.siteMonitorModule.siteMonitorIndex = -1;
                }
                _this.siteMonitorModule.siteMonitorIndex += 1;
                _this.theadSiteClick(_this.siteMonitorModule.siteMonitorIndex);
            }, len*2000+1000);
            _this.siteMonitorModule.siteMonitorTimerFlag = true;
        },
        //站点监测站点切换定时任务停止
        siteSwitchTimerStop:function(){
            var _this = this;
            window.clearInterval(_this.siteMonitorModule.siteSwitchTimer);
            _this.siteMonitorModule.siteMonitorTimerFlag = false;
        },

        //站点监测数据滚动定时任务开启
        siteDataScrollTimerStart:function () {
            var _this = this;
            _this.siteMonitorModule.siteDataScrollTimer = setInterval(function () {
                _this.scrollSiteMonitor();
            }, 2000);
            _this.siteMonitorModule.siteMonitorTimerFlag = true;
        },
        //站点监测数据滚动定时任务停止
        siteDataScrollTimerStop:function () {
            var _this = this;
            window.clearInterval(_this.siteMonitorModule.siteDataScrollTimer);
            _this.siteMonitorModule.siteMonitorTimerFlag = false;
        },
        //站点监测数据滚动
        scrollSiteMonitor:function () {
            var _this = this;
            var $news = $('#siteMonitorList tbody');
            var $lineHeight = $news.find('tr:first');
            $lineHeight.animate({height: 'hide', opacity: 'hide'}, 'normal',function(){
                $news.css({ margin: 0 }).find('tr:first').appendTo($news);
                $('#siteMonitorList tbody tr:last-child').css({ display: "table-row" })
            });
        },
        /*站点监测--------------------------END-------------------------------*/

    },
    created:function(){
        var _this = this;
        _this.weatherAPI();//天气API查询
    },
    mounted:function(){
        var _this = this;
        _this.handleClickVityList();
        setTimeout(function(){
            _this.dropDownBoxQuery();//下拉框数据查询
            peopTabs = setInterval(function () {_this.peopTabsTimerData();}, 3200);//工程管理的定时滚动
        },100);
    }
});

window.onresize = function () {
    requirementPieEcharts.resize();//需水提报
    distributionPieEcharts.resize();//配水计划
    predictLineEcharts.resize();//水库来水预测
    stackDayOrMonthEcharts.resize();//日饮水量曲线图
    stackBarEcharts.resize(); //总用水量柱状图
    compareDayLineEcharts.resize();//库水位库容日变化曲线图
    capacityBarEcharts.resize();//较上年库容日比较柱状图
    infiltratioLineEcharts.resize();//水库浸润线
}

/**
 * 初始化加载定时任务的时钟
 * @returns
 */
function refreshClock(){
    var myDay = new Date().getDay();
    var week = ['星期日','星期一','星期二','星期三','星期四','星期五','星期六'];
    bigData.week = '\r\n'+week[myDay];
    bigData.nowTime = moment(new Date()).format('YYYY 年 MM 月 DD 日 HH:mm')+'\r\n';

}

//日引水量曲线图
function stackDayOrMonthEchartsShow(resultData) {
    stackDayOrMonthEcharts = echarts.init(document.getElementById('stackDayOrMonthLine'));
    // let legend = ['2020/5/18用量','2020/3/20用量'];
    // let dayXsiaData = ['01:20','03:15','04:15','05:15','06:15','07:15','08:15'];
    // let dayYsiaDataA = [500,1000,500,1000,500,1000,500];
    // let dayYsiaDataB = [300,1200,800,600,1200,900,400];
    let legend = resultData.legend;
    let dayXsiaData = resultData.dayXsiaData;
    let dayYsiaDataA = resultData.dayYsiaDataA;
    let dayYsiaDataB = resultData.dayYsiaDataB;
    option = {
        color:['#1d96fe','#29e191'],
        tooltip: {
            trigger: 'axis',
            axisPointer: {
                type: 'cross',
                //xy轴十字架指示数值背景区域色
                label: {
                    backgroundColor: '#6a7985'
                }
            },
            textStyle:{
                align:'left',
                position:'absolute'
            },
        },
        legend: {
            data: legend,
            textStyle: {
                color: '#8db0ef',
            },
            x:'15%',
            y:'8%',
            icon:'roundRect',
            itemGap:20,
        },
        grid: {
            top:'20%',
            left: '3%',
            right: '4%',
            bottom: '3%',
            containLabel: true
        },
        xAxis: [
            {
                type: 'category',
                boundaryGap: false,
                data: dayXsiaData,
                axisLine: {
                    show: true,
                    lineStyle: { color: '#1fa1ff'}
                }
            }
        ],
        yAxis: [
            {
                min: 0,
                // max: 140,
                splitNumber: 4,
                splitLine: {
                    show: false,
                },
                axisLine: {
                    show: true,
                    lineStyle: {
                        color: '#1fa1ff',
                    },
                },
                type: 'value',
                axisLabel: {
                    formatter: '{value} m³'
                }
            }
        ],
        series: [
            {
                name: legend[0],
                type: 'line',
                smooth: true, //是否平滑
                symbol: 'none',
                lineStyle: {
                    normal: {
                        color: "#1d96fe",
                    }
                },
                areaStyle: {
                    normal: {
                        color: new echarts.graphic.LinearGradient(
                            0, 0, 0, 1,
                            [
                                {offset: 0,color: 'rgba(3,42,145,0.8)'},
                                {offset: 1,color: 'rgba(3,42,145,0)'}
                            ], false),
                        shadowColor: 'rgba(3,42,145, 0.9)',
                        shadowBlur: 20
                    }
                },
                data: dayYsiaDataA
            },
            {
                name: legend[1],
                type: 'line',
                smooth: true, //是否平滑
                symbol: 'none',
                lineStyle: {
                    normal: {
                        color: "#29e191",
                    }
                },
                areaStyle: {
                    normal: {
                        color: new echarts.graphic.LinearGradient(
                            0, 0, 0, 1,
                            [
                                {offset: 0, color: 'rgba(3,42,145,0.5)'},
                                {offset: 1, color: 'rgba(3,42,145,0)'}
                            ], false),
                        shadowColor: 'rgba(3,42,145, 0.9)',
                        shadowBlur: 20
                    }
                },
                data: dayYsiaDataB
            },
        ]
    };
    stackDayOrMonthEcharts.setOption(option);
}

//总用水量柱状图
function stackBarEchartsShow(resultData) {
    stackBarEcharts = echarts.init(document.getElementById('stackBar'));
    // let legend = ["2019年","2020年"];
    // let dayXsiaData = ['1月','2月','3月','4月','5月','6月','7月','8月','9月','10月','11月','12月',];
    // let dayYsiaDataA = [200,300,500,400,500,600,500,500,600,500,800,600];
    // let dayYsiaDataB = [200,300,500,400,500,600,500,500,600,500,700,600];
    let legend = resultData.legend;
    let dayXsiaData = resultData.dayXsiaData;
    let dayYsiaDataA = resultData.dayYsiaDataA;
    let dayYsiaDataB = resultData.dayYsiaDataB;
    option = {
        title:{
            text:'总用水量柱状图',
            x:'center',
            y:'5%',
            textStyle:{
                color:'#d3d3e0',
                fontSize:15,
            }
        },
        tooltip: {
            trigger: 'axis',
            axisPointer: {            // 坐标轴指示器，坐标轴触发有效
                type: 'shadow'        // 默认为直线，可选为：'line' | 'shadow'
            }
        },
        legend: {
            data: legend,
            textStyle: {
                color: '#8db0ef',
            },
            //图例标记与顶部标题的距离
            bottom:5,
            icon:'roundRect',
            itemGap:50,
        },
        grid: {
            top:'15%',
            left: '3%',
            right: '4%',
            bottom: '15%',
            containLabel: true
        },
        xAxis: [
            {
                type: 'category',
                axisLine: {
                    show: true,
                    lineStyle: { color: '#1fa1ff'}
                },
                data: dayXsiaData
            }
        ],
        yAxis: [
            {
                min: 0,
                // max: 140,
                splitNumber: 4,
                type: 'value',
                splitLine: {
                    show: false,
                },
                axisLine: {
                    show: true,
                    lineStyle: { color: '#1fa1ff'}
                },
                axisLabel: {
                    formatter: '{value} m³'
                }
            }
        ],
        series: [
            {
                barGap: 0,
                name: legend[0],
                type: 'bar',
                barWidth:'15%',
                itemStyle: {
                    color: new echarts.graphic.LinearGradient(
                        0, 0, 0, 1,
                        [
                            {offset: 0, color: '#69f4f1'},
                            {offset: 1, color: '#00d9d5'},
                        ]
                    ),
                    shadowColor: 'blue',
                },
                data: dayYsiaDataA
            },
            {
                barGap: 0,
                name: legend[1],
                type: 'bar',
                barWidth:'15%',
                itemStyle: {
                    color: new echarts.graphic.LinearGradient(
                        0, 0, 0, 1,
                        [
                            {offset: 0, color: '#fe971a'},
                            {offset: 1, color: '#fe441b'},
                        ]
                    ),
                    shadowColor: 'blue',
                },
                data: dayYsiaDataB
            }
        ]
    };
    stackBarEcharts.setOption(option);
}

//某某某水库库水位库容日变化曲线图
function compareDayLineEchartsShow(resultData) {
    compareDayLineEcharts = echarts.init(document.getElementById('RLC_DayLine'));
    let legend = ['库水位日变化曲线图','库容日变化曲线图'];
    let dayXsiaData = bigData.waterMonitoring.compareDayLineEchartsData.dayXsiaData;
    let dayYsiaDataA = bigData.waterMonitoring.compareDayLineEchartsData.dayYsiaDataA[0];
    let dayYsiaDataB = bigData.waterMonitoring.compareDayLineEchartsData.dayYsiaDataB[0];
    option = {
        color:['#00ff00','#f39800',],
        title:{
            text:'库水位/库容日变化曲线图',
            x:'5%',
            // y:'5%',
            textStyle:{
                color:'#d3d3e0',
                fontSize:15,
            },
            backgroundColor:'rgba(6,32,120, 0.5)',
            // padding: 0,
        },
        tooltip: {
            trigger: 'axis',
            axisPointer: {
                type: 'cross',
                //xy轴十字架指示数值背景区域色
                label: {
                    backgroundColor: '#6a7985'
                }
            }
        },
        legend: {
            data: legend,
            textStyle: {
                color: '#8db0ef',
            },
            x:'center',
            y:'15%',
            icon:'roundRect',
            itemHeight: 4, // 设置高度
            itemGap:20,
        },
        grid: {
            top:'25%',
            left: '3%',
            right: '3%',
            bottom: '3%',
            containLabel: true
        },
        xAxis: [
            {
                type: 'category',
                boundaryGap: false,
                data: dayXsiaData,
                axisLine: {
                    show: true,
                    lineStyle: { color: '#1fa1ff'}
                }
            }
        ],
        yAxis: [
            {
                min: 0,
                // max: 140,
                splitNumber: 4,
                splitLine: {
                    show: false,
                },
                axisLine: {
                    show: true,
                    lineStyle: {
                        color: '#1fa1ff',
                    }
                },
                type: 'value',
                position:'left'
            },
            {
                min: 0,
                // max: 140,
                splitNumber: 4,
                splitLine: {
                    show: false,
                },
                axisLine: {
                    show: true,
                    lineStyle: {
                        color: '#1fa1ff',
                    }
                },
                type: 'value',
                position:'right'
            },
        ],
        series: [
            {
                name: legend[0],
                type: 'line',
                smooth: true, //是否平滑
                symbol: 'none',
                itemStyle:{
                    normal: {
                        lineStyle: {
                            color: "#00ff00",
                        },
                        areaStyle: {
                            color: new echarts.graphic.LinearGradient(
                                0, 0, 0, 1,
                                [
                                    {offset: 0, color: 'rgba(0,255,0, 0.5)'},
                                    {offset: 1, color: 'rgba(0,255,0, 0.1)'}
                                ]),
                            shadowColor: 'rgba(0,255,0, 0.1)',
                            shadowBlur: 20
                        },
                    }
                },

                data: dayYsiaDataA
            },
            {
                name: legend[1],
                type: 'line',
                yAxisIndex:1,
                smooth: true, //是否平滑
                symbol: 'none',
                itemStyle:{
                    normal: {
                        lineStyle: {
                            color: "#f39800",
                        },
                        areaStyle: {
                            color: new echarts.graphic.LinearGradient(
                                0, 0, 0, 1,
                                [
                                    {offset: 0, color: 'rgba(255,175,0, 0.5)'},
                                    {offset: 1,color: 'rgba(255,175,0, 0.1)'}
                                ]),
                            shadowColor: 'rgba(255,175,0, 0.1)',
                            shadowBlur: 20
                        },
                    },
                },

                data: dayYsiaDataB
            },
        ]
    };
    compareDayLineEcharts.setOption(option);
}

//较上年库容日比较柱状图
function capacityBarEchartsShow(resultData) {
    capacityBarEcharts = echarts.init(document.getElementById('compareCapacityBar'));
    let year = new Date().getFullYear();
    let monthArr = [1,2,3,4,5,6,7,8,9,10,11,12];
    let month = new Date().getMonth();
    let day = new Date().getDate();
    // let legendA =  moment(new Date()).format('YYYY年MM月DD日');
    let legend = [year+"年"+ monthArr[month]+"月",Number(year-1)+"年"+monthArr[month]+"月"];

    let dayXsiaData = bigData.waterMonitoring.capacityBarEchartsData.dayXsiaData;
    let dayYsiaDataA = bigData.waterMonitoring.capacityBarEchartsData.dayYsiaDataA[0];
    let dayYsiaDataB = bigData.waterMonitoring.capacityBarEchartsData.dayYsiaDataB[0];

    // let legend = resultData.legend;
    // let dayXsiaData = resultData.dayXsiaData;
    // let dayYsiaDataA = resultData.dayYsiaDataA;
    // let dayYsiaDataB = resultData.dayYsiaDataB;
    option = {
        tooltip: {
            trigger: 'axis',
            axisPointer: {            // 坐标轴指示器，坐标轴触发有效
                type: 'shadow'        // 默认为直线，可选为：'line' | 'shadow'
            }
        },
        legend: {
            data: legend,
            textStyle: {
                color: '#8db0ef',
            },
            //图例标记与顶部标题的距离
            bottom:5,
            icon:'roundRect',
            itemGap:50,
        },
        grid: {
            top:'10%',
            left: '5%',
            right: '5%',
            bottom: '20%',
            containLabel: true
        },
        xAxis: [
            {
                type: 'category',
                axisLine: {
                    show: true,
                    lineStyle: { color: '#1fa1ff'}
                },
                data: dayXsiaData
            }
        ],
        yAxis: [
            {
                min: 0,
                // max: 140,
                splitNumber: 4,
                type: 'value',
                splitLine: {
                    show: false,
                },
                axisLine: {
                    show: true,
                    lineStyle: { color: '#1fa1ff'}
                },

            }
        ],
        series: [
            {
                barGap: 0,
                name: legend[0],
                type: 'bar',
                barWidth:'15%',
                itemStyle: {
                    color: new echarts.graphic.LinearGradient(
                        0, 0, 0, 1,
                        [
                            {offset: 0, color: '#0072f0'},
                            {offset: 1, color: '#53e0ff'},
                        ]
                    ),
                    shadowColor: 'blue',
                },
                data: dayYsiaDataA
            },
            {
                barGap: 0,
                name: legend[1],
                type: 'bar',
                barWidth:'15%',
                itemStyle: {
                    color: new echarts.graphic.LinearGradient(
                        0, 0, 0, 1,
                        [
                            {offset: 0, color: '#7c0fcf'},
                            {offset: 1, color: '#3c14fe'},
                        ]
                    ),
                    shadowColor: 'blue',
                },
                data: dayYsiaDataB
            }
        ]
    };
    capacityBarEcharts.setOption(option);
};
//水库浸润线折线图
function infiltratioLineEchartsShow() {
    infiltratioLineEcharts = echarts.init(document.getElementById('infiltratioLine'));
    let legend = ["标准值","测量值"];
    let dayXsiaData = bigData.waterMonitoring.infiltratioLineEchartsData.dayXsiaData;
    let dayYsiaDataA = bigData.waterMonitoring.infiltratioLineEchartsData.dayYsiaDataA[0];
    let dayYsiaDataB = bigData.waterMonitoring.infiltratioLineEchartsData.dayYsiaDataB[0];
    option = {
        color:['#4b9fe3','#F8456B',],
        tooltip: {
            trigger: 'axis',
            axisPointer: {            // 坐标轴指示器，坐标轴触发有效
                type: 'shadow'        // 默认为直线，可选为：'line' | 'shadow'
            }
        },
        legend: {
            data: legend,
            textStyle: {
                color: '#8db0ef',
            },
            //图例标记与顶部标题的距离
            bottom:5,
            icon:'roundRect',
            itemGap:50,
        },
        grid: {
            top:'10%',
            left: '5%',
            right: '5%',
            bottom: '20%',
            containLabel: true
        },
        xAxis: [
            {
                type: 'category',
                axisLine: {
                    show: true,
                    lineStyle: { color: '#1fa1ff'}
                },
                data: dayXsiaData
            }
        ],
        yAxis: [
            {
                min: 0,
                // max: 140,
                splitNumber: 4,
                type: 'value',
                splitLine: {
                    show: false,
                },
                axisLine: {
                    show: true,
                    lineStyle: { color: '#1fa1ff'}
                },
            }
        ],
        series: [
            {
                name: legend[0],
                type: 'line',
                lineStyle: {
                    color: '#4b9fe3',
                    width: 2
                },
                // areaStyle: {
                //     color: new echarts.graphic.LinearGradient(
                //         0, 0, 0, 1,
                //         [
                //             {offset: 0,color: '#4b9ee2'},
                //             {offset: 0.5,color: '#254490'},
                //             {offset: 1,color: '#030750'},
                //         ],
                //     ),
                //     opacity:0.2,
                //     shadowColor: 'blue',
                //     shadowBlur: 20
                // },
                data: dayYsiaDataA
            },
            {
                name: legend[1],
                type: 'line',
                lineStyle: {
                    color: '#F8456B',
                    width: 2
                },
                // areaStyle: {
                //     color: new echarts.graphic.LinearGradient(
                //         0, 0, 0, 1,
                //         [
                //             {offset: 0,color: '#4b9ee2'},
                //             {offset: 0.5,color: '#254490'},
                //             {offset: 1,color: '#030750'},
                //         ],
                //     ),
                //     opacity:0.2,
                //     shadowColor: 'blue',
                //     shadowBlur: 20
                // },
                data: dayYsiaDataB
            }
        ]
    };
    infiltratioLineEcharts.setOption(option);
}

//水库来水预测
function predictLineEchartsShow(resultData) {
    predictLineEcharts = echarts.init(document.getElementById('waterFlowPredictLine'));
    let Legend = resultData.legend;
    let dayXsiaData = resultData.dayXsiaData;
    let dayYsiaDataA = resultData.dayYsiaDataA;
    let dayYsiaDataB = resultData.dayYsiaDataB;
    let dayYsiaDataC = resultData.dayYsiaDataC;
    option = {
        color:['#4b9fe3','#19E369','#E309D8'],
        tooltip: {
            trigger: 'axis',
            axisPointer: {            // 坐标轴指示器，坐标轴触发有效
                type: 'shadow'        // 默认为直线，可选为：'line' | 'shadow'
            }
        },
        legend: {
            data: Legend,
            textStyle: {
                color: '#4b9fe3',
            },
            //图例标记与顶部标题的距离
            x:'15%',
            y:'13%',
            icon:'roundRect',
            itemHeight: 4, // 设置高度
        },
        grid: {
            top:'20%',
            left: '5%',
            right: '5%',
            bottom: '10%',
            containLabel: true
        },
        xAxis: [
            {
                type: 'category',
                axisLine: {
                    show: true,
                    lineStyle: { color: '#1fa1ff'}
                },
                data: dayXsiaData
            }
        ],
        yAxis: [
            {
                min: 0,
                // max: 140,
                splitNumber: 4,
                type: 'value',
                splitLine: {
                    show: false,
                },
                axisLine: {
                    show: true,
                    lineStyle: { color: '#1fa1ff'}
                },
                axisLabel: {
                    formatter: '{value} m³'
                }
            }
        ],
        series: [
            {
                name: Legend[0],
                type: 'line',
                lineStyle: {
                    color: '#4b9fe3',
                    width: 1
                },
                areaStyle: {
                    color: new echarts.graphic.LinearGradient(
                        0, 0, 0, 1,
                        [
                            {offset: 0,color: '#4b9ee2'},
                            {offset: 0.5,color: '#254490'},
                            {offset: 1,color: '#030750'},
                        ],
                    ),
                    opacity:0.2,
                    shadowColor: 'blue',
                    shadowBlur: 20
                },
                data: dayYsiaDataA
            },
            {
                name: Legend[1],
                type: 'line',
                lineStyle: {
                    color: '#19E369',
                    width: 1
                },
                areaStyle: {
                    color: new echarts.graphic.LinearGradient(
                        0, 0, 0, 1,
                        [
                            {offset: 0,color: '#19E369'},
                            {offset: 0.5,color: '#254490'},
                            {offset: 1,color: '#030750'},
                        ],
                    ),
                    opacity:0.2,
                    shadowColor: 'blue',
                    shadowBlur: 20
                },
                data: dayYsiaDataB
            },
            {
                name: Legend[2],
                type: 'line',
                lineStyle: {
                    color: '#E309D8',
                    width: 1
                },
                areaStyle: {
                    color: new echarts.graphic.LinearGradient(
                        0, 0, 0, 1,
                        [
                            {offset: 0,color: '#E309D8'},
                            {offset: 0.5,color: '#254490'},
                            {offset: 1,color: '#030750'},
                        ],
                    ),
                    opacity:0.2,
                    shadowColor: 'blue',
                    shadowBlur: 20
                },
                data: dayYsiaDataC
            }
        ]
    };
    predictLineEcharts.setOption(option);
}

//需水提报
function requirementPieEchartsShow(result) {
    requirementPieEcharts = echarts.init(document.getElementById('waterRequirementPie'));
    let color = ['#0089fd', '#666666', '#3fb6a4', '#F8456B', '#f9bc31', '#8560a8'];
    let echartData = [
        {
            name: "新坝灌区需水面积",
            value: result.realityArea
        }
    ];

    let total = echartData.reduce((a, b) => {
        return a + b.value * 1
    }, 0);

    option = {
        color: color,
        title: {
            text: total +'m³',
            subtext:'总量',
            top: '40%',
            left: '23%',
            textAlign:'center',
            textStyle: {
                fontSize: 16,
                fontWeight: 'bold',
                color: '#29acd2',
            },
            subtextStyle: {
                color: '#cfccd1'          // 副标题文字颜色
            }

        },
        legend: {
            orient: 'vertical',
            icon: 'rect',
            x: '48%',
            y: 'center',
            itemWidth: 12,
            itemHeight: 12,
            align: 'left',
            textStyle: {
                rich: {
                    name: {
                        fontSize: 12,
                        color:'#cfccd1'
                    },
                    value: {
                        fontSize: 12,
                        color:'#008ebf'
                    },
                }
            },
            formatter: function(name) {
                let res = echartData.filter(v => v.name === name);
                res = res[0] || {};
                let unit = res.unit || '';
                return '{name|' + name + '}{value|' + res.value + 'm³}'
            }
        },
        series: [{
            type: 'pie',
            radius: ['60%', '75%'],
            center: ['25%', '50%'],
            data: echartData,
            hoverAnimation: false,
            itemStyle: {
                normal: {
                    borderWidth: 2
                }
            },
            labelLine: {
                show:false,
            },
            label: {
                show:false,

            },
        }]
    };
    requirementPieEcharts.setOption(option);
}

//配水计划
function distributionPieEchartsShow(result) {
    distributionPieEcharts = echarts.init(document.getElementById('waterDistributionPie'));
    let color = ['#0089fd', '#666666', '#3fb6a4', '#F8456B', '#f9bc31', '#8560a8'];
    let echartData = [
        {
            name: "新坝灌区配水",
            value: result.needReservoirWaterAmount
        }
    ];

    let total = echartData.reduce((a, b) => {
        return a + b.value * 1
    }, 0);

    option = {
        color: color,
        title: {
            text: total +'m³',
            subtext:'总量',
            top: '40%',
            left: '24%',
            textAlign:'center',
            textStyle: {
                fontSize: 16,
                fontWeight: 'bold',
                color: '#29acd2',
            },
            subtextStyle: {
                color: '#cfccd1'          // 副标题文字颜色
            }

        },
        legend: {
            orient: 'vertical',
            icon: 'rect',
            x: '48%',
            y: 'center',
            itemWidth: 10,
            itemHeight: 10,
            align: 'left',
            textStyle: {
                rich: {
                    name: {
                        fontSize: 12,
                        color:'#cfccd1'
                    },
                    value: {
                        fontSize: 12,
                        color:'#008ebf'
                    },
                }
            },
            formatter: function(name) {
                let res = echartData.filter(v => v.name === name);
                res = res[0] || {};
                let unit = res.unit || '';
                return '{name|' + name + '}{value|' + res.value + 'm³}'
            }
            // data: legendName
        },
        series: [{
            type: 'pie',
            radius: ['60%', '75%'],
            center: ['25%', '50%'],
            data: echartData,
            hoverAnimation: false,
            itemStyle: {
                normal: {
                    borderWidth: 2
                }
            },
            labelLine: {
                show:false,
            },
            label: {
                show:false,

            },
        }]
    };
    distributionPieEcharts.setOption(option);
}