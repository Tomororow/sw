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
var moisture  = new Vue({
	el:'#moisture',
	//初始化数据类型
	data:{
		treeMenus:[],
		nodeKey:'',
		modalTitle:'',
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
		moisture:{
			moistureName:'',
			coding:'',
			equipName:'',
			equipCoding:'',
			administrativeCoding:'',
			simClip:'',
			simClipOperator:'',
			buildTime:'',
			longitude:'',
			latitude:'',
			elevation:'',
			DetailAddress:'',
			moistureImage:'',
			moistureAddress:'',
			address:'伪字段',
			longlatit:'伪字段',

		},
		rules:{
			moistureName:[{required: true, message: '请输入墒情站名称', trigger: 'blur'}],
			coding:[{required: true, message: '请输入墒情站编码', trigger: 'blur'}],
			longitude:[{required: true, message: '请输入经度', trigger: 'blur'}],
			latitude:[{required: true, message: '请输入纬度', trigger: 'blur'}],
			elevation:[{required: true, message: '请输入高程', trigger: 'blur'}],
			address:[{required: true}],
			longlatit:[{required: true}],
			DetailAddress:[{required: true, message: '请填写详细信息', trigger: 'blur'}],
			moistureImage:[{required: true, message: '请上传图片', trigger: 'blur'}],
			equipName:[{required: true, message: '请输入设备名称', trigger: 'blur'}],
			equipCoding:[{required: true, message: '请输入设备编码', trigger: 'blur'}],
			simClip:[{required: true, message: '请输入SIM卡号', trigger: 'blur'}],
			simClipOperator:[{required: true, message: '请选择运营商', trigger: 'blur'}],
		},
		rulesupdate:{
			moistureName:[{required: true, message: '请输入墒情站名称', trigger: 'blur'}],
			coding:[{required: true, message: '请输入墒情站编码', trigger: 'blur'}],
			longitude:[{required: true, message: '请输入经度', trigger: 'blur'}],
			latitude:[{required: true, message: '请输入纬度', trigger: 'blur'}],
			elevation:[{required: true, message: '请输入高程', trigger: 'blur'}],
			DetailAddress:[{required: true, message: '请填写详细信息', trigger: 'blur'}],
			equipName:[{required: true, message: '请输入设备名称', trigger: 'blur'}],
			equipCoding:[{required: true, message: '请输入设备编码', trigger: 'blur'}],
			simClip:[{required: true, message: '请输入SIM卡号', trigger: 'blur'}],
			simClipOperator:[{required: true, message: '请选择运营商', trigger: 'blur'}],
		},
		map:{},
		//表单上传action url
		imageUrl:localPath+'/moisture_survey_site/insertData',
		//图片单独修改路径
		updateImageUrl:localPath+'/moisture_survey_site/updateImage',
		disaled:false,
		//页面表格
		moistureList:[],
		dialogVisible:false,
		mapData:{},
		//图片显示路径
		imagePath:'',
		//分页函数
		currentPage:'1',
		pagesize:'10',
		//修改数据
		updateData:{
			moistureName:'',
			coding:'',
			equipName:'',
			equipCoding:'',
			simClip:'',
			simClipOperator:'',
			buildTime:'',
			longitude:'',
			latitude:'',
			elevation:'',
			DetailAddress:'',
		},
	},
	//页面方法集锦
	methods:{
		//树结构回调函数
		handleNodeClick:function(row){
			debugger
			var _this = this;
			_this.modalTitle = row.label;
			_this.moisture.administrativeCoding = row.areaCode;
			 $.post(localPath+"/moisture_survey_site/selectAll",{id:row.id},function(data){
				 _this.moistureList = data.data;
			 });
		},
		handleSizeChange:function(pagesize){
			var _this = this;
			_this.pagesize = pagesize;
		},
		handleCurrentChange:function(currentPage){
			var _this = this;
			_this.currentPage = currentPage;
		},
		//新增按钮
		showTreeForm:function(){
			var _this = this;
			_this.moisture.moistureName="";_this.moisture.coding="";_this.moisture.equipName="";_this.moisture.equipCoding="";
			_this.moisture.simClip="";_this.moisture.simClipOperator="";_this.moisture.buildTime="";_this.moisture.longitude="";
			_this.moisture.latitude="";_this.moisture.elevation="";_this.moisture.DetailAddress = "";_this.moisture.moistureImage = "";
			_this.disaled = false;
		},
		//上传图片时检查
		imageChange:function(file,fileList){
			var _this = this;
			const isJPG = (file.raw.type === 'image/jpeg')||(file.raw.type === 'image/png');
	        const isLt2M = file.size / 1024 / 1024 < 2;
	        if (!isJPG) {
	          this.$message.error('上传头像图片只能是 JPG或PNG格式!');
	        }
	        if (!isLt2M) {
	          this.$message.error('上传头像图片大小不能超过 2MB!');
	        }
	        _this.moisture.moistureImage = $("#seed").next("input[type='file']").val();
	        _this.disaled = true;
	        return isJPG && isLt2M;
		},
		//上传成功的回调函数
		successForms:function(response, file, fileList){
			var _this = this;
			debugger
			 _this.$message({
	                message: '图片修改成功！',
	                type: 'success'
	            });
			_this.dialogVisible = false;
			
		},
		errorForms:function(response, file, fileList){
			var _this = this;
			debugger
			 _this.$message({
	                message: '警告，图片未修改！',
	                type: 'warning'
	            });
			_this.dialogVisible = false;
		},
		//上传数据
		submitForms:function(formName){
			var _this = this;
			debugger
			_this.$refs[formName].validate(function(valid){
				if(valid){
					_this.moisture.moistureAddress =_this.moisture.DetailAddress;
					_this.map.moisture = JSON.stringify(_this.moisture);
					_this.$refs.upload.submit();
					 $('#myModal').modal('hide')
					 _this.$message({
			                message: '新增成功！',
			                type: 'success'
			            });
				}else{
					 _this.$message({
			                message: '警告，表单填写不完整！',
			                type: 'warning'
			            });
				}
			});
			
		},
		//提交修改数据
		UpdateForms:function(updateData){
			var _this = this;
			debugger
			_this.$refs[updateData].validate(function(valid){
				if(valid){
					_this.updateData.moistureAddress =_this.updateData.DetailAddress;
					$.post(localPath+"/moisture_survey_site/updateData",{data:JSON.stringify(_this.updateData)},function(data){
						if(data.state == 1){
							_this.$message({
				                message: '恭喜，数据修改成功！',
				                type: 'success'
				            });
						}
					})
					 $('#updateModal').modal('hide')
				}else{
					_this.$message({
		                message: '警告，数据未修改！',
		                type: 'warning'
		            });
					$('#updateModal').modal('hide')
				}
			});
			
			
		},
		//修改按钮
		updateRow:function(row){
			var _this = this;
			debugger
			_this.updateData = row;
			_this.updateData.longitude =""+row.longitude;
			_this.updateData.latitude =""+row.latitude;
			_this.updateData.elevation =""+row.elevation;
			_this.updateData.DetailAddress = row.moistureAddress;
			
		},
		//图片修改
		updateImage:function(row){
			var _this = this;
			debugger
			_this.dialogVisible = true;
			_this.map.moisture = JSON.stringify(row);
			_this.$refs.upload.submit();
		},
		//删除按钮
		deleteForms:function(index,row,list){
			var _this = this;
			debugger
			$.post(localPath+"/moisture_survey_site/deleterow",{"row":JSON.stringify(row)},function(data){
				if(data.state ==1){
					_this.$message({
		                message: '恭喜，数据已删除！',
		                type: 'success'
		            });
					list.splice((_this.currentPage-1)*_this.pagesize+index,1);
				}else{
					_this.$message({
		                message: '警告，数据未删除！',
		                type: 'warning'
		            });
				}
			});
		},
		
	},
	//初始化页面
	created:function(){
		var _this = this;
		$.post(localPath+"/moisture_survey_site/selectTree","",function(data){
			debugger
			 _this.treeMenus = data.data;
			 _this.nodeKey = data.data['0'].children['0'].label;
			 _this.modalTitle = data.data['0'].label;
			 _this.moisture.administrativeCoding = data.data['0'].areaCode;
			 $.post(localPath+"/moisture_survey_site/selectAll",{id:data.data['0'].id},function(data){
				 _this.moistureList = data.data;
			 });
		});
		_this.imagePath = picPath+"/pic/";
		 
	},

});