var curWwwPath = window.document.location.href;
var pathName = window.document.location.pathname;
var pos = curWwwPath.indexOf(pathName);
var localhostPaht = curWwwPath.substring(0,pos);
var projectName = pathName.substring(0,pathName.substr(1).indexOf('/')+1);
var ctxPath = localhostPaht + projectName;
var picPath = localhostPaht;
var imagePath = ctxPath+"/static/images/";

var websocket = null;

var gateContol = new Vue({
   el:'#gateContol',
   data:{
       canalCode:'',//选择的渠道的Code
       title:'远程闸门控制',
       dialogVisible:false,
       tableData: [],
       sluiceData:{},//远程控制当前闸门数据
       sluiceJzMiddData:{},
       pageSize:'8',//当前页显示的最大数量
       currentPage:1,//当前页码数
       sluiceCodeSelect:'',//按闸门站编码检索
       sluiceNameSelect:'',//按闸门站名称检索
       preGateOpening:'',//闸门开度预设值

       setIntervalTask:{},//定时任务
       ratioOfOpeningToPX:'',//闸门开度与PX比率
       openGateControlBtnDisabled:false,//闸门控制开启按钮活性与非活性设置
       closeGateControlBtnDisabled:true,//闸门控制关闭按钮活性与非活性设置
       sluiceHeightChangeBefore:'', //远程控制前闸门开度
       sluiceChangeType:'',//闸门上升或下降类型
       expands: [],//只展开一行放入当前行id
       userInfo:[],//当前平台用户信息
       gateStatusFlag:true,
       openningEqualNum:0,//开度相等次数
       previousSluiceHeight:'',//前一次开度大小
       AESSecretKey:'',
       videoControl:{
           videoDeviceSerial:'',//当前视频所在摄像头序列号
           videoDeviceName:'',//当前视频所在摄像头名称
           videoData:[],//视频数据
       },
       realVideoData:[],
   },
    methods:{
        handleSizeChange:function(pageSize){
            var _this = this;
            _this.pageSize = pageSize;
        },
        handleCurrentChange:function(currentPage){
            var _this = this;
            _this.currentPage = currentPage;
        },
        //树菜单点击事件
        zTreeOnClick:function(event, treeId, treeNode){
            var _this = this;
            _this.canalCode = treeNode.canalCode;
            _this.tableData = [];
            _this.showSluiceRealTimeData(treeNode.canalCode);
        },
        //行点击事件
        tableRowClick(row,index,e){
            this.$refs.refTable.toggleRowExpansion(row)
        },
        //树目录结构加载
        handleVityTree:function(id,code){
            var _this = this;
            setting = {
                view: {
                    selectedMulti: false
                },
                check: {
                    enable: true
                },
                callback: {
                    onClick: _this.zTreeOnClick
                },
                data:{
                    simpleData: {
                        enable: true
                    },
                    key:{
                        name:'canalName'
                    }
                },
            };
            $.post(ctxPath+"/cal_canal_info/tree_canal",{waterId:id,waterCode:code},function(result){
                if(result!=""&&result!=null) {
                    var treeData = result;
                    treeData[0].open = true;
                    if(treeData[0].children[0] != undefined){
                        treeData[0].children[0].open = true;
                    }
                    $.fn.zTree.init($('#treeDemo'), setting, treeData);
                    _this.canalCode = _this.code = treeData[0].canalCode;
                    _this.showSluiceRealTimeData(treeData[0].canalCode);
                }
            });
        },
        //获取用户信息
        handleUserInfo:function(){
            var _this = this;
            $.post(ctxPath + "/remote_control/user_info",function (data) {
                _this.userInfo = JSON.parse(data);
            });
        },
        //按渠道查询闸门站数据
        showSluiceRealTimeData:function (canalCode) {
            var _this = this;
            $.post(ctxPath + "/remote_control/sluice_realTime_list",{canalCode:canalCode},function (data) {
                _this.tableData = JSON.parse(data);
                /*if(_this.tableData.length > 0){
                    _this.expands.push(_this.tableData[0].id);
                }*/
            });
        },
        //按闸门站编码查询
        sluiceCodeQuery:function(){
            var _this = this;
            if(_this.sluiceCodeSelect != ''){
                _this.tableData = [];
                $.post(ctxPath + '/remote_control/sluice_condition_query',{canalCode:_this.canalCode,code:_this.sluiceCodeSelect,name:''},function (data) {
                    _this.tableData = JSON.parse(data);
                })
            }else{
                _this.$message({
                    message: '请输入闸门站编码！',
                    type: 'warning'
                });
            }
        },
        //按闸门站名称查询
        sluiceNameQuery:function(){
            var _this = this;
            if(_this.sluiceNameSelect != ''){
                _this.tableData = [];
                $.post(ctxPath + '/remote_control/sluice_condition_query',{canalCode:_this.canalCode,code:'',name:_this.sluiceNameSelect},function (data) {
                    _this.tableData = JSON.parse(data);
                })
            }else{
                _this.$message({
                    message: '请输入闸门站名称！',
                    type: 'warning'
                });
            }
        },
        //远程控制dialog打开之前进行websocket连接以及验证
        handleControlBefore:function(index,row){
            var _this = this;
            //_this.dialogVisible = true;//TODO
            _this.sluiceData = row.siteSluiceJzMiddDevice;
            _this.sluiceJzMiddData = row;
            _this.AESSecretKey = row.ssgiSecretKey;
            // _this.handleControl();//TODO
            //判断当前浏览器是否支持WebSocket
            if ('WebSocket' in window) {
                websocket = new WebSocket(row.ssgiSluiceSocketUrl);
                // websocket = new WebSocket("wss://www.zyjzjs.cn/");
                //建立webSocket连接
                websocket.onopen = function(evt) {
                    //建立webSocket连接
                    let wsData = JSON.stringify({source:'web',
                        content:_this.encrypt(JSON.stringify({type:'login',userId:_this.userInfo.id,deviceCode:_this.sluiceJzMiddData.ssgiSluiceGateCode}))})
                    websocket.send(wsData);
                };
                websocket.onmessage = (evt) => {
                    _this.webSocketResponse(evt);
                }
                //连接建立失败进行消息提示
                websocket.onerror = (evt) => {
                    _this.$message({
                        message:'设备不在线，请检查设备网络线路！',
                        type:'error'
                    })
                }
            }else {
                _this.$message({
                    message:'当前浏览器 Not support websocket',
                    type:'warn'
                })
            }
        },
        /**
         * 远程控制事件
         */
        handleControl:function(){
            var _this = this;
            _this.dialogVisible = true;//TODO
            _this.openGateControlBtnDisabled = false;
            _this.preGateOpening = '';
            //从视频信息表中获取视频直播地址
            $.post(ctxPath + '/remote_control/sluice_video_info',{id:_this.sluiceJzMiddData.ssgiSluiceMovieId},function (result) {
                if(result != null || result != ""){
                    _this.videoControl.videoData = JSON.parse(result);
                    _this.videoControl.videoDeviceSerial = _this.videoControl.videoData[0].deviceSerial;
                    _this.videoControl.videoDeviceName = _this.videoControl.videoData[0].deviceVideoName;
                    _this.handelVideoDataShow();
                }
                _this.ratioOfOpeningToPX = (42/(_this.sluiceData.ssjmdOpenCeiling - _this.sluiceData.ssjmdOpenLower));
                $("#channelGateId").css("margin-top",-(_this.sluiceData.ssjmdSluiceHeight*_this.ratioOfOpeningToPX).toFixed(0) + 'px');
                _this.sluiceHeightChangeBefore = _this.sluiceData.ssjmdSluiceHeight;
            })
        },
        handelVideoDataShow:function(){
            var _this = this;
            setTimeout(function(){
                for (let i = 0; i < _this.videoControl.videoData.length; i++) {
                    let playDom = document.querySelector("#myPlayer"+i);
                    playDom.src = _this.videoControl.videoData[i].ezopenLive;
                    var player = new EZUIPlayer("myPlayer"+i);
                }
            },500);
        },
        //卡片切换事件
        carouselChange:function(curKey,preKey){
            var _this = this;
            if($("#myPlayer"+curKey).attr('src') == ""){
                let playDom = document.querySelector("#myPlayer"+curKey);
                playDom.src = _this.videoControl.videoData[curKey].ezopenLive;
                var player = new EZUIPlayer("myPlayer"+curKey);
            }
            _this.videoControl.videoDeviceSerial = _this.videoControl.videoData[curKey].deviceSerial;
            _this.videoControl.videoDeviceName = _this.videoControl.videoData[curKey].deviceVideoName;
        },

        //监听webSocke消息
        webSocketResponse:function(evt){
            var _this = this;
            let event = JSON.parse(_this.decrypt(evt.data));
            console.log(event);
            //远程控制窗口打开前message监听
            if(event.type === 'login'){
                if(event.status == 'success'){
                    _this.$message({
                        message:'连接成功',
                        type:'success'
                    })
                    //dialog打开
                    _this.handleControl();
                }else{
                    _this.$message({
                        message:'连接失败，请耐心等待！',
                        type:'error'
                    })
                }
                return;
            }
            // alert(event);
            //闸门远程控制'执行'button 压下时message监听
            if(event.type == 'inste'){
                if(event.operationStatus === 'success'){
                    _this.$message({
                        message:'命令下发成功！',
                        type:'success'
                    })
                }else if(event.operationStatus === 'fail') {
                    debugger
                    _this.dialogVisible = false;
                    _this.webSocketClose();
                    _this.$message({
                        message:'命令下发失败，请重新尝试！',
                        type:'error'
                    })
                    return;
                }
            }
            //闸门远程控制'停止'button 压下时message监听
            if(event.type == 'stop'){
                if(event.operationStatus === 'success'){
                    _this.$message({
                        message:'命令下发成功！',
                        type:'success'
                    })
                    _this.gateControlStop();
                } else {
                    _this.$message({
                        message:'命令下发失败，请重新尝试！',
                        type:'error'
                    })
                    return;
                }
            }

            //消息监听（3s/次）
            if(event.type == 'data'){
                //’执行‘按钮压下时
                if(event.dataType === 'dynamic'){
                    //webSocket推送message监听
                    if(event.content != undefined){
                        debugger
                        let content = JSON.parse(event.content);
                        _this.sluiceData.ssjmdSluiceHeight = content.r_00;
                        _this.sluiceData.ssjmdARoadLoad = content.r_01;
                        _this.sluiceData.ssjmdBRoadLoad = content.r_02;
                        if(_this.openGateControlBtnDisabled == true){
                            if(_this.preGateOpening !=''){
                                //r_00:当前开度
                                if((_this.sluiceChangeType == 0 && content.r_00 >= _this.preGateOpening)
                                    || (_this.sluiceChangeType == 1 && content.r_00 <= _this.preGateOpening)){
                                    //改变动画闸门高度
                                    _this.gateControlOpening(content.r_00);
                                }
                            }

                            //闸门控制完毕，更新操作记录
                            if(_this.preGateOpening !='' && content.r_00 == _this.preGateOpening){
                                _this.sluiceData.ssjmdSluiceHeight = content.r_00;
                                _this.gateControlStop();
                            }

                            //当前开度与上一次开度相等 and 当前开度与远程控制前开度不相等
                            if(_this.previousSluiceHeight == content.r_00
                                && content.r_00 != _this.sluiceHeightChangeBefore
                                && content.r_00 == _this.preGateOpening){
                                _this.openningEqualNum = _this.openningEqualNum + 1;
                                //达到3次时 判断远程控制结束
                                if(_this.openningEqualNum === 3){
                                    _this.sluiceData.ssjmdSluiceHeight = content.r_00;
                                    _this.gateControlStop();
                                }
                            }
                            //改变前一次开度值
                            _this.previousSluiceHeight = content.r_00;
                        }
                    }
                }
            }
        },

        //websocket关闭
        webSocketClose:function(){
            var _this = this;
            websocket.close();//关闭websocket连接
        },
        /**
         * 闸门远程控制开启
         */
        openGateControl:function () {
            var _this = this;
            if(_this.preGateOpening == ""){
                _this.$message({
                    message: '请输入开度值后再进行此操作！',
                    type: 'warning'
                })
                return;
            }

            if(_this.preGateOpening == _this.sluiceData.ssjmdSluiceHeight){
                _this.$message({
                    message: '当前设定值当前开度相同，请更改设定值后再行操作！',
                    type: 'warning'
                })
                return;
            }

            if(_this.preGateOpening > _this.sluiceData.ssjmdOpenCeiling
                || _this.preGateOpening < _this.sluiceData.ssjmdOpenLower){
                _this.$message({
                    message: '当前设定值超过闸门开度临界点，请更改设定值后再行操作！',
                    type: 'warning'
                })
                return;
            }

            this.$confirm('是否确认进行远程闸门控制开启操作!','闸门控制开启确认',
                {
                    confirmButtonText: '确定',
                    cancelButtonText: '取消',
                    type: 'warning'
            }).then(() => {
                //闸门控制开启后“开启”按钮设置为非活性，防止二次点击
                _this.openGateControlBtnDisabled = true;
                //闸门控制开启后“停止”按钮设置为活性
                _this.closeGateControlBtnDisabled = false;
                _this.openningEqualNum=0,//开度相等次数初始化
                _this.previousSluiceHeight='',//前一次开度大小初始化
                _this.sluiceChangeType = _this.preGateOpening < _this.sluiceHeightChangeBefore ?0:1;
                //远程闸门控制开启
                let wsData = JSON.stringify({source:'web',
                    content:_this.encrypt(JSON.stringify({type:'inste',num:_this.preGateOpening,
                        deviceCode:_this.sluiceJzMiddData.ssgiSluiceGateCode,userId:_this.userInfo.id}))});
                websocket.send(wsData);
            }).catch(_ => {});
        },
        //单个视频站点查看
        getLabelInfo:function(row){
            var _this = this;
            _this.realVideoData = [];
            $.post(ctxPath + '/remote_control/sluice_video_info',{id:row.ssgiSluiceMovieId},function (result) {
                if(result!=null&&result!=""){
                    _this.realVideoData = JSON.parse(result);
                    if(_this.realVideoData.length == 1){
                        $('.el-popover').css('width','326px');
                    }
                    if(_this.realVideoData.length == 2){
                        $('.el-popover').css('width','666px');
                    }
                    localStorage.setItem('realVideoData',JSON.stringify(_this.realVideoData));
                }else{
                    _this.$message({
                        message: '抱歉，当前闸门暂无关联视频信息...',
                        type: 'warning'
                    });
                }
            });
            /*video的id为deviveId*/
            /*let playDom = document.querySelector("#props"+row.deviceSluiceCode);
            playDom.src = row.ezopenLive;
            playDom.play();
            var player = new EZUIPlayer('props'+row.deviceSluiceCode);*/
        },
        /**
         * 闸门远程控制关闭
         */
        closeGateControl:function () {
            var _this = this;
            // _this.timerStop();
            _this.gateStatusFlag =true;
            //远程闸门控制关闭
            let wsData = JSON.stringify({source:'web',
                content:_this.encrypt(JSON.stringify({type:'stop',
                    deviceCode:_this.sluiceJzMiddData.ssgiSluiceGateCode,userId:_this.userInfo.id}))});
            websocket.send(wsData);
            // _this.gateControlStop();//TODO
        },

        //详情dialog取消button压下前执行
        doCancelBefore:function(done){
            var _this = this;
            if(_this.openGateControlBtnDisabled == true){
                this.$confirm('当前闸门正在远程控制,暂时无法关闭当前页面，请等待完成后再进行关闭！')
                    .then(_ => {})
                    .catch(_ => {});
            }else{
                done();
                _this.preGateOpening = '';
                //关闭webSocket连接
                _this.webSocketClose();
            }
        },
        getRowKeys:function(row){
            return row.id
        },
        //手风琴下拉框控制
        handleConnectionSearch:function(row,expandedRows) {
            var _this = this;
            if (expandedRows.length) {//说明展开了
                _this.expands = []
                if (row) {
                    _this.expands.push(row.id)//只展开当前行id
                }
            } else {//说明收起了
                _this.expands = []
            }
        },
        //云台控制鼠标移入操作
        mouseenter:function () {
            $('#videoCtr').css("display","block")
        },
        //云台控制鼠标移出操作
        mouseleave:function () {
            $('#videoCtr').css("display","none")
        },
        /**
         *远程控制状态更新
         */
/*        remoteControlStatusUpdates:function () {
            var _this = this;
            debugger
            $.post(ctxPath + '/remote_control/remote_status_update',{data:JSON.stringify(_this.sluiceData)},function (msg) {
                if(msg == 1){
                    _this.$message({
                        message:'闸门开度状态已更新',
                        type:'success'
                    })
                }else{
                    _this.$message({
                        message:'闸门开度状态更新失败',
                        type:'error'
                    })
                }
            });
        },*/

        /**
         * 远程控制操作记录表更新
         */
        remoteControlOperationRecordUpdate:function(){
            var _this = this;
            $.post(ctxPath + '/remote_control/remote_operation_record_update',
                {data:JSON.stringify(_this.sluiceJzMiddData),sluiceHeightChangeBefore:_this.sluiceHeightChangeBefore,sluiceChangeType:_this.sluiceChangeType},
                function (msg) {
                if(msg == 1){
                    _this.$message({
                        message:'闸门控制操作记录已更新',
                        type:'success'
                    })
                }else{
                    _this.$message({
                        message:'闸门控制操作记录更新失败',
                        type:'error'
                    })
                }
            });
        },

        /**
         * 闸门高度调整
         * @param flag
         */
        channelGateChange:function (sluiceCurrentHeight) {
            var _this = this;
            //调整该div的margin-top属性来控制闸门的上升与下降
            $("#channelGateId").animate({marginTop:-(sluiceCurrentHeight*_this.ratioOfOpeningToPX).toFixed(0) + 'px'},50);
            //改变当前实时显示闸门开度
            _this.sluiceData.ssjmdSluiceHeight = sluiceCurrentHeight;
        },

        //闸门控制按钮开启
/*        gateControlOpen:function(){
            var _this = this;
            //闸门控制开启后“执行”按钮设置为非活性，防止二次点击
            _this.openGateControlBtnDisabled = true;
            //闸门控制开启后“停止”按钮设置为活性
            _this.closeGateControlBtnDisabled = false;
            // _this.gateOpening(sluiceCurrentHeight);
        },*/

        //闸门远程控制进行中
        gateControlOpening:function(sluiceCurrentHeight){
            var _this = this;
            _this.channelGateChange(sluiceCurrentHeight);
        },

        //闸门远程控制结束
        gateControlStop:function(){
            var _this = this;
            //闸门控制结束后“开启”按钮设置为活性
            _this.openGateControlBtnDisabled = false;
            //闸门控制结束后“关闭”按钮设置为非活性
            _this.closeGateControlBtnDisabled = true;
            //远程控制操作记录表更新
            if(_this.sluiceHeightChangeBefore != _this.sluiceData.ssjmdSluiceHeight){
                _this.remoteControlOperationRecordUpdate();
            }
            //更新远程控制前闸门开度
            _this.sluiceHeightChangeBefore = _this.sluiceData.ssjmdSluiceHeight;
        },

        /*定时器开启方法*/
/*        timerStart:function () {
            var _this = this;
            //闸门控制开启后“开启”按钮设置为非活性，防止二次点击
            _this.openGateControlBtnDisabled = true;
            //闸门控制开启后“关闭”按钮设置为活性
            _this.closeGateControlBtnDisabled = false;
            //flag:0:下降;1:上升
            _this.sluiceChangeType = _this.preGateOpening < _this.gateChangePX?0:1;
            //定时任务开启，100毫秒执行一次
            _this.setIntervalTask = setInterval(function () {
                _this.channelGateChange(_this.sluiceChangeType);
                //当前闸门开度与预设开度相等时，定时任务结束
                if(_this.gateChangePX == _this.preGateOpening){
                    _this.timerStop();
                }
            },100);//100毫秒执行一次
        },*/
        /*定时器销毁方法*/
/*        timerStop:function () {
            var _this = this;
            clearInterval(_this.setIntervalTask);
            //闸门控制结束后“开启”按钮设置为活性
            _this.openGateControlBtnDisabled = false;
            //闸门控制结束后“关闭”按钮设置为非活性
            _this.closeGateControlBtnDisabled = true;
            //远程控制操作记录表更新
            _this.remoteControlOperationRecordUpdate();
        },*/

        //时间格式化（"YYYY-MM-DD HH:mm:ss"）
        dateFormat:function(row, column){
            var _this = this;
            var date = row[column.property];
            return moment(date).format("YYYY-MM-DD HH:mm:ss");
        },

        //数据加密
        encrypt:function(word){
            var _this = this;
            var key = CryptoJS.enc.Utf8.parse(_this.AESSecretKey);
            var srcs = CryptoJS.enc.Utf8.parse(word);
            var encrypted = CryptoJS.AES.encrypt(srcs, key, {mode:CryptoJS.mode.ECB,padding: CryptoJS.pad.Pkcs7});
            return encrypted.toString();
        },

        //数据解密
         decrypt:function(word){
             var _this = this;
            var key = CryptoJS.enc.Utf8.parse(_this.AESSecretKey);
            var decrypt = CryptoJS.AES.decrypt(word, key, {mode:CryptoJS.mode.ECB,padding: CryptoJS.pad.Pkcs7});
            return CryptoJS.enc.Utf8.stringify(decrypt).toString();
        },
    },
    created:function(){
        var _this = this;
        _this.handleUserInfo();
    },
    mounted:function(){
        var _this = this;
        _this.handleVityTree();
    },
});

//页面的关闭或刷新事件关闭websocket连接
window.onunload = function() {
    if(websocket != null){
        websocket.close();//关闭websocket连接
    }
};
window.onbeforeunload = function(event) {
    if(websocket != null){
        websocket.close();//关闭websocket连接
    }
};
