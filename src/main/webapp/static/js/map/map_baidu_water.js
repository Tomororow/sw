/* 相对链接的基准URL */
var curWwwPath = window.document.location.href;
var pathName = window.document.location.pathname;
var pos = curWwwPath.indexOf(pathName);
var localhostPaht = curWwwPath.substring(0,pos);
var projectName = pathName.substring(0,pathName.substr(1).indexOf('/')+1);
var ctxPath = localhostPaht + projectName;
var myChart;
/**
 * Vue渲染整个Map页面
 */
var baiDuMapPage = new Vue({
	el:'#baiDuMapPage',
	data:{
        loading:true,
		treeSwitch:false,//树菜单透明背景的开关
		contrAction:false,//底部弹出框的开关
		mapButy:{},//点击当前maker拿到的对象
        mapDynamic:{},//地图表格的动态数据
        timer:{}, //定时器
        EchartLoading:false,//echarts加载框
        leftBtnList:[],//左侧模块的集合
        topBtnList:[],//顶部模块的集合
        searchSiteAll:[], //所有地图点
        searchSite:'',//需要查询的地图点
        activeIndex:0,//当前模块状态下标 0：雷达水位站，1：明渠流量站 ---默认为雷达水位站
        preLeftBtn:'',
        option:{
            legend: {
                textStyle:{color:'#fff'},
                data:['水位','流量'],

            },
            xAxis: {
                type: 'category',
                boundaryGap: false,
                data: "",
                axisLabel : {
                    textStyle: {
                        color: '#fff'
                    }
                },
                axisLine: {
                    lineStyle: {
                        color: '#f79604'
                    }
                },
            },
            yAxis: [
                {
                    type: 'value',
                    name: '水位（cm）',
                    axisLabel : {
                        formatter: '{value}',
                        textStyle: {
                            color: '#fff'
                        }
                    },
                    nameTextStyle:{
                        color:'#fff',
                    },
                    axisLine: {
                        lineStyle: {
                            color: '#f79604'
                        }
                    },
                    position:'left'
                },
                {
                    type: 'value',
                    name: '流量（m/s）',
                    axisLabel : {
                        formatter: '{value}',
                        textStyle: {
                            color: '#fff'
                        }
                    },
                    nameTextStyle:{
                        color:'#fff',
                    },
                    axisLine: {
                        lineStyle: {
                            color: '#f79604'
                        }
                    },
                    position:'right'
                }
            ],
            toolbox: {
                iconStyle:{
                    borderColor:'#fff'
                },
                feature: {
                    saveAsImage: {show: true},
                    restore: {},
                    dataView: {readOnly: false},
                    magicType: {type: ['line', 'bar']},
                },
                right:100
            },
            grid: {
                top: 45,
                left: 50,
                bottom:80,
                right:30,
                height: 200,
            },
            tooltip : {
                trigger: 'axis',
                extraCssText:'width:auto;height:75px;'
            },
            series: [{
                name:'水位',
                data: "",
                type: 'line',
                color:'#63b6dd',
                label: {
                    normal: {
                        show: true,
                        position: 'top'
                    }
                },
                markPoint: {
                    data: [
                        {type: 'max', name: '最大值'},
                        {type: 'min', name: '最小值'}
                    ]
                },

            }, {
                name:'流量',
                type:'line',
                color:'#05978e',
                data:"",
                label: {
                    normal: {
                        show: true,
                        position: 'top'
                    }
                },
                markPoint: {
                    data: [
                        {type: 'max', name: '最大值'},
                        {type: 'min', name: '最小值'}
                    ]
                },
            }]
        },
	},
	methods:{
		/**
		 * 单个点的点击事件
		 */
		handleMaker:function(event){
			var _this = this;
            _this.mapButy.deviceWaterName = event.target.buty.deviceWaterName;//基础数据
			_this.mapButy.deviceWaterCode = event.target.buty.deviceWaterCode;//基础数据
            _this.mapButy.siteDepth = event.target.buty.siteDepth;//基础数据
            _this.mapButy.siteType = event.target.buty.siteType;//基础数据
			_this.mapDynamic = event.target.buty;//动态数据
			/**视频切换的方法**/
            let playDom = document.querySelector('#myPlayer')
            playDom.src = event.target.buty.ezopenLive;
            playDom.play();
            var player = new EZUIPlayer('myPlayer');
            /**展开或关闭底部弹出框的方法**/
            contrAction(0);

            //为echarts图表赋值
            _this.dynamicInfo();

            //开启定时任务
            _this.timerStart();
		},

		/**
		 * 树结构点击方法
		 * @param event
		 * @param treeId
		 * @param treeNode
		 */
		zTreeOnClick:function(event, treeId, treeNode){
			var _this = this;
			debugger
			removeOverlay();
			var siteType = _this.activeIndex==0?'5':(_this.activeIndex=='1'?'12':'8');
			_this.vityTreeList(treeNode.canalCode,siteType);
		},
		/**
		 * 地图点的加载事件
		 * @param canalCode
		 */
		vityTreeList:function(canalCode,siteType){
			var _this = this;
			$.post(ctxPath+"/map/ajax_site_info",{id:canalCode,siteType:siteType},function(data){
				debugger
				if(data.length>0){
                    _this.searchSiteAll = data;
					makerList(data);
                }
			});
		},
		/*树结构加载方法调用方法*/
		vityMethods:function(){
			var _this = this;
			var setting = {
				callback: {
					onClick: _this.zTreeOnClick
				},
				view: {
					selectedMulti: false,
					fontCss : {color:"white","font-size": "0px"}
				},
				data:{
					simpleData: {
						enable: true
					},
					key:{
						name:"canalName"
					}
				}
			};
			$.post(ctxPath+"/cal_canal_info/tree_canal","",function(data){
				/*data[0].open = true;
                if(data[0].children[0] != undefined){
                    data[0].children[0].open = true;
                }*/
                var treeObject = $.fn.zTree.init($('#treeDemo'), setting, data);
                treeObject.expandAll(true);
			});
		},
        /*单个渠历史数据查询*/
        dynamicInfo:function(){
            debugger
            var _this = this;
            _this.EchartLoading = true;
            //清空画布缓存
            myChart.clear();
            $.post(ctxPath+"/map/ajax_site_water_dynamic_infoList",{id:_this.mapButy.deviceWaterCode},function(data){
                debugger
                _this.option.series[0].data = data.waterLevel;//当前渠水位
                _this.option.series[1].data = data.instantFlow;//当前渠流量
                _this.option.xAxis.data = data.swdiCreateTime;//当前时间
                if(_this.activeIndex==1){ //明渠流量站动态添加流速
                    let seriesData = {
                        name:'流速',
                        data:data.instantSpeed,
                        type: 'line',
                        color:'#f38181',
                        label: {
                            normal: {
                                show: true,
                                position: 'top'
                            }
                        },
                        markPoint: {
                            data: [
                                {type: 'max', name: '最大值'},
                                {type: 'min', name: '最小值'}
                            ]
                        },
                    };
                    _this.option.series[2] = seriesData;
                    _this.option.legend.data[2] = '流速';
                }else if(_this.activeIndex==0){
                    if(_this.option.series.length > 2){
                        _this.option.series.pop();
                        _this.option.legend.data.pop();
                    }
                }
                myChart.setOption(_this.option,true);
                _this.EchartLoading = false;
            });
        },
        /*定时器开启方法*/
        timerStart:function () {
            var _this = this;
            this.timerStop();
            _this.timer = setInterval(function () {
                $.post(ctxPath+"/map/ajax_site_water_dynamic_info",{id:_this.mapButy.deviceWaterCode},function (data) {
                    //echarts动态数据添加
                    _this.option.series[0].data.shift();
                    _this.option.series[0].data.push(data.waterLevel);
                    _this.option.series[1].data.shift();
                    _this.option.series[1].data.push(data.instantFlow);
                    _this.option.xAxis.data.shift();
                    _this.option.xAxis.data.push(data.swdiCreateTime);
                    if(_this.activeIndex==1){//明渠流量站动态添加流速
                        _this.option.series[2].data.shift();
                        _this.option.series[2].data.push(data.instantSpeed);//瞬时流速
                    }
                    //echarts动态数据画面渲染
                    myChart.setOption(_this.option);
                    //图表数据动态修改
                    _this.mapDynamic.waterLevel = data.waterLevel;//当前水位
                    _this.mapDynamic.instantFlow = data.instantFlow;//当前流量
                    _this.mapDynamic.meptyHing = data.testHeight;//测试高度
                    _this.mapDynamic.uploadTime = data.uploadTime;//上传时间
                    _this.mapDynamic.type = data.swdiType;//在线状态
                    ///明渠流量站动态数据
                    if(_this.activeIndex==1) {//明渠流量站动态添加流速
                        _this.mapDynamic.instantSpeend = data.instantSpeend;//瞬时流速
                        _this.mapDynamic.totleFlow = data.totleFlow == "0"
                            ?_this.mapDynamic.totleFlow
                            :data.totleFlow;//累计流量
                    }
                })
            },1000*60*5)//5分钟加载一次
        },
        /*定时器销毁方法*/
        timerStop:function () {
            var _this = this;
            clearInterval(_this.timer);
        },
        /*点击模块触发的方法*/
        handleMenuBtn:function(sign,index){
            var _this = this;
            _this.activeIndex = index;
            showCanal(sign+index);
        },
        /*站点搜索按钮button压下*/
        searchSiteInfo:function () {
            var _this = this;
            debugger
            if(_this.searchSiteAll.length>0 &&_this.searchSite != ''){
                let site = [];
                for (i in _this.searchSiteAll) {
                    if(_this.searchSiteAll[i].deviceWaterName.indexOf(_this.searchSite)>=0){
                        site.push(_this.searchSiteAll[i]);
                    }
                }
                //清除地图点
                removeOverlay();
                //地图上添加mark点
                makerList(site);
                //关闭底部弹出框
                // contrAction(1);
            }
        },
	},
    mounted:function(){
		var _this = this;
		debugger
        var dert = document.getElementById('EchartMain');
		_this.vityMethods();
        myChart = echarts.init(document.getElementById('EchartMain'));
        _this.loading = false;
	},
    created:function(){
        var _this = this;
        _this.leftBtnList = [{name:'雷达水位站'},{name:'雷达流速一体站'},{name:'明渠流量站'},{name:'闸门站'}];
        _this.topBtnList  = [{name:'视频站'},{name:'墒情站'},{name:'气象站'},{name:'蒸发站'},{name:'压力站'}];
    }
});

