/* 相对链接的基准URL */
var curWwwPath = window.document.location.href;
var pathName = window.document.location.pathname;
var pos = curWwwPath.indexOf(pathName);
var localhostPaht = curWwwPath.substring(0,pos);
var projectName = pathName.substring(0,pathName.substr(1).indexOf('/')+1);
var ctxPath = localhostPaht + projectName;
var picPath = localhostPaht;

var reservoir = new Vue({
    el:'#reservoir',
    data:{
        sysAreaId:'',
        sysAreaCode:'',
        reservoirData:[],//水库数据
        pageSize:'10',
        currentPage:1,
    },
    methods:{
        handleSizeChange:function(size){
            var _this = this;
            _this.pageSize = size;
        },
        handleCurrentChange:function(currentPage){
            var _this = this;
            _this.currentPage = currentPage;
        },

        /*数据查询*/
        handleSelectData:function(){
            var _this = this;
            debugger
            _this.reservoirData = [];
            $.post(ctxPath+'/reservoir/reservoirList',{id:_this.sysAreaCode},function (data) {
                if(data != null && data != ""){
                    _this.reservoirData = JSON.parse(data);
                }
            })
        },

        /*数目录加载*/
        handleVityTree:function (id, code) {
            var _this = this;
            debugger
            var setting={
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
                        name:"areaName"
                    }
                },
            };
            $.post(ctxPath+'/sysArea/areaTreeList',{waterId:id,waterCode:code},function(result){
                debugger
                if(result!=""&&result!=null) {
                    var treeData = JSON.parse(result);
                    treeData[0].open = true;
                    if(treeData[0].children[0] != undefined){
                        treeData[0].children[0].open = true;
                    }
                    $.fn.zTree.init($('#treeDemo'), setting, treeData);
                    _this.sysAreaId = treeData[0].id;
                    _this.sysAreaCode = treeData[0].areaCode;
                    //页面加载完成后默认查询水位站的数据
                    _this.handleSelectData(_this.sysAreaCode);
                }
            });
        },
        /*数目录点击方法*/
        zTreeOnClick:function(event, treeId, treeNode){
            debugger
            var _this = this;
            _this.sysAreaId = treeNode.id;
            _this.sysAreaCode = treeNode.areaCode;
            _this.handleSelectData(_this.sysAreaCode);
        },
    },
    created:function () {

    },
    mounted:function () {
        var _this = this;
        debugger
        _this.handleVityTree();
    },
})