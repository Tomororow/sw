var url ;
   for(var i=0;i<4;i++){
	  url=window.location.href.indexOf("/",url+1);
   }
   var localPath = window.location.href.substring(0,url);
var updateForm = new Vue({
	el:'#updateForm',
	//初始化数据类型
	data:{
		updateData:{
			monitorName:'',
			coding:'',
			elevation:'',
			longitude:'',
			latitude:'',
			elevation:'',
			waterGrade:0,
			detailAddress:'',
			longitudeLatitude:'',
			monitorAddress:'',
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
	},
	//页面方法集锦
	methods:{
		//格式化水质等级
		formatTooletip:function(value){
			debugger
			var _this = this;
			 return value == 20 ? "Ⅰ类":''||value == 40 ? "Ⅱ类":''|| value == 60 ? "Ⅲ类":''|| value == 80 ? "Ⅳ类":''|| value == 100 ?"Ⅴ类":'请选择';
		},
		changeUpdate:function(value){
			var _this = this;
			debugger
			_this.updateData.waterGrade = value;
			
		},
		//提交按钮
		submitForm:function(){
			var _this = this;
			debugger
			_this.updateData.longitudeLatitude = _this.updateData.longitude+"-"+_this.updateData.latitude;
			_this.updateData.monitorAddress =_this.updateData.detailAddress;
			$.post(localPath+"/water_survey_site/waterUpdate",{"waterUpdate":JSON.stringify(_this.updateData)},function(result){
				if(result.state==1){
					 var inex=parent.layer.getFrameIndex(window.name);
						layer.open({
							  title:"成功",
							  content: '修改【'+_this.updateData.monitorName+'】监测站成功',
							  shade: 0,//遮罩层
							  yes: function(index, layero){
								  parent.layer.close(inex);
								  }
							}); 
				}else{
					
				}
			});
			
	                  
			
		},
		
	},
	//初始化页面
	created:function(){
		var _this = this;
		debugger
		$.post(localPath+"/water_survey_site/waterUpdates","",function(data){
			_this.updateData = data.data;
			_this.updateData.longitude = data.data.longitudeLatitude.split("-")[0];
			_this.updateData.latitude = data.data.longitudeLatitude.split("-")[1];
			_this.updateData.waterGrade = Number(data.data.waterGrade);
			_this.updateData.detailAddress =data.data.monitorAddress;
			
		});
	
	
	},
	
});