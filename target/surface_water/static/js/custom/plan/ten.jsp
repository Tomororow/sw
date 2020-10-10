
<%@ page language="java" contentType="text/html; charset=utf-8" pageEncoding="utf-8"%>
<%@ include file="/WEB-INF/views/base.jsp"%>

function show(canalId,canalCode){
	////alset(canalId);
	////alset(canalCode);

	setCookie("currentRiverCode",canalCode);
	var tagState = getCookie("tagState");
		
	if(tagState==1||tagState==2|tagState==3||tagState==4||tagState==5||tagState==6||tagState==7||tagState==8||tagState==9||tagState==10||tagState==11||tagState==12){
		startForecast(canalCode,1);
		start(canalCode,1);
	
	}else{
		startForecast(canalCode,1);
	}
}


//渲染来水预测
function startForecast(canalCode,page){
	
	////alset("hahah");
	$("#table_thead").empty();
	$("#table_list0").empty();
	
	//表头
	var currentTag = document.getElementById("table_thead");
		var newTrTag = document.createElement("tr");
			var newTdTag1 = document.createElement("td");
				newTdTag1.setAttribute("class", "w5");
				var newInputTag = document.createElement("input");
					newInputTag.setAttribute("type", "checkbox");
					newInputTag.setAttribute("id", "selAll");
					newInputTag.setAttribute("onclick", "doSelectAll()");
					newTdTag1.appendChild(newInputTag);
			var newTdTag2 = document.createElement("td");
				newTdTag2.setAttribute("class", "w10");
				newTdTag2.innerHTML="表单编号";
			var newTdTag3 = document.createElement("td");
				newTdTag3.setAttribute("class", "w10");
				newTdTag3.innerHTML="河道";
			var newTdTag4 = document.createElement("td");	
				newTdTag4.setAttribute("class", "w10");
				newTdTag4.innerHTML="年份";
			var newTdTag5 = document.createElement("td");	
				newTdTag5.setAttribute("class", "w10");
				newTdTag5.innerHTML="创建时间";
			var newTdTag6 = document.createElement("td");	
				newTdTag6.setAttribute("class", "w10");
				newTdTag6.innerHTML="创建人";
			var newTdTag7 = document.createElement("td");	
				newTdTag7.setAttribute("class", "w10");
				newTdTag7.innerHTML="备注";
			var newTdTag8 = document.createElement("td");	
				newTdTag8.setAttribute("class", "w10");
				newTdTag8.innerHTML="操作";

		newTrTag.appendChild(newTdTag1);
		newTrTag.appendChild(newTdTag2);
		newTrTag.appendChild(newTdTag3);
		newTrTag.appendChild(newTdTag4);
		newTrTag.appendChild(newTdTag5);
		newTrTag.appendChild(newTdTag6);
		newTrTag.appendChild(newTdTag7);
		newTrTag.appendChild(newTdTag8);
	currentTag.appendChild(newTrTag);
	
	////alset(canalCode);
	$.ajax({
		url:"${ctx}/forecast/page",
		type: "post",
		data: {canalCode:canalCode,page:page},
		async: false,//非异步
		success: function(msg){
			//alset(JSON.stringify(msg));
			for(var i=0;i<msg.length;i++){
				var currentTag2 = document.getElementById("table_list0");
					var newTrTag1 = document.createElement("tr");
						var newTdTag11 = document.createElement("td");
							var newInputTag1 = document.createElement("input");
								newInputTag1.setAttribute("type", "checkbox");
								newInputTag1.setAttribute("name", "selectedRow");
								newInputTag1.setAttribute("value", msg[i].id);
								newTdTag11.appendChild(newInputTag1);
						var newTdTag22 = document.createElement("td");
							newTdTag22.innerHTML=msg[i].tableNo;	
						var newTdTag33 = document.createElement("td");
							newTdTag33.innerHTML=msg[i].canalCode;
						var newTdTag44 = document.createElement("td");
							newTdTag44.innerHTML=msg[i].year;
						var newTdTag55 = document.createElement("td");
							newTdTag55.innerHTML=msg[i].createTime;
						var newTdTag66 = document.createElement("td");
							newTdTag66.innerHTML=msg[i].createPeople;
						var newTdTag77 = document.createElement("td");
							newTdTag77.innerHTML=msg[i].remark;
						var newTdTag88 = document.createElement("td");
							var id = JSON.stringify(msg[i].id);
							newTdTag88.innerHTML="<a href='javascript\:doDetail("+id+")'>详情</a>|<a href='javascript\:doEdit("+id+")'>修改</a>|<a href='javascript\:doDelete("+id+")'>删除</a>";
						newTrTag1.appendChild(newTdTag11);
						newTrTag1.appendChild(newTdTag22);
						newTrTag1.appendChild(newTdTag33);
						newTrTag1.appendChild(newTdTag44);
						newTrTag1.appendChild(newTdTag55);
						newTrTag1.appendChild(newTdTag66);
						newTrTag1.appendChild(newTdTag77);
						newTrTag1.appendChild(newTdTag88);										
					currentTag2.appendChild(newTrTag1);
			}
		}
	});
	
	$.post("${ctx}/forecast/page_nav").success(function (response) {
				// //alset(555);
				 var pageNum = response.pageNum;
					var pages = response.pages;
					var size = response.size;
				    /* bootstrap分页样式设置 */
				    var options = {
				    	size:"small",
				    	alignment:"right",
				    	/* 当前页数 */
				        currentPage: pageNum,
				        /* 总页数  总条数除以每页条数  能整除总页数为商  不能整除商+1页  作为分页总页数  */
				        totalPages: pages,
				        /* 每页条数 */
				        numberOfPages:size,
				        /* bootstrap版本指定 */
				        bootstrapMajorVersion:3,
				        /* 样式设置 分页导航条 */
				        itemTexts: function (type, page, current) {
				            switch (type) {
				                case "first":
				                    return "首页";
				                case "prev":
				                    return "上一页";
				                case "next":
				                    return "下一页";
				                case "last":
				                    return "末页";
				                case "page":
				                    return page;
				            }
				        },
				        onPageClicked: function(event, originalEvent, type, page){
				        	////alset(JSON.stringify(page));
				        	//var id = getCookie ("currentNodeId");
				        	startForecast(canalCode,page);
				        	
				        }
				    };
				    $('#pageLimit0').bootstrapPaginator(options);
				}).error(function (response) {
				    //alset("列表请求出错");
				});
	
}

