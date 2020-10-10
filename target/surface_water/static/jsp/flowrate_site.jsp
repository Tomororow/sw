
<%@ page language="java" contentType="text/html; charset=utf-8" pageEncoding="utf-8"%>

//水位站表格标题
function showFlowrateSiteTitle(){
	var currentTrTag = document.getElementById("title");
	var newTdTagTitle1 = document.createElement("td");
		var newInputTag1 =  document.createElement("input");
		newInputTag1.setAttribute("type", "checkbox");
		newInputTag1.setAttribute("id", "selFlowrateSiteAll");
		newInputTag1.setAttribute("onclick", "doSelectFlowrateSiteAll()");
		newTdTagTitle1.appendChild(newInputTag1);
	var newTdTagTitle2 = document.createElement("td");
		newTdTagTitle2.setAttribute("class", "w10");
		newTdTagTitle2.innerHTML="流量站名称";
	var newTdTagTitle3 = document.createElement("td");
		newTdTagTitle3.setAttribute("class", "w10");
		newTdTagTitle3.innerHTML="站点编码";
	var newTdTagTitle4 = document.createElement("td");
		newTdTagTitle4.setAttribute("class", "w10");
		newTdTagTitle4.innerHTML="建设时间";
	var newTdTagTitle5 = document.createElement("td");
		newTdTagTitle5.setAttribute("class", "w10");
		newTdTagTitle5.innerHTML="地址";
	var newTdTagTitle6 = document.createElement("td");
		newTdTagTitle6.setAttribute("class", "w10");
		newTdTagTitle6.innerHTML="水位站编码";
	var newTdTagTitle7 = document.createElement("td");
		newTdTagTitle7.setAttribute("class", "w10");
		newTdTagTitle7.innerHTML="流量站编码";
	var newTdTagTitle8 = document.createElement("td");
		newTdTagTitle8.setAttribute("class", "w10");
		newTdTagTitle8.innerHTML="备注";
	var newTdTagTitle9 = document.createElement("td");
		newTdTagTitle9.setAttribute("class", "w10");
		newTdTagTitle9.innerHTML="操作";
		currentTrTag.appendChild(newTdTagTitle1);
		currentTrTag.appendChild(newTdTagTitle2);
		currentTrTag.appendChild(newTdTagTitle3);
		currentTrTag.appendChild(newTdTagTitle4);
		currentTrTag.appendChild(newTdTagTitle5);
		currentTrTag.appendChild(newTdTagTitle6);
		currentTrTag.appendChild(newTdTagTitle7);
		currentTrTag.appendChild(newTdTagTitle8);
		currentTrTag.appendChild(newTdTagTitle9);
		
}

//水位站表格数据
function showFlowrateSiteData(msg){
	for(var i=0;i<msg.length;i++){
		
		var currentTag = document.getElementById("table_list");
		var newTrTag = document.createElement("tr");
			var newTdTag1 = document.createElement("td");
				var newInputTag2 = document.createElement("input");
				newInputTag2.setAttribute("type", "checkbox");
				newInputTag2.setAttribute("name", "selectedFlowrateSiteRow");
				newInputTag2.setAttribute("value", msg[i].id);
				newTdTag1.appendChild(newInputTag2);
				
			var newTdTag2 = document.createElement("td");
			    newTdTag2.innerHTML=msg[i].fsiFlowrateName;	
			    
			var newTdTag3 = document.createElement("td");
			    newTdTag3.innerHTML=msg[i].fsiFlowrateCode;
			var newTdTag4 = document.createElement("td");
			    newTdTag4.innerHTML=msg[i].fsiBuildTime;
			    
			var newTdTag5 = document.createElement("td");
			    newTdTag5.innerHTML=msg[i].fsiFlowrateAddr;
			    
			var newTdTag6 = document.createElement("td");
			    newTdTag6.innerHTML=msg[i].fsiWaterCode;
			var newTdTag7 = document.createElement("td");
		    	newTdTag7.innerHTML=msg[i].fsiSpeedCode;
		    var newTdTag8 = document.createElement("td");
		    	newTdTag8.innerHTML=msg[i].fsiRemark;	
			var newTdTag9 = document.createElement("td");
				var id = JSON.stringify(msg[i].id);
				newTdTag9.innerHTML="<a href='javascript\:doFlowrateSiteEdit("+id+")'>修改</a>|<a href='javascript\:doFlowrateSiteDelete("+id+")'>删除</a>"
				newTrTag.appendChild(newTdTag1);
				newTrTag.appendChild(newTdTag2);
				newTrTag.appendChild(newTdTag3);
				newTrTag.appendChild(newTdTag4);
				newTrTag.appendChild(newTdTag5);
				newTrTag.appendChild(newTdTag6);
				newTrTag.appendChild(newTdTag7);
				newTrTag.appendChild(newTdTag8);										
				newTrTag.appendChild(newTdTag9);
				
			currentTag.appendChild(newTrTag);
		}
}