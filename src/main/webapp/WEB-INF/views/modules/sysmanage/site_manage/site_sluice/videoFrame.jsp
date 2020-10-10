<%@ page language="java" contentType="text/html; charset=utf-8" pageEncoding="utf-8"%>
<%@ include file="/WEB-INF/views/base.jsp"%>

<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
    <meta http-equiv="Content-Type" content="text/html; charset=utf-8">
    <meta http-equiv="X-UA-Compatible" content="IE=Edge">
    <meta name="viewport" content="width=device-width, initial-scale=1,maximum-scale=1, user-scalable=no">
    <title>灌区信息化平台</title>
    <script type="text/javascript" src="${ctxstc}/jquery/jquery-1.11.1.min.js"></script>
    <script type="text/javascript" src="${ctxstc}/js/vue.js"></script>
    <link rel="stylesheet" href="${ctxstc}/js/element-ui/theme-chalk/index.css" type="text/css">
    <script type="text/javascript" src="${ctxstc}/js/element-ui/index.js"></script>
    <script rel="stylesheet" src="${ctxstc}/adapters/moment/moment.js"></script>
    <!-- 2018-5-04 关于摄像头视频的插件 -->
    <script type="text/javascript" src="${ctxstc}/js/ezuikit.js"></script>
    <style type="text/css">
        .sluiceRealVideo td{width: 100px;position: relative;text-align: center}
        .sluiceRealVideo td div{width: 300px;height: 200px;line-height: 200px;}
        .sluiceRealVideo td video{position: relative;width: 100%;height: 100%;}
        .sluiceRealVideo tr:nth-child(1) td{height: 30px;font-weight:bold;font-size: 15px;}
        .el-popover{left:60%!important;}
    </style>
</head>
<body>
    <div id="videoFrame">
        <table class="sluiceRealVideo" width="280" height="140" cellspacing="5" border="1">
            <tr >
                <td v-for="(td_1,index) in realVideoData">{{td_1.deviceVideoName}}</td>
            </tr>
            <tr>
                <td v-for="(td_2,index) in realVideoData">
                    <div>
                        <video :id="('myPlayer') + (index)" controls  playsInline webkit-playsinline>
                            <source src="" type=""/>
                        </video>
                    </div>
                </td>
            </tr>
        </table>
    </div>
</body>
<script>

    var videoFrame = new Vue({
        el:'#videoFrame',
        data:{
            realVideoData:'',
            mytur:'',
        },
        methods:{

        },
        mounted:function(){
            var _this = this;

            console.log(localStorage.getItem('realVideoData'));
            this.realVideoData = JSON.parse(localStorage.getItem('realVideoData'));
            setTimeout(()=>{
                for(var i = 0;i<this.realVideoData.length;i++){
                    var playDom = document.querySelector("#myPlayer" + i);
                    playDom.src = this.realVideoData[i].ezopenLive;
                    var player = new EZUIPlayer('myPlayer'+ i);
                    player.play();
                }
            },500)
        },
        watch:function(){
            realVideoData:{
                this.mytur = this.realVideoData;
                alert("2563");
            }
        },
        created:function () {
            var _this = this;
        }
    });
</script>
</html>