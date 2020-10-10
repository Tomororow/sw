<%@ page language="java" import="java.util.*" pageEncoding="utf-8"%>
<%@ include file="/WEB-INF/views/base.jsp"%>

<!DOCTYPE html>
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
    <meta http-equiv="Content-Type" content="text/html; charset=utf-8">
    <meta http-equiv="X-UA-Compatible" content="IE=Edge">
    <meta name="viewport" content="width=device-width, initial-scale=1,maximum-scale=1, user-scalable=no">
    <title>地表水智能监测云平台</title>
    <link rel="Shortcut Icon" href="${ctxstc}/images/jzlogo.ico" type="image/x-icon" />
    <script type="text/javascript" src="${ctxstc}/jquery/jquery-1.8.2.min.js"></script>
    <link type="text/css" rel="stylesheet" href="${ctxstc}/css/body.css" title="" />
    <link type="text/css" rel="stylesheet" href="${ctxstc}/css/style.css" title="" />
    <link type="text/css" rel="stylesheet" href="${ctxstc}/css/dermadefault.css" title="blue" />
    <link type="text/css" rel="stylesheet" href="${ctxstc}/css/templatecss.css" title="" />
    <script type="text/javascript" src="${ctxstc}/js/vue.js"></script>
    <link rel="stylesheet" href="${ctxstc}/js/element-ui/theme-chalk/index.css" type="text/css">
    <script type="text/javascript" src="${ctxstc}/js/element-ui/index.js"></script>
    <link type="text/css" rel="stylesheet" href="${ctxstc}/css/custom/header.css" title="" />
</head>
<body>
    <div id="header">
        <input id="sysUser" value="${sysUser.userName}" hidden="hidden">
        <div  class="botyu" style="width: 15%;font-size: 16px;">
            <marquee behavior="scroll" width="100%" vspace="1" scrollamount="5" @click="handleClick" onmouseover="this.stop();" onmouseout="this.start();">
                <a class="logo" href="" title="点击返回主页" style="color: aqua;">地表水智能监测云平台</a>
            </marquee>
        </div>
        <div class="botyu" style="width:35%;position: absolute;right: 0;" align="right">
            <div class="botyu" style="width: 60%;position: absolute;">
                <span id="time" style="font-size: 20px;color: #2fb9d4;font-family: 'yjsz'"></span>
            </div>
            <div class="botyu" id="bot" align="center" style="position: relative">
                <a><span @mouseover="handleMouse(0);" @mouseout="handleMouse(1)" @click="handleMouse(2)">{{mouseText}}</span></a>
                <a><span id="mainBack" style="font-style: oblique" @click="handleClick">返回主页</span></a>
            </div>

        </div>
    </div>
</body>
<script type="application/javascript">
    /* 相对链接的基准URL */
    var curWwwPath = window.document.location.href;
    var pathName = window.document.location.pathname;
    var pos = curWwwPath.indexOf(pathName);
    var localhostPaht = curWwwPath.substring(0,pos);
    var projectName = pathName.substring(0,pathName.substr(1).indexOf('/')+1);
    var ctxPath = localhostPaht + projectName;
    var header = new Vue({
        el:'#header',
        data:{
            userName:'',
            mouseText:'',
            sysUser:{},
        },
        methods:{
            handleMouse:function(sign){
                var _this = this;
                debugger
                if(sign!=2){//进入
                    _this.mouseText = sign==0?'退出系统':"欢迎，"+_this.userName;
                }else{
                    window.location.href=ctxPath+"/login/quitAccount";
                    parent.location.reload();//iframe刷新需要调用父页面
                }
            },
            handleClick:function(){
                var _this = this;
                parent.location.href=ctxPath+"/map/map_page";
            },
        },
        mounted:function(){
            var _this = this;
            getTime();
            var sysuser =  $("#sysUser").val();
            _this.userName = sysuser;
            _this.mouseText = "欢迎，"+sysuser;
        }
    });
    //顶部时间
    function getTime(){
        var myDate = new Date();
        var myYear = myDate.getFullYear(); //获取完整的年份(4位,1970-????)
        var myMonth = myDate.getMonth()+1; //获取当前月份(0-11,0代表1月)
        var myToday = myDate.getDate(); //获取当前日(1-31)
        var myDay = myDate.getDay(); //获取当前星期X(0-6,0代表星期天)
        var myHour = myDate.getHours(); //获取当前小时数(0-23)
        var myMinute = myDate.getMinutes(); //获取当前分钟数(0-59)
        var mySecond = myDate.getSeconds(); //获取当前秒数(0-59)
        var week = ['星期日','星期一','星期二','星期三','星期四','星期五','星期六'];
        var nowTime;

        nowTime = myYear+'-'+fillZero(myMonth)+'-'+fillZero(myToday)+'&nbsp;&nbsp;'+fillZero(myHour)+':'+fillZero(myMinute)+':'+fillZero(mySecond)+'&nbsp;&nbsp;';
        //console.log(nowTime);
        $('#time').html(nowTime);
    };
    function fillZero(str){
        var realNum;
        if(str<10){
            realNum	= '0'+str;
        }else{
            realNum	= str;
        }
        return realNum;
    }
    setInterval(getTime,1000);
</script>
</html>