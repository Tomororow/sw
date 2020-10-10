/* 相对链接的基准URL */
	var curWwwPath = window.document.location.href;
	var pathName = window.document.location.pathname;
	var pos = curWwwPath.indexOf(pathName);
	var localhostPaht = curWwwPath.substring(0,pos);
	var projectName = pathName.substring(0,pathName.substr(1).indexOf('/')+1);
	var ctxPath = localhostPaht + projectName;
	var picPath = localhostPaht;
	
	/**+
	id:点击树目录所触发的id
	page：分页的起始页
	table：相对路劲
	tab：所对应的标签
	*/
	//当点击某一级树目录触发
	function start(page,threeLevelPermission){
		//每次进来清除之前的查询结果
		$("#table_list").empty();
			$.ajax({
				url:ctxPath+"/role/page",
				type: "post",
				data: {page:page},
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
										var newTdTag2 = document.createElement("td");
											newTdTag2.innerHTML=msg[i].roleCode;
										var newTdTag3 = document.createElement("td");
											newTdTag3.innerHTML=msg[i].roleName;
										var newTdTag4 = document.createElement("td");
											newTdTag4.innerHTML=msg[i].srCreateTime;
										var newTdTag5 = document.createElement("td");
											newTdTag5.innerHTML=msg[i].srEditTime;
										var newTdTag6 = document.createElement("td");
											newTdTag6.innerHTML=msg[i].srRemark;
										var newTdTag7 = document.createElement("td");
												var sonid = JSON.stringify(msg[i].id);
												newTdTag7.innerHTML=showThreeLevelPermission(threeLevelPermission,sonid);
											newTrTag.appendChild(newTdTag1);
											newTrTag.appendChild(newTdTag2);
											newTrTag.appendChild(newTdTag3);
											newTrTag.appendChild(newTdTag4);
											newTrTag.appendChild(newTdTag5);
											newTrTag.appendChild(newTdTag6);
											newTrTag.appendChild(newTdTag7);
										currentTag.appendChild(newTrTag);
							}
					
				}
			});
			
			$.post(ctxPath+"/role/page_nav").success(function (response) {
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
			        	start(page,threeLevelPermission);
			        }
			    };
			    $('#pageLimit').bootstrapPaginator(options);
			}).error(function (response) {
			  //  alert("列表请求出错");
			});
	}
	
	//添加角色弹窗
	 function addRole(){
		 layer.open({
		 	 id: 'insert-role-form'
	        ,type: 2 //此处以iframe举例
	        ,title: '添加用户'
	        ,area: ['420px', '700px']
	        ,shade: 0.8
	        ,maxmin: true
	        ,content: ctxPath+"/role/add_page"
	        ,btn: ['确定', '关闭'] //只是为了演示
	        ,yes: function(){
	        	//子页面提交
	        	insertSubmit();
	        	//弹出添加成功的窗口
	        	layer.confirm('添加成功', {
	        		  btn: ['确定'] //按钮
	        		}, function(){
        			document.forms[0].action = ctxPath+"/role/list?state=73";
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
	  };
	  //获取添加子页面的提交方法
	  function insertSubmit(){
		   var frameId=document.getElementById("insert-role-form").getElementsByTagName("iframe")[0].id;
		   $('#'+frameId)[0].contentWindow.mySubmit();
	  }
	  

	  //角色编辑提交
	  function doEdit(id){
		layer.open({
		 	id: 'edit-form'
	        ,type: 2 //此处以iframe举例
	        ,title: '角色编辑'
	        ,area: ['420px', '700px']
	        ,shade: 0.8
	        ,maxmin: true
	        ,content: ctxPath+"/role/edit_page?id="+id
	        ,btn: ['确定', '关闭'] //只是为了演示
	        ,yes: function(){
        	//子页面提交
        	editSubmit();
	        		//弹出添加成功的窗口
		        	layer.confirm('编辑成功', {
		        		  btn: ['确定'] //按钮
		        		}, function(){
	        			document.forms[0].action=ctxPath+"/role/list?state=73";
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
		
	  function editSubmit(){
		  //父页面控制子页面
		  var frameId=document.getElementById("edit-form").getElementsByTagName("iframe")[0].id;
		  $('#'+frameId)[0].contentWindow.mySubmit();
	  }
	  
	  
	  function doDelete(id){
			$.ajax({
				url:ctxPath+"/role/delete",
				type: "post",
				data: {id:id},
				async: false,//非异步
				success: function(msg){
					if(msg==1){
						//删除完后继续停留在照片标签内
			    		start(1);
					}
				}
			});
		}
	  
	  
	  