/*相关链接*/
var curWwwPath = window.document.location.href;
var pathName = window.document.location.pathname;
var pos = curWwwPath.indexOf(pathName);
var localhostPaht = curWwwPath.substring(0,pos);
var projectName = pathName.substring(0,pathName.substr(1).indexOf('/')+1);
var ctxPath = localhostPaht + projectName;
var picPath = localhostPaht;

var reservoirMonitor= new Vue({
    el:"#reservoirMonitor",
    data:{
        activeName: '1', //Tabs标签页默认第一个
    },
    methods:{
        //树目录结构加载
        handleVityTree:function(id,code){
            var _this = this;
            debugger
            var setting = {
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
                        name:'areaName'
                    }
                },

            };
            $.post(ctxPath+"/sysArea/areaTreeList",{waterId:id,waterCode:code},function(result){
                debugger
                if(result!=""&&result!=null) {
                    var treeData = JSON.parse(result);
                    treeData[0].open = true;
                    if(treeData[0].children[0] != undefined){
                        treeData[0].children[0].open = true;
                    }
                    $.fn.zTree.init($('#treeDemo'), setting, treeData);
                }
            });
        },
        //树菜单点击事件
        zTreeOnClick:function(event, treeId, treeNode){
            debugger
            var _this = this;
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