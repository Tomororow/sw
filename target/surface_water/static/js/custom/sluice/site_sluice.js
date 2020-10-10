/* 相对链接的基准URL */
var curWwwPath = window.document.location.href;
var pathName = window.document.location.pathname;
var pos = curWwwPath.indexOf(pathName);
var localhostPaht = curWwwPath.substring(0,pos);
var projectName = pathName.substring(0,pathName.substr(1).indexOf('/')+1);
var ctxPath = localhostPaht + projectName;
var picPath = localhostPaht;

function start(id,page,threeLevelPermission){
		//alert(id);
		setCookie("canalId2",id);
		//每次进来清除之前的查询结果
		$("#table_list").empty();
		$.ajax({
			url:ctxPath+"/site_sluice_manage/page",
			data: {id:id,page:page},
			type: "post",
			async: false,//非异步
			success: function(msg){
		//	alert(JSON.stringify(msg));
				//渲染列表
				for(var i=0;i<msg.length;i++){
					//alert(msg[i].id);
					var currentTag = document.getElementById("table_list");
					var newTrTag = document.createElement("tr");
						var newTdTag1 = document.createElement("td");
							var newInputTag2 = document.createElement("input");
							newInputTag2.setAttribute("type", "checkbox");
							newInputTag2.setAttribute("name", "selectedWaterSiteRow");
							newInputTag2.setAttribute("value", msg[i].id);
							newTdTag1.appendChild(newInputTag2);
							
						var newTdTag2 = document.createElement("td");
						    newTdTag2.innerHTML=msg[i].deviceSluiceName;	
						    
						var newTdTag3 = document.createElement("td");
						    newTdTag3.innerHTML=msg[i].ssiAddr;
						    
						 var newTdTag4 = document.createElement("td");
						    newTdTag4.innerHTML=msg[i].ssiBuildTime;
						    
						    var newTdTag5 = document.createElement("td");
						    newTdTag5.innerHTML=msg[i].ssiSimoperator;
						    
						    var newTdTag6 = document.createElement("td");
						    newTdTag6.innerHTML=msg[i].ssiLongitude;
						    
							var newTdTag7 = document.createElement("td");
						    newTdTag7.innerHTML=msg[i].ssiLatitude;
						    
					var newTdTag8 = document.createElement("td");
						//图片回显
						var newImgTag1 = document.createElement("img");
							newImgTag1.setAttribute("src", picPath+"/pic/"+msg[i].ssiPhotoBefore);
							newImgTag1.setAttribute("id", msg[i].id);
							newImgTag1.setAttribute("width", "50");
							newImgTag1.setAttribute("height", "50");
							
							var id = JSON.stringify(msg[i].id);
							var ssiPhotoBeforeImg ="\""+picPath+"/pic/"+msg[i].ssiPhotoBefore+"\"";
							//alert(canalBuildingImg);
							newImgTag1.setAttribute("onclick", "showPhoto("+id+","+ssiPhotoBeforeImg+")");
							newTdTag8.appendChild(newImgTag1);
								
								
					var newTdTag9 = document.createElement("td");
					//图片回显
					var newImgTag2 = document.createElement("img");
						newImgTag2.setAttribute("src", picPath+"/pic/"+msg[i].ssiPhotoAfter);
						newImgTag2.setAttribute("id", msg[i].id);
						newImgTag2.setAttribute("width", "50");
						newImgTag2.setAttribute("height", "50");
						
						var id = JSON.stringify(msg[i].id);
						var ssiPhotoAfterImg ="\""+picPath+"/pic/"+msg[i].ssiPhotoAfter+"\"";
						//alert(canalBuildingImg);
						newImgTag2.setAttribute("onclick", "showPhoto("+id+","+ssiPhotoAfterImg+")");
						newTdTag9.appendChild(newImgTag2);	
						var newTdTag10 = document.createElement("td");
					    newTdTag10.innerHTML=msg[i].ssiRemark;
						var newTdTag11 = document.createElement("td");
							var sluiceId = JSON.stringify(msg[i].id);
							newTdTag11.innerHTML=showThreeLevelPermission(threeLevelPermission,sluiceId);
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
		
		$.post(ctxPath+"/site_sluice_manage/page_nav").success(function (response) {
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
			        	
			        	start(id,page,threeLevelPermission);
			        	
			        }
			    };
			    $('#pageLimit').bootstrapPaginator(options);
			}).error(function (response) {
			   // alert("列表请求出错");
			});
	}
	
	
	
	function add(){
		var id = getCookie("canalId2");
		//alert(id);
		delCookie("canalId2");
		if(id==null||id==""){
			layer.alert('请先选择渠道！', {icon: 0});
		}else{
			//打开添加窗口
			//alert("111");
			 layer.open({
				 	id: 'add-sluiceSite-form'
			        ,type: 2 //此处以iframe举例
			        ,title: '你的闸门站为'+id
			        ,area: ['770px', '580px']
			        ,shade: 0.8
			        ,maxmin: true
			        ,content: ctxPath+"/site_sluice_manage/add_page?id="+id
			        ,btn: ['确定', '关闭'] //只是为了演示
			        ,yes: function(){
			        	//子页面提交
			        	addSluiceSiteSubmit();
			        	
			        }
			        ,btn2: function(){
			          layer.closeAll();
			        }
			        
			        ,zIndex: layer.zIndex //重点1
			        ,success: function(layero){
			        	start(id,1);
			        	layer.setTop(layero); //重点2
			        }
			    });
		}
	}
	
	//添加提交
	function addSluiceSiteSubmit(){
	   var frameId=document.getElementById("add-sluiceSite-form").getElementsByTagName("iframe")[0].id;
	   $('#'+frameId)[0].contentWindow.mySubmit();
	   
	   layer.confirm('添加成功', {
 		  btn: ['确定'] //按钮
 		}, function(){	
			document.forms[0].action=ctxPath+"/site_sluice_manage/list?state=23";
 		document.forms[0].submit();
 	});
	 }
	
	
	
	//编辑
	function doEdit(sluiceId){
		layer.open({
		 	id: 'edit-sluice-form'
	        ,type: 2 //此处以iframe举例
	        ,title: '你编辑的闸门站为'+sluiceId
	        ,area: ['770px', '580px']
	        ,shade: 0.8
	        ,maxmin: true
	        ,content: ctxPath+"/site_sluice_manage/edit_page?sluiceId="+sluiceId
	        ,btn: ['确定', '关闭'] //只是为了演示
	        ,yes: function(){
        	//子页面提交
        		editSluiceSiteSubmit();
        		layer.confirm('你的预测编辑成功', {
	        		  btn: ['确定'] //按钮
	        		}, function(){	
      			document.forms[0].action=ctxPath+"/site_sluice_manage/list?state=23";
		    		document.forms[0].submit();
	        	});
	        }
	        ,btn2: function(){
	          layer.closeAll();
	        }
	        
	        ,zIndex: layer.zIndex //重点1
	        ,success: function(layero){
	        	//start(getCookie ("canalId2"),1);
	          layer.setTop(layero); //重点2
	        } 
	    });
	}
	//编辑提交
	function editSluiceSiteSubmit(){
		////alert("haha");
	   var frameId=document.getElementById("edit-sluice-form").getElementsByTagName("iframe")[0].id;
	   $('#'+frameId)[0].contentWindow.mySubmit();
	}
	
	//单个删除
	function doDelete(id){
		//var pid = "";
		$.ajax({
			url:ctxPath+"/site_sluice_manage/delete",
			type: "post",
			data: {id:id},
			async: false,//非异步
			success: function(msg){
				if(msg==1){
					layer.confirm('删除成功', {
		        		  btn: ['确定'] //按钮
		        		}, function(){	
	      			document.forms[0].action=ctxPath+"/site_sluice_manage/list?state=23";
			    		document.forms[0].submit();
		        	});
				}
			}
		});
	}
	
	
	
	//水位站全选、全反选
	function doSelectWaterSiteAll(){
		//jquery 1.6 前
		//$("input[name=selectedRow]").attr("checked", $("#selAll").is(":checked"));
		//prop jquery 1.6+建议使用
		$("input[name=selectedWaterSiteRow]").prop("checked", $("#selWaterSiteAll").is(":checked"));		
	}
	
	
	
	//站点批量删除
	function deletes(){
		var siteNo = getCookie ("siteNo");
		
		switch (siteNo) {
		case "1":
			
			break;
		case "2":
			//传水位站id数组
			var ids = [];
			  $('input[name=selectedWaterSiteRow]:checked').each(function () {
				  ////alert(222222);
				  ids.push($(this).val());
			  });
			  $.ajax({
					url:ctxPath+"/site_sluice_manage/deletes",
					data: {ids:ids},
					type: "post",
					async: false,//非异步
					success: function(msg){
						if(msg==ids.length){
							start(getCookie ("id"),1,2);
						}
					}
				});
			break;
			
		case "3":
			var ids = [];
			  $('input[name=selectedSpeedSiteRow]:checked').each(function () {
				  ////alert(222222);
				  ids.push($(this).val());
			  });
			  $.ajax({
					url:ctxPath+"/site_speed_manage/deletes",
					data: {ids:ids},
					type: "post",
					async: false,//非异步
					success: function(msg){
						if(msg==ids.length){
							start(getCookie ("id"),1,3);
						}
					}
				});
			break;
		
		default:
			break;
		}
	}
	
	
	//照片点击事件显示照片=====================
	function showPhoto(a,img){
		////alert(a);
		layer.open({
			  type: 1,
			  title: false,
			  closeBtn: 0,
			  area: ['900px', '600px'],
			  skin: 'layui-layer-nobg', //没有背景色
			  shadeClose: true,
			  content: '<img src= '+img+'  width="900" height="600" alt="渠道照片" />'
		});
	} 