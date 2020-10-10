Cesium.BingMapsApi.defaultKey="ArgdTG4VWTidf-5ScPul3P3LuVAW4ArFDCMFdqB6Gr720D-K0WLKo-pLIhvIpUSn";

	var viewer = new Cesium.Viewer('cesiumContainer',{animation:false,timeline:false});
	viewer._cesiumWidget._creditContainer.style.display="none";
	
	//加入高程
	var terrainProvider = new Cesium.CesiumTerrainProvider({
	    url : '//assets.agi.com/stk-terrain/world'
	});
	viewer.terrainProvider = terrainProvider;
	var dataSource = Cesium.GeoJsonDataSource.load('../../../../Apps/SampleData/simplestyles.geojson');
	viewer.dataSources.add(dataSource);
	viewer.zoomTo(dataSource);
	
	
	
	
	//地图初始化位置纬、经、高=================================================
	var initialPosition = new Cesium.Cartesian3.fromDegrees(100.6643316149, 38.3962146848, 15555831.082799425431);
	//射像头角度调整y、x、z
	var initialOrientation = new Cesium.HeadingPitchRoll.fromDegrees(0, -90, 0);
	
	var homeCameraView = {
	    destination : initialPosition,
	    duration: 5, //动画持续时间
	    orientation : {
	        heading : initialOrientation.heading,
	        pitch : initialOrientation.pitch,
	        roll : initialOrientation.roll
	    }
	};
	
	// Set the initial view
	viewer.scene.camera.setView(homeCameraView);
	
	//initialOrientation = new Cesium.HeadingPitchRoll.fromDegrees(180.1077496389876024807,-5.987223091598949054, 0.025883251314954971306);
	//initialOrientation = new Cesium.HeadingPitchRoll.fromDegrees(0,-90, 0);
	//飞行
	function flyToSanDiego(a,b,c,x,y,z) {
		var initialOrientation = new Cesium.HeadingPitchRoll.fromDegrees(a, b, c); 
	    viewer.camera.flyTo({
	        destination : Cesium.Cartesian3.fromDegrees(x,y,z),
	        orientation : {
		        heading : initialOrientation.heading,
		        pitch : initialOrientation.pitch,
		        roll : initialOrientation.roll
		    }
	   });
	}
	//===========================================================

	function flyInACity(x,y,z) {
	    var camera = scene.camera;
	    camera.flyTo({
	        destination : Cesium.Cartesian3.fromDegrees(x,y,z),
	        complete : function() {
	            setTimeout(function() {
	                
	                camera.flyTo({
	                    destination : Cesium.Cartesian3.fromDegrees(100.6437,38.3817,4000),
	                    duration: 5, //动画持续时间
	                    orientation : {
	                    	heading : Cesium.Math.toRadians(0),
	                        pitch : Cesium.Math.toRadians(-90),
	                        roll:Cesium.Math.toRadians(0)
	                    },
	                    easingFunction : Cesium.EasingFunction.LINEAR_NONE
	                });
	                
			                setTimeout(function() {
			                camera.flyTo({
			                    destination : Cesium.Cartesian3.fromDegrees(100.5035,38.4672,4000),
			                    duration: 5, //动画持续时间
			                    orientation : {
			                        heading : Cesium.Math.toRadians(0),
			                        pitch : Cesium.Math.toRadians(-90),
			                        roll:Cesium.Math.toRadians(0)
			                    },
			                    easingFunction : Cesium.EasingFunction.LINEAR_NONE
			                });
			                
					                setTimeout(function() {
						                camera.flyTo({
						                    destination : Cesium.Cartesian3.fromDegrees(x,y,4000),
						                    duration: 5, //动画持续时间
						                    orientation : {
						                    	heading : Cesium.Math.toRadians(0),
						                        pitch : Cesium.Math.toRadians(-90),
						                        roll:Cesium.Math.toRadians(0)
						                    },
						                    easingFunction : Cesium.EasingFunction.LINEAR_NONE
						                });
						                
						                
						                	
						                		
						                }, 10000);
			                	
			                		
			                }, 10000);
	                
	                
	                
	            }, 10000);
	            
	        }
	    });
	}
	
	
	
	
	
	
	
	
	
	/*
	var czml = [{
	    "id" : "document",
	    "name" : "CZML Reference Properties",
	    "version" : "1.0"
	}, {
	    "id" : "position-reference",
	    "position" : {
	        "cartographicDegrees" : [100.6643516149, 38.3962146848,2512.57]
	    }
	}, {
	    "id" : "fillColor-reference",
	    "name" : "水位站",
	    "description" : "<br><div style='width:1500px;height:300px'><a href='javascript:open()'>水位站</a><div>",
	    "billboard" : {
	        "image" : "http://localhost:8080/surface_water/static/3D/timg.jpg",
	        "width" : 64,
		    "height" : 64,
	        "scale" : 1.5
	    },
	    "label" : {
	        "fillColor" : {
	            "rgba" : [255, 255, 255, 255]
	        },
	        "font" : "13pt Lucida Console",
	        "horizontalOrigin" : "LEFT",
	        "outlineColor" : {
	            "rgba":[150, 0, 150, 255]
	        },
	        "outlineWidth" : 3,
	        "pixelOffset" : {
	            "cartesian2" : [20, 0]
	        },
	        "style" : "FILL_AND_OUTLINE",
	        "text" : "哈哈哈哈"
	    },
	    "position" : {
	        "reference" : "position-reference#position"
	    }
	}];

	//var viewer = new Cesium.Viewer('cesiumContainer');
	viewer.dataSources.add(Cesium.CzmlDataSource.load(czml));

	
	*/
	
	//导入3D模型============================
    // 设置模型方向
	let position =  Cesium.Cartesian3.fromDegrees(100.6643516149, 38.3962146848,2512.57);
    let hpRoll = new Cesium.HeadingPitchRoll(Cesium.Math.toRadians(203), 0, 0);
    let orientation = Cesium.Transforms.headingPitchRollQuaternion(position, hpRoll);
	var entity = viewer.entities.add({   
		 id:'model',
	        // 模型位置
	     position: position,
	        // 模型方向
	     orientation: orientation,
	    
	    model : {    
	        uri : 'http://localhost:8080/surface_water/static/3D/hcbqs.gltf'    
	    }    
	});    
	//viewer.trackedEntity = entity; 
	//添加标志=============================================
	/*
	var citizensBankPark = viewer.entities.add({
		  id:'',
		  position : Cesium.Cartesian3.fromDegrees(100.6643516149, 39.3962146848),
		  billboard : {
		    image : 'http://localhost:8080/surface_water/static/3D/timg.jpg',
		    width : 32,
		    height : 32
		  },
		  label : {
		    text : '',
		    font : '14pt monospace',
		    style: Cesium.LabelStyle.FILL_AND_OUTLINE,
		    outlineWidth : 2,
		    verticalOrigin : Cesium.VerticalOrigin.TOP,
		    pixelOffset : new Cesium.Cartesian2(0, 32)
		  }
	});
	*/
	
	//鼠标事件============================================
	
	var handler = new Cesium.ScreenSpaceEventHandler(viewer.scene.canvas);
	var c=Cesium.Cartesian2.ZERO;
	
	handler.setInputAction(function(click) {
        var pickedObject = scene.pick(click.position);
        if (Cesium.defined(pickedObject) && (pickedObject.id != undefined)) {
        	
        	//alert(11111111111);
        	var changedC = Cesium.SceneTransforms.wgs84ToWindowCoordinates(viewer.scene,entity.position.getValue());
            // If things moved, move the popUp too
            if ((c.x !== changedC.x) || (c.y !== changedC.y)) {
                c = changedC;
                alert(c.x+"===="+c.y);
                a(c,entity.id,$(window).height(),$(window).width());
                alert($(window).height());
                alert($(window).width());
                
            }
            //alert();
            
            
           // positionPopUp(c);
        	
        	
           // actEntity = pickedObject.id;
           // var changedC = Cesium.SceneTransforms.wgs84ToWindowCoordinates(scene, entity.position);

          //  positionPopUp(changedC);
          //  c=changedC;
           // $('#trackPopUp').show();
            console.log(changedC);
        } else {
           // $('#trackPopUp').hide();
        }
    }, Cesium.ScreenSpaceEventType.LEFT_CLICK);
	
	/*
	var removeHandler = viewer.scene.postRender.addEventListener(function () {
		//alert(33333);
        if(entity!=null){
            var changedC = Cesium.SceneTransforms.wgs84ToWindowCoordinates(viewer.scene,position);
            // If things moved, move the popUp too
            if ((c.x !== changedC.x) || (c.y !== changedC.y)) {
                c = changedC;
            }
            positionPopUp(c);
        }
    });*/

	 function positionPopUp (c) {
		 
		 alert(c.x+"===="+c.y);
         var x = c.x - ($('#trackPopUpContent').width()) / 2;
        var y = c.y - ($('#trackPopUpContent').height());
      // $('#trackPopUpContent').css('transform', 'translate3d(' + x + 'px, ' + y + 'px, 0)');
     }
	
	 
	 var infoDiv = '<div id="trackPopUp" style="display:none;">'+
     '<div id="trackPopUpContent" class="leaflet-popup" style="top:-40px;left:0;">'+
     '<a class="leaflet-popup-close-button" onclick="yincang()" > ×</a>'+
     '<div class="leaflet-popup-content-wrapper" style="overflow-y: hidden;width: 300px;">'+
     '<h4 id="trackPopUpLink" class="leaflet-popup-content" style="max-width: 300px;">Okhttp3中DiskLrcCache的使用</h4>'+
     '<div style="height: 110px;"><img style="width: 100%;height:100%;" src="img/xue.gif"></div>'+
     '<div style="width:100%;overflow: hidden;"><div style="width:110%;overflow-y: auto;line-height: 1.80;font-weight: 700;font-size: 12px;">主要是okhttp3中缓存DiskLruCache类的使用完整例子，主要实现了写入、读取功能。</div></div>'+
     '</div>'+
     '<div class="leaflet-popup-tip-container">'+
     '<div class="leaflet-popup-tip"></div>'+
     '</div>'+
     '</div>'+
     '</div>';
	 
	 
	 $("#map").append(infoDiv);

     $('.leaflet-popup-close-button').click(function(){
         $('#trackPopUp').hide();
     });
     function yincang(){
         $('#trackPopUp').hide();
     }
	 
	 
	 
	 
	 
	 
	 
	 
	 
	 
	 
	 
	 
	 
	 
	 
	 
	 
	
