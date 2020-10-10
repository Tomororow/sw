layui.use(['element'], function(){
	$ = layui.jquery;
  	element = layui.element(); 
  
  //导航的hover效果、二级菜单等功能，需要依赖element模块
  // larry-side-menu向左折叠
  	if($(window).width()<750){
		trun = 1;
	}else{
		trun = 0;
	}


	$('.larry-side-menu').click(function() {
	debugger
	var vityu = document.getElementById('iFramse').contentWindow.document.getElementById('EchartMain')
	var actiuy =  menuList.isCollapse;
	if(actiuy){
		menuList.menuLabel = '菜单隐藏';
		menuList.isCollapse = false;
		menuList.activeLeft = '210';
		if(vityu!=null){
			vityu.style.width = '830px';
			vityu.childNodes['0'].style.width = '830px';
			if(vityu.childNodes['0'].childNodes.length>0){
				vityu.childNodes['0'].childNodes['0'].style.width = '830px';
			}

		}
	}else{
		menuList.menuLabel = '菜单展开';
		menuList.isCollapse = true;
		menuList.activeLeft = '64';
		if(vityu!=null){
			vityu.style.width = '905px';
			vityu.childNodes['0'].style.width = '905px';
			if(vityu.childNodes['0'].childNodes.length>0){
				vityu.childNodes['0'].childNodes['0'].style.width = '905px';
			}

		}
	}
	/*if(trun){
		$('#table1').animate({width: 'show', opacity: 'show'}, 'normal',function(){});
		$('#site-demo-title').css("left","0px");

	}else{
		$('#table1').animate({width: 'hide', opacity: 'show'}, 'normal',function(){});
	}*/
 /* if(trun){
		$('.x-side').animate({left: '0px'},100).siblings('.x-main').animate({left: '210px'},100);
			trun=0;
		}else{
			$('.x-side').animate({left: '-210px'},100).siblings('.x-main').animate({left: '0px'},100);
			trun=1;
		}*/
});



  	//监听导航点击
  	element.on('nav(side)', function(elem){
    	title = elem.find('cite').text();
    	url = elem.find('a').attr('_href');
    	// alert(url);

    	for (var i = 0; i <$('.x-iframe').length; i++) {
    		if($('.x-iframe').eq(i).attr('src')==url){
    			element.tabChange('x-tab', i);
    			return;
    		}
    	};

    	res = element.tabAdd('x-tab', {
	        title: title//用于演示
	        ,content: '<iframe frameborder="0" src="'+url+'" class="x-iframe"></iframe>'
		    });


		element.tabChange('x-tab', $('.layui-tab-title li').length-1);

    	$('.layui-tab-title li').eq(0).find('i').remove();
  });
});


//顶部时间
function getTime(){
	var myDate = new Date();
	var myYear = myDate.getFullYear(); //获取完整的年份(4位,1970-????)
	var myMonth = myDate.getMonth()+1; //获取当前月份(0-11,0代表1月)
	var myToday = myDate.getDate(); //获取当前日(1-31)
	var myDay = myDate.getDay(); //获取当前星期X(0-6,0代表星期天)
	var myHour = myDate.getHours(); //获取当前小时数(0-23)
	var myMinute = myDate.getMinutes(); //获取当前分钟数(0-59)
	var mySecond = myDate.getSeconds(); //获取当前秒数(0-59)
	var week = ['星期日','星期一','星期二','星期三','星期四','星期五','星期六'];
	var nowTime;

	nowTime = myYear+'-'+fillZero(myMonth)+'-'+fillZero(myToday)+'&nbsp;&nbsp;'+fillZero(myHour)+':'+fillZero(myMinute)+':'+fillZero(mySecond);
	//console.log(nowTime);
	$('#time').html(nowTime);
};
function fillZero(str){
	var realNum;
	if(str<10){
		realNum	= '0'+str;
	}else{
		realNum	= str;
	}
	return realNum;
}
setInterval(getTime,1000);