function start(riversCode,page){
	////alset("=======");
	////alset(riversCode);
	for(var i=1;i<13;i++){
		$("#table_list"+i+"_1").empty();
		$("#table_list"+i+"_2").empty();
		$("#table_list"+i+"_3").empty();
	}
	switch (getCookie("tagState")) {
	case '1':
		getTableList("${ctx}/ten/page","${ctx}/ten/page_nav",riversCode,1,1,10,page,"table_list1_1","pageLimit1_1");
		getTableList("${ctx}/ten/page","${ctx}/ten/page_nav",riversCode,1,11,20,page,"table_list1_2","pageLimit1_2");
		getTableList("${ctx}/ten/page","${ctx}/ten/page_nav",riversCode,1,21,31,page,"table_list1_3","pageLimit1_3");
		break;
	case '2':
		getTableList("${ctx}/ten/page","${ctx}/ten/page_nav",riversCode,2,1,10,page,"table_list2_1","pageLimit2_1");
		getTableList("${ctx}/ten/page","${ctx}/ten/page_nav",riversCode,2,11,20,page,"table_list2_2","pageLimit2_2");
		getTableList("${ctx}/ten/page","${ctx}/ten/page_nav",riversCode,2,21,28,page,"table_list2_3","pageLimit2_3");
		break;
	case '3':
		getTableList("${ctx}/ten/page","${ctx}/ten/page_nav",riversCode,3,1,10,page,"table_list3_1","pageLimit3_1");
		getTableList("${ctx}/ten/page","${ctx}/ten/page_nav",riversCode,3,11,20,page,"table_list3_2","pageLimit3_2");
		getTableList("${ctx}/ten/page","${ctx}/ten/page_nav",riversCode,3,21,31,page,"table_list3_3","pageLimit3_3");
		break;
	case '4':
		getTableList("${ctx}/ten/page","${ctx}/ten/page_nav",riversCode,4,1,10,page,"table_list4_1","pageLimit4_1");
		getTableList("${ctx}/ten/page","${ctx}/ten/page_nav",riversCode,4,11,20,page,"table_list4_2","pageLimit4_2");
		getTableList("${ctx}/ten/page","${ctx}/ten/page_nav",riversCode,4,21,30,page,"table_list4_3","pageLimit4_3");
		break;
		
	case '5':
		getTableList("${ctx}/ten/page","${ctx}/ten/page_nav",riversCode,5,1,10,page,"table_list5_1","pageLimit5_1");
		getTableList("${ctx}/ten/page","${ctx}/ten/page_nav",riversCode,5,11,20,page,"table_list5_2","pageLimit5_2");
		getTableList("${ctx}/ten/page","${ctx}/ten/page_nav",riversCode,5,21,31,page,"table_list5_3","pageLimit5_3");
		break;
	case '6':
		getTableList("${ctx}/ten/page","${ctx}/ten/page_nav",riversCode,6,1,10,page,"table_list6_1","pageLimit6_1");
		getTableList("${ctx}/ten/page","${ctx}/ten/page_nav",riversCode,6,11,20,page,"table_list6_2","pageLimit6_2");
		getTableList("${ctx}/ten/page","${ctx}/ten/page_nav",riversCode,6,21,30,page,"table_list6_3","pageLimit6_3");
		break;
	case '7':
		getTableList("${ctx}/ten/page","${ctx}/ten/page_nav",riversCode,7,1,10,page,"table_list7_1","pageLimit7_1");
		getTableList("${ctx}/ten/page","${ctx}/ten/page_nav",riversCode,7,11,20,page,"table_list7_2","pageLimit7_2");
		getTableList("${ctx}/ten/page","${ctx}/ten/page_nav",riversCode,7,21,31,page,"table_list7_3","pageLimit7_3");
		break;
	case '8':
		getTableList("${ctx}/ten/page","${ctx}/ten/page_nav",riversCode,8,1,10,page,"table_list8_1","pageLimit8_1");
		getTableList("${ctx}/ten/page","${ctx}/ten/page_nav",riversCode,8,11,20,page,"table_list8_2","pageLimit8_2");
		getTableList("${ctx}/ten/page","${ctx}/ten/page_nav",riversCode,8,21,31,page,"table_list8_3","pageLimit8_3");
		break;
	case '9':
		getTableList("${ctx}/ten/page","${ctx}/ten/page_nav",riversCode,9,1,10,page,"table_list9_1","pageLimit9_1");
		getTableList("${ctx}/ten/page","${ctx}/ten/page_nav",riversCode,9,11,20,page,"table_list9_2","pageLimit9_2");
		getTableList("${ctx}/ten/page","${ctx}/ten/page_nav",riversCode,9,21,30,page,"table_list9_3","pageLimit9_3");
		break;
	case '10':
		getTableList("${ctx}/ten/page","${ctx}/ten/page_nav",riversCode,10,1,10,page,"table_list10_1","pageLimit10_1");
		getTableList("${ctx}/ten/page","${ctx}/ten/page_nav",riversCode,10,11,20,page,"table_list10_2","pageLimit10_2");
		getTableList("${ctx}/ten/page","${ctx}/ten/page_nav",riversCode,10,21,31,page,"table_list10_3","pageLimit10_3");
		break;
	case '11':
		getTableList("${ctx}/ten/page","${ctx}/ten/page_nav",riversCode,11,1,10,page,"table_list11_1","pageLimit11_1");
		getTableList("${ctx}/ten/page","${ctx}/ten/page_nav",riversCode,11,11,20,page,"table_list11_2","pageLimit11_2");
		getTableList("${ctx}/ten/page","${ctx}/ten/page_nav",riversCode,11,21,30,page,"table_list11_3","pageLimit11_3");
		break;
	case '12':
		getTableList("${ctx}/ten/page","${ctx}/ten/page_nav",riversCode,12,1,10,page,"table_list12_1","pageLimit12_1");
		getTableList("${ctx}/ten/page","${ctx}/ten/page_nav",riversCode,12,11,20,page,"table_list12_2","pageLimit12_2");
		getTableList("${ctx}/ten/page","${ctx}/ten/page_nav",riversCode,12,21,30,page,"table_list12_3","pageLimit12_3");
		break;

	}
}

