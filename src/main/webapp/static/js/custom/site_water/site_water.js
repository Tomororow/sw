/* 相对链接的基准URL */
var curWwwPath = window.document.location.href;
var pathName = window.document.location.pathname;
var pos = curWwwPath.indexOf(pathName);
var localhostPaht = curWwwPath.substring(0,pos);
var projectName = pathName.substring(0,pathName.substr(1).indexOf('/')+1);
var ctxPath = localhostPaht + projectName;
var picPath = localhostPaht;
var imagePath = ctxPath+"/static/images/";

var url ;
for(var i=0;i<4;i++){
    url=window.location.href.indexOf("/",url+1);
}
var localPath = window.location.href.substring(0,url);

var visFlow = new Vue({
    el:'#visFlow',
    data:{
        dialogVisible:false,//图片上传显示flag
        calList:[],
        state:'0',
        count:0,
        currentPage:1, //画面当前页码数
        pagesize:'10', //画面当前页显示的最大数量
        dialogCurrentPage:1, //dialog当前页码数
        dialogPagesize:'10', //dialog当前页显示的最大数量
        currentZage:1,
        pageZize:'10',
        isExcel:'',
        map:{},
        ExcelText:'',
        canclStu:{
            cancId:'', //水位流量关系表上传时需要选择的具体渠道id
            canclName:'',
            canclevl:'',
        },
        canclName:'',
        activeName: 'first', //Tabs标签页默认第一个
        treeFlag:'1', //数目录展示flag 1：水管区 2：行政区域
        videoSiteUpdateImageUrl:ctxPath+"/video/imageUpdate",//视频站图片单独修改路径
        waterSluiceUpdateImageUrl:ctxPath+"/site_sluice_manage/photoBeforeUpdate",//闸门站安装前图片单独修改路径
        waterSurveyUpdateImageUrl:ctxPath+"/water_survey_site/waterImage", //在线水质监测站 图片提交路径
        meteorSurveyUpdateImageUrl:ctxPath+'/meteor_survey_site/updateImage', //气象站图片单独修改路径
        meteorSurveySubmitImageUrl:ctxPath+'/meteor_survey_site/submitData', //气象站图片提交地址
        moistureSurveyUpdateImageUrl:ctxPath+'/moisture_survey_site/updateImage', //土壤墒情站图片单独修改路径
        moistureSurveySubmitImageUrl:ctxPath+'/moisture_survey_site/insertData', //土壤墒情站图片提交地址
        evaporateSurveyUpdateImageUrl:ctxPath+'/evaporate_survey_site/updateImage', //蒸发站图片单独修改路径
        evaporateSurveySubmitImageUrl:ctxPath+'/evaporate_survey_site/addData', //蒸发站图片提交地址
        areaCode:'',//最高级水管区域code
        canalCode:'',
        tabData:[],//水位站的数据集合
        lightCanalData:[], //明渠流量站的数据集合
        videoData:[],//视频站的数据集合
        videoDeviceModelData:[],//设备类型数据集合
        sluiceData:[],//闸门站的数据集合
        rainData:[],//雨量站的数据集合
        waterSurveyData:[], //在线水质监测站数据集合
        sessionList:[], //存储到sessionStorage
        meteorSurveyData:[], //气象站数据集合
        moistureSurveyData:[], //土壤墒情站数据集合
        evaporateSurveyData:[], //蒸发站数据集合
        streamSurveyData:[], //流量站数据集合

        editDialogVisible:false, //站点dialog显示flag(修改)
        detailDialogVisible:false, //站点dialog显示flag(详情)
        disaled:false, //新增站点jsp画面的上传按钮活性设置
        dialogData:[], //站点显示数据
        doAddSiteWithValues:{ //新增站点时需要的信息
            arayId:'',
            arayName:'',
            arayCode:'',
            areaLevel:'',
        },

        //运营商列表
        options: [{
            value: '中国电信',
            label: '中国电信'
        }, {
            value: '中国移动',
            label: '中国移动'
        }, {
            value: '中国联通',
            label: '中国联通'
        }],
        //修改的表单数据
        updateData:{},
        //蒸发站新增数据
        evaAdd:{
            evaporateName:'',
            coding:'',
            equipName:'',
            equipCoding:'',
            simClip:'',
            DetailAddress:'',
            simClipOperator:'',
            buildTime:'',
            longitude:'',
            latitude:'',
            elevation:'',
            administrativeCoding:'',
            evaporateAddress:'',
            evaporateImage:'',
        },
        //表单验证规则
        rules:{
            //气象站
            meteorName:[{required: true, message: '请输入气象站名称', trigger: 'blur'}],
            coding:[{required: true, message: '请输入站点编码', trigger: 'blur'}],
            longitude:[{required: true, message: '请输入经度', trigger: 'blur'}],
            latitude:[{required: true, message: '请输入纬度', trigger: 'blur'}],
            elevation:[{required: true, message: '请输入高程', trigger: 'blur'}],
            monitorDetailAddress:[{required: true, message: '请填写详细信息', trigger: 'blur'}],
            monitorImage:[{required: true, message: '请上传图片', trigger: 'blur'}],
            equipName:[{required: true, message: '请输入设备名称', trigger: 'blur'}],
            equipCoding:[{required: true, message: '请输入设备编码', trigger: 'blur'}],
            simClip:[{required: true, message: '请输入SIM卡号', trigger: 'blur'}],
            simClipOperator:[{required: true, message: '请选择运营商', trigger: 'blur'}],
            buildTime:[{required: true, message: '请选择修建时间', trigger: 'blur'}],
            //土壤墒情站
            moistureName:[{required: true, message: '请输入墒情站名称', trigger: 'blur'}],
            moistureImage:[{required: true, message: '请上传图片', trigger: 'blur'}],
            //蒸发站
            evaporateName:[{required: true, message: '请输入蒸发站名称', trigger: 'blur'}],
            evaporateImage:[{required: true, message: '请上传图片', trigger: 'blur'}],
        },
        //气象站点新增数据
        monitorImport:{
            meteorName:'',
            coding:'',
            elevation:'',
            administrativeCoding:'',
            longitudeLatitude:'',
            longitude:'',
            latitude:'',
            monitorImage:'',
            monitorAddress:'',
            equipName:'',
            equipCoding:'',
            simClip:'',
            simClipOperator:'',
            buildTime:'',
        },
        //土壤墒情站新增数据
        moisture:{
            moistureName:'',
            coding:'',
            equipName:'',
            equipCoding:'',
            administrativeCoding:'',
            simClip:'',
            simClipOperator:'',
            buildTime:'',
            longitude:'',
            latitude:'',
            elevation:'',
            moistureImage:'',
            moistureAddress:'',
        },

        //闸门站闸门编辑数据
        sluiceGateData:{
            ssgiSluiceGateCode:'',
            ssgiSluiceGateName:'',
            ssgiSluiceInfoId:'',
            ssgiSluiceInfoName:'',
            ssgiSluiceWidth:'',
            ssgiSluiceHeight:'',
            ssgiSluiceWeight:'',
            ssgiSluiceMotorPower:'',
            sluiceTypeName:'',
            ssgiSluiceTypeCode:'',
            ssgiCreateTime:'',
            ssgiSluiceMovieId:'',
        },
        ssgiSluiceMovieIdArray:[],//闸门关联视频站
        sluiceGateRules:{
            ssgiSluiceGateName:[{required: true, message: '请输入闸门名称', trigger: 'blur'}],
            ssgiSluiceGateCode:[{required: true, message: '请输入闸门编码', trigger: 'blur'}],
            ssgiCreateTime:[{required: true, message: '请输入创建时间', trigger: 'blur'}],
        },
        allVideoData:[],//所有视频站数据
        allSluiceType:[],//闸门启闭类型
        expands: [],//只展开一行放入当前行id
    },
    methods:{
        tableRowClassName:function(row, index) {
            if (index%2 !=0) {
                return 'positive-row';
            }
            return '';
        },
        handleSizeChange:function(pagesize){
            var _this = this;
            _this.pagesize = pagesize;
        },
        handleCurrentChange:function(currentPage){
            var _this = this;
            _this.currentPage = currentPage;
        },
        handleDialogSizeChange:function(dialogPagesize){
            var _this = this;
            _this.dialogPagesize = dialogPagesize;
        },
        handleDialogCurrentChange:function(dialogCurrentPage){
            var _this = this;
            debugger
            _this.dialogCurrentPage = dialogCurrentPage;
        },
        //水位流量站某行被点击时触发
        uploadWaterSiteClick:function(row){
            var _this = this;
            debugger
            _this.canclStu.cancId = row.id;
        },
        submitUpload:function(){
            debugger
            var _this = this;
            if(_this.ExcelText==""){
                _this.$message.error('请先选取文件');
            }else{
                if(_this.ExcelText!="水位流量关系表Excel模板.xls"&&_this.ExcelText!="水位流量关系表Excel模板.xlsx"){
                    _this.$message.error('请选择模板Excel填入数据！');
                }else{
                    if(_this.canclStu.cancId == ""){
                        _this.$message.error('请选择具体渠道');
                    }else{
                        if(_this.isExcel == false){
                            _this.$message.error('Excel文件格式错误，请选择正确格式的Excel文件!');
                        }else{
                            _this.map.waterId = _this.canclStu.cancId;
                            _this.$refs.upload.submit();
                        }
                    }
                }
            }
        },
        handleSuccess:function(response, file, fileList){
            debugger
            var _this = this;
            if(response=="success"){
                _this.state = '1';
                _this.canclStu = {};
                _this.canclName = "";
                _this.$message.success('数据导入成功!');
            }else if(response=="warn"){
                _this.$message.error('报表数据为空或格式不正确！');
            }
        },
        //下载Excel模板
        downloadExcel:function(){
            debugger
            var _this = this;
            window.location.href=ctxPath + "/site_water_manage/downLoadExcel";
        },
        handleChange:function(file, fileList){
            var _this = this;
            debugger
            const isExcel = (file.name.substring(file.name.lastIndexOf(".")+1)=="xlsx")||(file.name.substring(file.name.lastIndexOf(".")+1)=="xls");
            if (!isExcel) {
                _this.$message.error('请选择正确格式的Excel文件!');
            }else{
                if(_this.state==1){
                    _this.ExcelText = "";
                    _this.state = '0';
                }else{
                    _this.ExcelText = file.name;
                }

            }
            _this.isExcel = isExcel;
            return isExcel;
        },
        //tabs标签点击切换方法
        handleChangeTabs:function () {
            debugger
            var _this = this;
            _this.currentPage = 1;
            _this.dialogCurrentPage = 1;
            if(_this.activeName=='first' || _this.activeName=='second'
                || _this.activeName=='third' || _this.activeName=='fourth'){
                _this.treeFlag = '1';
            }else{
                _this.treeFlag = '2';
            }
            _this.handleVityTree();
        },
        //水位流量站数据展示
        showSiteWaterData:function(canalCode){
            debugger
            var _this = this;
            $.post(ctxPath + "/site_water_manage/page",{canalCode:canalCode},function (data) {
                _this.tabData = JSON.parse(data);
            })
        },
        //明渠流量站数据展示
        showLigntCanalData:function(canalCode){
            debugger
            var _this = this;
            $.post(ctxPath + "/site_water_manage/lightCanalList",{canalCode:canalCode},function (data) {
                _this.lightCanalData = JSON.parse(data)
            })
        },
        //视频站数据展示
        showVideoData:function(canalCode){
            debugger
            var _this = this;
            $.post(ctxPath + "/video/getVideoSiteList",{canalCode:canalCode},function (data) {
                _this.videoData = JSON.parse(data);
            });
            $.post(ctxPath + "/video/query_video_deviceModel",function (data) {
                _this.videoDeviceModelData = JSON.parse(data);
            });
        },
        //查询所有视频
        queryAllVideoData:function(){
            debugger
            var _this = this;
            $.post(ctxPath + "/video/query_all_video",function (data) {
                _this.allVideoData = JSON.parse(data);
            });
        },
        //查询闸门启闭类型
        querySluiceTypes:function(){
            debugger
            var _this = this;
            $.post(ctxPath + "/site_sluice_manage/query_sluice_type",function (data) {
                _this.allSluiceType = JSON.parse(data);
            });
        },
        //闸门站数据展示
        showSluiceData:function(canalCode){
            debugger
            var _this = this;
            $.post(ctxPath + "/site_sluice_manage/page",{canalCode:canalCode},function (data) {
                _this.sluiceData = JSON.parse(data);
                if(_this.sluiceData.length > 0){
                    if(_this.expands.length>0){
                        _this.expands.shift();
                    }
                    _this.expands.push(_this.sluiceData[0].id);
                }
            })
        },
        //雨量站数据展示
/*        showRainData:function(areaCode){
            debugger
            var _this = this;
            $.post(ctxPath + "/siteRainManage/getRainSiteList",{areaId:areaCode},function (data) {
                _this.rainData = JSON.parse(data);
            })
        },*/
        //在线水质监测站数据展示
        showWaterSurveyData:function(areaCode){
            debugger
            var _this = this;
            sessionStorage.obj="";
            $.post(ctxPath+"/water_survey_site/waterData",{id:areaCode},function(data){
                _this.waterSurveyData = JSON.parse(data);
            });
        },
        //气象站数据展示
        showMeteorSurveyData:function(areaCode){
            debugger
            var _this = this;
            _this.monitorImport.administrativeCoding = _this.doAddSiteWithValues.arayCode;
            $.post(ctxPath+"/meteor_survey_site/selectTable",{id:areaCode},function(data){
                _this.meteorSurveyData = JSON.parse(data);
            });
        },
        //土壤墒情站数据展示
        showMoistureSurveyData:function(areaCode){
            debugger
            var _this = this;
            _this.moisture.administrativeCoding = _this.doAddSiteWithValues.arayCode;
            $.post(ctxPath+"/moisture_survey_site/selectAll",{id:areaCode},function(data){
                _this.moistureSurveyData = JSON.parse(data);
            });
        },
        //蒸发站数据展示
        showEvaporateSurveyData:function(areaCode){
            debugger
            var _this = this;
            _this.evaAdd.administrativeCoding =_this.doAddSiteWithValues.arayCode;
            $.post(ctxPath+"/evaporate_survey_site/selectAll",{id:areaCode},function(data){
                _this.evaporateSurveyData = JSON.parse(data);
            });
        },
        //数目录结构加载
        handleVityTree:function(id,code){
            var _this = this;
            debugger
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
                        name:_this.treeFlag == '2'?"areaName":'canalName'
                    }
                },
            };
            var areaId = _this.treeFlag == '2'?'#areaZtree':'#treeDemo';
            var url = _this.treeFlag == '2'?'/sysArea/areaTreeList':'/cal_canal_info/tree_canal';
            $.post(ctxPath+url,{waterId:id,waterCode:code},function(result){
                debugger
                if(result!=""&&result!=null) {
                    var treeData = _this.treeFlag == '2'?JSON.parse(result):result;
                    treeData[0].open = true;
                    if(treeData[0].children[0] != undefined){
                        treeData[0].children[0].open = true;
                    }
                    $.fn.zTree.init($(areaId), setting, treeData);
                    // 新增站点时所需要的区域信息
                    _this.doAddSiteWithValues.arayId = treeData[0].id;
                    _this.doAddSiteWithValues.arayName = _this.treeFlag == '2'?treeData[0].areaName:treeData[0].canalName;
                    _this.doAddSiteWithValues.arayCode = _this.treeFlag == '2'?treeData[0].areaCode:treeData[0].canalCode;
                    _this.canalCodeGet(); //canalCode取得
                    //各站点数据展示
                    switch (_this.activeName) {
                        case "first": //水位流量站
                            _this.canalCode = treeData[0].canalCode;
                            _this.showSiteWaterData(treeData[0].canalCode);
                            break;
                        case "second": //明渠流量站
                            _this.canalCode = treeData[0].canalCode;
                            _this.showLigntCanalData(treeData[0].canalCode);
                            break;
                        case "third": //视频站
                            _this.canalCode = treeData[0].canalCode;
                            _this.showVideoData(_this.canalCode);
                            break;
                        case "fourth": //闸门站
                            _this.canalCode = treeData[0].canalCode;
                            _this.showSluiceData(_this.canalCode);
                            break;
/*                        case "fifth": //雨量站
                            _this.areaCode = treeData[0].id;
                            _this.showRainData(_this.areaCode);
                            break;*/
                        case "sixth": //在线水质监测站
                            _this.areaCode = treeData[0].id;
                            _this.showWaterSurveyData(_this.areaCode);
                            break;
                        case "seventh": //气象站
                            _this.areaCode = treeData[0].id;
                            _this.showMeteorSurveyData(_this.areaCode);
                            break;
                        case "eighth": //土壤墒情站
                            _this.areaCode = treeData[0].id;
                            _this.showMoistureSurveyData(_this.areaCode);
                            break;
                        case "ninth": //蒸发站
                            _this.areaCode = treeData[0].id;
                            _this.showEvaporateSurveyData(_this.areaCode);
                            break;
                        default:;
                    }
                }
            });
        },
        // 数目录菜单点击方法
        zTreeOnClick:function(event, treeId, treeNode){
            var _this = this;
            debugger
            _this.doAddSiteWithValues.arayId = treeNode.id; // 新增站点时所需要的区域信息
            _this.doAddSiteWithValues.arayName = _this.treeFlag == '2'?treeNode.areaName:treeNode.canalName;
            _this.doAddSiteWithValues.arayCode = _this.treeFlag == '2'?treeNode.areaCode:treeNode.canalCode;
            _this.doAddSiteWithValues.areaLevel = _this.treeFlag == '2'?treeNode.areaLevel:treeNode.canallevelCode;
            _this.canalCodeGet(); //canalCode取得
            switch (_this.activeName) {
                case "first": //水位流量站
                    this.showSiteWaterData(treeNode.canalCode);
                    break;
                case "second": //明渠流量站
                    this.showLigntCanalData(treeNode.canalCode);
                    break;
                case "third": //视频站
                    this.showVideoData(treeNode.canalCode);
                    break;
                case "fourth": //闸门站
                    this.showSluiceData(treeNode.canalCode);
                    break;
                // case "fifth": //雨量站
                //     this.showRainData(treeNode.id);
                //     break;
                case "sixth": //在线水质监测站
                    this.showWaterSurveyData(treeNode.id);
                    break;
                case "seventh": //气象站
                    this.showMeteorSurveyData(treeNode.id);
                    break;
                case "eighth": //土壤墒情站
                    this.showMoistureSurveyData(treeNode.id);
                    break;
                case "ninth": //蒸发站
                    this.showEvaporateSurveyData(treeNode.id);
                    break;
                default:;
            }
        },
        //时间格式化（"YYYY-MM-DD HH:mm:ss"）
        dateFormat:function(row, column){
            var _this = this;
            var date = row[column.property];
            return moment(date).format("YYYY-MM-DD HH:mm:ss");
        },
        formatterGrade:function(row, column, value, index){
            var _this = this;
            return value == 20 ? "Ⅰ类":''||value == 40 ? "Ⅱ类":''|| value == 60 ? "Ⅲ类":''|| value == 80 ? "Ⅳ类":''|| value == 100 ?"Ⅴ类":'请选择';
        },
        //页面表格修改图片
        updateImage:function(row,type){
            var _this = this;
            debugger
            _this.dialogVisible=true;
            switch (_this.activeName) {
                case "first": //水位流量站
                    //TODO
                case "second": //明渠流量站
                    //TODO
                case "third": //视频站
                    _this.map.video = JSON.stringify(row);
                    break;
                case "fourth": //闸门站
                    if(type == 0){
                        _this.waterSluiceUpdateImageUrl = ctxPath+"/site_sluice_manage/photoBeforeUpdate";//闸门站安装前图片单独修改路径
                    }else{
                        _this.waterSluiceUpdateImageUrl = ctxPath+"/site_sluice_manage/photoAfterUpdate";//闸门站安装后图片单独修改路径
                    }
                    _this.map.sluice = JSON.stringify(row);
                    break;
                case "sixth": //在线水质监测站
                    _this.map.commodity = JSON.stringify(row);
                    break;
                case "seventh": //气象站
                    _this.map.mapData = JSON.stringify(row);
                    break;
                case "eighth": //土壤墒情站·
                    _this.map.moisture = JSON.stringify(row);
                    break;
                case "ninth": //蒸发站
                    _this.map.evaAdd = JSON.stringify(row);
                    break;
                default:;
            }
            _this.$refs.upload.submit();
        },
        //图片上传成功回调
        onSuccess:function(response, file, fileList){
            var _this = this;
            debugger
            _this.$message({
                message: '恭喜你，图片修改成功！',
                type: 'success'
            });
            _this.dialogVisible = false;
        },
        //图片上传失败回调
        onError:function(err, file, fileList){
            var _this = this;
            debugger
            _this.$message({
                message: '警告，图片未修改！',
                type: 'warning'
            });
            _this.dialogVisible = false;
            /* window.location.reload();
 */     },
        //图片改变回调函数
        imageChange:function(file,fileList){
            var _this = this;
            debugger
            const isJPG = (file.raw.type === 'image/jpeg')||(file.raw.type === 'image/png');
            const isLt2M = file.size / 1024 / 1024 < 2;
            if (!isJPG) {
                this.$message.error('上传图片只能是 JPG或PNG格式!');
            }
            if (!isLt2M) {
                this.$message.error('上传图片大小不能超过 2MB!');
            }
            if(_this.activeName == 'seventh'){ //气象站
                _this.monitorImport.monitorImage = $("#seed").next("input[type='file']").val();
                _this.disaled = true;
            }
            if(_this.activeName == 'eighth'){ //土壤墒情站
                _this.moisture.moistureImage = $("#seed").next("input[type='file']").val();
                _this.disaled = true;
            }
            if(_this.activeName == 'ninth'){ //蒸发站
                _this.evaAdd.evaporateImage = $("#seed").next("input[type='file']").val();
                _this.disaled = true;
            }
            return isJPG && isLt2M;
        },
        //表单右上角close按钮关闭前的回调
