
/* 相对链接的基准URL */
var curWwwPath = window.document.location.href;
var pathName = window.document.location.pathname;
var pos = curWwwPath.indexOf(pathName);
var localhostPaht = curWwwPath.substring(0,pos);
var projectName = pathName.substring(0,pathName.substr(1).indexOf('/')+1);
var ctxPath = localhostPaht + projectName;
var picPath = localhostPaht;
var imagePath = ctxPath+"/static/images/";

var canal= new Vue({
	el:'#canal',
	data:{
		//暂存标签的name值
		type:'１',
		channellist:[],//渠道信息list
		photolist:[],//渠道照片的list
		slucelist:[],//渠道闸门的list
		buildinglist:[],//渠道建筑物的list
		currentPage:1, //初始页
		pagesize:10,    //    每页的数据
		areaCode:'',//最高级水管区域code
		canalId:'',//点击树目录id
		canalInfo:[],
        dialogVisible:false,//图片上传显示flag
        map:{},
        canalBuildingUpdateImageUrl:ctxPath+"/cal_canal_info/edit_canal_building_image",//渠道建筑物图片单独修改路径
	},
	methods:{
		tableRowClassName:function(row, index) {
			if (index%2 !=0) {
				return 'positive-row';
			}
			return '';
		},

		handleSizeChange:function(pagesize){
			var _this = this;
			_this.pagesize = pagesize;
		},
		handleCurrentChange:function(currentPage){
			var _this = this;
			_this.currentPage = currentPage;
		},
		//tabs切换的方法
		handleClick:function(row) {
			var _this = this;
			_this.currentPage=1;
			_this.canalId='';
			_this.type = row.name;
			_this.handleVityTree();

		},

		//树目录结构加载
		handleVityTree:function(id,code){
			var _this = this;
			debugger
			setting = {
				view: {
					selectedMulti: false
				},
				check: {
					enable: true
				},
				callback: {
					onClick: _this.zTreeOnClick
				},
				data:{
					simpleData: {
						enable: true
					},
					key:{
						name:'canalName'
					}
				},

			};
			$.post(ctxPath+"/cal_canal_info/water_canal_tree",{waterId:id,waterCode:code},function(result){
				debugger
				if(result!=""&&result!=null) {
					var treeData = JSON.parse(result);
					treeData[0].open = true;
					if(treeData[0].children[0] != undefined){
						treeData[0].children[0].open = true;
					}
					var treeObject = $.fn.zTree.init($('#treeDemo'), setting, treeData);
					// treeObject.expandAll(true);
					_this.areaCode = _this.code = treeData[0].waterAreaCode;
					debugger
					//页面加载完成后默认查询渠道信息
					//各模块数据查询
					if (_this.type!=''&&_this.type!=null){
						switch (_this.type) {
							case '1'://渠道管理
								_this.channelquery(treeData[0].id);
								break;
							case '2'://渠道照片
								_this.photoquery(treeData[0].id);
								break;
							case '3'://渠道闸门
								_this.sluicequery(treeData[0].id);
								break;
							case '4'://渠道建筑物
								_this.buildingquery(treeData[0].id);
								break;

							default:;
						}
					}
				}
			});


		},
		//树菜单点击方法
		zTreeOnClick:function(event, treeId, treeNode){
			debugger
			var _this = this;
			// start(treeNode.id,1,'');
			_this.canalInfo = treeNode;
			_this.canalId = treeNode.id;
			if (_this.type!=''&&_this.type!=null){
				switch (_this.type) {
					case '1'://渠道管理
						_this.channelquery(treeNode.id);
						break;
					case '2'://渠道照片
						_this.photoquery(treeNode.id);
						break;
					case '3'://渠道闸门
						_this.sluicequery(treeNode.id);
						break;
					case '4'://渠道建筑物
						_this.buildingquery(treeNode.id);
						break;

					default:;
				}
			}
		},


		//渠道信息查询
		channelquery:function(id){
			var _this = this;
			$.post(ctxPath+"/cal_canal_info/channelquery",{id:id},function(data){
				debugger
				_this.channellist=data;
			});

		},
		//渠道照片查询
		photoquery:function(id){
			var _this = this;
			$.post(ctxPath+"/cal_canal_info/photoquery",{id:id},function(data){
				debugger
				_this.photolist=data;
			});

		},
		//渠道闸门查询
		sluicequery:function(id){
			var _this = this;
			$.post(ctxPath+"/cal_canal_info/sluicequery",{id:id},function(data){
				debugger
				_this.slucelist=data;
			});

		},
		//渠道建筑物查询
		buildingquery:function(id){
			var _this = this;
			$.post(ctxPath+"/cal_canal_info/buildingquery",{id:id},function(data){
				debugger
				_this.buildinglist=data;
			});

		},

		//添加渠道弹窗
		addchannel:function() {
			debugger
			var _this = this;
			//获取树目录id
			let  id =canal.canalId;
			if (_this.type!=''&&_this.type!=null){
				switch (_this.type) {
					case '1'://渠道管理
						layerId = 'add-channel-form';
						addContent = ctxPath +'/cal_canal_info/add_canal_page?id='+id;
						areaSize = ['1000px', '1000px'];
						_this.dialogOpenWithAddchall(layerId,addContent,areaSize);

						break;
					case '2'://渠道照片
						layerId = 'add-photo-form';
						Content = ctxPath +'/cal_canal_info/add_canal_photo_page?id='+id;
						areaSize = ['800px', '400px'];
						title='【添加渠道照片】';
						_this.dialogOpenWithAddpbp(layerId,Content,areaSize,title);
						break;
					case '3'://渠道闸门
						layerId = 'add-sluice-form';
						Content = ctxPath +'/cal_canal_info/add_canal_sluice_page?id='+id;
						areaSize = ['800px', '650px'];
						title='【你添加闸门的渠道为】';
						_this.dialogOpenWithAddpbp(layerId,Content,areaSize,title);
						break;
					case '4'://渠道建筑物
						layerId = 'add-building-form';
						Content = ctxPath +'/cal_canal_info/add_canal_building_page?id='+id;
						areaSize = ['800px', '700px'];
						title='【你添加建筑物的渠道为】';
						_this.dialogOpenWithAddpbp(layerId,Content,areaSize,title);
						break;

					default:;
				}
			}

		},
		//新增渠道时弹窗打开
		dialogOpenWithAddchall:function(layerId,addContent,areaSize){
			debugger
			var canalId=canal.canalId;

			if(canalId=="0"){//第一次进来没有最高级
				layer.open({
					type: 2 //此处以iframe举例
					,title: '选择新建内容'
					,area: ['300px', '100px']
					,shade: 0.8
					,maxmin: true
					,content: addContent
					,btn: ['新建渠道级别', '添加水管区级别'] //只是为了演示
					,btn1:function(){
						canall(canalId);
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
							canall(canalId);
							//layer.closeAll();
						}
						,btn2: function(){
							pWaterArea(canalId);
							//layer.closeAll();
						}

					});
				}

			}

		},
		//新增渠道图片时打开的弹窗
		dialogOpenWithAddpbp:function (layerId,Content,areaSize,title){
			var _this = this;
			let canalId=canal.canalId;
			if(canalId=="0"){//第一次进来没有最高级

			}else{
				if(canalId==null||canalId==""){
					layer.alert('请选择添加位置！', {icon: 0});
				}else{
					layer.open({
						id: layerId
						,type: 2 //此处以iframe举例
						,title: title
						,area: areaSize
						,shade: 0.8
						,maxmin: true
						,content: Content
						,btn: ['确定', '关闭'] //只是为了演示
						,yes: function() {
							debugger
							switch (_this.type) {
								case '2'://渠道照片

									break;
								case '3'://闸门
									_this.addSluiceSubmit();
									//弹出添加成功的窗口
									layer.confirm('添加成功', {
										btn: ['确定'] //按钮
									}, function(){
										document.forms[0].action=ctxPath+"/cal_canal_info/list";
										document.forms[0].submit();

									});
									break;
								case '4'://渠道建筑物
									_this.addBuildingSubmit();
									//弹出添加成功的窗口
									layer.confirm('添加成功', {
										btn: ['确定'] //按钮
									}, function(){
										document.forms[0].action=ctxPath+"/cal_canal_info/list";
										document.forms[0].submit();

									});
									break;
								default:
									;

									showPhotoPage();

							}

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

		},
		//修改渠道的弹窗
		doEdit:function(row) {
			debugger
			var _this = this;
			let  id=row.id;
			if (_this.type!=''&&_this.type!=null){
				switch (_this.type) {
					case '1'://渠道管理
						layerId = 'edit-channel-form';
						editContent = ctxPath +'/cal_canal_info/edit_page?id='+id;
						areaSize = ['800px', '800px'];
						title='【编辑渠道】';
						_this.dialogOpenWithedit(layerId,editContent,areaSize,title);
						break;
					case '2'://渠道照片
						layerId = 'edit-waterSite-form';
						editContent = ctxPath +'/cal_canal_info/add_canal_photo_page?id='+id;
						areaSize = ['800px', '400px'];
						title='【编辑图片】';
						_this.dialogOpenWithedit(layerId,editContent,areaSize,title);
						break;
					case '3'://渠道闸门
						layerId = 'edit-sluice-form';
						editContent = ctxPath +"/cal_canal_info/edit_canal_sluice_page?id="+row.sluiceid;
						areaSize = ['800px', '800px'];
						title='【编辑闸门信息】';
						_this.dialogOpenWithedit(layerId,editContent,areaSize,title);
						break;
					case '4'://渠道建筑物
						layerId = 'edit-building-form';
						editContent = ctxPath +"/cal_canal_info/edit_canal_building_page?id="+row.buildingid;
						areaSize = ['800px', '700px'];
						title='【您编辑的建筑物信息】';
						_this.dialogOpenWithedit(layerId,editContent,areaSize,title);
						break;

					default:;
				}
			}

		},
		//修改渠道弹窗
		dialogOpenWithedit:function(layerId,editContent,areaSize,title) {
			debugger
			var _this = this;
			layer.open({
				id: layerId
				,type: 2 //此处以iframe举例
				,title: title
				,area:areaSize
				,shade: 0.8
				,maxmin: true
				,content: editContent
				,btn: ['确定', '关闭'] //只是为了演示
				,yes: function(){
					//子页面提交
					switch (_this.type) {
						case '1'://渠道信息
							_this.editSubmit(layerId);
							break;
						case '2'://渠道照片

							break;
						case '3'://闸门
							_this.addSluiceSubmit();
							//弹出添加成功的窗口
							layer.confirm('添加成功', {
								btn: ['确定'] //按钮
							}, function(){
								document.forms[0].action=ctxPath+"/cal_canal_info/list";
								document.forms[0].submit();

							});
							break;
						case '4'://渠道建筑物
						_this.editCanalBuildingSubmit();
							layer.confirm('修改成功', {
								btn: ['确定'] //按钮
							}, function(){
								document.forms[0].action=ctxPath+"/cal_canal_info/list";
								document.forms[0].submit();

							});
							break;
						default:
							;

							showPhotoPage();

					}

					//弹出添加成功的窗口
					layer.confirm('修改成功', {
						btn: ['确定'] //按钮
					}, function(){

						//document.forms[0].action=ctxPath+"/cal_canal_info/frush";
						document.forms[0].action=ctxPath+"/cal_canal_info/list";
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
		},
		//渠道编辑提交的方法
		editSubmit:function(layerId){

			//父页面控制子页面
			var frameId=document.getElementById(layerId).getElementsByTagName("iframe")[0].id;
			$('#'+frameId)[0].contentWindow.mySubmit2();
		},
		//渠道闸门提交
		addSluiceSubmit:function(){
			var frameId=document.getElementById("add-sluice-form").getElementsByTagName("iframe")[0].id;
			$('#'+frameId)[0].contentWindow.mySubmit5();
		},
		//渠道闸门编辑父页面提交子页面
		editCanalSluiceSubmit:function(layerId){
            //父页面控制子页面
            var frameId=document.getElementById("edit-sluice-form").getElementsByTagName("iframe")[0].id;
            $('#'+frameId)[0].contentWindow.mySubmit8();
        },
		//获取添加建筑物子页面的提交方法
		addBuildingSubmit:function(){
            var frameId=document.getElementById("add-building-form").getElementsByTagName("iframe")[0].id;
            $('#'+frameId)[0].contentWindow.mySubmit3();
        },
		//渠道建筑物修改
		editCanalBuildingSubmit:function(layerId){
            //父页面控制子页面
            var frameId=document.getElementById("edit-building-form").getElementsByTagName("iframe")[0].id;
            $('#'+frameId)[0].contentWindow.mySubmit4();
        },
		//删除渠道信息
		doDelete:function (row) {
			var _this = this;
			debugger
			this.$confirm('确认删除该站点？','删除确认',{
				type: 'warning'
			}).then(() => {
				if (_this.type!=''&&_this.type!=null){
					switch (_this.type) {
						case '1'://渠道管理
							$.post(ctxPath+"/cal_canal_info/delete_byid",{id:row.id},function (msg) {
								debugger
								_this.messageJudge(msg);
								_this.handleVityTree();
								// _this.channelquery(_this.canalId);
							});
							break;
						case '2'://渠道照片
							$.post(ctxPath+"/site_water_manage/delete",{id:row.id},function (msg) {
								_this.messageJudge(msg);
								_this.handleVityTree();
							});
							break;
						case '3'://渠道闸门
							$.post(ctxPath+"/cal_canal_info/delete_single_canalsluice_byid",{id:row.sluiceid},function (msg) {
								_this.messageJudge(msg);
								_this.handleVityTree();
							});
							break;
						case '4'://渠道建筑物
							$.post(ctxPath+"/cal_canal_info/delete_single_canalbuilding_byid",{id:row.buildingid},function (msg) {
								_this.messageJudge(msg);
								_this.handleVityTree();
							})
							break;

						default:;
					}
				}
			}).catch(_ => { });
		},

		//取得删除回调后要显示到页面的message
		messageJudge:function (msg) {
			var _this = this;
			debugger
			if(msg == 1){
				this.$message({
					type: 'success',
					message: '删除成功'
				});
			}else{
				this.$message({
					type: 'error',
					message: '删除失败'
				});
			}
		},
        //图片上传成功回调
        onSuccess:function(response, file, fileList){
            var _this = this;
            debugger
            _this.$message({
                message: '恭喜你，图片修改成功！',
                type: 'success'
            });
            _this.dialogVisible = false;
        },
        //图片上传失败回调
        onError:function(err, file, fileList){
            var _this = this;
            debugger
            _this.$message({
                message: '警告，图片未修改！',
                type: 'warning'
            });
            _this.dialogVisible = false;
       },
        //图片改变回调函数
        imageChange:function(file,fileList){
            var _this = this;
            debugger
            const isJPG = (file.raw.type === 'image/jpeg')||(file.raw.type === 'image/png');
            const isLt2M = file.size / 1024 / 1024 < 2;
            if (!isJPG) {
                this.$message.error('上传图片只能是 JPG或PNG格式!');
            }
            if (!isLt2M) {
                this.$message.error('上传图片大小不能超过 2MB!');
            }
            return isJPG && isLt2M;
        },
		//页面表格修改图片
		updateImage:function(row){
			var _this = this;
			debugger
			_this.dialogVisible=true;
			_this.map.canal = JSON.stringify(row);
		},
    },
	mounted:function() {
		var _this = this;
		_this.type='1';
		debugger
		_this.handleVityTree();
	}
})


/*
//添加渠道弹窗
function addCanal(){
	debugger
	// var canalId = getCookie("canalId");
	var canalId = canal.canalInfo.syswaterarea_id;
	// var canalId = canal.canalId;
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
		        	canall(canalId);
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
			        	canall(canalId);
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
*/



//添加渠道
	function canall(canalId){
		 if(canalId!=null&&canalId!=""){
			 layer.open({
				 	id: 'insert-form'
			        ,type: 2 //此处以iframe举例
			        ,title: '【添加渠道】'
			        ,area: ['700px', '700px']
			        ,shade: 0.8
			        ,maxmin: true
			       ,content: ctxPath+"/cal_canal_info/add_canal_page?id="+canalId+'&canalLevel='+canal.canalInfo.canallevelCode+'&canalCode='+canal.canalInfo.canalCode
			        ,btn: ['确定', '关闭'] //只是为了演示
			        ,yes: function(){
			        	//子页面提交
			        	insertSubmitCanal();
			        	 layer.confirm('你的渠道已经添加成功', {
			   	  		  btn: ['确定'] //按钮
			   	  		}, function(){
			   	  			
			   	  			document.forms[0].action=ctxPath+"/cal_canal_info/list";
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
				   	  			
				   	  			document.forms[0].action=ctxPath+"/cal_canal_info/list";
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
		/*function doEdit(id){
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
		}*/
		
		
		/**+
		id:点击树目录所触发的id
		page：分页的起始页
		table：相对路劲
		tab：所对应的标签
		*/
		//当点击某一级树目录触发
	/*	function start(id,page,threeLevelPermission){
			//alert(page);
			//将获取的id放到cook中
			debugger
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
											/!*!/!*var newTdTag2 = document.createElement("td");
												newTdTag2.innerHTML=msg[i].sysareaId;
											var newTdTag3 = document.createElement("td");
												newTdTag3.innerHTML=msg[i].syswaterareaId;*!/!*!/
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
												/!*!/!*newTrTag.appendChild(newTdTag2);
												newTrTag.appendChild(newTdTag3);*!/!*!/
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
					    /!* bootstrap分页样式设置 *!/
					    var options = {
					    	size:"small",
					    	alignment:"right",
					    	/!* 当前页数 *!/
					        currentPage: pageNum,
					        /!* 总页数  总条数除以每页条数  能整除总页数为商  不能整除商+1页  作为分页总页数  *!/
					        totalPages: pages,
					        /!* 每页条数 *!/
					        numberOfPages:size,
					        /!* bootstrap版本指定 *!/
					        bootstrapMajorVersion:3,
					        /!* 样式设置 分页导航条 *!/
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
					    /!* bootstrap分页样式设置 *!/
					    var options = {
					    	size:"small",
					    	alignment:"right",
					    	/!* 当前页数 *!/
					        currentPage: pageNum,
					        /!* 总页数  总条数除以每页条数  能整除总页数为商  不能整除商+1页  作为分页总页数  *!/
					        totalPages: pages,
					        /!* 每页条数 *!/
					        numberOfPages:size,
					        /!* bootstrap版本指定 *!/
					        bootstrapMajorVersion:3,
					        /!* 样式设置 分页导航条 *!/
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
					    /!* bootstrap分页样式设置 *!/
					    var options = {
					    	size:"small",
					    	alignment:"right",
					    	/!* 当前页数 *!/
					        currentPage: pageNum,
					        /!* 总页数  总条数除以每页条数  能整除总页数为商  不能整除商+1页  作为分页总页数  *!/
					        totalPages: pages,
					        /!* 每页条数 *!/
					        numberOfPages:size,
					        /!* bootstrap版本指定 *!/
					        bootstrapMajorVersion:3,
					        /!* 样式设置 分页导航条 *!/
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
					    /!* bootstrap分页样式设置 *!/
					    var options = {
					    	size:"small",
					    	alignment:"right",
					    	/!* 当前页数 *!/
					        currentPage: pageNum,
					        /!* 总页数  总条数除以每页条数  能整除总页数为商  不能整除商+1页  作为分页总页数  *!/
					        totalPages: pages,
					        /!* 每页条数 *!/
					        numberOfPages:size,
					        /!* bootstrap版本指定 *!/
					        bootstrapMajorVersion:3,
					        /!* 样式设置 分页导航条 *!/
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
		}*/
		
		
		
		 
		 
		
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

		
		
		
		
		
	/*	 function editSubmit(){
			 	alert("任伍伍11111111111");
			  //父页面控制子页面
			   var frameId=document.getElementById("edit-form").getElementsByTagName("iframe")[0].id;
			   $('#'+frameId)[0].contentWindow.mySubmit2();
		  }*/
		 
/*		//删除
		function doDelete(id){
			alert("是否确认删除！");
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
		}*/
  
	  
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