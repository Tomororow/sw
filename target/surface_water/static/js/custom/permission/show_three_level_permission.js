

//渲染列表的三级权限显示公共方法
function showThreeLevelPermission(threeLevelPermission,id){
	debugger
	if(threeLevelPermission instanceof Array){
	}else{
		threeLevelPermission = threeLevelPermission.split(",");
	}
	var innerHTML = "";
	innerHTML+="|<a href='javascript\:doEdit("+id+")'>修改</a>";
	innerHTML+="|<a href='javascript\:doDelete("+id+")'>删除</a>";
	innerHTML+="|<a href='javascript\:doDetail("+id+")'>详情</a>";
	return innerHTML+"|";
}


//渠道管理页面专用方法

//渲染列表的三级权限显示公共方法
function showThreeLevelPermissionOfCanalPhoto(threeLevelPermission,id){
	
	
	if(threeLevelPermission instanceof Array){
	}else{
		threeLevelPermission = threeLevelPermission.split(",");
	}
	
	var innerHTML = "";
	if(threeLevelPermission.length>0){
		for(var j=0;j<threeLevelPermission.length;j++){
			if(threeLevelPermission[j].substring(0, 4)=="edit"){
				innerHTML+="|<a href='javascript\:doEditCanalPhoto("+id+")'>修改</a>";
			}else if(threeLevelPermission[j].substring(0, 6)=="delete"){
				innerHTML+="|<a href='javascript\:doDeleteCanalPhoto("+id+")'>删除</a>";
			}else if(threeLevelPermission[j].substring(0, 6)=="detail"){
				innerHTML+="|<a href='javascript\:doDetail("+id+")'>详情</a>";
			}
		}
	}
	
	return innerHTML+"|";
}

function showThreeLevelPermissionOfCanalSluice(threeLevelPermission,id){
	
	
	if(threeLevelPermission instanceof Array){
	}else{
		threeLevelPermission = threeLevelPermission.split(",");
	}
	
	var innerHTML = "";
	if(threeLevelPermission.length>0){
		for(var j=0;j<threeLevelPermission.length;j++){
			if(threeLevelPermission[j].substring(0, 4)=="edit"){
				innerHTML+="|<a href='javascript\:doEditCanalSluice("+id+")'>修改</a>";
			}else if(threeLevelPermission[j].substring(0, 6)=="delete"){
				innerHTML+="|<a href='javascript\:doDeleteCanalSluice("+id+")'>删除</a>";
			}else if(threeLevelPermission[j].substring(0, 6)=="detail"){
				innerHTML+="|<a href='javascript\:doDetail("+id+")'>详情</a>";
			}
		}
	}
	
	return innerHTML+"|";
}


function showThreeLevelPermissionOfCanalBuilding(threeLevelPermission,id){
	
	
	if(threeLevelPermission instanceof Array){
	}else{
		threeLevelPermission = threeLevelPermission.split(",");
	}
	
	var innerHTML = "";
	if(threeLevelPermission.length>0){
		for(var j=0;j<threeLevelPermission.length;j++){
			if(threeLevelPermission[j].substring(0, 4)=="edit"){
				innerHTML+="|<a href='javascript\:doEditCanalBuilding("+id+")'>修改</a>";
			}else if(threeLevelPermission[j].substring(0, 6)=="delete"){
				innerHTML+="|<a href='javascript\:doDeleteCanalBuilding("+id+")'>删除</a>";
			}else if(threeLevelPermission[j].substring(0, 6)=="detail"){
				innerHTML+="|<a href='javascript\:doDetail("+id+")'>详情</a>";
			}
		}
	}
	
	return innerHTML+"|";
}