/*        closeDialog:function(formName){
            var _this = this;
            debugger
            this.$confirm('确认关闭？')
                .then(_ => {
                    // done();
                    // location.reload();
                    this.doEditCancel(formName);
                }).catch(_ => {});
        },*/
        //气象站新增站点提交
        submitForm:function(ruleForm){
            var _this = this;
            debugger
            _this.$refs[ruleForm].validate(function(valid){
                if(valid){
                    if(_this.activeName == 'seventh') { //气象站
                        _this.monitorImport.longitudeLatitude = _this.monitorImport.longitude+"-"+_this.monitorImport.latitude;
                        _this.map.monitorImport = JSON.stringify(_this.monitorImport);
                    }else if(_this.activeName == 'eighth') { //土壤墒情站
                        _this.map.moisture = JSON.stringify(_this.moisture);
                    }else if(_this.activeName == 'ninth') { //蒸发站
                        _this.map.evaAdd = JSON.stringify(_this.evaAdd);
                    }
                    _this.$refs.upload.submit();
                    $('#myModal').modal('hide')
                    _this.$message({
                        message: '新增成功！',
                        type: 'success'
                    });
                    if(_this.activeName == 'seventh') { //气象站
                        _this.showMeteorSurveyData(_this.areaCode);
                    }else if(_this.activeName == 'eighth') { //土壤墒情站
                        _this.showMoistureSurveyData(_this.areaCode);
                    }else if(_this.activeName == 'ninth') { //蒸发站
                        _this.showEvaporateSurveyData(_this.areaCode);
                    }
                }else{
                    _this.$message({
                        message: '警告，表单填写不完整！',
                        type: 'warning'
                    });
                }
            });
        },
        //操作：修改
        doEdit:function (row) {
            var _this = this;
            debugger
            let submitId = '';
            let editContent = '';
            let lsyerSize = '';
            let id = row.id;
            switch (_this.activeName) {
                case "first": //水位流量站
                    submitId = 'edit-waterSite-form';
                    editContent = ctxPath + '/site_water_manage/edit_page?id='+id;
                    lsyerSize = ['650px', '800px'];
                    _this.dialogOpen(submitId,editContent,lsyerSize);
                    break;
                case "second": //明渠流量站
                    submitId = 'edit-waterSite-form';
                    editContent = ctxPath + '/site_water_manage/edit_page?id='+id;
                    lsyerSize = ['650px', '800px'];
                    _this.dialogOpen(submitId,editContent,lsyerSize);
                    break;
                case "third": //视频站
                    _this.dialogData = row;
                    _this.editDialogVisible = true;
                    // submitId = 'edit-video-form';
                    // editContent = ctxPath + '/video/edit_page?id='+id;
                    break;
                case "fourth": //闸门站
                    submitId = 'edit-sluice-form';
                    editContent = ctxPath+"/site_sluice_manage/edit_page?sluiceId="+id;
                    lsyerSize = ['750px', '800px'];
                    _this.dialogOpen(submitId,editContent,lsyerSize);
                    break;
                case "fifth": //雨量站
                    // _this.dialogData = row;
                    // _this.editDialogVisible = true;
                case "sixth": //在线水质监测站
                    layer.open({
                        // title: "修改【"+row.monitorName+"】监测站信息",
                        content:ctxPath+"/water_survey_site/updateForms?id="+id,
                        type:2, // 基本层类型
                        area: ["40%","60%"], // 弹窗大小(宽高)
                        maxmin: true,
                        btn: ['确定', '取消'], // 页面按钮
                        closeBtn: 1, // 显示关闭按钮(右上角)
                        shade: 0.5,	// 遮罩阴影程度
                        resize: false, // 禁止拉伸
                    });
                    break;
                case "seventh": //气象站
                case "eighth": //土壤墒情站
                case "ninth": //蒸发站
                default:;
            }
        },
        //dialog弹出
        dialogOpen:function(submitId,editContent,lsyerSize){
            var _this = this;
            debugger
            layer.open({
                id: submitId,
                type: 2, //此处以iframe举例,
                // title: '你编辑的渠道为'+id,
                area: lsyerSize,
                shade: 0.8,
                maxmin: true,
                content: editContent,
                btn: ['确定', '关闭'], //只是为了演示
                btn1: function () {
                    //子页面提交
                    _this.doSubmit(submitId);
                },
                btn2: function () {
                    layer.closeAll();
                },
                zIndex: layer.zIndex,//重点1
                success: function (layero) {
                    layer.setTop(layero); //重点2
                }
            });
        },
        //操作：编辑提交
        doSubmit:function(submitId){
            var _this = this;
            debugger
            let frameId = '';
            //父页面数据刷新
            switch (_this.activeName) {
                case "first": //水位流量站
                    //子页面提交
                    frameId=document.getElementById(submitId).getElementsByTagName("iframe")[0].id;
                    $('#'+frameId)[0].contentWindow.mySubmit();
                    _this.showSiteWaterData(_this.canalCode);
                    break;
                case "second": //明渠流量站
                    //子页面提交
                    frameId=document.getElementById(submitId).getElementsByTagName("iframe")[0].id;
                    $('#'+frameId)[0].contentWindow.mySubmit();
                    _this.showLigntCanalData(_this.canalCode);
                    break;
                case "third": //视频站
                    if('add-video-form' == submitId){
                        frameId=document.getElementById(submitId).getElementsByTagName("iframe")[0].id;
                        $('#'+frameId)[0].contentWindow.mySubmit();
                        _this.showVideoData(_this.canalCode);
                    }else{
                        $.post(ctxPath+"/video/edit",{editData:JSON.stringify(_this.dialogData)},function (data) {
                            _this.editDialogVisible = false;
                            _this.showVideoData(_this.canalCode);
                        })
                    }
                    break;
                case "fourth": //闸门站
                    //子页面提交
                    frameId=document.getElementById(submitId).getElementsByTagName("iframe")[0].id;
                    $('#'+frameId)[0].contentWindow.mySubmit();
                    _this.showSluiceData(_this.areaCode);
                    break;
                case "fifth": //雨量站
 /*                   $.post(ctxPath+"/siteRainManage/edit",{editData:JSON.stringify(_this.dialogData)},function (data) {
                        _this.editDialogVisible = false;
                        _this.showRainData(_this.areaCode);
                    })*/
                case "sixth": //在线水质监测站
                case "seventh": //气象站
                case "eighth": //土壤墒情站
                case "ninth": //蒸发站
                default:;

            }
            // window.location.replace(editSubmitUrl);
        },
        //修改dialog取消button压下时执行：关闭对话框，清除表单验证
        doEditCancel:function(formName){
            var _this = this;
            debugger
            this.editDialogVisible = false;
            this.$refs[formName].resetFields();
        },
        //新增dialog取消或关闭时，关闭对话框，清除表单验证
        doAddCancel:function(formName){
            var _this = this;
            debugger
            this.$refs[formName].resetFields();
        },

        //操作：删除
        doDelete:function (row) {
            var _this = this;
            debugger
            this.$confirm('确认删除该站点？','删除确认',{
                type: 'warning'
            }).then(() => {
                switch (_this.activeName) {
                    case "first": //水位流量站
                        $.post(ctxPath+"/site_water_manage/delete",{id:row.id},function (msg) {
                            _this.messageJudge(msg);
                            _this.showSiteWaterData(_this.canalCode);
                        });
                        break;
                    case "second": //明渠流量站
                        $.post(ctxPath+"/site_water_manage/delete",{id:row.id},function (msg) {
                            _this.messageJudge(msg);
                            _this.showLigntCanalData(_this.canalCode);
                        });
                        break;
                    case "third": //视频站
                        $.post(ctxPath+"/video/delete",{id:row.id},function (msg) {
                            _this.messageJudge(msg);
                            _this.showVideoData(_this.canalCode);
                        });
                        break;
                    case "fourth": //闸门站
                        $.post(ctxPath+"/site_sluice_manage/delete",{id:row.id},function (msg) {
                            _this.messageJudge(msg);
                            _this.showSluiceData(_this.areaCode);
                        });
                        break;
                    case "fifth": //雨量站
/*                        $.post(ctxPath+"/siteRainManage/delete",{id:row.id},function (msg) {
                            _this.messageJudge(msg);
                            _this.showRainData(_this.areaCode);
                        })*/
                    case "sixth": //在线水质监测站
                        $.post(ctxPath+"/water_survey_site/waterDelete",{id:row.id},function(result){
                            _this.messageJudge(result.state);
                            _this.showWaterSurveyData(_this.canalCode);
                        });
                        break;
                    case "seventh": //气象站
                        $.post(ctxPath+"/meteor_survey_site/deleteTable",{"id":row.id,"image":row.monitorImage},function(result){
                            _this.messageJudge(result.state);
                            _this.showMeteorSurveyData(_this.areaCode);
                        });
                        break;
                    case "eighth": //土壤墒情站
                        $.post(ctxPath+"/moisture_survey_site/deleterow",{"row":JSON.stringify(row)},function(result){
                            _this.messageJudge(result.state);
                            _this.showMoistureSurveyData(_this.areaCode);
                        });
                        break;
                    case "ninth": //蒸发站
                        $.post(ctxPath+"/evaporate_survey_site/deleteData",{row:JSON.stringify(row)},function(result){
                            _this.messageJudge(result.state);
                            _this.showEvaporateSurveyData(_this.areaCode);
                        });
                        break;
                    default:;
                }
            }).catch(_ => { });
        },

        //取得删除回调后要显示到页面的message
        messageJudge:function (msg) {
            var _this = this;
            debugger
            if(msg == 1){
                this.$message({
                    type: 'success',
                    message: '删除成功'
                });
            }else{
                this.$message({
                    type: 'error',
                    message: '删除失败'
                });
            }
        },
        //操作：详情
        doDetail:function (row) {
            var _this = this;
            debugger
            switch (_this.activeName) {
                case "first": //水位流量站
                    $.post(ctxPath+"/site_water_manage/edit_page_data",{"id":row.id},function(data){
                        _this.dialogData = data.data;
                        _this.detailDialogVisible = true;
                    });
                    break;
                case "second": //明渠流量站
                //case "third": //视频站
                case "fourth": //闸门站
                case "fifth": //雨量站
                case "sixth": //在线水质监测站
                case "seventh": //气象站
                case "eighth": //土壤墒情站
                case "ninth": //蒸发站
                default:;
            }
        },
        //详情dialog取消button压下时执行：关闭对话框，当前页码初始化
        doDetailCancel:function(formName){
            var _this = this;
            debugger
            _this.detailDialogVisible = false;
            _this.dialogCurrentPage = 1;
        },
        //气象站页面表格的修改方法
        updateRow1:function(row,type,updateData){
            var _this = this;
            debugger
            if(type==0){
                row.longitude = row.longitudeLatitude.split("-")[0];
                row.latitude = row.longitudeLatitude.split("-")[1];
                _this.updateData = row;
            }else{
                debugger
                _this.$refs[updateData].validate(function(valid){
                    if(valid){
                        _this.updateData.longitudeLatitude = _this.updateData.longitude+"-"+_this.updateData.latitude;
                        $.post(ctxPath+"/meteor_survey_site/updateData",{"result":JSON.stringify(_this.updateData)},function(result){
                            if(result.state == 1){
                                _this.$message({
                                    message: '恭喜你，表单数据修改成功！',
                                    type: 'success'
                                });
                                _this.showMeteorSurveyData(_this.areaCode);
                            }else{
                                _this.$message({
                                    message: '警告，表单数据未修改！',
                                    type: 'warning'
                                });
                            }
                            $('#updateModal').modal('hide')
                        });
                    }else{
                        _this.$message({
                            message: '警告，表单填写不完整！',
                            type: 'warning'
                        });
                    }
                });
            }
        },
        //土壤墒情站页面表格的修改方法
        updateRow2:function(row,type,updateData){
            var _this = this;
            debugger
            if(type==0){
                _this.updateData = row;
            }else{
                debugger
                _this.$refs[updateData].validate(function(valid){
                    if(valid){
                        $.post(ctxPath+"/moisture_survey_site/updateData",{data:JSON.stringify(_this.updateData)},function(data){
                            if(data.state == 1){
                                _this.$message({
                                    message: '恭喜，数据修改成功！',
                                    type: 'success'
                                });
                                _this.showMoistureSurveyData(_this.areaCode);
                            }else{
                                _this.$message({
                                    message: '警告，表单数据未修改！',
                                    type: 'warning'
                                });
                            }
                            $('#updateModal').modal('hide')
                        })
                    }else{
                        _this.$message({
                            message: '警告，数据未修改！',
                            type: 'warning'
                        });
                        $('#updateModal').modal('hide')
                    }
                });
            }
        },
        //蒸发站页面表格的修改方法
        updateRow3:function(row,type,updateData){
            var _this = this;
            debugger
            if(type==0){
                _this.evaAdd = row;
            }else{
                _this.$refs[updateData].validate(function(valid){
                    $.post(ctxPath+"/evaporate_survey_site/updateData",{data:JSON.stringify(_this.evaAdd)},function(data){
                        if(data.state == 1){
                            _this.$message({
                                message: '修改成功！',
                                type: 'success'
                            });
                            _this.showEvaporateSurveyData(_this.areaCode);
                        }else{
                            _this.$message({
                                message: '修改失败！',
                                type: 'warning'
                            });
                        }
                        $('#updateModal').modal('hide');
                    });
                });
            }
        },
        //操作：新增
        doAdd:function () {
            var _this = this;
            debugger
            let layerId = '';
            let addContent = '';
            let areaSize = [];

            let str = _this.doAddSiteWithValues.arayCode;
            // _this.treeFlag == '2' || !(str.substring(6,7)=="0" && str.substring(7,8) == "0")
            if(_this.doAddSiteWithValues.areaLevel != 0){
                switch (_this.activeName) {
                    case "first": //水位流量站
                        layerId = 'add-waterSite-form';
                        addContent = ctxPath +'/site_water_manage/add_page?id='+_this.doAddSiteWithValues.arayId;
                        areaSize = ['650px', '800px'];
                        _this.dialogOpenWithAddSite(layerId,addContent,areaSize);
                        break;
                    case "second": //明渠流量站
                        layerId = 'add-waterSite-form';
                        addContent = ctxPath +'/site_water_manage/add_page?id='+_this.doAddSiteWithValues.arayId;
                        areaSize = ['650px', '800px'];
                        _this.dialogOpenWithAddSite(layerId,addContent,areaSize);
                        break;
                    case "third": //视频站
                        layerId = 'add-video-form';
                        addContent = ctxPath +'/video/addPage?id='+_this.doAddSiteWithValues.arayId;
                        areaSize = ['700px', '780px'];
                        _this.dialogOpenWithAddSite(layerId,addContent,areaSize);
                        break;
                    case "fourth": //闸门站
                        layerId = 'add-sluiceSite-form';
                        addContent = ctxPath +'/site_sluice_manage/add_page?id='+_this.doAddSiteWithValues.arayId;
                        areaSize = ['770px', '680px'];
                        _this.dialogOpenWithAddSite(layerId,addContent,areaSize);
                        break;
                    case "sixth": //在线水质监测站
                        let sessList = new Array(_this.doAddSiteWithValues.arayCode,'');//行政编码与河道编码
                        sessionStorage.obj = JSON.stringify(sessList);
                        layerId = 'add-waterSurveySite-form';
                        addContent = ctxPath +'/water_survey_site/addForms';
                        layer.open({
                            title: "新增"+"【"+_this.doAddSiteWithValues.arayName+"】"+"水质监测站",
                            content:addContent,
                            type:2, // 基本层类型
                            area: ["40%","75%"], // 弹窗大小(宽高)
                            maxmin: true,
                            btn: ['确定', '取消'], // 页面按钮
                            closeBtn: 1, // 显示关闭按钮(右上角)
                            shade: 0.5,	// 遮罩阴影程度
                            resize: false, // 禁止拉伸
                        });
                        break;
                    case "seventh": //气象站
                        _this.monitorImport.meteorName="";_this.monitorImport.coding="";_this.monitorImport.longitude="";
                        _this.monitorImport.latitude="";_this.monitorImport.elevation="";_this.monitorImport.monitorAddress="";
                        _this.monitorImport.monitorImage="";
                        _this.disaled = false;
                        break;
                    case "eighth": //土壤墒情站
                        _this.moisture.moistureName="";_this.moisture.coding="";_this.moisture.equipName="";_this.moisture.equipCoding="";
                        _this.moisture.simClip="";_this.moisture.simClipOperator="";_this.moisture.buildTime="";_this.moisture.longitude="";
                        _this.moisture.latitude="";_this.moisture.elevation="";_this.moisture.moistureAddress = "";_this.moisture.moistureImage = "";
                        _this.disaled = false;
                        break;
                    case "ninth": //蒸发站
                        _this.evaAdd.evaporateName="";_this.evaAdd.coding="";_this.evaAdd.equipName="";_this.evaAdd.equipCoding="";
                        _this.evaAdd.simClip="";_this.evaAdd.simClipOperator="";_this.evaAdd.buildTime="";_this.evaAdd.longitude="";
                        _this.evaAdd.latitude="";_this.evaAdd.elevation="";_this.evaAdd.evaporateAddress = "";_this.evaAdd.evaporateImage = "";
                        _this.disaled = false;
                        break;
                    default:;
                }
            }else{
                _this.$message({
                    message: '请选择具体渠道,当前选择为'+_this.doAddSiteWithValues.arayName,
                    type: 'warning'
                });
            }

        },
        //新增站点时弹窗打开
        dialogOpenWithAddSite:function(layerId,addContent,areaSize){
            var _this = this;
            debugger
            layer.open({
                id: layerId
                ,type: 2 //此处以iframe举例
                ,title: '为【'+_this.doAddSiteWithValues.arayName+'】添加站点'
                ,area: areaSize
                ,shade: 0.8
                ,maxmin: true
                ,content:addContent
                ,btn: ['确定', '关闭'] //只是为了演示
                ,yes: function(){
                    //子页面提交
                    _this.doSubmit(layerId);
                    layer.confirm('你的预测添加成功', {
                        btn: ['确定'] //按钮
                    }, function(){
                        document.forms[0].action=ctxPath + "/site_water_manage/list";
                        document.forms[0].submit();
                        layer.msg('的确很重要', {icon: 1});
                    });
                }
                ,btn2: function(){
                    layer.closeAll();
                }
                ,zIndex: layer.zIndex //重点1
                ,success: function(layero){
                    //start(id,1,2);
                    layer.setTop(layero); //重点2
                }
            });
        },
        //水位站添加提交