function forecast(){
	delCookie("tagState");
	setCookie("tagState", 0);
	var currentRiverCode = getCookie("currentRiverCode");
	start(currentRiverCode,1);
}


function one(){
	delCookie("tagState");
	setCookie("tagState", 1);
	var currentRiverCode = getCookie("currentRiverCode");
	start(currentRiverCode,1);
}
function two(){
	delCookie("tagState");
	setCookie("tagState", 2);
	var currentRiverCode = getCookie("currentRiverCode");
	start(currentRiverCode,1);
}
function three(){
	delCookie("tagState");
	setCookie("tagState", 3);
	var currentRiverCode = getCookie("currentRiverCode");
	start(currentRiverCode,1);
}
function four(){
	delCookie("tagState");
	setCookie("tagState", 4);
	var currentRiverCode = getCookie("currentRiverCode");
	start(currentRiverCode,1);
}
function five(){
	delCookie("tagState");
	setCookie("tagState", 5);
	var currentRiverCode = getCookie("currentRiverCode");
	start(currentRiverCode,1);
}
function six(){
	delCookie("tagState");
	setCookie("tagState", 6);
	var currentRiverCode = getCookie("currentRiverCode");
	start(currentRiverCode,1);
}
function seven(){
	delCookie("tagState");
	setCookie("tagState", 7);
	var currentRiverCode = getCookie("currentRiverCode");
	start(currentRiverCode,1);
}
function eight(){
	delCookie("tagState");
	setCookie("tagState", 8);
	var currentRiverCode = getCookie("currentRiverCode");
	start(currentRiverCode,1);
}
function nine(){
	delCookie("tagState");
	setCookie("tagState", 9);
	var currentRiverCode = getCookie("currentRiverCode");
	start(currentRiverCode,1);
}
function ten(){
	delCookie("tagState");
	setCookie("tagState", 10);
	var currentRiverCode = getCookie("currentRiverCode");
	start(currentRiverCode,1);
}
function eleven(){
	delCookie("tagState");
	setCookie("tagState", 11);
	var currentRiverCode = getCookie("currentRiverCode");
	start(currentRiverCode,1);
}
function twelve(){
	delCookie("tagState");
	setCookie("tagState", 12);
	var currentRiverCode = getCookie("currentRiverCode");
	start(currentRiverCode,1);
}


