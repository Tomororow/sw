
<%@ page language="java" contentType="text/html; charset=utf-8" pageEncoding="utf-8"%>

//水位站表格标题
function showSpeedSiteTitle(){
	var currentTrTag = document.getElementById("title");
	var newTdTagTitle1 = document.createElement("td");
		var newInputTag1 =  document.createElement("input");
		newInputTag1.setAttribute("type", "checkbox");
		newInputTag1.setAttribute("id", "selSpeedSiteAll");
		newInputTag1.setAttribute("onclick", "doSelectSpeedSiteAll()");
		newTdTagTitle1.appendChild(newInputTag1);
	var newTdTagTitle2 = document.createElement("td");
		newTdTagTitle2.setAttribute("class", "w10");
		newTdTagTitle2.innerHTML="水位站名称";
	var newTdTagTitle3 = document.createElement("td");
		newTdTagTitle3.setAttribute("class", "w10");
		newTdTagTitle3.innerHTML="建设时间";
	var newTdTagTitle4 = document.createElement("td");
		newTdTagTitle4.setAttribute("class", "w10");
		newTdTagTitle4.innerHTML="站点卡号";
	var newTdTagTitle5 = document.createElement("td");
		newTdTagTitle5.setAttribute("class", "w10");
		newTdTagTitle5.innerHTML="经度";
	var newTdTagTitle6 = document.createElement("td");
		newTdTagTitle6.setAttribute("class", "w10");
		newTdTagTitle6.innerHTML="纬度";
	var newTdTagTitle7 = document.createElement("td");
		newTdTagTitle7.setAttribute("class", "w10");
		newTdTagTitle7.innerHTML="安装前照片";
	var newTdTagTitle8 = document.createElement("td");
		newTdTagTitle8.setAttribute("class", "w10");
		newTdTagTitle8.innerHTML="安装后照片";
	var newTdTagTitle9 = document.createElement("td");
		newTdTagTitle9.setAttribute("class", "w10");
		newTdTagTitle9.innerHTML="备注";
	var newTdTagTitle10 = document.createElement("td");
		newTdTagTitle10.setAttribute("class", "w10");
		newTdTagTitle10.innerHTML="操作";
		currentTrTag.appendChild(newTdTagTitle1);
		currentTrTag.appendChild(newTdTagTitle2);
		currentTrTag.appendChild(newTdTagTitle3);
		currentTrTag.appendChild(newTdTagTitle4);
		currentTrTag.appendChild(newTdTagTitle5);
		currentTrTag.appendChild(newTdTagTitle6);
		currentTrTag.appendChild(newTdTagTitle7);
		currentTrTag.appendChild(newTdTagTitle8);
		currentTrTag.appendChild(newTdTagTitle9);
		currentTrTag.appendChild(newTdTagTitle10);
}

//水位站表格数据
function showSpeedSiteData(msg){
	for(var i=0;i<msg.length;i++){
		
		var currentTag = document.getElementById("table_list");
		var newTrTag = document.createElement("tr");
			var newTdTag1 = document.createElement("td");
				var newInputTag2 = document.createElement("input");
				newInputTag2.setAttribute("type", "checkbox");
				newInputTag2.setAttribute("name", "selectedSpeedSiteRow");
				newInputTag2.setAttribute("value", msg[i].id);
				newTdTag1.appendChild(newInputTag2);
				
			var newTdTag2 = document.createElement("td");
			    newTdTag2.innerHTML=msg[i].ssiName;	
			    
			var newTdTag3 = document.createElement("td");
			    newTdTag3.innerHTML=msg[i].ssiBuildTime;
			 var newTdTag4 = document.createElement("td");
			    newTdTag4.innerHTML=msg[i].ssiSimNumber;
			    
			    var newTdTag5 = document.createElement("td");
			    newTdTag5.innerHTML=msg[i].ssiLongitude;
			    
			    var newTdTag6 = document.createElement("td");
			    newTdTag6.innerHTML=msg[i].ssiLatitude;
				
		var newTdTag7 = document.createElement("td");
			//图片回显
			var newImgTag1 = document.createElement("img");
				newImgTag1.setAttribute("src", "${picPath}/pic/"+msg[i].ssiPhotoBefore);
				newImgTag1.setAttribute("id", msg[i].id);
				newImgTag1.setAttribute("width", "50");
				newImgTag1.setAttribute("height", "50");
				
				var id = JSON.stringify(msg[i].id);
				var ssiPhotoBeforeImg ="\"${picPath}/pic/"+msg[i].ssiPhotoBefore+"\"";
				//alert(canalBuildingImg);
				newImgTag1.setAttribute("onclick", "showPhoto("+id+","+ssiPhotoBeforeImg+")");
				newTdTag7.appendChild(newImgTag1);
					
					
		var newTdTag8 = document.createElement("td");
		//图片回显
		var newImgTag2 = document.createElement("img");
			newImgTag2.setAttribute("src", "${picPath}/pic/"+msg[i].ssiPhotoAfter);
			newImgTag2.setAttribute("id", msg[i].id);
			newImgTag2.setAttribute("width", "50");
			newImgTag2.setAttribute("height", "50");
			
			var id = JSON.stringify(msg[i].id);
			var ssiPhotoAfterImg ="\"${picPath}/pic/"+msg[i].ssiPhotoAfter+"\"";
			//alert(canalBuildingImg);
			newImgTag2.setAttribute("onclick", "showPhoto("+id+","+ssiPhotoAfterImg+")");
			newTdTag8.appendChild(newImgTag2);	
			var newTdTag9 = document.createElement("td");
		    newTdTag9.innerHTML=msg[i].ssiRemark;
			var newTdTag10 = document.createElement("td");
				var id = JSON.stringify(msg[i].id);
				newTdTag10.innerHTML="<a href='javascript\:doSpeedSiteEdit("+id+")'>修改</a>|<a href='javascript\:doSpeedSiteDelete("+id+")'>删除</a>"
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