/*        doAddSiteSubmit:function (layerId) {
            var _this = this;
            debugger
            let frameId = '';
            //父页面数据刷新
            switch (_this.activeName) {
                case "first": //水位流量站
                    //子页面提交
                    frameId=document.getElementById(layerId).getElementsByTagName("iframe")[0].id;
                    $('#'+frameId)[0].contentWindow.mySubmit();
                    _this.showSiteWaterData(_this.areaCode);
                case "second": //明渠流量站
                case "third": //视频站
                    var frameId=document.getElementById("add-video-form").getElementsByTagName("iframe")[0].id;
                    $('#'+frameId)[0].contentWindow.mySubmit();
            }

        }*/
        //canalCode取得
        canalCodeGet:function () {
            var _this = this;
            debugger
            let sysAreaCode = '';
            let sysWaterAreaCode = '';
            if(_this.treeFlag == '2'){
                sysAreaCode = _this.doAddSiteWithValues.arayCode;
            }else{
                sysWaterAreaCode = _this.doAddSiteWithValues.arayCode;
            }
            //取得canalCode
            $.post(ctxPath + '/user/getCanalCode',{areaCode:sysAreaCode,waterAreaCode:sysWaterAreaCode},function (data) {
                _this.canalCode = data;
            });
        },
/*        change:function (e) {
            var _this = this;
            _this.$forceUpdate();
        }*/

        //新增闸门按钮压下
        doAddSluiceGate:function (row) {
            debugger
            var _this = this;
            _this.sluiceGateData.ssgiSluiceInfoId = row.id;
            _this.sluiceGateData.ssgiSluiceInfoName = row.deviceSluiceName;
            _this.ssgiSluiceMovieIdArray = [];
            if(_this.allVideoData.length == 0){
                _this.queryAllVideoData();
            }
            if(_this.allSluiceType.length == 0){
                _this.querySluiceTypes();
            }
        },
        //闸门dialog关闭
        doSluiceDialogClose:function(formName){
            var _this = this;
            debugger
            _this.$refs[formName].resetFields();
        },
        //闸门添加
        addSluiceGateSubmit:function (formName) {
            debugger
            var _this = this;
            this.$refs[formName].validate((valid) => {
                if(valid){
                    _this.sluiceGateData.ssgiSluiceMovieId = _this.ssgiSluiceMovieIdArray.join(',');
                    $.post(ctxPath + '/site_sluice_manage/sluice_gate_add',{sluiceGateInfo:JSON.stringify(_this.sluiceGateData)},function (msg) {
                        if(msg == 1){
                            _this.$message({
                                message: '添加成功！',
                                type: 'success'
                            });
                        }else{
                            _this.$message({
                                message: '添加失败！',
                                type: 'warning'
                            });
                        }
                        _this.doSluiceDialogClose('sluiceGateData');
                        $('#mySluiceModalAdd').modal('hide');
                        _this.showSluiceData(_this.areaCode);
                    });
                }else{
                    _this.$message({
                        message: '请输入必须入力项',
                        type: 'warning'
                    });
                }
            });
        },
        //闸门修改
        doSluiceGateEdit:function (row) {
            debugger
            var _this = this;
            _this.sluiceGateData = JSON.parse(JSON.stringify(row));
            _this.ssgiSluiceMovieIdArray = [];
            if(_this.sluiceGateData.ssgiSluiceMovieId != ""){
                _this.ssgiSluiceMovieIdArray = _this.sluiceGateData.ssgiSluiceMovieId.split(',');
            }
            if(_this.allVideoData.length == 0){
                _this.queryAllVideoData();
            }
            if(_this.allSluiceType.length == 0){
                _this.querySluiceTypes();
            }
        },
        //闸门修改
        editSluiceGateSubmit:function (formName) {
            debugger
            var _this = this;
            this.$refs[formName].validate((valid) => {
                if(valid){
                    _this.sluiceGateData.ssgiSluiceMovieId = _this.ssgiSluiceMovieIdArray.join(',');
                    $.post(ctxPath + '/site_sluice_manage/sluice_gate_edit',{sluiceGateInfo:JSON.stringify(_this.sluiceGateData)},function (msg) {
                        if(msg == 1){
                            _this.$message({
                                message: '修改成功！',
                                type: 'success'
                            });
                        }else{
                            _this.$message({
                                message: '修改失败！',
                                type: 'warning'
                            });
                        }
                        $('#mySluiceModalEdit').modal('hide');
                        _this.showSluiceData(_this.areaCode);
                    });
                }else{
                    _this.$message({
                        message: '数据未修改,请修改后提交！',
                        type: 'warning'
                    });
                }
            });
        },
        //闸门删除
        doSluiceGateDelete:function (row) {
            debugger
            var _this = this;
            this.$confirm('是否确认删除该闸门!','闸门删除确认',{
                confirmButtonText: '确定',
                cancelButtonText: '取消',
                type: 'warning'
            }).then(() => {
                $.post(ctxPath + '/site_sluice_manage/sluice_gate_delete',{id:row.id},function (msg) {
                    if(msg == 1){
                        _this.$message({
                            message: '删除成功！',
                            type: 'success'
                        });
                    }else{
                        _this.$message({
                            message: '删除失败！',
                            type: 'warning'
                        });
                    }
                    $('#mySluiceModalEdit').modal('hide');
                    _this.showSluiceData(_this.areaCode);
                });
            }).catch(_ => {});
        },
        getRowKeys:function(row){
            return row.id
        },
        //手风琴下拉框控制
        handleConnectionSearch:function(row,expandedRows) {
            var _this = this;
            debugger
            if (expandedRows.length) {//说明展开了
                _this.expands = []
                if (row) {
                    _this.expands.push(row.id)//只展开当前行id
                }
            } else {//说明收起了
                _this.expands = []
            }
        },
    },
    created:function(){

    },
    mounted:function() {
        var _this = this;
        debugger
        _this.handleVityTree();
    },
});