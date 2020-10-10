/* 相对链接的基准URL */
var curWwwPath = window.document.location.href;
var pathName = window.document.location.pathname;
var pos = curWwwPath.indexOf(pathName);
var localhostPaht = curWwwPath.substring(0,pos);
var projectName = pathName.substring(0,pathName.substr(1).indexOf('/')+1);
var ctxPath = localhostPaht + projectName;

//水位站
function start(id,swiDevicemodelCode){
	//alert(id);
	removeOverlay();
	$.ajax({
		url:ctxPath+"/map/ajax_site_info",
		type: "post",
		data: {id:id},
		async: false,//非异步
		success: function(msg){
			debugger
			/*var msg = [[100.17, 39.35],[100.17, 39.38],[100.17, 39.30]];*/
			var pointArray = new Array();
			var myIcon = null;
			for(var i=0;i<msg.length;i++){
				if(swiDevicemodelCode == msg[i].swiDevicemodelCode){
					if(msg[i].swiEquipState==1){
						myIcon = new BMap.Icon(ctxPath+"/static/images/map/map-DEV-1.gif", new BMap.Size(30,40));
					}else{
						myIcon = new BMap.Icon(ctxPath+"/static/images/map/map-DEV-0.gif", new BMap.Size(30,40))
					}
					var marker = new BMap.Marker(new BMap.Point(msg[i].swiLongitude, msg[i].swiLatitude),{icon:myIcon}); // 创建点
					//map.centerAndZoom(marker, 12);
					//增加点
					pointArray = new BMap.Point(msg[i].swiLongitude, msg[i].swiLatitude);
					var label = new BMap.Label(msg[i].deviceWaterName,{offset:new BMap.Size(20,-10)});
					label.setStyle({
						color : "#000", //字体颜色
						fontSize : "14px",//字体大小 　　
						backgroundColor :"0.05", //文本标注背景颜色　
						border :"0",
						fontWeight :600 //字体加粗
					});
					marker.setLabel(label);
					marker.name =msg[i].deviceWaterName;
					marker.addEventListener("click",attribute);
					map.addOverlay(marker);
					
					//覆盖点跳动
					/* marker.setAnimation(BMAP_ANIMATION_BOUNCE);*/
				}
			}
			//让所有点在视野范围内
			//map.setViewport(pointArray);
			function attribute(e){
				debugger
				var p = e.target;
				//alert(p.vc.innerText);
			    $.post(ctxPath+"/site_water_manage/selectName",{"name": p.name},function(data){
			    	var result = data.data;
			    	getEntityMsg(result.id,0,result);
			    });
/*			    for(var i=0;i<msg.length;i++){
					var pt = new BMap.Point(msg[i].swiLongitude, msg[i].swiLatitude);
					var myIcon = new BMap.Icon("http://localhost:8080/surface_water/static/images/map/water_drop.gif", new BMap.Size(300,157));
				    var marker = new BMap.Marker(pt,{icon:myIcon}); // 创建点new BMap.Point(msg[i].swiLongitude, msg[i].swiLatitude)
				    map.addOverlay(marker);    //增加点
				    pointArray[i] = new BMap.Point(msg[i].swiLongitude, msg[i].swiLatitude);
				    var label = new BMap.Label(msg[i].deviceWaterName,{offset:new BMap.Size(20,-10)});
				    marker.setLabel(label);
				    marker.addEventListener("click",attribute);
				}*/
			}
		
	}
	});
	
	canalWaterMsg();
	//如果将getPlayer(id);放开,百度地图界面就展示站点视频流信息2019-1-7 李玥
	 getPlayer(id);
}

//供水站
function startArea(id){
	siteEntitys.removeAll();
	removeWaterSiteMessage();
	removeRainSiteMessage();
	removeReservoirSiteMessage();
	reset();		
	$.ajax({
		url:ctxPath+"/map/ajax_site_rain_info",
		type: "get",
		data: {id:id},
		async: false,//非异步
		success: function(msg){
			//alert(JSON.stringify(msg));
			for(var i=0;i<msg.length;i++){
					siteEntitys.add({
					  id:msg[i].id,
					  position : Cesium.Cartesian3.fromDegrees(msg[i].sriLongitude, msg[i].sriLatitude),
					  name:'2',
					  billboard : {
					    image : 'http://localhost:8080/surface_water/static/3D/rain_site2.png',
					    width : 50,
					    height: 55
					  },
					  label : {
						  text :msg[i].deviceRainName,
					    fillColor:Cesium.Color.RED,
					    font : '12pt monospace',
					    outlineColor:Cesium.Color.RED,
					    style: Cesium.LabelStyle.FILL_AND_OUTLINE,
					    outlineWidth : 0,
					    verticalOrigin : Cesium.VerticalOrigin.BOTTOM,
					    pixelOffset : new Cesium.Cartesian2(45, -25)
					  }
				});
			}
		}
	});
}

