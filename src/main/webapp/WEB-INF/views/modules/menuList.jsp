<%@ page language="java" import="java.util.*" pageEncoding="utf-8"%>
<%@ include file="/WEB-INF/views/base.jsp"%>
<!DOCTYPE html>
<html xmlns:v-bind="http://www.w3.org/1999/xhtml">
<head>
    <meta charset="utf-8">
    <title>金志智慧水务</title>
    <meta name="renderer" content="webkit">
    <meta http-equiv="X-UA-Compatible" content="IE=edge,chrome=1">
    <meta name="viewport" content="width=device-width, initial-scale=1, maximum-scale=1">
    <meta name="apple-mobile-web-app-status-bar-style" content="black">
    <meta name="apple-mobile-web-app-capable" content="yes">
    <meta name="format-detection" content="telephone=no">
    <link rel="Shortcut Icon" href="${ctxstc}/images/jzlogo.ico" type="image/x-icon" />
    <link rel="stylesheet" href="${ctxstc}/css/x-admin.css" media="all">
    <script type="text/javascript" src="${ctxstc}/jquery/jquery-1.8.2.min.js"></script>
    <script type="text/javascript" src="${ctxstc}/js/vue.js"></script>
    <link rel="stylesheet" href="${ctxstc}/js/element-ui/theme-chalk/index.css" type="text/css">
    <script type="text/javascript" src="${ctxstc}/js/element-ui/index.js"></script>
    <link type="text/css" rel="stylesheet" href="${ctxstc}/css/custom/header.css" title="" />
</head>
<body style="">
<div class="layui-layout layui-layout-admin" id="menuList">
    <div class="layui-header header header-demo" style="position: fixed;width: 100%;">
        <div class="layui-main">
            <div class="admin-logo-box">
                <marquee behavior="scroll" width="100%" vspace="1" scrollamount="5" onmouseover="this.stop();" onmouseout="this.start();">
                    <a class="logo" href="" title="地表水智能监测云平台" style="color: aqua;">地表水智能监测云平台</a>
                </marquee>
                <div class="larry-side-menu" style="width: 80px">
                    <i id="aUtyo" class=" layui-icon iconfont" aria-hidden="true" style="float: left">&#xe83c;</i><li style="float: left">{{menuLabel}}</li>
                </div>
            </div>

            <ul class="layui-nav" lay-filter="">
                <li class="layui-nav-item" id="time" style="margin-right: 50px;font-size: 20px;color: #2fb9d4;font-family: 'yjsz'"></li>
                <li class="layui-nav-item"><img src="${ctxstc}/images/login/logo.png" class="layui-circle" style="border: 2px solid #A9B7B7;" width="35px"
                                                height="34px" title="金志技术"></li>
                <li class="layui-nav-item"> <a href="javascript:;">欢迎，{{sysUser.userName}}</a>
                    <dl class="layui-nav-child">
                        <!-- 二级菜单 -->
                        <dd><a href="javascript:;" @click="removeAccount(0)">退出</a></dd>
                    </dl>
                </li>
                <li class="layui-nav-item x-index"><a id="mainBack" href="javascript:;" style="font-style: oblique" @click="removeAccount(1)">返回主页</a></li>
            </ul>
        </div>
    </div>
    <!--左侧导航区域-->
    <ul id="menuConuytUl">
        <li id="menuConuyt">
            <el-menu id="el-menu" default-active="2" class="el-menu-vertical-demo" :show-timeout="100" :collapse-transition="true" :collapse="isCollapse">
                <el-submenu v-bind:index="('1-')+(index)" v-for="(menu,index) in menuList">
                    <template slot="title"><i v-bind:class="iconList[index]"></i> <span slot="title">{{menu.menuName}}</span></template>
                    <template v-for="(menVal,indet) in menu.children">
                        <el-submenu v-if="menVal.children && menVal.children.length" v-bind:index="('1-')+(index)+(indet)" >
                            <template slot="title"><i v-bind:class="iconList_1[indet]" style="color: bisque"></i> <span slot="title">{{menVal.menuName}}</span></template>
                            <el-menu-item v-bind:index="('1-')+(index)+(indet)+(idx)" @click="handleMenu(men)" v-for="(men,idx) in menVal.children">
                                <i class="el-icon-location-outline" style="color: #0bef86"></i>{{men.menuName}}
                            </el-menu-item>
                        </el-submenu>
                        <el-menu-item v-else v-bind:index="('1-')+(index)+(indet)" @click="handleMenu(menVal)">
                            <i class="el-icon-location-outline" style="color: #0bef86"></i>{{menVal.menuName}}
                        </el-menu-item>
                    </template>
                </el-submenu>
            </el-menu>
        </li>
        <li>
            <ul id="site-demo-title" class="layui-tab layui-tab-card site-demo-title x-main" lay-filter="x-tab" lay-allowclose="true" v-bind:style="{ left: activeLeft + 'px'}"
                style="border-left: solid 2px #2299ee;" v-loading="loading" element-loading-text="请稍候" element-loading-background="rgba(0, 0, 0, 0.8)">
                <iframe id="iFramse" v-bind:src="pageUrl" width="100%" height="93.5%" frameborder="0" name="right" scrolling="no" ></iframe>
            </ul>
        </li>

    </ul>
    <%--<div id="menuConuyt">
        <el-menu id="el-menu" default-active="2" class="el-menu-vertical-demo" :show-timeout="100" :collapse-transition="true" :collapse="isCollapse">
            <el-submenu v-bind:index="('1-')+(index)" v-for="(menu,index) in menuList">
                &lt;%&ndash;TODO&ndash;%&gt;
                <template slot="title"><i v-bind:class="iconList[index]"></i> <span slot="title">{{menu.menuName}}</span></template>
                <template v-for="(menVal,indet) in menu.children">
                    <el-submenu v-if="menVal.children && menVal.children.length" v-bind:index="('1-')+(index)+(indet)" >
                        <template slot="title"><i v-bind:class="iconList_1[indet]" style="color: bisque"></i> <span slot="title">{{menVal.menuName}}</span></template>
                        <el-menu-item v-bind:index="('1-')+(index)+(indet)+(idx)" @click="handleMenu(men)" v-for="(men,idx) in menVal.children">
                            <i class="el-icon-location-outline" style="color: #0bef86"></i>{{men.menuName}}
                        </el-menu-item>
                    </el-submenu>
                    <el-menu-item v-else v-bind:index="('1-')+(index)+(indet)" @click="handleMenu(menVal)">
                        <i class="el-icon-location-outline" style="color: #0bef86"></i>{{menVal.menuName}}
                    </el-menu-item>
                </template>
            </el-submenu>
        </el-menu>

    </div>
    <div style="background: #fff">
        <ul id="site-demo-title" class="layui-tab layui-tab-card site-demo-title x-main" lay-filter="x-tab" lay-allowclose="true" v-bind:style="{ left: activeLeft + 'px'}"
            style="border-left: solid 2px #2299ee;" v-loading="loading" element-loading-text="请稍候" element-loading-background="rgba(0, 0, 0, 0.8)">
            <iframe id="iFramse" v-bind:src="pageUrl" width="100%" height="93.5%" frameborder="0" name="right" scrolling="no" ></iframe>
        </ul>

    </div>--%>
