<%@ page language="java" contentType="text/html; charset=utf-8" pageEncoding="utf-8"%>
<%@ include file="/WEB-INF/views/base.jsp"%>

<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
	<meta http-equiv="Content-Type" content="text/html; charset=utf-8">
	<meta http-equiv="X-UA-Compatible" content="IE=Edge">
	<meta name="viewport" content="width=device-width, initial-scale=1,maximum-scale=1, user-scalable=no">
	<title>灌区信息化平台</title>
	<link type="text/css" rel="stylesheet" href="${ctxstc}/adapters/bootstrap/css/bootstrap.min.css" title="" />
	<link type="text/css" rel="stylesheet" href="${ctxstc}/css/body.css" title="" />
	<link type="text/css" rel="stylesheet" href="${ctxstc}/css/style.css" title="" />
	<link type="text/css" rel="stylesheet" href="${ctxstc}/css/dermadefault.css" title="blue" />
	<link type="text/css" rel="stylesheet" href="${ctxstc}/css/templatecss.css" title="" />
	<link type="text/css" rel="stylesheet" href="${ctxstc}/css/ui-layout.css" title="" /><!-- angular ui --->
	<link type="text/css" rel="stylesheet" href="${ctxstc}/css/custom/scroll.css" title="" />
	<link type="text/css" rel="stylesheet" href="${ctxstc}/adapters/ztree/css/zTreeStyle/zTreeStyle.css" /><!-- zTree -->
	<link type="text/css" rel="stylesheet" href="${ctxstc}/adapters/ztree/css/metroStyle/metroStyle.css">

	<script type="text/javascript" src="${ctxstc}/jquery/jquery-1.11.1.min.js"></script>
	<script type="text/javascript" src="${ctxstc}/jquery/jquery.cookie.js"></script>
	<script type="text/javascript" src="${ctxstc}/adapters/bootstrap/js/bootstrap.min.js"></script>
	<script type="text/javascript" src="${ctxstc}/adapters/bootstrap/js/bootstrap-paginator.js"></script>
	<script type="text/javascript" src="${ctxstc}/js/style.js"></script>
	<script type="text/javascript" src="${ctxstc}/js/angular.min.js"></script><!-- angular ui --->
	<script type="text/javascript" src="${ctxstc}/js/ui-layout.js"></script>
	<script type="text/javascript" src="${ctxstc}/adapters/ztree/js/jquery.ztree.core.js"></script><!-- zTree -->
	<script type="text/javascript" src="${ctxstc}/adapters/layui/layer/layer.js" merge="true"></script>
	<script type="text/javascript" src="${ctxstc}/jquery/jquery-form.js" ></script>
 	<script type="text/javascript" src="${ctxstc}/js/echarts.min.js"></script>