/**
 * 定义底部弹出框是否弹出
 * @param sign
 */
function contrAction(sign){
	debugger
	if(sign==0){
		if(!baiDuMapPage.contrAction){
			$('#btnProDiv').animate({height: 'show', opacity: 'show'}, 'normal',function(){});
		}
	}else{
		$('#btnProDiv').animate({height: 'hide', opacity: 'show'}, 'normal',function(){});
        baiDuMapPage.timerStop();
	}
    baiDuMapPage.contrAction = !baiDuMapPage.contrAction
}

/**
 * 定义树菜单的背景是否展开
 */
function showCanal(sign) {
	//菜单切换管理
	debugger
    var signDer = '#'+sign;
	if(!baiDuMapPage.treeSwitch){//未展开
        $(signDer).css({"background":"#0099cc","opacity":'0.8'});
        $('.treeBack').animate({height: 'show', opacity: 'show'}, 'normal',function(){});
        baiDuMapPage.beforeActive = signDer;
        baiDuMapPage.treeSwitch = !baiDuMapPage.treeSwitch;
	}else{
        $(baiDuMapPage.beforeActive).css({"background":""});
        $(signDer).css({"background":""});
        $('.treeBack').animate({height: 'hide', opacity: 'hide'}, 'normal',function(){});
        if(baiDuMapPage.beforeActive!=signDer){
            baiDuMapPage.treeSwitch = !baiDuMapPage.treeSwitch;
            showCanal(sign);
        }else{
            baiDuMapPage.treeSwitch = !baiDuMapPage.treeSwitch;
        }
	}
    //关闭底部弹出框
    if(baiDuMapPage.contrAction){
        contrAction(1);
    }

    //清除地图点
    // removeOverlay();
    if(baiDuMapPage.treeSwitch && signDer != baiDuMapPage.preLeftBtn){
        removeOverlay();
    }
    baiDuMapPage.preLeftBtn = signDer;
}
