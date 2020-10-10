// 百度地图API功能100.11441708,39.13463116//{mapType: BMAP_HYBRID_MAP});{mapType: BMAP_NORMAL_MAP});    // 创建Map实例
var map = new BMap.Map("cesiumContainer",{mapType: BMAP_HYBRID_MAP});
map.centerAndZoom(new BMap.Point(99.42655566008327, 39.1582637371515), 12);
map.enableScrollWheelZoom(true);
//-----------------------------------地图类型、缩略图--------------------------------------------------
var mapType2 = new BMap.MapTypeControl({anchor: BMAP_ANCHOR_TOP_RIGHT});

var overView = new BMap.OverviewMapControl();
var overViewOpen = new BMap.OverviewMapControl({isOpen:true, anchor: BMAP_ANCHOR_BOTTOM_RIGHT});

map.addControl(mapType2);          //左上角，默认地图控件
map.setCurrentCity("甘肃省张掖市高台县");        //由于有3D图，需要设置城市哦
map.addControl(overView);          //添加默认缩略地图控件
map.addControl(overViewOpen);      //右下角，打开
map.addEventListener("click", showInfo);
function showInfo(e){
    console.log(e.point.lng + ", " + e.point.lat);
}
//---------------------------------------比例尺控件-----------------------------------------------------------
var top_left_control = new BMap.ScaleControl({anchor: BMAP_ANCHOR_TOP_LEFT});// 左上角，添加比例尺
var top_left_navigation = new BMap.NavigationControl();  //左上角，添加默认缩放平移控件
/*缩放控件type有四种类型:
BMAP_NAVIGATION_CONTROL_SMALL：仅包含平移和缩放按钮；BMAP_NAVIGATION_CONTROL_PAN:仅包含平移按钮；BMAP_NAVIGATION_CONTROL_ZOOM：仅包含缩放按钮*/
map.addControl(top_left_control);
map.addControl(top_left_navigation);

/**
 * maker点的加载方法
 * @param makers
 */
function makerList(makers){
    debugger
    if(makers.length>0){
        for(var i = 0;i<makers.length;i++){
            var point = new BMap.Point(makers[i].swiLongitude,makers[i].swiLatitude);
            var myIcon = new BMap.Icon(ctxPath+"/static/images/map/map-DEV-"+makers[i].type+".gif", new BMap.Size(28,40));
            var marker = new BMap.Marker(point,{icon:myIcon});
            marker.buty = makers[i];
            marker.deviceWaterCode = makers[i].deviceWaterCode;
            marker.addEventListener("click",baiDuMapPage.handleMaker);
            map.addOverlay(marker);
        }
    }
}
function getBoundary(){
    var bdary = new BMap.Boundary();
    bdary.get("甘肃省张掖市高台县", function(rs){       //获取行政区域
                                               //map.clearOverlays();        //清除地图覆盖物
        var count = rs.boundaries.length; //行政区域的点有多少个
        if (count === 0) {
            alert('未能获取当前输入行政区域');
            return ;
        }
        var pointArray = [];
        for (var i = 0; i < count; i++) {

            var ply = new BMap.Polygon(rs.boundaries[i], { strokeWeight: 5, strokeColor: "#FF0000", fillOpacity: 0.01, fillColor: " #FFFFFF" }); //建立多边形覆盖物
            ply.disableMassClear();//不需要对此进行清除
            map.addOverlay(ply);  //添加覆盖物
            pointArray = pointArray.concat(ply.getPath());
        }
        map.setViewport(pointArray);    //调整视野

    });
}

setTimeout(function () {
    //getBoundary();
}, 100);
//删除覆盖物
function removeOverlay(){
    map.clearOverlays();
}

