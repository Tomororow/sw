/* 相对链接的基准URL */
var curWwwPath = window.document.location.href;
var pathName = window.document.location.pathname;
var pos = curWwwPath.indexOf(pathName);
var localhostPaht = curWwwPath.substring(0,pos);
var projectName = pathName.substring(0,pathName.substr(1).indexOf('/')+1);
var ctxPath = localhostPaht + projectName;
var picPath = localhostPaht;
var url ;
   for(var i=0;i<4;i++){
	  url=window.location.href.indexOf("/",url+1);
   }
   var localPath = window.location.href.substring(0,url);
var monitorSurveySite = new Vue({
	el:'#monitorSurveySite',
	//初始化数据类型
	data:{
		pagesize:'10',
		currentPage:'1',
		//表格集合
		treeMenus:[],
		//默认打开输的label
		nodeKey:'',
		//树形转存
		showTree:{},
		//页面数据
		monitorList:[],
		monitorImport:{
			meteorName:'',
			coding:'',
			elevation:'',
			administrativeCoding:'',
			longitudeLatitude:'',
			longitude:'',
			latitude:'',
			monitorImage:'',
			monitorAddress:'',
			monitorDetailAddress:'',
			equipName:'',
			equipCoding:'',
			simClip:'',
			simClipOperator:'',
			buildTime:'',
		},
		 options: [{
	          value: '中国电信',
	          label: '中国电信'
	        }, {
	          value: '中国移动',
	          label: '中国移动'
	        }, {
	          value: '中国联通',
	          label: '中国联通'
	        }],
		dialogVisible:false,
		//图片显示地址
		imagePath:'',
		//提交地址
		imageUrl:localPath+'/meteor_survey_site/submitData',
		//图片单独修改路径
		updateImageUrl:localPath+'/meteor_survey_site/updateImage',
		//当前数据对象
		map:{},
		//当前数据对象
		mapData:{},
		disaled:false,
		//修改的表单数据
		updateData:{
			longitudeLatitude:'',
			monitorAddress:'',
		},
		rules:{
			meteorName:[{required: true, message: '请输入气象站名称', trigger: 'blur'}],
			coding:[{required: true, message: '请输入气象站编码', trigger: 'blur'}],
			longitude:[{required: true, message: '请输入经度', trigger: 'blur'}],
			latitude:[{required: true, message: '请输入纬度', trigger: 'blur'}],
			elevation:[{required: true, message: '请输入高程', trigger: 'blur'}],
			monitorDetailAddress:[{required: true, message: '请填写详细信息', trigger: 'blur'}],
			monitorImage:[{required: true, message: '请上传图片', trigger: 'blur'}],
			equipName:[{required: true, message: '请输入设备名称', trigger: 'blur'}],
			equipCoding:[{required: true, message: '请输入设备编码', trigger: 'blur'}],
			simClip:[{required: true, message: '请输入SIM卡号', trigger: 'blur'}],
			simClipOperator:[{required: true, message: '请选择运营商', trigger: 'blur'}],
			},
		
	},
	//页面方法集锦
	methods:{
		handleSizeChange:function(size){
			var _this = this;
			_this.pagesize = size;
		},
		handleCurrentChange:function(currentPage){
			var _this = this;
			_this.currentPage = currentPage;
		},
		//树形回调方法
		handleNodeClick:function(data){
			var _this = this;
			debugger 
			_this.monitorImport.administrativeCoding = data.areaCode;
			_this.showTree = data;
			$.post(localPath+"/meteor_survey_site/selectTable",{"id":data.id},function(result){
				_this.monitorList = result.data;
			});
			
		},
		//文件上传回调函数
		imageChange:function(file,fileList){
			var _this = this;
			debugger
			const isJPG = (file.raw.type === 'image/jpeg')||(file.raw.type === 'image/png');
	        const isLt2M = file.size / 1024 / 1024 < 2;
	        if (!isJPG) {
	          this.$message.error('上传头像图片只能是 JPG或PNG格式!');
	        }
	        if (!isLt2M) {
	          this.$message.error('上传头像图片大小不能超过 2MB!');
	        }
	        _this.monitorImport.monitorImage = $("#seed").next("input[type='file']").val();
	        _this.disaled = true;
	        return isJPG && isLt2M;
		},
		//页面表格的修改方法
		updateRow:function(row,type,updateData){
			var _this = this;
			debugger
			if(type==0){
				_this.updateData = row;
				_this.updateData.elevation =""+row.elevation;
				_this.updateData.longitude = row.longitudeLatitude.split("-")[0];
				_this.updateData.latitude = row.longitudeLatitude.split("-")[1];
				_this.updateData.monitorDetailAddress = row.monitorAddress;
			}else{
				debugger
				_this.$refs[updateData].validate(function(valid){
					if(valid){
						_this.updateData.monitorAddress =_this.updateData.monitorDetailAddress;
						_this.updateData.longitudeLatitude = _this.updateData.longitude+"-"+_this.updateData.latitude;
						$.post(localPath+"/meteor_survey_site/updateData",{"result":JSON.stringify(_this.updateData)},function(result){
							if(result.state == 1){
								 _this.$message({
						                message: '恭喜你，表单数据修改成功！',
						                type: 'success'
						            });
								 $('#updateModal').modal('hide')
							}else{
								_this.$message({
					                message: '警告，表单数据未修改！',
					                type: 'warning'
					            });
								 $('#updateModal').modal('hide')
							}
						});
					}else{
						 _this.$message({
				                message: '警告，表单填写不完整！',
				                type: 'warning'
				            });
					}
				});
				
			}
			
			
		},
		//提交数据方法
		submitForms:function(ruleForm){
			var _this = this;
			_this.$refs[ruleForm].validate(function(valid){
				if(valid){
					_this.monitorImport.monitorAddress = _this.monitorImport.monitorDetailAddress;
					_this.monitorImport.longitudeLatitude = _this.monitorImport.longitude+"-"+_this.monitorImport.latitude;
					_this.map.monitorImport = JSON.stringify(_this.monitorImport);
					_this.$refs.upload.submit();
				}else{
					 _this.$message({
			                message: '警告，表单填写不完整！',
			                type: 'warning'
			            });
				}
				
			});
			
		},
		successForms:function(response, file, fileList){
			var _this = this;
			debugger
				 _this.$message({
		                message: '恭喜你，表单提交成功！',
		                type: 'success'
		            });
				  $('#exampleModal').modal('hide')
		},
		successForm:function(response, file, fileList){
			var _this = this;
			 _this.$message({
	                message: '恭喜你，图片修改成功！',
	                type: 'success'
	            });
			 _this.dialogVisible = false;
		},
		//新增按钮方法
		showTreeForm:function(){
			var _this = this;
			_this.monitorImport.meteorName="";_this.monitorImport.coding="";_this.monitorImport.longitude="";
			_this.monitorImport.latitude="";_this.monitorImport.elevation="";_this.monitorImport.monitorDetailAddress="";
			_this.monitorImport.monitorImage="";
			_this.disaled = false;
		},
		updateImage:function(row){
			var _this = this;
			_this.dialogVisible = true;
			_this.$refs.upload.submit();
			_this.mapData.mapData = JSON.stringify(row);
		},
		//删除行数据
		deleteForms:function(index,row,list){
			var _this = this;
			debugger
			$.post(localPath+"/meteor_survey_site/deleteTable",{"id":row.id,"image":row.monitorImage},function(data){
				if(data.state == 1){
					 _this.$message({
			                message: '恭喜你，该行数据已删除！',
			                type: 'success'
			            });
					 list.splice((_this.currentPage-1)*_this.pagesize+index,1);
				}else{
					_this.$message({
		                message: '警告，该行数据未成功删除！',
		                type: 'warning'
		            });
				}
			});
		},
	},
	//初始化页面
	created:function(){
		var _this = this;
		$.post(localPath+"/meteor_survey_site/selectTree","",function(data){
			debugger
			_this.monitorImport.administrativeCoding = data.data['0'].areaCode;
			_this.showTree = data.data['0'];
			
			$.post(localPath+"/meteor_survey_site/selectTable",{"id":data.data['0'].id},function(result){
				_this.monitorList = result.data;
			});
			_this.treeMenus = data.data;
			_this.nodeKey = data.data['0'].children['0'].label;
			
		});
		_this.imagePath = picPath+"/pic/";
	},
});