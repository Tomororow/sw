	//给父页面传值所用信息
	var index = parent.layer.getFrameIndex(window.name);
	
	function mySubmit(){
		 if($("#name").val()==null || $("#name").val()==""){
			layer.alert('用户姓名不能为空！', {icon: 0});
		 }else if($("#account").val()==null || $("#account").val()==""){
			 layer.alert('用户账号不能为空！', {icon: 0});
		 }else if($("#password").val()==null || $("#password").val()==""){
			 layer.alert('用户密码不能为空！', {icon: 0});
		 }else if($("#waterRightArea").val()==null || $("#waterRightArea").val()==""){
			 layer.alert('水权面积为必填项！', {icon: 0});
		 }else if($("#realArea").val()==null || $("#realArea").val()==""){
			 layer.alert('实有面积为必填项！', {icon: 0});
		 }		 
		 else{
			//关闭子页面
			parent.layer.close(index);
			//parent.layer.msg('您将标记 成功传送给了父窗口');
	        $('#form').submit();
		 }
		
    }