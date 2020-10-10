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
var evaporate = new Vue({
	el:'#evaporate',
	//初始化数据类型
	data:{
		//树形控件
		treeMenus:[],
		//新增标题
		treeLabel:'',
		nodeKey:'',
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
		//页面数据
		evaAdd:{
			evaporateName:'',
			coding:'',
			equipName:'',
			equipCoding:'',
			simClip:'',
			DetailAddress:'',
			simClipOperator:'',
			buildTime:'',
			longitude:'',
			latitude:'',
			elevation:'',
			administrativeCoding:'',
			evaporateAddress:'',
			evaporateImage:'',
			address:'伪字段',
			longlatit:'伪字段',
		},
		pagesize:'10',
		currentPage:'1',
		disaled:false,
		//上传数据路径
		imageUrl:localPath+'/evaporate_survey_site/addData',
		//图片单独修改路径
		updateImageUrl:localPath+'/evaporate_survey_site/updateImage',
		map:{},
		//页面表格数据
		evaporateList:[],
		dialogVisible:false,
		imagePath:'',
		rules:{
			evaporateName:[{required: true, message: '请输入蒸发站名称', trigger: 'blur'}],
			coding:[{required: true, message: '请输入蒸发站编码', trigger: 'blur'}],
			longitude:[{required: true, message: '请输入经度', trigger: 'blur'}],
			latitude:[{required: true, message: '请输入纬度', trigger: 'blur'}],
			elevation:[{required: true, message: '请输入高程', trigger: 'blur'}],
			address:[{required: true}],
			longlatit:[{required: true}],
			DetailAddress:[{required: true, message: '请填写详细信息', trigger: 'blur'}],
			evaporateImage:[{required: true, message: '请上传图片', trigger: 'blur'}],
			equipName:[{required: true, message: '请输入设备名称', trigger: 'blur'}],
			equipCoding:[{required: true, message: '请输入设备编码', trigger: 'blur'}],
			simClip:[{required: true, message: '请输入SIM卡号', trigger: 'blur'}],
			simClipOperator:[{required: true, message: '请选择运营商', trigger: 'blur'}],
		},
		rulesupdate:{
			evaporateName:[{required: true, message: '请输入蒸发站名称', trigger: 'blur'}],
			coding:[{required: true, message: '请输入蒸发站编码', trigger: 'blur'}],
			longitude:[{required: true, message: '请输入经度', trigger: 'blur'}],
			latitude:[{required: true, message: '请输入纬度', trigger: 'blur'}],
			elevation:[{required: true, message: '请输入高程', trigger: 'blur'}],
			address:[{required: true}],
			longlatit:[{required: true}],
			DetailAddress:[{required: true, message: '请填写详细信息', trigger: 'blur'}],
			equipName:[{required: true, message: '请输入设备名称', trigger: 'blur'}],
			equipCoding:[{required: true, message: '请输入设备编码', trigger: 'blur'}],
			simClip:[{required: true, message: '请输入SIM卡号', trigger: 'blur'}],
			simClipOperator:[{required: true, message: '请选择运营商', trigger: 'blur'}],
		}
	},
	//页面方法集锦
	methods:{
		//树形控件回调函数
		handleNodeClick:function(row){
			var _this = this;
			debugger
			_this.treeLabel = row.label;
			_this.evaAdd.administrativeCoding =row.areaCode;
			$.post(localPath+"/evaporate_survey_site/selectAll",{id:row.id},function(data){
				_this.evaporateList = data.data;
			});
		},
		handleCurrentChange:function(currentPage){
			var _this = this;
			_this.currentPage = currentPage;
		},
		handleSizeChange:function(pagesize){
			var _this = this;
			_this.pagesize = pagesize;
		},
		//新增按钮
		showTreeForm:function(row){
			var _this = this;
			debugger
			if(row==0){
				_this.evaAdd.evaporateName="";_this.evaAdd.coding="";_this.evaAdd.equipName="";_this.evaAdd.equipCoding="";
				_this.evaAdd.simClip="";_this.evaAdd.simClipOperator="";_this.evaAdd.buildTime="";_this.evaAdd.longitude="";
				_this.evaAdd.latitude="";_this.evaAdd.elevation="";_this.evaAdd.DetailAddress = "";_this.evaAdd.evaporateImage = "";
				_this.disaled = false;
			}else{
				_this.evaAdd = row;
				_this.evaAdd.longitude = ""+row.longitude;_this.evaAdd.latitude = ""+row.latitude;_this.evaAdd.elevation = ""+row.elevation;
				_this.evaAdd.DetailAddress = row.evaporateAddress;
			}
			
		},
		//图片上传检查函数
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
	        _this.evaAdd.evaporateImage = $("#seed").next("input[type='file']").val();
	        _this.disaled = true;
	        return isJPG && isLt2M;
		},
		successForms:function(response, file, fileList){
			var _this = this;
			debugger
			 _this.$message({
	                message: '提交成功！',
	                type: 'success'
	            });
			$('#myModal').modal('hide');
			_this.dialogVisible = false;
		},
		errorForms:function(response, file, fileList){
			var _this = this;
			debugger
			_this.$message({
                message: '提交失败！',
                type: 'warning'
            });
			$('#myModal').modal('hide');
			_this.dialogVisible = false;
		},
		//单独修改图片
		updateImage:function(row){
			var _this = this;
			_this.dialogVisible = true;
			_this.map.evaAdd = JSON.stringify(row);
			_this.$refs.upload.submit();
		},
		//修改数据
		UpdateForms:function(updateData){
			var _this = this;
			debugger
			_this.evaAdd.evaporateAddress = _this.evaAdd.DetailAddress;
			_this.$refs[updateData].validate(function(valid){
				$.post(localPath+"/evaporate_survey_site/updateData",{"evaAdd":JSON.stringify(_this.evaAdd)},function(data){
					if(data.state == 1){
						_this.$message({
			                message: '修改成功！',
			                type: 'success'
			            });
						$('#updateModal').modal('hide');
					}else{
						_this.$message({
			                message: '修改失败！',
			                type: 'warning'
			            });
						$('#updateModal').modal('hide');
					}
				});
			});
		},
		//删除数据
		deleteForms:function(index,row,list){
			var _this = this;
			debugger
			$.post(localPath+"/evaporate_survey_site/deleteData",{row:JSON.stringify(row)},function(data){
				if(data.state == 1){
					_this.$message({
		                message: '数据已删除！',
		                type: 'success'
		            });
					list.splice((_this.currentPage-1)*_this.pagesize+index,1);
				}else{
					_this.$message({
		                message: '数据未删除！',
		                type: 'warning'
		            });
				}
			});
			
			
			
		},
		//提交新增数据
		submitAdd:function(evaAdd){
			var _this = this;
			_this.$refs[evaAdd].validate(function(valid){
				if(valid){
					_this.evaAdd.evaporateAddress =_this.evaAdd.DetailAddress;
					_this.map.evaAdd = JSON.stringify(_this.evaAdd);
					_this.$refs.upload.submit();
				}else{
				}
			});
		},
		//提交修改表单updateData
		submitUpdate:function(){
			
		}
	},
	//初始化页面
	created:function(){
		var _this = this;
		debugger
		$.post(localPath+"/evaporate_survey_site/selectTree","",function(data){
			_this.treeMenus = data.data;
			_this.nodeKey = data.data['0'].children['0'].label;
			_this.treeLabel =  data.data['0'].label;
			_this.evaAdd.administrativeCoding = data.data['0'].areaCode;
			$.post(localPath+"/evaporate_survey_site/selectAll",{id:data.data['0'].id},function(data){
				_this.evaporateList = data.data;
			});
		});
		_this.imagePath = picPath+"/pic/";
	},
});