/*相关链接*/
var curWwwPath = window.document.location.href;
var pathName = window.document.location.pathname;
var pos = curWwwPath.indexOf(pathName);
var localhostPaht = curWwwPath.substring(0,pos);
var projectName = pathName.substring(0,pathName.substr(1).indexOf('/')+1);
var ctxPath = localhostPaht + projectName;
var picPath = localhostPaht;

var operationRecord= new Vue({
    el:"#operationRecord",
    data:{
        canalCode:'',
        operationRecordList:[],//闸门控制操作记录
        operationRecordHistory:[],//闸门控制历史操作记录
        pageSize:'10',//当前页码数
        currentPage:1,//当前页显示的最大数量
        historyDialogVisible:false,
        dialogCurrentPage:1, //dialog当前页码数
        dialogPageSize:'10', //dialog当前页显示的最大数量
        loading:true, // dialog加载Loading
        dialogSluiceCode:'',//当前历史数据站点编码
        dialogSluiceName:'',//当前历史数据站点名称
        queryStartTime:'',//开始日期
        queryEndTime:'',//结束日期
        // recordCodeQuery:'',//按闸门站编码检索
        recordNameQuery:'',//按闸门站名称检索
        recordOperatorQuery:'',//按闸门站名称检索
        expands: [],//只展开一行放入当前行id
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
        handleDialogSizeChange:function(dialogPageSize){
            var _this = this;
            _this.dialogPageSize = dialogPageSize;
        },
        handleDialogCurrentChange:function(dialogCurrentPage){
            var _this = this;
            _this.dialogCurrentPage = dialogCurrentPage;
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
                debugger
                if(result!=""&&result!=null) {
                    result[0].open = true;
                    if(result[0].children[0] != undefined){
                        result[0].children[0].open = true;
                    }
                    $.fn.zTree.init($('#treeDemo'), setting, result);
                    _this.canalCode = result[0].canalCode;
                    _this.operationRecordQuery();
                }
            });
        },
        //树菜单点击事件
        zTreeOnClick:function(event, treeId, treeNode){
            debugger
            var _this = this;
            _this.operationRecordList = [];
            _this.canalCode = treeNode.canalCode;
            _this.operationRecordQuery();
        },
        //闸门控制操作记录查询
        operationRecordQuery:function () {
            var _this = this;
            debugger
            $.post(ctxPath+"/site_sluice_operation/operation_record_query",{canalCode:_this.canalCode},function (result) {
                _this.operationRecordList = JSON.parse(result);
                if(_this.operationRecordList.length > 0){
                    _this.expands.push(_this.operationRecordList[0].id);
                }
            })
        },
        //按闸门站编码查询
/*        operationRecordQueryByCode:function(){
            var _this = this;
            debugger
            if(_this.recordCodeQuery != ''){
                _this.operationRecordList = [];
                $.post(ctxPath + '/site_sluice_operation/operation_record_condition_query',{canalCode:_this.canalCode,code:_this.recordCodeQuery,name:''},function (data) {
                    _this.operationRecordList = JSON.parse(data);
                })
            }else{
                _this.$message({
                    message: '请输入闸门站编码！',
                    type: 'warning'
                });
            }
        },*/
        //按闸门站名称查询
        operationRecordQueryByName:function(){
            var _this = this;
            debugger
            if(_this.recordNameQuery != ''){
                _this.operationRecordList = [];
                _this.expands = [];
                $.post(ctxPath + '/site_sluice_operation/operation_record_condition_query',{canalCode:_this.canalCode,code:'',name:_this.recordNameQuery},function (data) {
                    _this.operationRecordList = JSON.parse(data);
                    _this.expands.push(_this.operationRecordList[0].id);
                })
            }else{
                _this.$message({
                    message: '请输入闸门站名称！',
                    type: 'warning'
                });
            }
        },
        //按闸门控制操作人员查询
        operationRecordQueryByOperator:function(){
            var _this = this;
            debugger
            if(_this.recordOperatorQuery != ''){
                _this.operationRecordList = [];
                _this.expands = [];
                $.post(ctxPath + '/site_sluice_operation/operation_record_query_operator',{canalCode:_this.canalCode,sluiceOperatorName:_this.recordOperatorQuery},function (data) {
                    _this.operationRecordList = JSON.parse(data);
                    _this.expands.push(_this.operationRecordList[0].id);
                })
            }else{
                _this.$message({
                    message: '请输入操作人员名称！',
                    type: 'warning'
                });
            }
        },
        //闸门控制操作历史记录
        operationHistoryRecordQuery:function (row) {
            var _this = this;
            debugger
            _this.dialogSluiceCode = row.sscorSluiceCode;
            _this.dialogSluiceName = row.sscorSluiceName;
            _this.historyDialogVisible = true; //打开历史数据dialog
            $.post(ctxPath+"/site_sluice_operation/operation_history_record_query",{sscorSluiceCode:row.sscorSluiceCode},function (result) {
                _this.operationRecordHistory = JSON.parse(result);
                _this.loading = false;
            })
        },
        //按时间段查询历史数据
        historyDataQueryByTime:function () {
            var _this = this;
            debugger
            _this.operationRecordHistory = [];
            //时间格式化
            let startTime = moment(_this.queryStartTime).format("YYYY-MM-DD HH:mm:ss");
            let endTime = moment(_this.queryEndTime).format("YYYY-MM-DD HH:mm:ss");
            //日期校验
            let flag = _this.dateJudgment(startTime,endTime);
            if(flag){
                _this.loading = true;
                $.post(ctxPath + "/site_sluice_operation/operation_history_record_time",{sscorSluiceCode:_this.dialogSluiceCode,
                    startTime:startTime,endTime:endTime},function (data) {
                    _this.operationRecordHistory = JSON.parse(data);
                    _this.loading = false;
                })
            }
        },
        //日期判断
        dateJudgment:function(startTime,endTime){
            var _this = this;
            debugger
            if(_this.queryStartTime == '' || _this.queryStartTime == null){
                _this.$message({
                    message: '请输入开始日期！',
                    type: 'warning'
                });
                return false;
            }
            if(_this.queryEndTime == '' || _this.queryEndTime == null){
                _this.$message({
                    message: '请输入结束日期！',
                    type: 'warning'
                });
                return false;
            }
            if(startTime > endTime){
                _this.$message({
                    message: '当前开始日期大于结束日期，请重新选择！',
                    type: 'warning'
                });
                return false;
            }
            return true;
        },
        //报表导出
        sluiceExcelExport:function(){
            var _this = this;
            debugger
            if(_this.operationRecordHistory.length>0){
                window.location.href = ctxPath + "/site_sluice_operation/operation_history_record_export";
            }else{
                _this.$message({
                    message: '当前无历史数据，无法导出，请重新查询！',
                    type: 'warning'
                });
            }
        },
        //时间格式化（"YYYY-MM-DD HH:mm:ss"）
        dateFormat:function(row, column){
            var _this = this;
            var date = row[column.property];
            return moment(date).format("YYYY-MM-DD HH:mm:ss");
        },
        tableRowClassName:function(row, index) {
            if (index%2 !=0) {
                return 'positive-row';
            }
            return '';
        },
        //详情dialog取消button压下时执行：关闭对话框，当前页码初始化
        doCancel:function(formName){
            var _this = this;
            debugger
            _this.detailDialogVisible = false;
            _this.dialogCurrentPage = 1;
            _this.queryStartTime = '';
            _this.queryEndTime = '';
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
    created:function () {
        debugger
        var _this = this;
        _this.handleVityTree();
    },
    mounted:function () {

    }
})