</head>
<body onload="load('')">
<form  action="" method="post">
	<!-- 页面头部start -->
	<nav class="nav navbar-default navbar-mystyle navbar-fixed-top">
	<div class="navbar-header">
		<button class="navbar-toggle" data-toggle="collapse" data-target=".navbar-collapse">
			<span class="icon-bar"></span>
			<span class="icon-bar"></span>
			<span class="icon-bar"></span>
		</button>
		<a class="navbar-brand mystyle-brand"><span class="glyphicon glyphicon-home"></span></a>
	</div>
	
	<div class="collapse navbar-collapse">
		<!-- 头部左侧导航start -->
		<ul class="nav navbar-nav">
			<li class="li-border"><a class="mystyle-color" href="#">管理控制台</a></li>
			<li class="dropdown li-border">
				<!-- 下拉框选项 -->
				<a href="#" class="dropdown-toggle mystyle-color" data-toggle="dropdown">项目导航<span class="caret"></span></a>
				<div class="dropdown-menu topbar-nav-list">
					<!-- 项目一导航start -->
					<div class="topbar-nav-col">
						<div class="topbar-nav-item">
							<p class="topbar-nav-item-title">机井灌溉云平台</p>
							<ul>
								<li>
									<a href="#">
										<span class="glyphicon glyphicon-road"></span>
										<span class="">实时监测</span>
									</a>
								</li>
								<li>
									<a href="#">
										<span class="glyphicon glyphicon-picture"></span>
										<span class="">水权管理</span>
									</a>
								</li>
								<li>
									<a href="#">
										<span class="glyphicon glyphicon-gift"></span>
										<span class="">收费管理</span>
									</a>
								</li>
							</ul>
						</div>
					</div>
					<!-- 项目一导航end -->
					
					<!-- 项目二导航start -->
					<div class="topbar-nav-col">
						<div class="topbar-nav-item">
							<p class="topbar-nav-item-title">地表水灌溉系统</p>
							<ul>
								<li>
									<a href="#">
										<span class="glyphicon glyphicon-road"></span>
										<span class="">电子地图</span>
									</a>
								</li>
								<li>
									<a href="#">
										<span class="glyphicon glyphicon-picture"></span>
										<span class="">雨水情监控</span>
									</a>
								</li>
								<li>
									<a href="#">
										<span class="glyphicon glyphicon-gift"></span>
										<span class="">视频图像</span>
									</a>
								</li>
							</ul>
						</div>
					</div>
					<!-- 项目二导航end -->
					
					<!-- 项目三导航start -->
					<div class="topbar-nav-col">
						<div class="topbar-nav-item">
							<p class="topbar-nav-item-title">山洪灾害预警平台</p>
							<ul>
								<li>
									<a href="#">
										<span class="glyphicon glyphicon-road"></span>
										<span class="">气象国土</span>
									</a>
								</li>
								<li>
									<a href="#">
										<span class="glyphicon glyphicon-picture"></span>
										<span class="">预警发布</span>
									</a>
								</li>
							</ul>
						</div>
					</div>
					<!-- 项目三导航end -->
				</div>
			</li>
		</ul>
		<!-- 头部左侧导航end -->
		
		<!-- 头部右侧导航start -->
		<ul class="nav navbar-nav pull-right">
			<li class="dropdown li-border">
				<a href="#" class="dropdown-toggle mystyle-color" data-toggle="dropdown">james<span class="caret"></span></a>
				<ul class="dropdown-menu">
					<li><a href="#">退出</a></li>
				</ul>
			</li>
		</ul>
		<!-- 头部右侧导航end -->
	</div>
	</nav>
	<!-- 页面头部end -->

	<!-- 页面主体start -->
	<div class="down-main">
		<!-- 页面主体左侧菜单导航start -->
		<div class="left-main left-full" id="scroll">
			<div class="sidebar-fold">
				<span class="glyphicon glyphicon-menu-hamburger"></span>
			</div>
			<!-- 菜单内容导航start -->
			<div class="subNavBox">
				<!-- 电子地图start -->
				<c:forEach items="${sysPermissionVOList}" var="sysPermissionVO">
					<c:choose>
            			<c:when test="${sysPermissionVO.sysChildsPermissions != null && sysPermissionVO.sysChildsPermissions.size()>0}">
            				<div id="one_map" class="sBox" style="display:${sysPermissionVO.isMable == 0 ? 'block' : 'none' }" >
								<div class="subNav sublist-${sysPermissionVO.menuCode == oneMenuCode ? 'down' : 'up' }">
										<span class="title-icon glyphicon glyphicon-chevron-${sysPermissionVO.menuCode == oneMenuCode ? 'down' : 'up' }"></span>
										<span class="sublist-title">${sysPermissionVO.menuName}</span>
								</div>
								<ul class="navContent" style="display:${sysPermissionVO.menuCode == oneMenuCode ? 'block' : 'none' }">
									 <c:forEach items="${sysPermissionVO.sysChildsPermissions}" var="childsPermission">
										<li class="${childsPermission.menuCode == twoMenuCode ? 'active' : '' }" id="${childsPermission.id}">
											<div class="showtitle" style="width:100px;">
												<img src="${ctxstc}/images/leftico05.png" />${childsPermission.menuName}
											</div>
											<a href="${childsPermission.menuHref}">
												<span class="sublist-icon glyphicon"><img src="${ctxstc}/images/leftico05.png" /></span>
												<span class="sub-title">${childsPermission.menuName}</span>
											</a>
										</li>
									</c:forEach>
								</ul>
						   </div>
				 		</c:when >
         		   </c:choose>
         		  </c:forEach>
				<!-- 系统管理end -->
			</div>
			<!-- 菜单内容导航end -->
		</div>
		<!-- 页面主体左侧菜单导航end -->
		
		<!-- 页面主体右侧内容start -->
		<div class="right-product right-full">
			<section id="layout" ng-app="doc.ui-layout">
			<div ui-layout class="layout-mock">
				<ui-layout options="{ flow : 'column' }">
				
				<!--2018/4/10 liyue  -->
				<sidebar class="east-back left-back" >
					<ul id="tree" class="nav nav-pills nav-stacked">
						<li><h4 style="margin-left: 10px;">行政区域等级</h4></li>
						<ul id="treeDemo" class="ztree">
						</ul>
					</ul>
				</sidebar>
				
				<div class="center-back right-back">
					<div class="container-fluid">
						<div class="info-center">
							<div class="page-header">
								<div class="pull-left">
									<h4>灌区信息化平台>智慧供水>数据分析</h4>
								</div>
							</div>
							
							<div class="search-box row">
								
							</div>
							
							<div class="clearfix"></div>
							<div class="table-margin">
								<table class="table table-bordered table-header">
									<thead>
										<tr>
										<td><div id="chartmain1" style="width:600px; height: 400px;"></div></td>
										<td><div id="chartmain2" style="width:600px; height: 400px;"></div></td>
										</tr>
										<tr>
										<td><div id="chartmain3" style="width:600px; height: 400px;"></div></td>
										<td><div id="chartmain4" style="width:600px; height: 400px;"></div></td>
										</tr>
									</thead>
									
									<tbody id="soilsTableList">
									
									</tbody>
									
									<tfoot>
										<tr>
											<td colspan="8">
												<div class="pull-right">
													<div id="pagination">
														<ul id="pageLimit"></ul>
													</div>
												</div>
											</td>
										</tr>
									</tfoot>
								</table>
							</div>
						</div>
					</div>
				</div>
				</ui-layout>
			</div>
			</section>
		</div>
		<!-- 页面主体右侧内容end -->
	</div>
	<!-- 页面主体end -->

	<!--弹窗添加或修改内容必备的代码-->
	<div id="show">
	    <iframe id="popup" name="popup" marginwidth=0 width="100%" frameBorder=0 scrolling=yes></iframe>
	</div>
