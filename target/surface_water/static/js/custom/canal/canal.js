
/* 相对链接的基准URL */
var curWwwPath = window.document.location.href;
var pathName = window.document.location.pathname;
var pos = curWwwPath.indexOf(pathName);
var localhostPaht = curWwwPath.substring(0,pos);
var projectName = pathName.substring(0,pathName.substr(1).indexOf('/')+1);
var ctxPath = localhostPaht + projectName;
var picPath = localhostPaht;



//添加渠道弹窗
function addCanal(){
	var canalId = getCookie("canalId");
	delCookie("canalId");
	if(canalId=="0"){//第一次进来没有最高级
		 layer.open({
		        type: 2 //此处以iframe举例
		        ,title: '选择新建内容'
		        ,area: ['300px', '100px']
		        ,shade: 0.8
		        ,maxmin: true
		        ,content: '<div style="padding: 50px; line-height: 22px; background-color: #393D49; color: #fff; font-weight: 300;">你知道吗？亲！<br>layer ≠ layui<br><br>layer只是作为Layui的一个弹层模块，由于其用户基数较大，所以常常会有人以为layui是layerui<br><br>layer虽然已被 Layui 收编为内置的弹层模块，但仍然会作为一个独立组件全力维护、升级。<br><br>我们此后的征途是星辰大海 ^_^</div>'
		        ,btn: ['新建渠道级别', '添加水管区级别'] //只是为了演示
		        ,btn1:function(){
		        	canal(canalId);
		        	//layer.closeAll();
		        }
		        ,btn2: function(){
		        	pWaterArea(canalId);
		        	//layer.closeAll();
		        }
		     
		    });
	}else{
		
		if(canalId==null||canalId==""){
			layer.alert('请选择添加位置！', {icon: 0});
		}else{
			 layer.open({
			        type: 2 //此处以iframe举例
			        ,title: '选择新建内容'
			        ,area: ['300px', '100px']
			        ,shade: 0.8
			        ,maxmin: true
			        ,content: '<div style="padding: 50px; line-height: 22px; background-color: #393D49; color: #fff; font-weight: 300;">你知道吗？亲！<br>layer ≠ layui<br><br>layer只是作为Layui的一个弹层模块，由于其用户基数较大，所以常常会有人以为layui是layerui<br><br>layer虽然已被 Layui 收编为内置的弹层模块，但仍然会作为一个独立组件全力维护、升级。<br><br>我们此后的征途是星辰大海 ^_^</div>'
			        ,btn: ['新建渠道级别', '添加水管区级别'] //只是为了演示
			        ,btn1:function(){
			        	canal(canalId);
			        	//layer.closeAll();
			        }
			        ,btn2: function(){
			        	pWaterArea(canalId);
			        	//layer.closeAll();
			        }
			     
			    });
		}
		
	}
}



	function canal(canalId){
		 if(canalId!=null&&canalId!=""){
			 layer.open({
				 	id: 'insert-form'
			        ,type: 2 //此处以iframe举例
			        ,title: '【添加渠道】'
			        ,area: ['700px', '700px']
			        ,shade: 0.8
			        ,maxmin: true
			       ,content: ctxPath+"/cal_canal_info/add_canal_page?id="+canalId
			        ,btn: ['确定', '关闭'] //只是为了演示
			        ,yes: function(){
			        	//子页面提交
			        	insertSubmitCanal();
			        	 layer.confirm('你的渠道已经添加成功', {
			   	  		  btn: ['确定'] //按钮
			   	  		}, function(){
			   	  			
			   	  			document.forms[0].action=ctxPath+"/cal_canal_info/list?state=76";
			   		    	document.forms[0].submit();
			   		    	
			   	  		  layer.msg('的确很重要', {icon: 1});
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
	  };
	  //获取添加子页面的提交方法
	  function insertSubmitCanal(){
		   var frameId=document.getElementById("insert-form").getElementsByTagName("iframe")[0].id;
		   $('#'+frameId)[0].contentWindow.mySubmit();
	  }
	  
	  function pWaterArea(canalId){
			 if(canalId!=null&&canalId!=""){
				 layer.open({
					 	id: 'insert-form'
				        ,type: 2 //此处以iframe举例
				        ,title: '【添加水管区域】'
				        ,area: ['692px', '456px']
				        ,shade: 0.8
				        ,maxmin: true
				       ,content: ctxPath+"/cal_canal_info/add_canal_pwaterarea_page?id="+canalId
				        ,btn: ['确定', '关闭'] //只是为了演示
				        ,yes: function(){
				        	//子页面提交
				        	insertSubmitArea();
				        	 layer.confirm('你的渠道已经添加成功', {
				   	  		  btn: ['确定'] //按钮
				   	  		}, function(){
				   	  			
				   	  			document.forms[0].action=ctxPath+"/cal_canal_info/list?state=76";
				   		    	document.forms[0].submit();
				   		    	
				   	  		  layer.msg('的确很重要', {icon: 1});
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
		  };
		  //获取添加子页面的提交方法
		  function insertSubmitArea(){
			   var frameId=document.getElementById("insert-form").getElementsByTagName("iframe")[0].id;
			   $('#'+frameId)[0].contentWindow.mySubmit();
		  }
	  
	  
	  
	//编辑渠道
	  
	//渠道编辑提交===================================
		function doEdit(id){
			layer.open({
			 	id: 'edit-form'
		        ,type: 2 //此处以iframe举例
		        ,title: '【编辑渠道】'
		        ,area: ['1000px', '700px']
		        ,shade: 0.8
		        ,maxmin: true
		        ,content: ctxPath+"/cal_canal_info/edit_page?id="+id
		        ,btn: ['确定', '关闭'] //只是为了演示
		        ,yes: function(){
	        	//子页面提交
	        	editSubmit();
		        		//弹出添加成功的窗口
			        	layer.confirm('你的渠道修改成功', {
			        		  btn: ['确定'] //按钮
			        		}, function(){
			        			
		        			document.forms[0].action=ctxPath+"/cal_canal_info/frush";
				    		document.forms[0].submit();
			        			
			        		  layer.msg('的确很重要', {icon: 1});
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
		
		
		/**+
		id:点击树目录所触发的id
		page：分页的起始页
		table：相对路劲
		tab：所对应的标签
		*/
		//当点击某一级树目录触发
		function start(id,page,threeLevelPermission){
			//alert(page);
			//将获取的id放到cook中
			setCookie("canalId",id);
			//每次进来清除之前的查询结果
			$("#table_list").empty();
			$("#table_photo_list").empty();
			$("#table_building_list").empty();
			$("#table_sluice_list").empty();
			//alert(555);
			//alert(33333);
			switch (getCookie("tagState")) {
			case '0':
				$.ajax({
					url:ctxPath+"/cal_canal_info/page",
					data: {id:id,page:page},
					type: "post",
					async: false,//非异步
					success: function(msg){
						//alert(JSON.stringify(msg) );
						var table = msg;
							//动态建立渠道列表
								for(var i=0;i<msg.length;i++){
									var currentTag = document.getElementById("table_list");
										var newTrTag = document.createElement("tr");
											var newTdTag1 = document.createElement("td");
												var newInputTag = document.createElement("input");
												newInputTag.setAttribute("type", "checkbox");
												
												newTdTag1.appendChild(newInputTag);
											/*var newTdTag2 = document.createElement("td");
												newTdTag2.innerHTML=msg[i].sysareaId;
											var newTdTag3 = document.createElement("td");
												newTdTag3.innerHTML=msg[i].syswaterareaId;*/
											var newTdTag4 = document.createElement("td");
												newTdTag4.innerHTML=msg[i].sysareaCode;
											//var newTdTag5 = document.createElement("td");
											//	newTdTag5.innerHTML=msg[i].parentWaterareaId;
											var newTdTag6 = document.createElement("td");
												newTdTag6.innerHTML=msg[i].syswaterareaCode;
											var newTdTag7 = document.createElement("td");
												newTdTag7.innerHTML=msg[i].canalCode;
											var newTdTag8 = document.createElement("td");
												newTdTag8.innerHTML=msg[i].canalName;
											var newTdTag9 = document.createElement("td");
												newTdTag9.innerHTML=msg[i].canalAddr;	
												
											var newTdTag10 = document.createElement("td");
												newTdTag10.innerHTML=msg[i].cciRemark;	
											var newTdTag11 = document.createElement("td");
													var sonid = JSON.stringify(msg[i].id);
													
													var innerHTML = showThreeLevelPermission(threeLevelPermission,sonid);
													
												newTdTag11.innerHTML=innerHTML;
												newTrTag.appendChild(newTdTag1);
												/*newTrTag.appendChild(newTdTag2);
												newTrTag.appendChild(newTdTag3);*/
												newTrTag.appendChild(newTdTag4);
												//newTrTag.appendChild(newTdTag5);
												newTrTag.appendChild(newTdTag6);
												newTrTag.appendChild(newTdTag7);
												newTrTag.appendChild(newTdTag8);
												newTrTag.appendChild(newTdTag9);
												newTrTag.appendChild(newTdTag10);
												newTrTag.appendChild(newTdTag11);
											currentTag.appendChild(newTrTag);
								}
						
					}
				});
				
				 $.post(ctxPath+"/cal_canal_info/page_nav").success(function (response) {
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
					        	//var id = getCookie ("canalId");
					        	start(id,page,threeLevelPermission);
					        	
					        }
					    };
					    $('#pageLimit').bootstrapPaginator(options);
					}).error(function (response) {
					   // alert("列表请求出错");
					});
				
				break;
				
			case '1':
				$.ajax({
					url:ctxPath+"/cal_canal_info/photo_page",
					data: {id:id,page:page},
					type: "post",
					async: false,//非异步
					success: function(msg){
						//alert(JSON.stringify(msg) );
						var table = msg;
							//动态建立渠道列表
								for(var i=0;i<msg.length;i++){
									var currentTag = document.getElementById("table_photo_list");
										var newTrTag = document.createElement("tr");
											var newTdTag1 = document.createElement("td");
												var newInputTag = document.createElement("input");
												newInputTag.setAttribute("type", "checkbox");
												newInputTag.setAttribute("name", "selectedPhotoRow");
												newInputTag.setAttribute("value", msg[i].id);
												newTdTag1.appendChild(newInputTag);
												
											var newTdTag2 = document.createElement("td");
												newTdTag2.innerHTML=msg[i].canalId;
												
											var newTdTag3 = document.createElement("td");
												//图片回显
												var newImgTag = document.createElement("img");
													newImgTag.setAttribute("src", picPath+"/pic/"+msg[i].canalPhotoimg);
													newImgTag.setAttribute("id", msg[i].id);
													newImgTag.setAttribute("width", "50");
													newImgTag.setAttribute("height", "50");
													
													var id = JSON.stringify(msg[i].id);
													var canalPhotoimg ="\""+picPath+"/pic/"+msg[i].canalPhotoimg+"\"";
													//alert(canalPhotoimg);
													newImgTag.setAttribute("onclick", "showPhoto("+id+","+canalPhotoimg+")");
													newTdTag3.appendChild(newImgTag);
													
												
												
											var newTdTag4 = document.createElement("td");
												newTdTag4.innerHTML=msg[i].ccpRemark;
											var newTdTag5 = document.createElement("td");
													var sonid = JSON.stringify(msg[i].id);
													
													
												newTdTag5.innerHTML=showThreeLevelPermissionOfCanalPhoto(threeLevelPermission,sonid);
												newTrTag.appendChild(newTdTag1);
												newTrTag.appendChild(newTdTag2);
												newTrTag.appendChild(newTdTag3);
												newTrTag.appendChild(newTdTag4);
												newTrTag.appendChild(newTdTag5);
											currentTag.appendChild(newTrTag);
								}
						
					}
				});
				$.post(ctxPath+"/cal_canal_info/photo_page_nav").success(function (response) {
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
					        	//var id = getCookie ("canalId");
					        	start(id,page,threeLevelPermission);
					        	
					        }
					    };
					    $('#pageLimit2').bootstrapPaginator(options);
					}).error(function (response) {
					    alert("列表请求出错");
					});
				
				 break;
			case '2':
				$.ajax({
					url:ctxPath+"/cal_canal_info/sluice_page",
					data: {id:id,page:page},
					type: "post",
					async: false,//非异步
					success: function(msg){
						//alert(JSON.stringify(msg) );
						var table = msg;
						//动态建立渠道列表
							for(var i=0;i<msg.length;i++){
								var currentTag = document.getElementById("table_sluice_list");
									var newTrTag = document.createElement("tr");
										var newTdTag1 = document.createElement("td");
											var newInputTag = document.createElement("input");
											newInputTag.setAttribute("type", "checkbox");
											newInputTag.setAttribute("name", "selectedSluiceRow");
											newInputTag.setAttribute("value", msg[i].id);
											newTdTag1.appendChild(newInputTag);
											
										var newTdTag2 = document.createElement("td");
										    newTdTag2.innerHTML=msg[i].canalId;	
										    
										var newTdTag3 = document.createElement("td");
										    newTdTag3.innerHTML=msg[i].sluiceCode;	
											
										var newTdTag4 = document.createElement("td");
											//图片回显
											var newImgTag = document.createElement("img");
												newImgTag.setAttribute("src", "${picPath}/pic/"+msg[i].sluicePhoto);
												newImgTag.setAttribute("id", msg[i].id);
												newImgTag.setAttribute("width", "50");
												newImgTag.setAttribute("height", "50");
												
												var id = JSON.stringify(msg[i].id);
												var canalSluiceImg ="\"${picPath}/pic/"+msg[i].sluicePhoto+"\"";
												//alert(canalBuildingImg);
												newImgTag.setAttribute("onclick", "showPhoto("+id+","+canalSluiceImg+")");
												newTdTag4.appendChild(newImgTag);
										var newTdTag5 = document.createElement("td");
											newTdTag5.innerHTML=msg[i].sluicePhotoNo;
											
										var newTdTag6 = document.createElement("td");
											newTdTag6.innerHTML=msg[i].sluiceType;	
											
										
										var newTdTag7 = document.createElement("td");
											newTdTag7.innerHTML=msg[i].sluiceBuildTime;
										var newTdTag8 = document.createElement("td");
											newTdTag8.innerHTML=msg[i].sluiceRepairTime;
										
											
										var newTdTag9 = document.createElement("td");
											newTdTag9.innerHTML=msg[i].ccsRemark;
											
										var newTdTag10 = document.createElement("td");
												var id = JSON.stringify(msg[i].id);
											newTdTag10.innerHTML=showThreeLevelPermissionOfCanalSluice(threeLevelPermission,id);
											newTrTag.appendChild(newTdTag1);
											newTrTag.appendChild(newTdTag2);
											newTrTag.appendChild(newTdTag3);
											newTrTag.appendChild(newTdTag4);
											newTrTag.appendChild(newTdTag5);
											newTrTag.appendChild(newTdTag6);
											newTrTag.appendChild(newTdTag7);
											newTrTag.appendChild(newTdTag8);										
											newTrTag.appendChild(newTdTag9);
											newTrTag.appendChild(newTdTag10);
										currentTag.appendChild(newTrTag);
							}
						
					}
				});
				
				 $.post(ctxPath+"/cal_canal_info/sluice_page_nav").success(function (response) {
					// alert(555);
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
					        	//var id = getCookie ("canalId");
					        	start(id,page,threeLevelPermission);
					        	
					        }
					    };
					    $('#pageLimit3').bootstrapPaginator(options);
					}).error(function (response) {
					    alert("列表请求出错");
					});
				break;
			case '3':
				//alert(44444);
				$.ajax({
					url:ctxPath+"/cal_canal_info/building_page",
					data: {id:id,page:page},
					type: "post",
					async: false,//非异步
					success: function(msg){
						//alert(JSON.stringify(msg) );
						var table = msg;
						//动态建立渠道列表
							for(var i=0;i<msg.length;i++){
								//alert(i);
								var currentTag = document.getElementById("table_building_list");
									var newTrTag = document.createElement("tr");
										var newTdTag1 = document.createElement("td");
											var newInputTag = document.createElement("input");
											newInputTag.setAttribute("type", "checkbox");
											newInputTag.setAttribute("name", "selectedBuildingRow");
											newInputTag.setAttribute("value", msg[i].id);
											newTdTag1.appendChild(newInputTag);
											
										var newTdTag2 = document.createElement("td");
										    newTdTag2.innerHTML=msg[i].canalId;	
										    
										var newTdTag3 = document.createElement("td");
										    newTdTag3.innerHTML=msg[i].buildingCode;	
											
										var newTdTag4 = document.createElement("td");
											//图片回显
											var newImgTag = document.createElement("img");
												newImgTag.setAttribute("src", "${picPath}/pic/"+msg[i].buildingPhoto);
												newImgTag.setAttribute("id", msg[i].id);
												newImgTag.setAttribute("width", "50");
												newImgTag.setAttribute("height", "50");
												
												var id = JSON.stringify(msg[i].id);
												var canalBuildingImg ="\"${picPath}/pic/"+msg[i].buildingPhoto+"\"";
												//alert(canalBuildingImg);
												newImgTag.setAttribute("onclick", "showPhoto("+id+","+canalBuildingImg+")");
												newTdTag4.appendChild(newImgTag);
										var newTdTag5 = document.createElement("td");
											newTdTag5.innerHTML=msg[i].buildingPhotoNo;
											
										var newTdTag6 = document.createElement("td");
											newTdTag6.innerHTML=msg[i].buildingName;	
											
										var newTdTag7 = document.createElement("td");
											newTdTag7.innerHTML=msg[i].buildingType;
										var newTdTag8 = document.createElement("td");
											newTdTag8.innerHTML=msg[i].buildingBuildTime;
										var newTdTag9 = document.createElement("td");
											newTdTag9.innerHTML=msg[i].buildingRepairTime;
										
											
										var newTdTag10 = document.createElement("td");
											newTdTag10.innerHTML=msg[i].ccbRemark;
											
										var newTdTag11 = document.createElement("td");
												var sonid = JSON.stringify(msg[i].id);
											newTdTag11.innerHTML=showThreeLevelPermissionOfCanalBuilding(threeLevelPermission,id)
											newTrTag.appendChild(newTdTag1);
											newTrTag.appendChild(newTdTag2);
											newTrTag.appendChild(newTdTag3);
											newTrTag.appendChild(newTdTag4);
											newTrTag.appendChild(newTdTag5);
											newTrTag.appendChild(newTdTag6);
											newTrTag.appendChild(newTdTag7);
											newTrTag.appendChild(newTdTag8);										
											newTrTag.appendChild(newTdTag9);
											newTrTag.appendChild(newTdTag10);
											newTrTag.appendChild(newTdTag11);
										currentTag.appendChild(newTrTag);
							}
						
					}
				});
				
				 $.post(ctxPath+"/cal_canal_info/building_page_nav").success(function (response) {
					// alert(555);
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
					        	//var id = getCookie ("canalId");
					        	start(id,page,threeLevelPermission);
					        	
					        }
					    };
					    $('#pageLimit4').bootstrapPaginator(options);
					}).error(function (response) {
					    alert("列表请求出错");
					});
				break;
			}
		}
		
		
		
		 
		 
		
		//照片点击事件显示照片=====================
		function showPhoto(a,canalPhotoimg){
			//alert(a);
			layer.open({
				  type: 1,
				  title: false,
				  closeBtn: 0,
				  area: ['900px', '600px'],
				  skin: 'layui-layer-nobg', //没有背景色
				  shadeClose: true,
				  content: '<img src= '+canalPhotoimg+'  width="900" height="600" alt="渠道照片" />'
			});
		}

		
		
		
		
		
		 function editSubmit(){
			 	alert("任伍伍11111111111");
			  //父页面控制子页面
			   var frameId=document.getElementById("edit-form").getElementsByTagName("iframe")[0].id;
			   $('#'+frameId)[0].contentWindow.mySubmit2();
		  }
		 
		//删除
		function doDelete(id){
			alert(id);
			//var pid = "";
			$.ajax({
				url:ctxPath+"/cal_canal_info/delete_byid",
				type: "post",
				data: {id:id},
				async: false,//非异步
				success: function(msg){
					history.go(0);
					//start(msg,1);
				}
			});
		}
  
	  
		/*//========显示渠道管理页===========
		function showCanalPage(){
			//alert();
			//设置标签状态值为0
			delCookie("tagState");
			setCookie("tagState", 0);
			start(null,1,getCookie("threeLevelPermission"));
			//tagState=0;
			//alert("渠道");
			
		}*/
		
		//========显示照片页===============
		function showPhotoPage(){
			//设置标签状态值为1
			delCookie("tagState");
			setCookie("tagState", 1);
			//tagState=1;
			//alert("照片");
			start(canalId,1,getCookie("threeLevelPermission"));
			//alert("asdfasdf");
		}
		
	//========显示照片页===============
		function showSluicePage(){
			//delCookie("canalId");
			//设置标签状态值为1
			delCookie("tagState");
			setCookie("tagState", 2);
			//tagState=1;
			//alert("照片");
			start(canalId,1,getCookie("threeLevelPermission"));
			//alert("asdfasdf");
		}
		/*		//=======显示渠道建筑物页==========
		function showBuildingPage(){
			//alert("12341234");
			//设置标签状态值为4
			delCookie("tagState");
			setCookie("tagState", 3);
			start(canalId,1,getCookie("threeLevelPermission"));
		}	*/