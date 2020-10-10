
//==============================
function showCanal(){
	
	$('.map_button1').css({"background":"pink"});
	$('.map_button2').css({"background":"black"});
	$('.map_button3').css({"background":"black"});
	
	var canalLength = $('.rightejectthis_canal').length;
	var reservoirLength = $('.rightejectthis_reservoir').length;
	var wellLength = $('.rightejectthis_well').length;
	if(canalLength==0&&reservoirLength==0&&wellLength==0){
		addCanal();
	}else if(canalLength>0){
		removeCanal();
		$('.map_button1').css({"background":"black"});
	}else if(reservoirLength>0){
		removeReservoir();
		setTimeout("addCanal()",1000);
	}else if(wellLength>0){
		removeWell();
		setTimeout("addCanal()",1000);
	}	
}

function showReservoir(){
	$('.map_button1').css({"background":"black"});
	$('.map_button2').css({"background":"pink"});
	$('.map_button3').css({"background":"black"});
	var canalLength = $('.rightejectthis_canal').length;
	var reservoirLength = $('.rightejectthis_reservoir').length;
	var wellLength = $('.rightejectthis_well').length;
	if(canalLength==0&&reservoirLength==0&&wellLength==0){
		addReservoir();
	}else if(reservoirLength>0){
		removeReservoir();
		$('.map_button2').css({"background":"black"});
	}else if(canalLength>0){
		removeCanal();
		setTimeout("addReservoir()",1000);
	}else if(wellLength>0){
		removeWell();
		setTimeout("addReservoir()",1000);
	}	
}

function showWell(){
	$('.map_button1').css({"background":"black"});
	$('.map_button2').css({"background":"black"});
	$('.map_button3').css({"background":"pink"});
	var canalLength = $('.rightejectthis_canal').length;
	var reservoirLength = $('.rightejectthis_reservoir').length;
	var wellLength = $('.rightejectthis_well').length;
	if(canalLength==0&&reservoirLength==0&&wellLength==0){
		addWell();
	}else if(wellLength>0){
		removeWell();
		$('.map_button3').css({"background":"black"});
	}else if(canalLength>0){
		removeCanal();
		setTimeout("addWell()",1000);
	}else if(reservoirLength>0){
		removeReservoir();
		setTimeout("addWell()",1000);
	}	
}


function addCanal(){
	$('#righteject_canal strong').addClass("rightejectthis_canal").next("div").animate({height: '+600px'}, "slow");
}
function removeCanal(){
	$('#righteject_canal strong').removeClass("rightejectthis_canal").next("div").animate({height: '-600px'}, "slow");
}

function addReservoir(){
	$('#righteject_reservoir strong').addClass("rightejectthis_reservoir").next("div").animate({height: '+600px'}, "slow");
}
function removeReservoir(){
	$('#righteject_reservoir strong').removeClass("rightejectthis_reservoir").next("div").animate({height: '-600px'}, "slow");
}

function addWell(){
	$('#righteject_well strong').addClass("rightejectthis_well").next("div").animate({height: '+600px'}, "slow");
}
function removeWell(){
	$('#righteject_well strong').removeClass("rightejectthis_well").next("div").animate({height: '-600px'}, "slow");
}