//闸门
function startSluice(id){
	siteEntitys.removeAll();
	removeWaterSiteMessage();
	removeRainSiteMessage();
	removeReservoirSiteMessage();
	reset();		
	$.ajax({
		url:ctxPath+"/site_sluice_manage/sliuce_site",
		type: "get",
		data: {id:id},
		async: false,//非异步
		success: function(data){
			debugger
			var msg = data.data.ssiList;
			for(var i=0;i<msg.length;i++){
					siteEntitys.add({
					 id:msg[i].id,
					  position : Cesium.Cartesian3.fromDegrees(msg[i].ssiLongitude, msg[i].ssiLatitude,msg[i].ssiHeight),
					  name:'3',
					  billboard : {
					    image : 'http://localhost:8080/surface_water/static/3D/sulice.png',
					    width : 50,
					    height: 55
					  },
					  label : {
					    text :msg[i].deviceSluiceName,
					    fillColor:Cesium.Color.RED,
					    font : '12pt monospace',
					    outlineColor:Cesium.Color.RED,
					    style: Cesium.LabelStyle.FILL_AND_OUTLINE,
					    outlineWidth:2,
					    verticalOrigin : Cesium.VerticalOrigin.TOP,
					    pixelOffset:new Cesium.Cartesian2(0, 32)
					  }
				});
			}
		}
	});
}


//水库
function show(id,code){
//alert(id);	
	siteEntitys.removeAll();
	if(id==0){
		reset();
		removeWaterSiteMessage();
		removeRainSiteMessage();
		removeReservoirSiteMessage();
		$.ajax({
		url:ctxPath+"/map/ajax_all_reservoir_info",
		type: "post",
		data: {id:id},
		async: false,//非异步
		success: function(msg){
		//alert(JSON.stringify(msg) );
				for(var i=0;i<msg.length;i++){
				//alert(i);
					siteEntitys.add({
					  id:msg[i].id,
					  position : Cesium.Cartesian3.fromDegrees(msg[i].sriLongitude, msg[i].sriLatitude,msg[i].sriHeight),
					  name : '1', 
					  billboard : {
					    image : 'http://localhost:8080/surface_water/static/3D/reservoir.png',
					    width : 50,
					    height : 50
					  },
					  label : {
						  text :msg[i].deviceReservoirName,
						    fillColor:Cesium.Color.RED,
						    font : '12pt monospace',
						    outlineColor:Cesium.Color.RED,
						    style: Cesium.LabelStyle.FILL_AND_OUTLINE,
						    outlineWidth : 0,
						    verticalOrigin : Cesium.VerticalOrigin.BOTTOM,
						    pixelOffset : new Cesium.Cartesian2(45, -25)
					  }
				});
			}
		}
	});

	}else{
	removeWaterSiteMessage();
	removeRainSiteMessage();
	removeReservoirSiteMessage();
		reset();
		$.ajax({
			url:ctxPath+"/map/ajax_reservoir_info",
			type: "post",
			data: {id:id},
			async: false,//非异步
			success: function(msg){
			//alert(JSON.stringify(msg) );
			//alert(msg.sriLongitude);
						siteEntitys.add({
						id:msg.id,
						  position : Cesium.Cartesian3.fromDegrees(msg.sriLongitude, msg.sriLatitude,msg.sriHeight),
						  name:'1',
						  billboard : {
						    image : 'http://localhost:8080/surface_water/static/3D/reservoir.png',
						    width : 50,
						    height : 50
						  },
						  label : {
							  text :msg[i].deviceReservoirName,
							    fillColor:Cesium.Color.RED,
							    font : '12pt monospace',
							    outlineColor:Cesium.Color.RED,
							    style: Cesium.LabelStyle.FILL_AND_OUTLINE,
							    outlineWidth : 0,
							    verticalOrigin : Cesium.VerticalOrigin.BOTTOM,
							    pixelOffset : new Cesium.Cartesian2(45, -25)
						  }
					});
			}
		});
	}

}