</form>	
	<!-- js引入 -->
	<%-- <script type="text/javascript" src="${ctxstc}/js/custom/soils.js"></script> --%>
	<script type="text/javascript" src="${ctxstc}/js/footer.js"></script>
	<script type="text/javascript" src="${ctxstc}/js/custom/water_area_cook.js"></script>
	<script type="text/javascript" src="${ctxstc}/js/custom/permission/show_three_level_permission.js"></script>
	
	<script>
//start---------------------------------------------------
	//指定图标的配置和数据
    var option = {
        title:{
            text:'爆管统计'
        },
        tooltip:{},
        legend:{
            name:"爆管数"
        },
        xAxis:{
            data:["1","2","3","4","5","6","7","8","10","11","12"],
            name:"月份"
        },
        yAxis:{

        },
        series:[{
            name:'爆管数',
            type:'line',
            data:[4,2,4,5,0,2,0,0,0,2,3,1],
            itemStyle:{  
                normal:{  
                  color:'red', 
                  label: {
                         show: true,//是否展示  
                     }  
                  } 
            }
        }]
    };
    //初始化echarts实例
    var myChart = echarts.init(document.getElementById('chartmain1'));
    //使用制定的配置项和数据显示图表
    myChart.setOption(option);
    
    //chartmain2
     var option = {
        title:{
            text:'漏损分析'
        },
        tooltip:{},
        legend:{
       		 name:'漏损水量'
        },
        xAxis:{
            data:["1","2","3","4","5","6","7","8","10","11","12"],
            name:'月份'
        },
        yAxis:{

        },
        series:[{
            name:'漏损水量',
            type:'bar',
            data:[400,230,450,500,380,222,100,500,360,260,320],
            itemStyle:{  
                normal:{  
                  color:'blue', 
                  label: {
                         show: true,//是否展示  
                     }  
                  } 
            }
        }]
    };
    //初始化echarts实例
    var myChart = echarts.init(document.getElementById('chartmain2'));
    //使用制定的配置项和数据显示图表
    myChart.setOption(option);
    
    //chartmain3
     var chartmain3;  
    var json = [  
                {value:303,name:'1月'},  
                {value:260,name:'2月'},  
                {value:400,name:'3月'},
                {value:500,name:'4月'},
                {value:550,name:'5月'},
                {value:530,name:'6月'},
                {value:580,name:'7月'},
                {value:600,name:'8月'},
                {value:520,name:'9月'},
                {value:480,name:'10月'},
                {value:390,name:'11月'},
                {value:350,name:'12月'}
                ];  
    var option = {  
            title : {  
                text: '用水量统计',
                subtext: '全年用水量', 
                x:'center'  
            },  
            tooltip : {  
                trigger: 'item',  
                formatter: ""  
            },  
            legend: {  
                orient : 'vertical',  
                x : 'left'
                
            },  
            toolbox: {  
                show : true,  
                feature : {  
                    mark : {show: true},  
                    dataView : {show: true, readOnly: false},  
                    magicType : {  
                        show: true,   
                        type: ['pie', 'funnel'],  
                        option: {  
                            funnel: {  
                                x: '25%',  
                                width: '50%',  
                                funnelAlign: 'left',  
                                max: 1548  
                            }  
                        }  
                    },  
                    restore : {show: true},  
                    saveAsImage : {show: true}  
                }  
            },  
            calculable : true,  
            series : [  
                {  
                    name:'用水量',  
                    type:'pie',  
                    radius : '55%',//饼图的半径大小  
                    center: ['50%', '60%'],//饼图的位置  
                    data:json  
                }  
            ]  
        };   
      
    chartmain3 = echarts.init(document.getElementById('chartmain3'));  
    $(function(){  
    	chartmain3.setOption(option);  
          
    }); 
    
    //chartmain4;
    var chartmain4;
    option2 = {
    title: {
        text: '水质分析'
    },
    tooltip: {
        trigger: 'axis'
    },
    legend: {
        data:['PH','温度','溶氧','电导率','浊度']
    },
    grid: {
        left: '3%',
        right: '4%',
        bottom: '3%',
        containLabel: true
    },
    toolbox: {
        feature: {
            saveAsImage: {}
        }
    },
    xAxis: {
        type: 'category',
        boundaryGap: false,
        data: ['1','2','3','4','5','6','7','8','9','10','11','12'],
        name:"月份"
    },
    yAxis: {
        type: 'value'
    },
    series: [
        {
            name:'PH',
            type:'line',
            stack: '总量',
            data:[7, 6, 7, 8, 7, 8, 6,8,7,7,7,9],
            itemStyle:{  
                normal:{  
                  label: {
                         show: true,//是否展示  
                     }  
                  } 
            }
        },
        {
            name:'温度',
            type:'line',
            stack: '总量',
            data:[6, 8, 12, 15, 15, 16, 18,16,13,15,15,13]
        },
        {
            name:'溶氧',
            type:'line',
            stack: '总量',
            data:[1.6, 1.8, 1.2, 1.5, 1.5, 2, 1.8,1.6,1.3,1.5,1.5,1.3]
        },
        {
            name:'电导率',
            type:'line',
            stack: '总量',
            data:[6, 8, 5, 5, 5, 6, 18,16,13,15,5,3]
        },
        {
            name:'浊度',
            type:'line',
            stack: '总量',
            data:[0.2, 0.3, 0.4, 0.5, 0.7, 0.6, 0.8,0.6,0.7,0.5,0.5,0.3]
        }
    ]
};
    //初始化echarts实例
    var myChart = echarts.init(document.getElementById('chartmain4'));
    //使用制定的配置项和数据显示图表
    myChart.setOption(option2);
    
