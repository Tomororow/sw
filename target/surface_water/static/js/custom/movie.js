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
			/*������һ��ֻ��Ϊ���ñ����е��ı���ֱ���У������ʹ��ͼƬ��tit������֪��span�ĸ߶ȣ������ɾ��������.rightejecttit spanд��margin-top:span�߶ȵ�һ��*/
			$('#righteject strong span').css("margin-top",-$('#righteject strong span').height()*0.5);
	

});