function showFactory(){
	//alert(111);
	siteEntitys.removeAll();
	removeWaterSiteMessage();
	removeRainSiteMessage();
	reset();		
	siteEntitys.add({
	    name : 'Blue box',
	    position: Cesium.Cartesian3.fromDegrees(100.6526, 38.3859, 2290),
	    orientation : Cesium.Transforms.headingPitchRollQuaternion(Cesium.Cartesian3.fromDegrees(100.5101, 38.4770, 2290), new Cesium.HeadingPitchRoll(Cesium.Math.toRadians(115), 0, 0)),
	   
	    box : {
	        dimensions : new Cesium.Cartesian3(400, 400, 400),
	        material : Cesium.Color.BLUE
	    },
	    label : {
		    text :"海潮坝水厂",
		    fillColor:Cesium.Color.RED,
		    font : '12pt monospace',
		    outlineColor:Cesium.Color.RED,
		    style: Cesium.LabelStyle.FILL_AND_OUTLINE,
		    outlineWidth : 0,
		    verticalOrigin : Cesium.VerticalOrigin.BOTTOM,
		    pixelOffset : new Cesium.Cartesian2(45, -25)
		}
	    
	});
	
	
	siteEntitys.add({
	    name : 'Blue box',
	    position: Cesium.Cartesian3.fromDegrees(100.6575, 38.4635, 2290),
	    orientation : Cesium.Transforms.headingPitchRollQuaternion(Cesium.Cartesian3.fromDegrees(100.6575, 38.4635, 2290), new Cesium.HeadingPitchRoll(Cesium.Math.toRadians(115), 0, 0)),
	   
	    box : {
	        dimensions : new Cesium.Cartesian3(200, 200, 200),
	        material : Cesium.Color.BLUE
	    },
	    label : {
		    text :"一号监察站，压力：568MP",
		    fillColor:Cesium.Color.RED,
		    font : '12pt monospace',
		    outlineColor:Cesium.Color.RED,
		    style: Cesium.LabelStyle.FILL_AND_OUTLINE,
		    outlineWidth : 0,
		    verticalOrigin : Cesium.VerticalOrigin.BOTTOM,
		    pixelOffset : new Cesium.Cartesian2(45, -25)
		}
	    
	});
	
	
	siteEntitys.add({
	    name : 'Blue box',
	    position: Cesium.Cartesian3.fromDegrees(100.6783, 38.4114, 2290),
	    orientation : Cesium.Transforms.headingPitchRollQuaternion(Cesium.Cartesian3.fromDegrees(100.5101, 38.4770, 2290), new Cesium.HeadingPitchRoll(Cesium.Math.toRadians(115), 0, 0)),
	   
	    box : {
	        dimensions : new Cesium.Cartesian3(200, 200, 200),
	        material : Cesium.Color.BLUE
	    },
	    label : {
		    text :"二号监察站",
		    fillColor:Cesium.Color.RED,
		    font : '12pt monospace',
		    outlineColor:Cesium.Color.RED,
		    style: Cesium.LabelStyle.FILL_AND_OUTLINE,
		    outlineWidth : 0,
		    verticalOrigin : Cesium.VerticalOrigin.BOTTOM,
		    pixelOffset : new Cesium.Cartesian2(45, -25)
		}
	    
	});
	
	
	
	siteEntitys.add({
	    name : 'Blue box',
	    position: Cesium.Cartesian3.fromDegrees(100.7180, 38.4665, 2290),
	    orientation : Cesium.Transforms.headingPitchRollQuaternion(Cesium.Cartesian3.fromDegrees(100.7180, 38.4665, 2290), new Cesium.HeadingPitchRoll(Cesium.Math.toRadians(115), 0, 0)),
	   
	    box : {
	        dimensions : new Cesium.Cartesian3(200, 200, 200),
	        material : Cesium.Color.BLUE
	    },
	    label : {
		    text :"三号监察站",
		    fillColor:Cesium.Color.RED,
		    font : '12pt monospace',
		    outlineColor:Cesium.Color.RED,
		    style: Cesium.LabelStyle.FILL_AND_OUTLINE,
		    outlineWidth : 0,
		    verticalOrigin : Cesium.VerticalOrigin.BOTTOM,
		    pixelOffset : new Cesium.Cartesian2(45, -25)
		}
	    
	});
	
	
	
	siteEntitys.add({
	    name : 'Blue box',
	    position: Cesium.Cartesian3.fromDegrees(100.6868, 38.4322, 2290),
	    orientation : Cesium.Transforms.headingPitchRollQuaternion(Cesium.Cartesian3.fromDegrees(100.6868, 38.4322, 2290), new Cesium.HeadingPitchRoll(Cesium.Math.toRadians(115), 0, 0)),
	   
	    box : {
	        dimensions : new Cesium.Cartesian3(200, 200, 200),
	        material : Cesium.Color.BLUE
	    },
	    label : {
		    text :"四号监察站",
		    fillColor:Cesium.Color.RED,
		    font : '12pt monospace',
		    outlineColor:Cesium.Color.RED,
		    style: Cesium.LabelStyle.FILL_AND_OUTLINE,
		    outlineWidth : 0,
		    verticalOrigin : Cesium.VerticalOrigin.BOTTOM,
		    pixelOffset : new Cesium.Cartesian2(45, -25)
		}
	    
	});
	
	
	siteEntitys.add({
	    name : 'Blue box',
	    position: Cesium.Cartesian3.fromDegrees(100.6547, 38.4351, 2290),
	    orientation : Cesium.Transforms.headingPitchRollQuaternion(Cesium.Cartesian3.fromDegrees(100.6547, 38.4351, 2290), new Cesium.HeadingPitchRoll(Cesium.Math.toRadians(115), 0, 0)),
	   
	    box : {
	        dimensions : new Cesium.Cartesian3(200, 200, 200),
	        material : Cesium.Color.BLUE
	    },
	    label : {
		    text :"五号监察站",
		    fillColor:Cesium.Color.RED,
		    font : '12pt monospace',
		    outlineColor:Cesium.Color.RED,
		    style: Cesium.LabelStyle.FILL_AND_OUTLINE,
		    outlineWidth : 0,
		    verticalOrigin : Cesium.VerticalOrigin.BOTTOM,
		    pixelOffset : new Cesium.Cartesian2(45, -25)
		}
	    
	});
	
	
	siteEntitys.add({
	    name : 'Blue box',
	    position: Cesium.Cartesian3.fromDegrees(100.7604, 38.4469, 2290),
	    orientation : Cesium.Transforms.headingPitchRollQuaternion(Cesium.Cartesian3.fromDegrees(100.7604, 38.4469, 2290), new Cesium.HeadingPitchRoll(Cesium.Math.toRadians(115), 0, 0)),
	   
	    box : {
	        dimensions : new Cesium.Cartesian3(200, 200, 200),
	        material : Cesium.Color.BLUE
	    },
	    label : {
		    text :"六号监察站",
		    fillColor:Cesium.Color.RED,
		    font : '12pt monospace',
		    outlineColor:Cesium.Color.RED,
		    style: Cesium.LabelStyle.FILL_AND_OUTLINE,
		    outlineWidth : 0,
		    verticalOrigin : Cesium.VerticalOrigin.BOTTOM,
		    pixelOffset : new Cesium.Cartesian2(45, -25)
		}
	    
	});
	
	
	siteEntitys.add({
	    name : 'Blue box',
	    position: Cesium.Cartesian3.fromDegrees(100.7550, 38.4622,  2290),
	    orientation : Cesium.Transforms.headingPitchRollQuaternion(Cesium.Cartesian3.fromDegrees(100.7550, 38.4622, 2290), new Cesium.HeadingPitchRoll(Cesium.Math.toRadians(115), 0, 0)),
	   
	    box : {
	        dimensions : new Cesium.Cartesian3(200, 200, 200),
	        material : Cesium.Color.BLUE
	    },
	    label : {
		    text :"七号监察站",
		    fillColor:Cesium.Color.RED,
		    font : '12pt monospace',
		    outlineColor:Cesium.Color.RED,
		    style: Cesium.LabelStyle.FILL_AND_OUTLINE,
		    outlineWidth : 0,
		    verticalOrigin : Cesium.VerticalOrigin.BOTTOM,
		    pixelOffset : new Cesium.Cartesian2(45, -25)
		}
	});
	
	
	
	var czml = [{
	    "id" : "document",
	    "name" : "CZML Geometries: Polyline",
	    "version" : "1.0"
	},
	
	{  
		"id" : "cgerCorridor",
	    "name" : "Green corridor at height with mitered corners and outline",
	    "corridor" : {
	        "positions" : {
	            "cartographicDegrees" : [
	               
	                100.6783, 38.4114, 0,
	                 100.6998, 38.4342, 0,
	                100.7095, 38.4298, 0,
	                100.7346, 38.4354, 0,
	                100.7604, 38.4469, 0
	            ]
	        },
	        "height" : 2320,
	         "extrudedHeight" : 2290,
	        "width" : 50,
	        "cornerType": "BEVELED",
	        "material" : {
	            "solidColor" : {
	                "color" : {
	                    "rgba" : [0, 255,255, 255]
	                }
	            }
	        },
	        "outline" : true, // height must be set for outlines to display
	        "outlineColor" : {
	            "rgba" : [255, 255, 255, 255]
	        }
	    }
	},
	
	
	{  
		"id" : "dgerCorridor",
	    "name" : "Green corridor at height with mitered corners and outline",
	    "corridor" : {
	        "positions" : {
	            "cartographicDegrees" : [
	               
	               
	                100.7180, 38.4665, 0,
	                
	                100.7550, 38.4622, 0
	            ]
	        },
	        "height" : 2320,
	         "extrudedHeight" : 2290,
	        "width" : 50,
	        "cornerType": "BEVELED",
	        "material" : {
	            "solidColor" : {
	                "color" : {
	                    "rgba" : [0, 255,255, 255]
	                }
	            }
	        },
	        "outline" : true, // height must be set for outlines to display
	        "outlineColor" : {
	            "rgba" : [255, 255, 255, 255]
	        }
	    }
	},
	
	
	{  
		"id" : "bgerCorridor",
	    "name" : "Green corridor at height with mitered corners and outline",
	    "corridor" : {
	        "positions" : {
	            "cartographicDegrees" : [
	          
	                100.6783, 38.4114, 0,
	                100.6998, 38.4342, 0,
	                100.7081, 38.4415, 0,
	                100.7180, 38.4665, 0,
	                100.7571, 38.4919, 0,
	                100.7399, 38.5109, 0
	            ]
	        },
	        "height" : 2320,
	         "extrudedHeight" : 2290,
	        "width" : 50,
	        "cornerType": "BEVELED",
	        "material" : {
	            "solidColor" : {
	                "color" : {
	                    "rgba" : [0, 255,255, 255]
	                }
	            }
	        },
	        "outline" : true, // height must be set for outlines to display
	        "outlineColor" : {
	            "rgba" : [255, 255, 255, 255]
	        }
	    }
	},
	
	
	
	{  
		"id" : "agerCorridor",
	    "name" : "Green corridor at height with mitered corners and outline",
	    "corridor" : {
	        "positions" : {
	            "cartographicDegrees" : [
	               100.6526, 38.3859, 0,
	               100.6783, 38.4114, 0,
	               100.7057, 38.4826, 0 
	            ]
	        },
	        "height" : 2320,
	         "extrudedHeight" : 2290,
	        "width" : 50,
	        "cornerType": "BEVELED",
	        "material" : {
	            "solidColor" : {
	                "color" : {
	                    "rgba" : [0, 255,255, 255]
	                }
	            }
	        },
	        "outline" : true, // height must be set for outlines to display
	        "outlineColor" : {
	            "rgba" : [255, 255, 255, 255]
	        }
	    }
	},
	
	{  
		"id" : "gerCorridor",
	    "name" : "Green corridor at height with mitered corners and outline",
	    "corridor" : {
	        "positions" : {
	            "cartographicDegrees" : [
	                100.6575, 38.4635, 0,
	                100.6507, 38.4951, 0,
	                 100.6401, 38.5016, 0,
	                 100.6351, 38.5028, 0
	            ]
	        },
	        "height" : 2320,
	         "extrudedHeight" : 2290,
	        "width" : 50,
	        "cornerType": "BEVELED",
	        "material" : {
	            "solidColor" : {
	                "color" : {
	                    "rgba" : [0, 255,255, 255]
	                }
	            }
	        },
	        "outline" : true, // height must be set for outlines to display
	        "outlineColor" : {
	            "rgba" : [255, 255, 255, 255]
	        }
	    }
	},{  
		"id" : "greenCorridor",
	    "name" : "Green corridor at height with mitered corners and outline",
	    "corridor" : {
	        "positions" : {
	            "cartographicDegrees" : [
	                100.6526, 38.3859, 0,
	                100.6575, 38.4635, 0,
	                100.6764, 38.5063, 0,
	                100.6772, 38.5351, 0,
	                100.6939, 38.5556, 0
	            ]
	        },
	        "height" : 2320,
	         "extrudedHeight" : 2290,
	        "width" : 50,
	        "cornerType": "BEVELED",
	        "material" : {
	            "solidColor" : {
	                "color" : {
	                    "rgba" : [0, 255,255, 255]
	                }
	            }
	        },
	        "outline" : true, // height must be set for outlines to display
	        "outlineColor" : {
	            "rgba" : [255, 255, 255, 255]
	        }
	    }
	}, {
	    "id" : "blueCorridor",
	    "name" : "Blue extruded corridor with beveled corners and outline",
	    "corridor" : {
	        "positions" : {
	            "cartographicDegrees" : [
	                  100.5101, 38.4770, 0,
	                  100.5043, 38.4667, 0,
	                  100.5043, 38.4667, 0
	            ]
	        },
	        "height" : 2320,
	        "extrudedHeight" : 2290,
	        "width" : 50,
	        "cornerType": "BEVELED",
	        "material" : {
	            "solidColor" : {
	                "color" : {
	                    "rgba" : [0, 0, 255, 255]
	                }
	            }
	        },
	        "outline" : true,
	        "outlineColor" : {
	            "rgba" : [255, 255, 255, 255]
	        }
	    }
	}];
	
	var dataSourcePromise = Cesium.CzmlDataSource.load(czml);
	viewer.dataSources.add(dataSourcePromise);
	viewer.zoomTo(dataSourcePromise);	
}


