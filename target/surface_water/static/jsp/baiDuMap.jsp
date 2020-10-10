<%@ page language="java" contentType="text/html; charset=utf-8" pageEncoding="utf-8"%>
<%@ include file="/WEB-INF/views/base.jsp"%>
// 百度地图API功能100.11441708,39.13463116
var map = new BMap.Map("cesiumContainer",{mapType: BMAP_HYBRID_MAP});
map.centerAndZoom(new BMap.Point(100.451504,38.934668), 12);
map.enableScrollWheelZoom(true); 
//-----------------------------------地图类型、缩略图--------------------------------------------------
//var mapType1 = new BMap.MapTypeControl({mapTypes: [BMAP_NORMAL_MAP,BMAP_HYBRID_MAP]});
var mapType2 = new BMap.MapTypeControl({anchor: BMAP_ANCHOR_TOP_RIGHT});

var overView = new BMap.OverviewMapControl();
var overViewOpen = new BMap.OverviewMapControl({isOpen:true, anchor: BMAP_ANCHOR_BOTTOM_RIGHT});

//map.addControl(mapType1);          //2D图，卫星图
map.addControl(mapType2);          //左上角，默认地图控件
map.setCurrentCity("临泽县");        //由于有3D图，需要设置城市哦
map.addControl(overView);          //添加默认缩略地图控件
map.addControl(overViewOpen);      //右下角，打开

//---------------------------------------比例尺控件-----------------------------------------------------------
var top_left_control = new BMap.ScaleControl({anchor: BMAP_ANCHOR_TOP_LEFT});// 左上角，添加比例尺
var top_left_navigation = new BMap.NavigationControl();  //左上角，添加默认缩放平移控件
//var top_right_navigation = new BMap.NavigationControl({anchor: BMAP_ANCHOR_TOP_RIGHT, type: BMAP_NAVIGATION_CONTROL_SMALL}); //右上角，仅包含平移和缩放按钮
/*缩放控件type有四种类型:
BMAP_NAVIGATION_CONTROL_SMALL：仅包含平移和缩放按钮；BMAP_NAVIGATION_CONTROL_PAN:仅包含平移按钮；BMAP_NAVIGATION_CONTROL_ZOOM：仅包含缩放按钮*/
map.addControl(top_left_control);
map.addControl(top_left_navigation);

//设置样式
map.setMapStyle({
    styleJson: [
        {//不显示点信息
            "featureType": "poi",
            "elementType": "all",
            "stylers": {
                "color": "#ffffff",
                "visibility": "off"
            }
        }
    ]
});

//map.disableDragging();//禁止拖动
//map.disableDoubleClickZoom();//禁止双击缩放
var blist = [];
var districtLoading = 0;

function getBoundary() {
    //addDistrict("甘肃省");
    addDistrict("临泽县");

}

/**
 * 添加行政区划
 * @param {} districtName 行政区划名
 * @returns  无返回值
 */
function addDistrict(districtName) {
    //使用计数器来控制加载过程
    districtLoading++;
    var bdary = new BMap.Boundary();
    bdary.get(districtName, function (rs) {       //获取行政区域
        var count = rs.boundaries.length; //行政区域的点有多少个
        if (count === 0) {
            alert('未能获取当前输入行政区域');
            return;
        }
        for (var i = 0; i < count; i++) {
            blist.push({ points: rs.boundaries[i], name: districtName });
        };
        //加载完成区域点后计数器-1
        districtLoading--;
        if (districtLoading == 0) {
            //全加载完成后画端点
            drawBoundary();
        }
    });
}


/**
 * 各种鼠标事件绑定
 */
function click(evt) {
    alert(evt.target.name);
}

function mouseover(evt) {
    evt.target.label.setZIndex(99);
    evt.target.label.setPosition(evt.point);
    evt.target.label.show();
}

function mousemove(evt) {
    evt.target.label.setPosition(evt.point);
}

function mouseout(evt) {
    evt.target.label.hide();
}

function drawBoundary() {
    //包含所有区域的点数组
    var pointArray = [];

    /*画遮蔽层的相关方法
    *思路: 首先在中国地图最外画一圈，圈住理论上所有的中国领土，然后再将每个闭合区域合并进来，并全部连到西北角。
    *      这样就做出了一个经过多次西北角的闭合多边形*/
    //定义中国东南西北端点，作为第一层
    var pNW = { lat: 59.0, lng: 73.0 }
    var pNE = { lat: 59.0, lng: 136.0 }
    var pSE = { lat: 3.0, lng: 136.0 }
    var pSW = { lat: 3.0, lng: 73.0 }
    //向数组中添加一次闭合多边形，并将西北角再加一次作为之后画闭合区域的起点
    var pArray = [];
    pArray.push(pNW);
    pArray.push(pSW);
    pArray.push(pSE);
    pArray.push(pNE);
    pArray.push(pNW);
    //循环添加各闭合区域
    for (var i = 0; i < blist.length; i++) {
        //添加显示用标签层
        var label = new BMap.Label(blist[i].name, { offset: new BMap.Size(20, -10) });
        label.hide();
        map.addOverlay(label);

        //添加多边形层并显示
        var ply = new BMap.Polygon(blist[i].points, { strokeWeight: 5, strokeColor: "#FF0000", fillOpacity: 0.01, fillColor: " #FFFFFF" }); //建立多边形覆盖物
        ply.name = blist[i].name;
        ply.label = label;

        map.addOverlay(ply);

        //添加名称标签层
        var centerlabel = new BMap.Label(blist[i].name, { offset: new BMap.Size(0, 0) });
        centerlabel.setPosition(ply.getBounds().getCenter());
        map.addOverlay(centerlabel);

        //将点增加到视野范围内
        var path = ply.getPath();
        pointArray = pointArray.concat(path);
        //将闭合区域加到遮蔽层上，每次添加完后要再加一次西北角作为下次添加的起点和最后一次的终点
        pArray = pArray.concat(path);
        pArray.push(pArray[0]);
    }

    //限定显示区域，需要引用api库
    var boundply = new BMap.Polygon(pointArray);
    BMapLib.AreaRestriction.setBounds(map, boundply.getBounds());
    map.setViewport(pointArray);    //调整视野

    //添加遮蔽层
    var plyall = new BMap.Polygon(pArray, { strokeOpacity: 0.0000001, strokeColor: "#000000", strokeWeight: 0.00001, fillColor: "#000000", fillOpacity: 0.4 }); //建立多边形覆盖物
    map.addOverlay(plyall);
}

setTimeout(function () {
    getBoundary();
}, 200);
//删除覆盖物
function removeOverlay(){
map.clearOverlays();         
}

