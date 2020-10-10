
	//给父页面传值所用信息
	var index = parent.layer.getFrameIndex(window.name);
	function mySubmit(){
		var reg = /^[0-9]*$/;
		var age = /^[\-\+]?(0?\d{1,2}\.\d{1,10}|1[0-7]?\d{1}\.\d{1,10}|180\.0{1,10})$/;
		var msg = /^[\-\+]?([0-8]?\d{1}\.\d{1,10}|90\.0{1,10})$/;
	//	var avg = /^[a-zA-Z/d/.]+$ ;
		if($("#deviceSluiceCode").val()==null || $("#deviceSluiceCode").val()==""){
			//墨绿深蓝风
			/* layer.alert('闸门站编码不能为空！', {
			  skin: 'layui-layer-lan' //样式类名
			  ,closeBtn: 0
			}); */
		//	alert("你好");
			layer.alert('闸门站编码不能为空！', {icon: 0});
		}else if($("#deviceSluiceName").val()==null || $("#deviceSluiceName").val()==""){
			layer.alert('闸门站名称不能为空！', {icon: 0});
		}else if($("#ssiDeviceNo").val()==null || $("#ssiDeviceNo").val()==""){
			layer.alert('闸门站设备编码不能为空！', {icon: 0});
		}else if($("#ssiDevicemodelCode option:selected").val()==null || $("#ssiDevicemodelCode option:selected").val()==""){
			layer.alert('请选择水位计类型！', {icon: 0});
		}else if($("#ssiBuildTime").val()==null || $("#ssiBuildTime").val()==""){
			layer.alert('请选择站点建设时间！', {icon: 0});
		}else if($("#deviceSluiceCode").val()==null || $("#deviceSluiceCode").val()==""){
			layer.alert('水位计类型！', {icon: 0});
		}else if($("#ssiSimcard").val()==null || $("#ssiSimcard").val()==""){
			layer.alert('站点SIM卡号不能为空！', {icon: 0});
		}
		else if(!reg.test($("#ssiSimcard").val())){
			//正则验证sim号不能为非数字
			layer.alert('SIM卡号只能为0~9的数字！', {icon: 0});
		}
		else if($("#ssiSimoperator").val()==null || $("#ssiSimoperator").val()==""){
			layer.alert('站点SIM运营商不能为空！', {icon: 0});
		}else if($("#ssiLongitude").val()==null || $("#ssiLongitude").val()==""){
			layer.alert('闸门站经度不能为空！', {icon: 0});
		}
		else if(!age.test($("#ssiLongitude").val())){
			layer.alert('-180.0～+180.0（整数部分为0～180，必须输入1到10位小数）!', {icon: 0});
		}
		else if($("#ssiLatitude").val()==null || $("#ssiLatitude").val()==""){
			layer.alert('闸门站纬度不能为空！', {icon: 0});
		}
		else if(!msg.test($("#ssiLatitude").val())){
			layer.alert('纬度在-90.0～+90.0（整数部分为0～90，必须输入1到10位小数）!', {icon: 0});
		}
		else if($("#ssiHeight").val()==null || $("#ssiHeight").val()==""){
			layer.alert('闸门站海拔不能为空！', {icon: 0});
		}
		/* else if(!avg.test($("#ssiHeight").val())){
			layer.alert('闸门站海拔高度只能为0~9的数字，必须输入1到10位小数！', {icon: 0});
		} */
		/*else if($("#sluiceBeforeSiteWaterId option:selected").val()==null || $("#sluiceBeforeSiteWaterId").val()==""){
			layer.alert('闸前水位站不能为空！', {icon: 0});
		}else if($("#sluiceAfterSiteWaterId option:selected").val()==null || $("#sluiceAfterSiteWaterId").val()==""){
			layer.alert('闸后水位站不能为空！', {icon: 0});
		}else if($("#sluiceMovieSiteId").val()==null || $("#sluiceMovieSiteId").val()==""){
			layer.alert('请选择关联视频站！', {icon: 0});
		}else if($("#sluiceBeforeSiteWaterId option:selected").val()==$("#sluiceAfterSiteWaterId option:selected").val()){
			layer.alert('闸前水位站和闸后水位站不能为同一站点！', {icon: 0});
		}*/else if($("#ssiAddr").val()==null || $("#ssiAddr").val()==""){
			layer.alert('闸门站详细地址不能空！', {icon: 0});
		}else{
			parent.layer.close(index);
			//parent.layer.msg('您将标记 成功传送给了父窗口');
	        $('#form').submit(); 
	    }
	}
	
	
	
	
	
	
