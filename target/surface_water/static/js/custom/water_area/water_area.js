/* 相对链接的基准URL */
var curWwwPath = window.document.location.href;
var pathName = window.document.location.pathname;
var pos = curWwwPath.indexOf(pathName);
var localhostPaht = curWwwPath.substring(0,pos);
var projectName = pathName.substring(0,pathName.substr(1).indexOf('/')+1);
var ctxPath = localhostPaht + projectName;
var picPath = localhostPaht;

var testId =null;
//当点击某一级树目录触发
function start(id,page,threeLevelPermission){
	testId = id;
	//alert(page);
	//将获取的id放到cook中
	setCookie("currentNodeId",id,1);
	//每次进来清除之前的查询结果
	$("#table_list").empty();
	$.ajax({
		url:ctxPath+"/sys_water_area/page",
		data: {id:id,page:page},
		type: "post",
		async: false,//非异步
		success: function(msg){
			//alert(JSON.stringify(msg) );
			var table = msg;
			
			for(var i=0;i<msg.length;i++){
				var currentTag = document.getElementById("table_list");
					var newTrTag = document.createElement("tr");
						var newTdTag1 = document.createElement("td");
							var newInputTag = document.createElement("input");
							newInputTag.setAttribute("type", "checkbox");
							newTdTag1.appendChild(newInputTag);
						var newTdTag2 = document.createElement("td");
							newTdTag2.innerHTML=msg[i].waterAreaCode;
						var newTdTag3 = document.createElement("td");
							newTdTag3.innerHTML=msg[i].waterAreaName;
						var newTdTag4 = document.createElement("td");
							newTdTag4.innerHTML=msg[i].waterAreaLevel;
						//var newTdTag5 = document.createElement("td");
						//	newTdTag5.innerHTML=msg[i].parentWaterareaId;
						var newTdTag6 = document.createElement("td");
							newTdTag6.innerHTML=msg[i].swaCreateTime;
						var newTdTag7 = document.createElement("td");
							newTdTag7.innerHTML=msg[i].swaEditTime;
						var newTdTag8 = document.createElement("td");
							newTdTag8.innerHTML=msg[i].swaRemark;
						var newTdTag9 = document.createElement("td");
							//var newATag = document.createElement("a");
								var sonid = JSON.stringify(msg[i].id);
								
							newTdTag9.innerHTML=showThreeLevelPermission(threeLevelPermission,sonid);
							
							
							
							newTrTag.appendChild(newTdTag1);
							newTrTag.appendChild(newTdTag2);
							newTrTag.appendChild(newTdTag3);
							newTrTag.appendChild(newTdTag4);
							//newTrTag.appendChild(newTdTag5);
							newTrTag.appendChild(newTdTag6);
							newTrTag.appendChild(newTdTag7);
							newTrTag.appendChild(newTdTag8);
							newTrTag.appendChild(newTdTag9);
						currentTag.appendChild(newTrTag);
			
			}
			
		}
	});
	
	 $.post(ctxPath+"/sys_water_area/page_nav").success(function (response) {
		// alert(JSON.stringify(response));
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
		        	//alert(JSON.stringify(page));
		        	var id = getCookie ("currentNodeId");
		        	start(id,page,threeLevelPermission);
		        	
		        }
		    };
		    $('#pageLimit').bootstrapPaginator(options);
		}).error(function (response) {
		    alert("列表请求出错");
		});
	
}

