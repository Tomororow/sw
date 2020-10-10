//当点击某一级树目录触发
	function start(id,page,table,tag){
		//alert(page);
		//将获取的id放到cook中
		setCookie("currentNodeId",id,1);
		//每次进来清除之前的查询结果
		$("#table_list").empty();
		$("#table_photo_list").empty();
		$.ajax({
			url:"${ctx}/cal_canal_info/"+table,
			data: {id:id,page:page},
			type: "post",
			async: false,//非异步
			success: function(msg){
				alert(JSON.stringify(msg) );
				var table = msg;
				if(tag=="canal"){
					//动态建立渠道列表
						for(var i=0;i<msg.length;i++){
							var currentTag = document.getElementById("table_list");
								var newTrTag = document.createElement("tr");
									var newTdTag1 = document.createElement("td");
										var newInputTag = document.createElement("input");
										newInputTag.setAttribute("type", "checkbox");
										
										newTdTag1.appendChild(newInputTag);
									var newTdTag2 = document.createElement("td");
										newTdTag2.innerHTML=msg[i].sysareaId;
									var newTdTag3 = document.createElement("td");
										newTdTag3.innerHTML=msg[i].syswaterareaId;
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
										newTdTag11.innerHTML="<a href='javascript\:doEdit("+sonid+")'>修改</a>|<a href='javascript\:doDelete("+sonid+")'>删除</a>"
										newTrTag.appendChild(newTdTag1);
										newTrTag.appendChild(newTdTag2);
										newTrTag.appendChild(newTdTag3);
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
				
				
				}else if(tag=="photo"){
					for(var i=0;i<msg.length;i++){
						var currentTag = document.getElementById("table_photo_list");
							var newTrTag = document.createElement("tr");
								var newTdTag1 = document.createElement("td");
									var newInputTag = document.createElement("input");
									newInputTag.setAttribute("type", "checkbox");
									
									newTdTag1.appendChild(newInputTag);
								var newTdTag2 = document.createElement("td");
									newTdTag2.innerHTML=msg[i].canalId;
								var newTdTag3 = document.createElement("td");
									newTdTag3.innerHTML=msg[i].syswaterareaId;
								var newTdTag4 = document.createElement("td");
									newTdTag4.innerHTML=msg[i].sysareaCode;
								
								var newTdTag5 = document.createElement("td");
										var sonid = JSON.stringify(msg[i].id);
									newTdTag5.innerHTML="<a href='javascript\:doEdit("+sonid+")'>修改</a>|<a href='javascript\:doDelete("+sonid+")'>删除</a>"
									newTrTag.appendChild(newTdTag1);
									newTrTag.appendChild(newTdTag2);
									newTrTag.appendChild(newTdTag3);
									newTrTag.appendChild(newTdTag4);
									newTrTag.appendChild(newTdTag5);
							
								currentTag.appendChild(newTrTag);
					
					}
				}
				
			}
		});
		
		 $.post("${ctx}/cal_canal_info/page_nav").success(function (response) {
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
			        itemTexts: function (type, page, current){
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
			        	start(id,page);
			        	
			        }
			    };
			    $('#pageLimit').bootstrapPaginator(options);
			}).error(function (response) {
			    alert("列表请求出错");
			});
		
	}