//	handler.setInputAction(function (movement) {
	     // 处理鼠标移动事件
	     // 更新鼠标位置
	   // mousePosition = movement.endPosition;
	//}, Cesium.ScreenSpaceEventType.MOUSE_MOVE);

/*	handler.setInputAction(function(click) {
	   // 处理鼠标按下事件
	   // 获取鼠标当前位置
		
		alert("任伍伍");
	   //mousePosition = click.position;
		
		var clickX = click.position.x;
	    var clickY = click.position.y;
	    
	    alert(clickX+"---"+clickY);
		
	 }, Cesium.ScreenSpaceEventType.LEFT_CLICK);*/
	
	//var handler = new Cesium.ScreenSpaceEventHandler（canvas）;
   // handler.setInputAction（函数（点击）{}，Cesium.ScreenSpaceEventType.LEFT_CLICK）;
   // var clickX = click.position.x;
   // var clickY = click.position.y;
	
	
	/*
	
	//标记提示
	var pinBuilder = new Cesium.PinBuilder();

	var bluePin = viewer.entities.add({
	    name : 'Blank blue pin',
	    position : Cesium.Cartesian3.fromDegrees(100.170726, 39.9208667,0),
	    billboard : {
	        image : pinBuilder.fromColor(Cesium.Color.ROYALBLUE, 48).toDataURL(),
	        verticalOrigin : Cesium.VerticalOrigin.BOTTOM
	    }
	});

	var questionPin = viewer.entities.add({
	    name : 'Question mark',
	    position : Cesium.Cartesian3.fromDegrees(-75.1698529, 39.9220071),
	    billboard : {
	        image : pinBuilder.fromText('?', Cesium.Color.BLACK, 48).toDataURL(),
	        verticalOrigin : Cesium.VerticalOrigin.BOTTOM
	    }
	});

	var url = Cesium.buildModuleUrl('Assets/Textures/maki/grocery.png');
	var groceryPin = Cesium.when(pinBuilder.fromUrl(url, Cesium.Color.GREEN, 48), function(canvas) {
	    return viewer.entities.add({
	        name : 'Grocery store',
	        position : Cesium.Cartesian3.fromDegrees(100.6643516149,38.3962146848,2512.57),
	        billboard : {
	            image : canvas.toDataURL(),
	            verticalOrigin : Cesium.VerticalOrigin.BOTTOM
	        }
	    });
	});

	//Create a red pin representing a hospital from the maki icon set.
	var hospitalPin = Cesium.when(pinBuilder.fromMakiIconId('hospital', Cesium.Color.RED, 48), function(canvas) {
	    return viewer.entities.add({
	        name : 'Hospital',
	        position : Cesium.Cartesian3.fromDegrees(-75.1698606, 39.9211275),
	        billboard : {
	            image : canvas.toDataURL(),
	            verticalOrigin : Cesium.VerticalOrigin.BOTTOM
	        }
	    });
	});

	//Since some of the pins are created asynchronously, wait for them all to load before zooming/
	Cesium.when.all([bluePin, questionPin, groceryPin, hospitalPin], function(pins){
	    viewer.zoomTo(pins);
	});


	*/
	
	
	
	
	
	
	
	
	
	
	
	
	//Sandcastle.addDefaultToolbarButton('Show Cartographic Position on Mouse Over', function() {
	//显示经纬度
	var scene = viewer.scene;
	var handler;
	    var entity = viewer.entities.add({
	        label : {
	            show : false,
	            showBackground : true,
	            font : '14px monospace',
	            horizontalOrigin : Cesium.HorizontalOrigin.LEFT,
	            verticalOrigin : Cesium.VerticalOrigin.TOP,
	            pixelOffset : new Cesium.Cartesian2(15, 0)
	        }
	    });

	    // Mouse over the globe to see the cartographic position
	    handler = new Cesium.ScreenSpaceEventHandler(scene.canvas);
	    handler.setInputAction(function(movement) {
	        var cartesian = viewer.camera.pickEllipsoid(movement.endPosition, scene.globe.ellipsoid);
	        if (cartesian) {
	            var cartographic = Cesium.Cartographic.fromCartesian(cartesian);
	            var longitudeString = Cesium.Math.toDegrees(cartographic.longitude).toFixed(2);
	            var latitudeString = Cesium.Math.toDegrees(cartographic.latitude).toFixed(2);

	            entity.position = cartesian;
	            entity.label.show = true;
	            entity.label.text =
	                'Lon: ' + ('   ' + longitudeString).slice(-7) + '\u00B0' +
	                '\nLat: ' + ('   ' + latitudeString).slice(-7) + '\u00B0';
	        } else {
	            entity.label.show = false;
	        }
	    }, Cesium.ScreenSpaceEventType.MOUSE_MOVE);
	//});
	
	
	    
	    
	    
	   
	
	
	
	
	
	
	/*	
var viewer = new Cesium.Viewer("cesiumContainer", {
    animation: false,  //是否显示动画控件
    baseLayerPicker: false, //是否显示图层选择控件
    geocoder: true, //是否显示地名查找控件
    timeline: false, //是否显示时间线控件
    sceneModePicker: true, //是否显示投影方式控件
    navigationHelpButton: false, //是否显示帮助信息控件
    infoBox: true,  //是否显示点击要素之后显示的信息
    imageryProvider: new Cesium.WebMapTileServiceImageryProvider({
        url: "http://t0.tianditu.com/img_w/wmts?service=wmts&request=GetTile&version=1.0.0&LAYER=img&tileMatrixSet=w&TileMatrix={TileMatrix}&TileRow={TileRow}&TileCol={TileCol}&style=default&format=tiles",
        layer: "tdtBasicLayer",
        style: "default",
        format: "image/jpeg",
        tileMatrixSetID: "GoogleMapsCompatible",
        show: false
    })
});

	
	//离线地图
	var url='http://localhost:8080/geoserver/wms'; //Geoserver URL   
	var viewer = new Cesium.Viewer('cesiumContainer',{  
	    imageryProvider:new Cesium.WebMapServiceImageryProvider({   
	        url : url,         
	        layers: 'nurc:Arc_Sample'// Here just give layer name   
	    }),  
	    baseLayerPicker:false  
	});  
	var layers = viewer.imageryLayers;  
	var blackMarble = layers.addImageryProvider(Cesium.createTileMapServiceImageryProvider({  
	    url : '/GlobalTMS',  
	    credit : '北京市昌平区'  
	}));  
	
	/*
	 var layers = viewer.imageryLayers;  
	    //添加各国夜晚灯光亮度图  
	    var blackMarble =layers.addImageryProvider(Cesium.createTileMapServiceImageryProvider({  
	        url: 'https://cesiumjs.org/blackmarble',  
	        credit: 'Black Marble imagery courtesy NASA EarthObservatory',  
	        flipXY: true // Only old gdal2tile.py generatedtilesets need this flag.  
	    }));  
	    blackMarble.alpha = 0.5;    //透明度  
	    blackMarble.brightness = 1.5;   //亮度  
	*/
	
	    Cesium.Math.setRandomNumberSeed(0);  
	    
	    var promise =Cesium.GeoJsonDataSource.load("http://localhost:8080/surface_water/static/mapJson/ZYXJ.json");  
	   
	    promise.then(function (dataSource) {  
	   
	        viewer.dataSources.add(dataSource);  
	   
	        var entities =dataSource.entities.values;  
	   
	        var colorHash = {};  
	   
	        for (var i = 0; i < entities.length;i++) {  
	   
	            var entity = entities[i];  
	   
	            var name = entity.name;  
	   
	            var color = colorHash[name];  
	   
	            if (!color) {  
	   
	                color =Cesium.Color.fromRandom({  
	   
	                    alpha: 1.0  
	   
	                });  
	   
	                colorHash[name] = color;  
	   
	            }  
	   
	            entity.polygon.material = color;  
	   
	            entity.polygon.outline = false;  
	   
	           entity.polygon.extrudedHeight =5000.0;  
	   
	        }  
	   
	    });  
	   
	    //viewer.flyTo(promise); 
	
	
	//谷歌中文标记
	viewer.imageryLayers.addImageryProvider(new Cesium.WebMapTileServiceImageryProvider({
	    url: "http://t0.tianditu.com/cia_w/wmts?service=wmts&request=GetTile&version=1.0.0&LAYER=cia&tileMatrixSet=w&TileMatrix={TileMatrix}&TileRow={TileRow}&TileCol={TileCol}&style=default.jpg",
	    layer: "tdtAnnoLayer",
	    style: "default",
	    format: "image/jpeg",
	    tileMatrixSetID: "GoogleMapsCompatible",
	    show: false
	}));

	
	viewer.imageryLayers.addImageryProvider(new Cesium.WebMapTileServiceImageryProvider({
	    url: "http://t0.tianditu.com/cva_w/wmts?service=wmts&request=GetTile&version=1.0.0&LAYER=cva&tileMatrixSet=w&TileMatrix={TileMatrix}&TileRow={TileRow}&TileCol={TileCol}&style=default.jpg",
	    layer: "tdtAnnoLayer",
	    style: "default",
	    format: "image/jpeg",
	    tileMatrixSetID: "GoogleMapsCompatible"
	}));

	