//添加区域弹窗
function addWaterArea(){
	alert("hahah");
	 var id = getCookie ("currentNodeId");
	// alert(id);
	 delCookie("currentNodeId");
	 if(id!=null&&id!=""){
		 layer.open({
		        type: 1
		        ,title: false //不显示标题栏
		        ,closeBtn: false
		        ,area: '300px;'
		        ,shade: 0.8
		        ,id: 'LAY_layuipro' //设定一个id，防止重复弹出
		        ,btn: ['考虑一下', '我已确定']
		        ,btnAlign: 'c'
		        ,moveType: 1 //拖拽模式，0或者1
		        ,content: '<div style="padding: 30px; line-height: 22px; background-color: #393D49; color: #fff; font-weight: 300;">'+
		      					'新增区域-->'+'所属区域id<br>'+id+
		        
		        				'<form action="" method="post">'+
		        					'<input hidden="hidden" type="text" name="parentWaterareaId" value="'+id+'" style="color:black;"/>'+
					       		 	'区域编码：<input type="text" name="waterAreaCode" value="" style="color:black;"/><br><br>'+
					        		'区域名称：<input type="text" name="waterAreaName" value="" style="color:black;"/><br><br>'+
					        		'备____注：<input type="text" name="swaRemark" value="" style="color:black;"/>'+
				        		'</form>'+
			       		 '</div>'
		        ,btn2: function(){
	       			document.forms[0].action=ctxPath+"/sys_water_area/add";
	       			document.forms[0].submit();
		        }
		  });
	 }else{
		 layer.open({
		        type: 1
		        ,title: false //不显示标题栏
		        ,closeBtn: false
		        ,area: '300px;'
		        ,shade: 0.8
		        ,id: 'LAY_layuipro' //设定一个id，防止重复弹出
		        ,btn: ['考虑一下', '我已确定']
		        ,btnAlign: 'c'
		        ,moveType: 1 //拖拽模式，0或者1
		        ,content: '<div style="padding: 30px; line-height: 22px; background-color: #393D49; color: #fff; font-weight: 300;">'+
		      					'新增区域-->'+'所建区域为最高级'+
		        				'<form action="" method="post">'+
					       		 	'区域编码：<input type="text" name="waterAreaCode" value="" style="color:black;"/><br><br>'+
					        		'区域名称：<input type="text" name="waterAreaName" value="" style="color:black;"/><br><br>'+
					        		'备____注：<input type="text" name="swaRemark" value="" style="color:black;"/>'+
				        		'</form>'+
			       		 '</div>'
		        ,btn2: function(){
	       			document.forms[0].action=ctxPath+"/sys_water_area/add";
	       			document.forms[0].submit();
		        }
		  });
		 
	 }
	  
 };
 
 
//编辑
	function doEdit(id){
		alert(id);
		var waterArea;
		alert(id+"222");
		//回显信息
		$.ajax({
			url:ctxPath+"/sys_water_area/ajax_findWaterArea",
			type: "post",
			data: {id:id},
			async: false,//非异步
			success: function(msg){
				alert(id+"222");
				waterArea=msg;
			}
		});
		layer.open({
	        type: 1
	        ,title: false //不显示标题栏
	        ,closeBtn: false
	        ,area: '300px;'
	        ,shade: 0.8
	        ,id: 'LAY_layuipro' //设定一个id，防止重复弹出
	        ,btn: ['考虑一下', '确定']
	        ,btnAlign: 'c'
	        ,moveType: 1 //拖拽模式，0或者1
	        ,content: '<div style="padding: 30px; line-height: 22px; background-color: #393D49; color: #fff; font-weight: 300;">'+
	      					'编辑-->'+
	        
	        				'<form  action="${ctx}/sys_water_area/edit" method="post">'+
	        					'<input hidden="hidden" type="text" name="id" value="'+waterArea.id+'" style="color:black;"/>'+
				       		 	'区域编码：<input type="text" name="waterAreaCode" value="'+waterArea.waterAreaCode+'" style="color:black;"/><br><br>'+
				        		'区域名称：<input type="text" name="waterAreaName" value="'+waterArea.waterAreaName+'" style="color:black;"/><br><br>'+
				        		'区域级别：<input type="text" name="waterAreaLevel" value="'+waterArea.waterAreaLevel+'" style="color:black;"/><br><br>'+
				        		'创建时间：<input type="text" name="swaCreateTime" value="'+waterArea.swaCreateTime+'" style="color:black;"/><br><br>'+
				        		'父级的ID：<input type="text" name="parentWaterareaId" value="'+waterArea.parentWaterareaId+'" style="color:black;"/><br><br>'+
				        		'备____注：<input type="text" name="swaRemark" value="'+waterArea.swaRemark+'" style="color:black;"/>'+
				        		
				        		'<input type="submit"  value="提交" style="color:black;"/>'+
			        		'</form>'+
		       		 '</div>'
	        ,btn2: function(){
	        	//document.getElementById("edit").action="${ctx}/sys_water_area/edit";
    			//document.forms[1].action="${ctx}/sys_water_area/edit";
    			//document.getElementById("edit").submit();
	        }
	  });
	}
	
	
	//删除
	function doDelete(id){
		alert(id);
		//var pid = "";
		$.ajax({
			url:ctxPath+"/sys_water_area/delete_byid",
			type: "post",
			data: {id:id},
			async: false,//非异步
			success: function(msg){
				history.go(0);
				//start(msg,1);
			}
		});
		
	}
 