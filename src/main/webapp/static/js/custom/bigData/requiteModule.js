var curWwwPath = window.document.location.href;
var pathName = window.document.location.pathname;
var pos = curWwwPath.indexOf(pathName);
var localhostPaht = curWwwPath.substring(0,pos);
var projectName = pathName.substring(0,pathName.substr(1).indexOf('/')+1);
var ctxPath = localhostPaht + projectName;

var requiteModule = new Vue({
    el:'#requiteModule',
    data:{
        dialogPageVisible:false,
        activeName:'first',
        leftType:'first',
        waterRequirementModule:{//需水提报模块
            irrigationRequireWaterList:[],
            waterRequirementInput:'',
        },
        waterConfigPlanModule:{//配水计划模块
            irrigationConfigPlanList:[],
        }
    },
    methods:{
        //灌区查询
        irrigationQuery:function () {
            var _this = this;
            $.post(ctxPath + "/big_data/down_select_irrigation_query",function(result){
                if(result != null){
                    _this.waterRequirementModule.irrigationRequireWaterList = JSON.parse(result);
                    _this.waterConfigPlanModule.irrigationConfigPlanList = JSON.parse(result);
                }
            });
        },
        //需水提报新增按钮压下
        addWaterRequire:function (type) {
            var _this = this;
            if('first' == type){
                _this.waterRequirementModule.irrigationRequireWaterList.push({});
            }else{
                _this.waterConfigPlanModule.irrigationConfigPlanList.push({});
            }
        },
        deleteWaterRequire:function (type,index) {
            var _this = this;
            if('first' == type){
                _this.waterRequirementModule.irrigationRequireWaterList.splice(index,1);
            }else{
                _this.waterConfigPlanModule.irrigationConfigPlanList.splice(index,1);
            }
        }
    },
    created:function(){
        var _this = this;
        _this.irrigationQuery();
    },
    mounted:function(){
        var _this = this;
    }
})


/**
 * 页面按键监听
 * @param event
 */
/*$(document).keyup(function(event){
    if(event.keyCode==32){
        dialogPage.dialogPageVisible = true;
    }
});*/
