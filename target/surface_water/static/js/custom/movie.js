$(document).ready(function(){
	
	setTimeout("flyToSanDiego()",1000);//
	$('#righteject strong').addClass("rightejectthis").next("div").animate({width: '+480px'}, "slow");
	
	$('#righteject strong').toggle(
			  function () {
				 $(this).addClass("rightejectthis").next("div").animate({width: '+480px'}, "100");
			  },
			  function () {
				$(this).removeClass("rightejectthis").next("div").animate({width: '-480px'}, "100");
			  }
			);
			/*下面这一句只是为了让标题中的文本垂直居中，如果你使用图片做tit或者你知道span的高度，你可以删除它，在.rightejecttit span写上margin-top:span高度的一半*/
			$('#righteject strong span').css("margin-top",-$('#righteject strong span').height()*0.5);
	

});