//ajax请求渲染table
function getTableList(pageUrl,pageNavUrl,riversCode,month,startDay,endDay,page,tableId,tableNavId){
	$.ajax({
		url:pageUrl,
		data: {riversCode:riversCode,month:month,startDay:startDay,endDay:endDay,page:page},
		type: "post",
		async: false,//非异步
		success: function(msg){
			////alset(JSON.stringify(msg));
			for(var i=0;i<msg.length;i++){
				var currentTag = document.getElementById(tableId);
				var newTrTag = document.createElement("tr");
					var newTdTag1 = document.createElement("td");
						//newTdTag1.setAttribute("class", "w45");
						newTdTag1.innerHTML=msg[i].no;
					var newTdTag2 = document.createElement("td");
						//newTdTag2.setAttribute("class", "w5");
						newTdTag2.innerHTML=msg[i].currentYear;
					var newTdTag3 = document.createElement("td");
						newTdTag3.innerHTML=msg[i].tenFlow;
					var newTdTag4 = document.createElement("td");
						newTdTag4.innerHTML=msg[i].descendingArrangement;
					var newTdTag5 = document.createElement("td");
						newTdTag5.innerHTML=msg[i].contrastYear;;
					var newTdTag6 = document.createElement("td");
						newTdTag6.innerHTML=msg[i].frequency;
					newTrTag.appendChild(newTdTag1);
					newTrTag.appendChild(newTdTag2);
					newTrTag.appendChild(newTdTag3);
					newTrTag.appendChild(newTdTag4);
					newTrTag.appendChild(newTdTag5);
					newTrTag.appendChild(newTdTag6);
					currentTag.appendChild(newTrTag);
			}
		}
	});
	 $.post(pageNavUrl).success(function (response) {
				 var pageNum = response.pageNum;
					var pages = response.pages;
					var size = response.size;
				    /* bootstrap分页样式设置 */
				    var options = {
				    	size:"small",
				    	alignment:"right",
				    	/* 当前页数 */
				        currentPage: pageNum,
				        /* 总页数  总条数除以每页条数  能整除总页数为商  不能整除商+1页  作为分页总页数  */
				        totalPages: pages,
				        /* 每页条数 */
				        numberOfPages:size,
				        /* bootstrap版本指定 */
				        bootstrapMajorVersion:3,
				        /* 样式设置 分页导航条 */
				        itemTexts: function (type, page, current) {
				            switch (type) {
				                case "first":
				                    return "首页";
				                case "prev":
				                    return "上一页";
				                case "next":
				                    return "下一页";
				                case "last":
				                    return "末页";
				                case "page":
				                    return page;
				            }
				        },
				        onPageClicked: function(event, originalEvent, type, page){
				        	start(riversCode,page);
				        }
				    };
				    $('#'+tableNavId).bootstrapPaginator(options);
				}).error(function (response) {
				    //alset("列表请求出错");
				});

}

