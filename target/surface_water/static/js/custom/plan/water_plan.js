/* 相对链接的基准URL */
var curWwwPath = window.document.location.href;
var pathName = window.document.location.pathname;
var pos = curWwwPath.indexOf(pathName);
var localhostPaht = curWwwPath.substring(0,pos);
var projectName = pathName.substring(0,pathName.substr(1).indexOf('/')+1);
var ctxPath = localhostPaht + projectName;
var picPath = localhostPaht;

function start(canalId,page){
	setCookie("canalId", canalId);
	//alert(canalId+"========start");
	$("#table_list").empty();
	$.ajax({
		url:ctxPath+"/plan/page",
		data: {canalId:canalId,page:page},
		type: "post",
		async: false,//非异步
		success: function(msg){
			//alert(JSON.stringify(msg));
			var table = msg;
				//动态建立渠道列表
					for(var i=0;i<msg.length;i++){
						var currentTag = document.getElementById("table_list");
							var newTrTag = document.createElement("tr");
								var newTdTag1 = document.createElement("td");
									var newInputTag = document.createElement("input");
									newInputTag.setAttribute("type", "checkbox");
									
									newTdTag1.appendChild(newInputTag);
								var newTdTag2 = document.createElement("td");
									newTdTag2.innerHTML=msg[i].startYear;
								var newTdTag3 = document.createElement("td");
									newTdTag3.innerHTML=msg[i].canalCode;
								
								var newTdTag4 = document.createElement("td");
									newTdTag4.innerHTML=msg[i].canalDecisionArea;
									
								var newTdTag5 = document.createElement("td");
									newTdTag5.innerHTML=msg[i].realityArea;
								var newTdTag6 = document.createElement("td");
									newTdTag6.innerHTML=msg[i].createPeople;
								//合计
								var newTdTag7 = document.createElement("td");
									newTdTag7.innerHTML=msg[i].createTime;
								var newTdTag8 = document.createElement("td");
									var canalCode = JSON.stringify(msg[i].canalCode);
									var startYear = msg[i].startYear;;
									newTdTag8.innerHTML="<a href='javascript\:doDetailAll("+canalCode+","+startYear+")'>查看详情</a>";	
								
									newTrTag.appendChild(newTdTag1);
									newTrTag.appendChild(newTdTag2);
									newTrTag.appendChild(newTdTag3);
									newTrTag.appendChild(newTdTag4);
									newTrTag.appendChild(newTdTag5);
									newTrTag.appendChild(newTdTag6);
									newTrTag.appendChild(newTdTag7);
									newTrTag.appendChild(newTdTag8);
									
									
								currentTag.appendChild(newTrTag);
			}
			
		}
	});
	
	 $.post(ctxPath+"/plan/page_nav").success(function (response) {
		// alert("11");
		 var pageNum = response.pageNum;
		 //alert("33");
			var pages = response.pages;
			//alert("44");
			var size = response.size;
			//alert("55");
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
		        	//alert("22");
		        	//alert(JSON.stringify(page));
		        	//var id = getCookie ("canalId");
		        	start(canalId,page);
		        	
		        }
		    };
		    $('#pageLimit').bootstrapPaginator(options);
		}).error(function (response) {
		    //alert("列表请求出错");
		});
}

//新增需水报表
function addWaterPlan(){
	var canalId = getCookie("canalId");
	//alert(canalId);
	delCookie("canalId");
	if(canalId==null||canalId==""){
		alert("请先选择渠道");
	}else{
		//打开添加窗口
		//alert("111");
		 layer.open({
			 	id: 'insert-water—plan-form'
		        ,type: 2 //此处以iframe举例
		        ,title: '【添加配水计划】'
		        ,area: ['637px', '573px']
		        ,shade: 0.8
		        ,maxmin: true
		        ,content: ctxPath+"/plan/add_page?canalId="+canalId
		        ,btn: ['确定', '关闭'] //只是为了演示
		        ,yes: function(){
		        	//子页面提交
		        	insertSubmit();
		        	layer.confirm('你的预测添加成功', {
		        		  btn: ['确定'] //按钮
		        		}, function(){
		        			
	        			document.forms[0].action=ctxPath+"/plan/list?state=33";
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
}

 function insertSubmit(){
	   var frameId=document.getElementById("insert-water—plan-form").getElementsByTagName("iframe")[0].id;
	   $('#'+frameId)[0].contentWindow.mySubmit();
  }

 //详细信息
 function doDetailAll(canalCode,startYear){
	 var index = layer.open({
		 	id: 'insert-water—plan-form'
	        ,type: 2 //此处以iframe举例
	        ,title: '【配水计划】'
	        ,area: ['637px', '573px']
	        ,shade: 0.8
	        ,maxmin: true
	        ,content: ctxPath+"/plan/detail_all_page?canalCode="+canalCode+"&&startYear="+startYear
	        ,btn: ['确定', '关闭'] //只是为了演示
	        ,yes: function(){
	        	//子页面提交
	        	insertSubmit();
	        	layer.confirm('你的预测添加成功', {
	        		  btn: ['确定'] //按钮
	        		}, function(){
	        			
     			document.forms[0].action=ctxPath+"/plan/list";
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
	 layer.full(index);
 }
