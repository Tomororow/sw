	/* 相对链接的基准URL */
	var curWwwPath = window.document.location.href;
	var pathName = window.document.location.pathname;
	var pos = curWwwPath.indexOf(pathName);
	var localhostPaht = curWwwPath.substring(0,pos);
	var projectName = pathName.substring(0,pathName.substr(1).indexOf('/')+1);
	var ctxPath = localhostPaht + projectName;
	var picPath = localhostPaht;
	
	function start(id,page,level,threeLevelPermission){
		setCookie("permission_id",id);
		setCookie("permission_level",level);
		//每次进来清除之前的查询结果
		$("#table_list").empty();
		$.ajax({
			url:ctxPath+"/permission/page",
			data: {id:id,page:page},
			type: "post",
			async: false,//非异步
			success: function(msg){
				//渲染列表
				for(var i=0;i<msg.length;i++){
					var currentTag = document.getElementById("table_list");
					var newTrTag = document.createElement("tr");
						var newTdTag1 = document.createElement("td");
							var newInputTag2 = document.createElement("input");
							newInputTag2.setAttribute("type", "checkbox");
							newInputTag2.setAttribute("name", "selectedWaterSiteRow");
							newInputTag2.setAttribute("value", msg[i].id);
							newTdTag1.appendChild(newInputTag2);
							
						var newTdTag2 = document.createElement("td");
						    newTdTag2.innerHTML=msg[i].menuCode;	
						    
						var newTdTag3 = document.createElement("td");
						    newTdTag3.innerHTML=msg[i].menuName;
						 var newTdTag4 = document.createElement("td");
						    newTdTag4.innerHTML=msg[i].menuLevel;
						    
						var newTdTag5 = document.createElement("td");
						    newTdTag5.innerHTML=msg[i].menuOrder;
						    
					  var newTdTag6 = document.createElement("td");
						    newTdTag6.innerHTML=msg[i].menuHref;
							
					var newTdTag7 = document.createElement("td");
						//图片回显
						var newImgTag1 = document.createElement("img");
							newImgTag1.setAttribute("src", picPath+"/pic/"+msg[i].menuIcon);
							newImgTag1.setAttribute("id", msg[i].id);
							newImgTag1.setAttribute("width", "30");
							newImgTag1.setAttribute("height", "30");
							
							var id = JSON.stringify(msg[i].id);
							var menuIconImg ='\''+picPath+'/pic/'+msg[i].menuIcon+'\'';
							newImgTag1.setAttribute("onclick", 'showPhoto('+menuIconImg+')');
							newTdTag7.appendChild(newImgTag1);
								
				
						var newTdTag8 = document.createElement("td");
					    newTdTag8.innerHTML=msg[i].isMenu;
					    
					    var newTdTag9 = document.createElement("td");
					    newTdTag9.innerHTML=msg[i].smCreateTime;
					    
					    var newTdTag10 = document.createElement("td");
					    newTdTag10.innerHTML=msg[i].smEditTime;
					    
					    var newTdTag11 = document.createElement("td");
					    newTdTag11.innerHTML=msg[i].smRemark;
					    
						var newTdTag12 = document.createElement("td");
							var id = JSON.stringify(msg[i].id);
							newTdTag12.innerHTML = showThreeLevelPermission(threeLevelPermission,id);
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
							newTrTag.appendChild(newTdTag12);
						currentTag.appendChild(newTrTag);
					}
			}
		});
		
		$.post(ctxPath+"/permission/page_nav").success(function (response) {
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
			        	start(id,page,level,threeLevelPermission);
			        	
			        }
			    };
			    $('#pageLimit').bootstrapPaginator(options);
			}).error(function (response) {
			    alert("列表请求出错");
			});
		
	}
	
	
	
	
	



	//添加渠道弹窗
	function addPermission(){
		var pId = getCookie("permission_id");
		delCookie("permission_id");
		if(pId=="0"){//第一次进来没有最高级
			layer.open({
			 	 id: 'insert-permission-form'
		        ,type: 2 //此处以iframe举例
		        ,title: '添加权限'
		        ,area: ['636px', '352px']
		        ,shade: 0.8
		        ,maxmin: true
		        ,content: ctxPath+"/permission/add_page?parentMenuId="+""+"&&menuLevel="+0
		        ,btn: ['确定', '关闭'] //只是为了演示
		        ,yes: function(){
		        	//子页面提交
		        	insertSubmit();
		        	//弹出添加成功的窗口
		        	layer.confirm('添加成功', {
		        		  btn: ['确定'] //按钮
		        		}, function(){
		    			
		        		document.forms[0].action= ctxPath+"/permission/list?state=75";
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
			
		}else{
			var level = getCookie("permission_level");
			delCookie("permission_level");
			var level2 = 1+ parseInt(level);
			if(pId==null||pId==""){
				layer.alert('请选择添加位置！', {icon: 0});
			}else{
				layer.open({
				 	 id: 'insert-permission-form'
			        ,type: 2 //此处以iframe举例
			        ,title: '添加权限'
			        ,area: ['636px', '352px']
			        ,shade: 0.8
			        ,maxmin: true
			        ,content: ctxPath+"/permission/add_page?parentMenuId="+pId+"&&menuLevel="+level2
			        ,btn: ['确定', '关闭'] //只是为了演示
			        ,yes: function(){
			        	//子页面提交
			        	insertSubmit();
			        	//弹出添加成功的窗口
			        	layer.confirm('添加成功', {
			        		  btn: ['确定'] //按钮
			        		}, function(){
			    			
			        		document.forms[0].action= ctxPath+"/permission/list?state=75";
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
	 };

 	//添加权限提交
	function insertSubmit(){
		////alert("haha");
	   var frameId=document.getElementById("insert-permission-form").getElementsByTagName("iframe")[0].id;
	   $('#'+frameId)[0].contentWindow.mySubmit();
	}
	
	//权限编辑
	function doEdit(id){
		//var id = getCookie("permission_id");
		//delCookie("permission_id");
		//if(id==null||id==""){
		//	layer.alert('请选择编辑位置！', {icon: 0});
		//}else{
			layer.open({
			 	 id: 'edit-permission-form'
		        ,type: 2 //此处以iframe举例
		        ,title: '编辑权限'
		        ,area: ['636px', '352px']
		        ,shade: 0.8
		        ,maxmin: true
		        ,content: ctxPath+"/permission/edit_page?id="+id
		        ,btn: ['确定', '关闭'] //只是为了演示
		        ,yes: function(){
		        	//子页面提交
		        	editSubmit();
		        	//弹出添加成功的窗口
		        	
		        	layer.confirm('编辑成功', {
		        		  btn: ['确定'] //按钮
		        		}, function(){
		    			
		        		document.forms[0].action= ctxPath+"/permission/list?state=75";
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
		//}
	}
	
	//编辑权限提交
	function editSubmit(){
		////alert("haha");
	   var frameId=document.getElementById("edit-permission-form").getElementsByTagName("iframe")[0].id;
	   $('#'+frameId)[0].contentWindow.mySubmit();
	}
		
	//删除权限
	function doDelete(id){
		//var id = getCookie("permission_id");
		$.ajax({
			url:ctxPath+"/permission/delete",
			data: {id:id},
			type: "post",
			async: false,//非异步
			success: function(msg){
			   if(msg==0){
				   layer.alert('删除失败！', {icon: 0});
			   }else if(msg==1){
				   //layer.alert('删除成功！', {icon: 0});
				   
				   layer.confirm('删除成功', {
		        		  btn: ['确定'] //按钮
		        		}, function(){
		    			
		        		document.forms[0].action= ctxPath+"/permission/list?state=75";
			    		document.forms[0].submit();
		        		layer.msg('的确很重要', {icon: 1})
		        	});
				   
				   
			   }
			}
			
		});
	}
	
	
	//照片点击事件显示照片=====================
	function showPhoto(photoImg){
		layer.open({
			  type: 1,
			  title: false,
			  closeBtn: 0,
			  area: ['200px', '200px'],
			  skin: 'layui-layer-nobg', //没有背景色
			  shadeClose: true,
			  content: '<img src= '+photoImg+'  width="200" height="200" alt="渠道照片" />'
		});
	}
	
	
	