//添加流量
function addFlow(month){
	////alset("hahah");
	//拿到当前河道编码
	var currentRiverCode = getCookie("currentRiverCode");
	layer.open({
		 	id: 'add-form'
	        ,type: 2 //此处以iframe举例
	        ,title: '你编辑的渠道为'
	        ,area: ['500px', '500px']
	        ,shade: 0.8
	        ,maxmin: true
	        ,content: '${ctx}/ten/add_single_month_flow_page?currentRiverCode='+currentRiverCode+'&&month='+month
	        ,btn: ['确定', '关闭'] //只是为了演示
	        ,yes: function(){
        	//子页面提交
        	addSubmit();
	        		//弹出添加成功的窗口
		        	//layer.confirm('你的渠道修改成功', {
		        	//	  btn: ['确定'] //按钮
		        	//	}, function(){
		        			
	        		//	document.forms[0].action="${ctx}/cal_canal_info/frush";
			    	//	document.forms[0].submit();
		        	//	layer.msg('的确很重要', {icon: 1});
		       // });
	        }
	        ,btn2: function(){
	          layer.closeAll();
	        }
	        
	        ,zIndex: layer.zIndex //重点1
	        ,success: function(layero){
	        	if(month==1){
	        		one(); 
	        	}else if(month==2){
	        		two();
	        	}else if(month==3){
	        		three();
	        	}else if(month==4){
	        		four();
	        	}else if(month==5){
	        		five();
	        	}else if(month==6){
	        		six();
	        	}else if(month==7){
	        		seven();
	        	}else if(month==8){
	        		eight();
	        	}else if(month==9){
	        		nine();
	        	}else if(month==10){
	        		ten();
	        	}else if(month==11){
	        		eleven();
	        	}else if(month==12){
	        		twelve();
	        	}
	          layer.setTop(layero); //重点2
	        }
	    });
	
}
function addSubmit(){
 //父页面控制子页面
  var frameId=document.getElementById("add-form").getElementsByTagName("iframe")[0].id;
  $('#'+frameId)[0].contentWindow.mySubmit();
 }

//打开添加来水预测页面
function addForecast(){
	var canalCode = getCookie("currentRiverCode");
	layer.open({
		 	id: 'add-forecast-form'
	        ,type: 2 //此处以iframe举例
	        ,title: '你预测的渠道为'+canalCode
	        ,area: ['1000px', '700px']
	        ,shade: 0.8
	        ,maxmin: true
	        ,content: '${ctx}/forecast/add_page?canalCode='+canalCode
	        ,btn: ['确定', '关闭'] //只是为了演示
	        ,yes: function(){
        	//子页面提交
        	addForecastSubmit();
        		//弹出添加成功的窗口
		        	layer.confirm('你的预测添加成功', {
		        		  btn: ['确定'] //按钮
		        		}, function(){
		        			
	        			document.forms[0].action="${ctx}/ten/refresh";
			    		document.forms[0].submit();
		        		layer.msg('的确很重要', {icon: 1})
		        });
	        }
	        ,btn2: function(){
	          layer.closeAll();
	        }
	        
	        ,zIndex: layer.zIndex //重点1
	        ,success: function(layero){
	         layer.setTop(layero); //重点2
	        }
	    });
	}
	function addForecastSubmit(){
	 //父页面控制子页面
	  var frameId=document.getElementById("add-forecast-form").getElementsByTagName("iframe")[0].id;
	  $('#'+frameId)[0].contentWindow.mySubmit();
	}


	//来水预测的详细界面
	function doDetail(id){
	
	
	}
	
	//来水预测的编辑界面
	function doEdit(id){
		alert(id);
		layer.open({
		 	id: 'edit-forecast-form'
	        ,type: 2 //此处以iframe举例
	        ,title: '你预测的渠道为'
	        ,area: ['1000px', '700px']
	        ,shade: 0.8
	        ,maxmin: true
	        ,content: '${ctx}/forecast/edit_page?id='+id
	        ,btn: ['确定', '关闭'] //只是为了演示
	        ,yes: function(){
        	//子页面提交
        	editForecastSubmit();
        		//弹出添加成功的窗口
		        	layer.confirm('你的预测添加成功', {
		        		  btn: ['确定'] //按钮
		        		}, function(){
		        			
	        			document.forms[0].action="${ctx}/ten/refresh";
			    		document.forms[0].submit();
		        		layer.msg('的确很重要', {icon: 1})
		        });
	        }
	        ,btn2: function(){
	          layer.closeAll();
	        }
	        
	        ,zIndex: layer.zIndex //重点1
	        ,success: function(layero){
	         layer.setTop(layero); //重点2
	        }
	    });
	}
	function editForecastSubmit(){
	 //父页面控制子页面
	  var frameId=document.getElementById("edit-forecast-form").getElementsByTagName("iframe")[0].id;
	  $('#'+frameId)[0].contentWindow.mySubmit();
	}