//供水站
function startWater(){
	siteEntitys.removeAll();
	removeWaterSiteMessage();
	removeRainSiteMessage();
	removeReservoirSiteMessage();
	reset();
		showFactory();
	
	
}
//地图视频站
function videoArea(){
	siteEntitys.removeAll();
	removeWaterSiteMessage();
	removeRainSiteMessage();
	removeReservoirSiteMessage();
	reset();		
}

function showFactory(){
		
	siteEntitys.add({
		id:'01',
	    name : '001',
	    position: Cesium.Cartesian3.fromDegrees(100.6526, 38.3859, 2290),
	  orientation : Cesium.Transforms.headingPitchRollQuaternion(Cesium.Cartesian3.fromDegrees(100.5101, 38.4770, 2290), new Cesium.HeadingPitchRoll(Cesium.Math.toRadians(115), 0, 0)),
	   
	   /* box : {
	        dimensions : new Cesium.Cartesian3(400, 400, 400),
	        material : Cesium.Color.BLUE
	       
	    },*/
	    billboard : {
		    image : 'http://localhost:8080/surface_water/static/3D/waterWork.png',
		    width : 100,
		    height :100
		  },
	    label : {
		    text :"海潮坝水厂",
		    fillColor:Cesium.Color.RED,
		    font : '12pt monospace',
		    outlineColor:Cesium.Color.RED,
		    style: Cesium.LabelStyle.FILL_AND_OUTLINE,
		    outlineWidth : 0,
		    verticalOrigin : Cesium.VerticalOrigin.BOTTOM,
		    pixelOffset : new Cesium.Cartesian2(45, -25)
		}
	    
	});
	
	
	siteEntitys.add({
	    name : 'Blue box',
	    position: Cesium.Cartesian3.fromDegrees(100.6575, 38.4635, 2290),
	    orientation : Cesium.Transforms.headingPitchRollQuaternion(Cesium.Cartesian3.fromDegrees(100.6575, 38.4635, 2290), new Cesium.HeadingPitchRoll(Cesium.Math.toRadians(115), 0, 0)),
	    box : {
	        dimensions : new Cesium.Cartesian3(200, 200, 200),
	        material : Cesium.Color.BLUE
	    },
	    label : {
		    text :"曹营村，压力：568MP",
		    fillColor:Cesium.Color.RED,
		    font : '12pt monospace',
		    outlineColor:Cesium.Color.RED,
		    style: Cesium.LabelStyle.FILL_AND_OUTLINE,
		    outlineWidth : 0,
		    verticalOrigin : Cesium.VerticalOrigin.BOTTOM,
		    pixelOffset : new Cesium.Cartesian2(45, -25)
		}
	    
	});
	
	
	siteEntitys.add({
	    name : 'Blue box',
	    position: Cesium.Cartesian3.fromDegrees(100.6783, 38.4114, 2290),
	    orientation : Cesium.Transforms.headingPitchRollQuaternion(Cesium.Cartesian3.fromDegrees(100.5101, 38.4770, 2290), new Cesium.HeadingPitchRoll(Cesium.Math.toRadians(115), 0, 0)),
	   
	    box : {
	        dimensions : new Cesium.Cartesian3(200, 200, 200),
	        material : Cesium.Color.BLUE
	    },
	    label : {
		    text :"丰乐乡",
		    fillColor:Cesium.Color.RED,
		    font : '12pt monospace',
		    outlineColor:Cesium.Color.RED,
		    style: Cesium.LabelStyle.FILL_AND_OUTLINE,
		    outlineWidth : 0,
		    verticalOrigin : Cesium.VerticalOrigin.BOTTOM,
		    pixelOffset : new Cesium.Cartesian2(45, -25)
		}
	    
	});
	
	
	
	siteEntitys.add({
		id:'02',
	    name : '002',
	    position: Cesium.Cartesian3.fromDegrees(100.7180, 38.4665, 2290),
	    orientation : Cesium.Transforms.headingPitchRollQuaternion(Cesium.Cartesian3.fromDegrees(100.7180, 38.4665, 2290), new Cesium.HeadingPitchRoll(Cesium.Math.toRadians(115), 0, 0)),
	   
	    box : {
	        dimensions : new Cesium.Cartesian3(200, 200, 200),
	        material : Cesium.Color.BLUE
	    },
	    label : {
		    text :"友爱村",
		    fillColor:Cesium.Color.RED,
		    font : '12pt monospace',
		    outlineColor:Cesium.Color.RED,
		    style: Cesium.LabelStyle.FILL_AND_OUTLINE,
		    outlineWidth : 0,
		    verticalOrigin : Cesium.VerticalOrigin.BOTTOM,
		    pixelOffset : new Cesium.Cartesian2(45, -25)
		}
	    
	});
	
	
	
	siteEntitys.add({
	    name : 'Blue box',
	    position: Cesium.Cartesian3.fromDegrees(100.6868, 38.4322, 2290),
	    orientation : Cesium.Transforms.headingPitchRollQuaternion(Cesium.Cartesian3.fromDegrees(100.6868, 38.4322, 2290), new Cesium.HeadingPitchRoll(Cesium.Math.toRadians(115), 0, 0)),
	   
	    box : {
	        dimensions : new Cesium.Cartesian3(200, 200, 200),
	        material : Cesium.Color.BLUE
	    },
	    label : {
		    text :"土城村",
		    fillColor:Cesium.Color.RED,
		    font : '12pt monospace',
		    outlineColor:Cesium.Color.RED,
		    style: Cesium.LabelStyle.FILL_AND_OUTLINE,
		    outlineWidth : 0,
		    verticalOrigin : Cesium.VerticalOrigin.BOTTOM,
		    pixelOffset : new Cesium.Cartesian2(45, -25)
		}
	    
	});
	
	
	siteEntitys.add({
	    name : 'Blue box',
	    position: Cesium.Cartesian3.fromDegrees(100.6547, 38.4351, 2290),
	    orientation : Cesium.Transforms.headingPitchRollQuaternion(Cesium.Cartesian3.fromDegrees(100.6547, 38.4351, 2290), new Cesium.HeadingPitchRoll(Cesium.Math.toRadians(115), 0, 0)),
	   
	    box : {
	        dimensions : new Cesium.Cartesian3(200, 200, 200),
	        material : Cesium.Color.BLUE
	    },
	    label : {
		    text :"白庙村",
		    fillColor:Cesium.Color.RED,
		    font : '12pt monospace',
		    outlineColor:Cesium.Color.RED,
		    style: Cesium.LabelStyle.FILL_AND_OUTLINE,
		    outlineWidth : 0,
		    verticalOrigin : Cesium.VerticalOrigin.BOTTOM,
		    pixelOffset : new Cesium.Cartesian2(45, -25)
		}
	    
	});
	
	
	siteEntitys.add({
	    name : 'Blue box',
	    position: Cesium.Cartesian3.fromDegrees(100.7604, 38.4469, 2290),
	    orientation : Cesium.Transforms.headingPitchRollQuaternion(Cesium.Cartesian3.fromDegrees(100.7604, 38.4469, 2290), new Cesium.HeadingPitchRoll(Cesium.Math.toRadians(115), 0, 0)),
	   
	    box : {
	        dimensions : new Cesium.Cartesian3(200, 200, 200),
	        material : Cesium.Color.BLUE
	    },
	    label : {
		    text :"新庄村",
		    fillColor:Cesium.Color.RED,
		    font : '12pt monospace',
		    outlineColor:Cesium.Color.RED,
		    style: Cesium.LabelStyle.FILL_AND_OUTLINE,
		    outlineWidth : 0,
		    verticalOrigin : Cesium.VerticalOrigin.BOTTOM,
		    pixelOffset : new Cesium.Cartesian2(45, -25)
		}
	    
	});
	
	
	siteEntitys.add({
	    name : 'Blue box',
	    position: Cesium.Cartesian3.fromDegrees(100.7550, 38.4622,  2290),
	    orientation : Cesium.Transforms.headingPitchRollQuaternion(Cesium.Cartesian3.fromDegrees(100.7550, 38.4622, 2290), new Cesium.HeadingPitchRoll(Cesium.Math.toRadians(115), 0, 0)),
	   
	    box : {
	        dimensions : new Cesium.Cartesian3(200, 200, 200),
	        material : Cesium.Color.BLUE
	    },
	    label : {
		    text :"张满村",
		    fillColor:Cesium.Color.RED,
		    font : '12pt monospace',
		    outlineColor:Cesium.Color.RED,
		    style: Cesium.LabelStyle.FILL_AND_OUTLINE,
		    outlineWidth : 0,
		    verticalOrigin : Cesium.VerticalOrigin.BOTTOM,
		    pixelOffset : new Cesium.Cartesian2(45, -25)
		}
	});
	
	
	
	var czml = [{
	    "id" : "document",
	    "name" : "CZML Geometries: Polyline",
	    "version" : "1.0"
	},
	
	{  
		"id" : "cgerCorridor",
	    "name" : "Green corridor at height with mitered corners and outline",
	    "corridor" : {
	        "positions" : {
	            "cartographicDegrees" : [ 
	                100.6783, 38.4114, 0,
	                100.6998, 38.4342, 0,
	                100.7095, 38.4298, 0,
	                100.7346, 38.4354, 0,
	                100.7604, 38.4469, 0
	            ]
	        },
	        "height" : 2320,
	         "extrudedHeight" : 2290,
	        "width" : 50,
	        "cornerType": "BEVELED",
	        "material" : {
	            "solidColor" : {
	                "color" : {
	                    "rgba" : [0, 255,255, 255]
	                }
	            }
	        },
	        "outline" : true, // height must be set for outlines to display
	        "outlineColor" : {
	            "rgba" : [255, 255, 255, 255]
	        }
	    }
	},
	
	
	{  
		"id" : "dgerCorridor",
	    "name" : "Green corridor at height with mitered corners and outline",
	    "corridor" : {
	        "positions" : {
	            "cartographicDegrees" : [
	           
	                100.7180, 38.4665, 0,
	                
	                100.7550, 38.4622, 0
	            ]
	        },
	        "height" : 2320,
	         "extrudedHeight" : 2290,
	        "width" : 50,
	        "cornerType": "BEVELED",
	        "material" : {
	            "solidColor" : {
	                "color" : {
	                    "rgba" : [0, 255,255, 255]
	                }
	            }
	        },
	        "outline" : true, // height must be set for outlines to display
	        "outlineColor" : {
	            "rgba" : [255, 255, 255, 255]
	        }
	    }
	},
	
	
	{  
		"id" : "bgerCorridor",
	    "name" : "Green corridor at height with mitered corners and outline",
	    "corridor" : {
	        "positions" : {
	            "cartographicDegrees" : [
	          
	                100.6783, 38.4114, 0,
	                100.6998, 38.4342, 0,
	                100.7081, 38.4415, 0,
	                100.7180, 38.4665, 0,
	                100.7571, 38.4919, 0,
	                100.7399, 38.5109, 0
	            ]
	        },
	        "height" : 2320,
	         "extrudedHeight" : 2290,
	        "width" : 50,
	        "cornerType": "BEVELED",
	        "material" : {
	            "solidColor" : {
	                "color" : {
	                    "rgba" : [0, 255,255, 255]
	                }
	            }
	        },
	        "outline" : true, // height must be set for outlines to display
	        "outlineColor" : {
	            "rgba" : [255, 255, 255, 255]
	        }
	    }
	},
	
	
	{  
		"id" : "agerCorridor",
	    "name" : "Green corridor at height with mitered corners and outline",
	    "corridor" : {
	        "positions" : {
	            "cartographicDegrees" : [
	               100.6526, 38.3859, 0,
	               100.6783, 38.4114, 0,
	               100.7057, 38.4826, 0 
	            ]
	        },
	        "height" : 2320,
	         "extrudedHeight" : 2290,
	        "width" : 50,
	        "cornerType": "BEVELED",
	        "material" : {
	            "solidColor" : {
	                "color" : {
	                    "rgba" : [0, 255,255, 255]
	                }
	            }
	        },
	        "outline" : true, // height must be set for outlines to display
	        "outlineColor" : {
	            "rgba" : [255, 255, 255, 255]
	        }
	    }
	},
	
	{  
		"id" : "gerCorridor",
	    "name" : "Green corridor at height with mitered corners and outline",
	    "corridor" : {
	        "positions" : {
	            "cartographicDegrees" : [
	                100.6575, 38.4635, 0,
	                100.6507, 38.4951, 0,
	                 100.6401, 38.5016, 0,
	                 100.6351, 38.5028, 0
	            ]
	        },
	        "height" : 2320,
	         "extrudedHeight" : 2290,
	        "width" : 50,
	        "cornerType": "BEVELED",
	        "material" : {
	            "solidColor" : {
	                "color" : {
	                    "rgba" : [0, 255,255, 255]
	                }
	            }
	        },
	        "outline" : true, // height must be set for outlines to display
	        "outlineColor" : {
	            "rgba" : [255, 255, 255, 255]
	        }
	    }
	},{  
		"id" : "greenCorridor",
	    "name" : "Green corridor at height with mitered corners and outline",
	    "corridor" : {
	        "positions" : {
	            "cartographicDegrees" : [
	                100.6526, 38.3859, 0,
	                100.6575, 38.4635, 0,
	                100.6764, 38.5063, 0,
	                100.6772, 38.5351, 0,
	                100.6939, 38.5556, 0
	            ]
	        },
	        "height" : 2320,
	         "extrudedHeight" : 2290,
	        "width" : 50,
	        "cornerType": "BEVELED",
	        "material" : {
	            "solidColor" : {
	                "color" : {
	                    "rgba" : [0, 255,255, 255]
	                }
	            }
	        },
	        "outline" : true, // height must be set for outlines to display
	        "outlineColor" : {
	            "rgba" : [255, 255, 255, 255]
	        }
	    }
	}, {
	    "id" : "blueCorridor",
	    "name" : "Blue extruded corridor with beveled corners and outline",
	    "corridor" : {
	        "positions" : {
	            "cartographicDegrees" : [
	                  100.5101, 38.4770, 0,
	                  100.5043, 38.4667, 0,
	                  100.5043, 38.4667, 0
	            ]
	        },
	        "height" : 2320,
	        "extrudedHeight" : 2290,
	        "width" : 50,
	        "cornerType": "BEVELED",
	        "material" : {
	            "solidColor" : {
	                "color" : {
	                    "rgba" : [0, 0, 255, 255]
	                }
	            }
	        },
	        "outline" : true,
	        "outlineColor" : {
	            "rgba" : [255, 255, 255, 255]
	        }
	    }
	}];
	
	var dataSourcePromise = Cesium.CzmlDataSource.load(czml);
	viewer.dataSources.add(dataSourcePromise);
	viewer.zoomTo(dataSourcePromise);	
}

