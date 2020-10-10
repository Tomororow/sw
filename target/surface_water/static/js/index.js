require([ "esri/map", "dojo/domReady!" ], function(Map) {
	// code to create the map and add a basemap will go here
	map = new Map("mapDiv", {
		center : [ 100.46, 38.93 ],
		zoom : 10,
		basemap : "streets"
	});
});