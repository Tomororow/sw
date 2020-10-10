var addForms = new Vue({
			el:'#addForms',
			//初始化数据类型
			data:{
				ruleForm:{
					monitorName:'',
					coding:'',
					elevation:'',
					longitude:'',
					latitude:'',
					administrativeCoding:'',
					riverwayCoding:'',
					elevation:'',
					waterGrade:0,
					waterImage:'',
					detailAddress:'',
					equipCoding:'',
					simClip:'',
					simClipOperator:'',
					buildTime:'',
					longitudeLatitude:'',
					monitorAddress:'',
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
				imageUrl:'',
				waterGradeSlide:0,
				rules:{
					monitorName:[{required: true, message: '请输入监测站名称', trigger: 'blur'}],
					coding:[{required: true, message: '请输入监测站编码', trigger: 'blur'}],
					longitude:[{required: true, message: '请输入经度', trigger: 'blur'}],
					latitude:[{required: true, message: '请输入纬度', trigger: 'blur'}],
					elevation:[{required: true, message: '请输入高程', trigger: 'blur'}],
					waterGrade:[{required: true, message: '请选择水质等级'}],
					detailAddress:[{required: true, message: '请填写详细信息', trigger: 'blur'}],
					waterImage:[{required: true, message: '请上传图片', trigger: 'blur'}],
					equipCoding:[{required: true, message: '请填写设备编码', trigger: 'blur'}],
					simClip:[{required: true, message: '请填写sim卡号', trigger: 'blur'}],
					simClipOperator:[{required: true, message: '请填写运营商', trigger: 'blur'}],
					},
					disaled:false,
					map:{},
				},
			//页面犯法集锦
			methods:{
				//格式化水质等级
				formatTooltip:function(value){
					var _this = this;
					 return value == 20 ? "Ⅰ类":''||value == 40 ? "Ⅱ类":''|| value == 60 ? "Ⅲ类":''|| value == 80 ? "Ⅳ类":''|| value == 100 ?"Ⅴ类":'请选择';
				},
				//提交按钮
				submitForm:function(ruleForm){
					debugger
					sessionStorage.obj = "";
					var _this = this;
					_this.$refs[ruleForm].validate(function(valid){
						if (valid) {
							_this.ruleForm.longitudeLatitude = _this.ruleForm.longitude+"-"+_this.ruleForm.latitude;
							_this.ruleForm.monitorAddress = _this.ruleForm.detailAddress;;
							_this.map.ruleForm = JSON.stringify(_this.ruleForm);
							_this.$refs.upload.submit();
								var inex=parent.layer.getFrameIndex(window.name);
								layer.open({
									  title:"成功",
									  content: '新增【'+_this.ruleForm.monitorName+'】监测站成功',
									  shade: 0,//遮罩层
									  yes: function(index, layero){
										  parent.layer.close(inex);
										  }
									}); 
								
				          } else {
				        	 
				          }
						
					});
				},
				handleSuccess:function(response, file, fileList){
					var _this = this;
					debugger
				},
				//重置按钮
				resetForm:function(formName){
					var _this = this;
					_this.$refs[formName].resetFields();
				},
				
				handleChange:function(file,fileList){
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
			        _this.ruleForm.waterImage = $("#see").next("input[type='file']").val();
			        _this.disaled = true;
			        return isJPG && isLt2M;
				},
			},
			//初始化页面
			created:function(){
				var _this = this;
				var url ;
				for(var i=0;i<4;i++){
				  	url=window.location.href.indexOf("/",url+1);
					}
				_this.imageUrl = window.location.href.substring(0,url)+"/water_survey_site/fileUpLoad";
				_this.ruleForm.administrativeCoding = JSON.parse(sessionStorage.obj)[0];
				_this.ruleForm.riverwayCoding = JSON.parse(sessionStorage.obj)[1];
				
				},
				
			});