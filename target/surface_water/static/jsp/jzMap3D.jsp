<%@ page language="java" contentType="text/html; charset=utf-8" pageEncoding="utf-8"%>
<%@ include file="/WEB-INF/views/base.jsp"%>


Cesium.BingMapsApi.defaultKey="ArgdTG4VWTidf-5ScPul3P3LuVAW4ArFDCMFdqB6Gr720D-K0WLKo-pLIhvIpUSn";
	//var viewer = new Cesium.Viewer('cesiumContainer',{animation:false,timeline:false});
	var viewer;
	var siteEntitys;
	$(document).ready(function() {
				initMap();
				setTimeout(function() {
				viewer.camera.flyTo({
					destination: Cesium.Cartesian3.fromDegrees(100.47640800,38.92898083, 160000),
					duration: 5, 
				})
				}, 3000)
			});
		
		function initMap(){
			viewer = new Cesium.Viewer('cesiumContainer', {
				timeline: false,
				animation: false,
				baseLayerPicker: true,
				fullscreenButton: false,
				geocoder: false,   
				infoBox: false,
				sceneModePicker: true,   
				selectionIndicator: false, 
				navigationHelpButton: false,
				imageryProvider:Cesium.createTileMapServiceImageryProvider({
			    	url:'http://www.google.cn/maps/vt?lyrs=s@198&gl=en&x={x}&y={y}&z={z}'
			 	}),
				homeButton: false
			});
			
			
			siteEntitys=viewer.entities;
			
			viewer._cesiumWidget._creditContainer.style.display="none";
			var terrainProvider = new Cesium.CesiumTerrainProvider({
			    url : '//assets.agi.com/stk-terrain/world'
			});
			viewer.terrainProvider = terrainProvider;
			var dataSource = Cesium.GeoJsonDataSource.load('../../../../Apps/SampleData/simplestyles.geojson');
			viewer.dataSources.add(dataSource);
			viewer.zoomTo(dataSource);
			
			
			var initialPosition = new Cesium.Cartesian3.fromDegrees(100.6643316149, 38.3962146848, 15555831.082799425431);

			var initialOrientation = new Cesium.HeadingPitchRoll.fromDegrees(0, -90, 0);
			
			var homeCameraView = {
			    destination : initialPosition,
			    orientation : {
			        heading : initialOrientation.heading,
			        pitch : initialOrientation.pitch,
			        roll : initialOrientation.roll
			    }
			};
			
			
			// Set the initial view
			viewer.scene.camera.setView(homeCameraView);
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
	    	
	   
	    	var scene = viewer.scene;
			var handler;
	   		var entity2 = viewer.entities.add({
		        label : {
		            show : false,
		            showBackground : true,
		            font : '14px monospace',
		            horizontalOrigin : Cesium.HorizontalOrigin.LEFT,
		            verticalOrigin : Cesium.VerticalOrigin.TOP,
		            pixelOffset : new Cesium.Cartesian2(15, 0)
		        }
		    });
		    
		    
		    let position =  Cesium.Cartesian3.fromDegrees(101.08932495, 38.78723145,2512.57);
		    let hpRoll = new Cesium.HeadingPitchRoll(Cesium.Math.toRadians(203), 0, 0);
		    let orientation = Cesium.Transforms.headingPitchRollQuaternion(position, hpRoll);
			var entity = viewer.entities.add({   
				 id:'model',
			     position: position,

			     orientation: orientation,
			     model : {    
			        uri : 'http://localhost:8080/surface_water/static/3D/hcbqs.gltf'    
			     }    
			}); 
			
			
			
			var handler = new Cesium.ScreenSpaceEventHandler(viewer.scene.canvas);
	    	var c=Cesium.Cartesian2.ZERO;
			handler.setInputAction(function(click) {
		        var pickedObject = scene.pick(click.position);
		        if (Cesium.defined(pickedObject) && (pickedObject.id != undefined)) {
		        	var id = viewer.selectedEntity.id;
		        	var name = viewer.selectedEntity.name;
		        	
		        	if(name=='0'){
			        	$.ajax({
							url:"${ctx}/map/ajax_water_site_info",
							type: "post",
							data: {id:id},
							async: false,//非异步
							success: function(msg){
							debugger
								getEntityMsg(id,name,msg);
								//fly(msg.sriLongitude,msg.sriLatitude,msg.sriHeight,0,-90,0);
							}
						});
			        }else if(name=='1'){
			    		$.ajax({
							url:"${ctx}/map/ajax_reservoir_info",
							type: "post",
							data: {id:id},
							async: false,//非异步
							success: function(msg){
								alert("----------"+msg.siteWaterId);
								if(msg.deviceReservoirName=="海潮坝水库")	{
									fly(msg.sriLongitude,msg.sriLatitude,msg.sriHeight,3.7017,-0.3153, 6.2814);
								}else if(msg.deviceReservoirName=="瓦房城水库"){
									fly(msg.sriLongitude,msg.sriLatitude,msg.sriHeight,4.014,-0.6078, 6.2801);
								}						
									getEntityMsg(id,name,msg);
							}
						});
			        }else if(name=='2'){
			        	$.ajax({
							url:"${ctx}/map/ajax_rain_site_info",
							type: "post",
							data: {id:id},
							async: false,//非异步
							success: function(msg){
							
								getEntityMsg(id,name,msg);
							
								//fly(msg.sriLongitude,msg.sriLatitude,msg.sriHeight,0,-90,0);
							}
						});
			        

			        }else if(name=='4'){
			        $.ajax({
							url:"${ctx}/map/ajax_rain_site_info",
							type: "post",
							data: {id:id},
							async: false,//非异步
							success: function(msg){
							
								getEntityMsg(id,name,msg);
							
								//fly(msg.sriLongitude,msg.sriLatitude,msg.sriHeight,0,-90,0);
							}
						});
			        

			        }else if(name=="3"){
			        	 $.ajax({
							url:"${ctx}/site_sluice_manage/slice_id",
							type: "post",
							data: {id:id,type:1},
							async: false,//非异步
							success: function(msg){
								getEntityMsg(id,name,msg.data.ssi);
							
								//fly(msg.sriLongitude,msg.sriLatitude,msg.sriHeight,0,-90,0);
							}
						});
			        }else if(name=='001'){
			        	getEntityMsg(id,name,001);
			        	tst();
			        
			        }else if(name=='002'){
			        	getEntityMsg(id,name,002);
			        	tsst();
			        
			        }
			        
		        } else {
		           //$('#trackPopUp').hide();
		        }
		    }, Cesium.ScreenSpaceEventType.LEFT_CLICK);
		    
		    viewer.cesiumWidget.screenSpaceEventHandler.removeInputAction(Cesium.ScreenSpaceEventType.LEFT_DOUBLE_CLICK);
		}
		function reset(){
				var initialPosition = Cesium.Cartesian3.fromDegrees(100.6643316149, 38.3962146848, 15555831.082799425431);
				
				fly2(100.05935669,39.09484863, 160000, 0,-90,0);

		}
		
		function tst(){
				var initialPosition = Cesium.Cartesian3.fromDegrees(100.6526,38.3859,2290);
				
				fly2(100.6526,38.3859,2290, 100.6526,38.3859,2290); 
		}
		
		function tsst(){
				var initialPosition = Cesium.Cartesian3.fromDegrees(100.7180,38.4665,2290);
				
				<!-- fly2(100.6526,38.3859,2290, 100.6526,38.3859,2290); -->
		}
		
		
		function fly(x,y,z,a,b,c){
			setTimeout(function() {
                viewer.camera.flyTo({
                    destination : Cesium.Cartesian3.fromDegrees(x,y,z),
                    duration: 5, 
                    orientation : {
                    	heading : a,
                        pitch : b,
                        roll:c
                    },
                    easingFunction : Cesium.EasingFunction.LINEAR_NONE
                });
            }, 100);
		}
		
		function fly2(x,y,z,a,b,c){
			setTimeout(function() {
                viewer.camera.flyTo({
                    destination : Cesium.Cartesian3.fromDegrees(x,y,z),
                    duration: 5, 
                    orientation : {
                    	heading : Cesium.Math.toRadians(a),
                        pitch : Cesium.Math.toRadians(b),
                        roll:Cesium.Math.toRadians(c)
                    },
                    easingFunction : Cesium.EasingFunction.LINEAR_NONE
                });
            }, 100);
		}