//end------------------------------------------------------------------
    
	//树结构json数据
	var zNodes=[];	
	function load(id){
		//alert(id);
		//三级权限code数组============================================================
		var threeLevelPermission = [];
		//拿到三级权限的的列表
		<c:forEach items="${threeLevelPermissions}" var="sysPermission">
			var menuNameCode = "${sysPermission.menuNameCode}";
			//拿到页面三级权限对应的标签
			var tag = document.getElementById(menuNameCode);
			if(tag!=null){//如果有权限就将他显示
				tag.style.display="block";
				threeLevelPermission.push(menuNameCode);
			}
		</c:forEach>
		
		showNodes(threeLevelPermission); 
		$.fn.zTree.init($("#treeDemo"), setting, zNodes);
		
		var areaId2 = "${areaId}";
		//alert(areaId2);
		start(areaId2,1,threeLevelPermission);
		delCookie("areaId");
		
	};
	
	
	//导航树的配置
	var setting = {
            view: {
                
                selectedMulti: false
            },
            check: {
                //enable: true
            },
            data: {
                simpleData: {
                    enable: true
                }
            },
            edit: {
                //enable: true
            }
	};
	
	//树结构json数据
	var zNodes=[];
	//拿到后台的json数据赋值给zNodes
	function showNodes(threeLevelPermission){
		var zNode;
		<c:forEach items="${sysAreaList}" var="sysArea">
			var id="${sysArea.id}";
			var pId="${sysArea.parentAreaId}";
			var name="${sysArea.areaName}";
			var level="${sysArea.areaLevel}";
			if(level==0||level==1){
				zNode={id:id, pId:pId, name:name,click:"start('${sysArea.id}',1,'"+threeLevelPermission+"');", open:true};
			}else{
				zNode={id:id, pId:pId, name:name,click:"start('${sysArea.id}',1,'"+threeLevelPermission+"');", open:false};
			}
			zNodes.push(zNode);
		</c:forEach>
	}	
	//当点击某一级树目录触发
	function start(id,page,threeLevelPermission){
		//alert(id+"-------");
		//将获取的id放到cook中
		setCookie("areaId",id);
		
		//每次进来清除之前的查询结果
		$("#soilsTableList").empty();
		
		
		 $.post("${ctx}/soils/getPages").success(function (response) {
			// ////alert(JSON.stringify(response));
			    var pageNum = response.pageNum;
				var pages = response.pages;
				var size = response.size;
			    /* bootstrap分页样式设置 */
			    var options = {
			    	size:"small",
			    	alignment:"right",
			    	/* 当前页数 */
			        currentPage: pageNum,
			        /* 总页数  总条数除以每页条数  能整除总页数为商  不能整除商+1页  作为分页总页数  */
			        totalPages: pages,
			        /* 每页条数 */
			        numberOfPages:size,
			        /* bootstrap版本指定 */
			        bootstrapMajorVersion:3,
			        /* 样式设置 分页导航条 */
			        itemTexts: function (type, page, current) {
			            switch (type) {
			                case "first":
			                    return "首页";
			                case "prev":
			                    return "上一页";
			                case "next":
			                    return "下一页";
			                case "last":
			                    return "末页";
			                case "page":
			                    return page;
			            }
			        },
			        onPageClicked: function(event, originalEvent, type, page){
			        	//alert(JSON.stringify(page));
			        	//var id = getCookie ("areaId");
			        	start(id,page,threeLevelPermission);
			        	
			        }
			    };
			    $('#pageLimit').bootstrapPaginator(options);
			}).error(function (response) {
			    ////alert("列表请求出错");
			});
		
	}
	</script>
</body>
</html>