</div>
</body>
<script src="${ctxstc}/layui/layui.js" charset="utf-8"></script>
<script src="${ctxstc}/js/custom/x-admin.js"></script>
<script type="application/javascript">
    /* 相对链接的基准URL */
    var curWwwPath = window.document.location.href;
    var pathName = window.document.location.pathname;
    var pos = curWwwPath.indexOf(pathName);
    var localhostPaht = curWwwPath.substring(0,pos);
    var projectName = pathName.substring(0,pathName.substr(1).indexOf('/')+1);
    var ctxPath = localhostPaht + projectName;
    var menuList = new Vue({
        el:'#menuList',
        data:{
            menuList:[],
            iconList:['el-icon-menu','el-icon-tickets','el-icon-setting','el-icon-edit-outline','el-icon-phone','el-icon-info','el-icon-paperclip'],//一级菜单图标
            iconList_1:['el-icon-stopwatch','el-icon-view','','','','','','','el-icon-user'],//二级菜单图标
            sysUser:{},
            pageUrl:ctxPath+'/map/map_page',
            pageUrlDenied:ctxPath+'/login/permission_denied',
            isCollapse:true,
            activeLeft:'64',
            loading:true,
            menuLabel:'菜单展开',
        },
        methods:{
            handleMenu:function(menuVal){
                var _this = this;
                debugger
                if(_this.pageUrl != menuVal.menuHref){
                    _this.loading=menuVal.menuHref!='http://';
                }
                _this.pageUrl = menuVal.menuHref!='http://'?menuVal.menuHref:_this.pageUrlDenied;
            },
            removeAccount:function(sign){
                var _this = this;
                if(_this.pageUrl != ctxPath+"/map/map_page"){
                    _this.loading=true;
                }
                if(sign==0){
                    window.location.href=ctxPath+"/login/quitAccount";
                    // window.location.href=ctxPath+"/login/login_page";
                    window.location.href=ctxPath;
                }else{
                    _this.pageUrl = ctxPath+"/map/map_page";
                }
            },
        },
        created:function(){
            var _this = this;
            debugger
            $.post(ctxPath+"/login/menuData","",function(result){
                debugger
                if(result!=""&&result!=null){
                    var reuty = JSON.parse(result);
                    _this.menuList = reuty.menuList;
                    _this.sysUser = reuty.sysUser;
                }
            });
        },
        mounted:function () {
            var _this = this;
            debugger
        }

    });

    //iframe监听事件，iframe标签加载完成后，将loading置为false
    var iframe = document.getElementById('iFramse');
    debugger
    if (iframe.attachEvent){ // 兼容IE写法
        iframe.attachEvent("onload", function(){
            menuList.loading = false;
        })
    } else {
        iframe.onload = function(){
            menuList.loading = false;
        }
    }
</script>
</html>
</html>