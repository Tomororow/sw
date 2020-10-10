/添加区域弹窗
	 function addWaterArea(){
		 alert("hahah");
		 var id = readCookie ("currentNodeId");
		 alert(id);
		  layer.open({
		        type: 1
		        ,title: false //不显示标题栏
		        ,closeBtn: false
		        ,area: '300px;'
		        ,shade: 0.8
		        ,id: 'LAY_layuipro' //设定一个id，防止重复弹出
		        ,btn: ['考虑一下', '我已确定']
		        ,btnAlign: 'c'
		        ,moveType: 1 //拖拽模式，0或者1
		        ,content: '<div style="padding: 50px; line-height: 22px; background-color: #393D49; color: #fff; font-weight: 300;">'+
		      					'所属区域'+id+
		        
		        				'<form action="" method="post">'+
		        					'上级id：<input hidden="hidden" type="text" name="parentWaterareaId" value="'+id+'" style="color:black;"/>'+
					       		 	'区域编码：<input type="text" name="waterAreaCode" value="" style="color:black;"/>'+
					        		'区域名称：<input type="text" name="waterAreaName" value="" style="color:black;"/>'+
					        		'备        注：<input type="text" name="swaRemark" value="" style="color:black;"/>'+
					        		//'<input type="button" value="确定" style="color:black;"/>'+
					        		//'<input type="button" value="取消" style="color:black;"/>'+
				        		'</form>'+
			       		 '</div>'
		        ,btn2: function(){
        			document.forms[0].action="${ctx}/sys_water_area/add";
        			document.forms[0].submit();
		        }
		      });
	  }
	

var setting = {
            view: {
                addHoverDom: addHoverDom,
                removeHoverDom: removeHoverDom,
                selectedMulti: false
            },
            check: {
                enable: true
            },
            data: {
                simpleData: {
                    enable: true
                }
            },
            edit: {
                enable: true
            }

	};
	
	
var zNodes=[];


function showNodes(){
	alert("1111");
	var zNode;
	<c:forEach items="${sysWaterAreaList}" var="sysWaterArea">
		var id="${sysWaterArea.id}";
		var pId="${sysWaterArea.parentWaterareaId}";
		var name="${sysWaterArea.waterAreaName}";
		zNode={id:id, pId:pId, name:name,click:"hello('${sysWaterArea.id}');", open:true};
		zNodes.push(zNode);
		
	</c:forEach>
}
	
var newCount = 1;
function addHoverDom(treeId, treeNode) {
    var sObj = $("#" + treeNode.tId + "_span");
    if (treeNode.editNameFlag || $("#addBtn_"+treeNode.tId).length>0) return;
    var addStr = "<span class='button add' id='addBtn_" + treeNode.tId
        + "' title='add node' onfocus='this.blur();'></span>";
    sObj.after(addStr);
    var btn = $("#addBtn_"+treeNode.tId);
    if (btn) btn.bind("click", function(){
    	
    	addWaterArea();
    	
        var zTree = $.fn.zTree.getZTreeObj("treeDemo");
        //alert(100+newCount);
        zTree.addNodes(treeNode, {id:(100 + newCount), pId:treeNode.id, name:"new node"+ (newCount++),click:"hello()"});
        return false;
    });
};
function removeHoverDom(treeId, treeNode) {
    $("#addBtn_"+treeNode.tId).unbind().remove();
};



function hello(id){
	
	writeCookie("currentNodeId",id,1);
	$("#table_list").empty();
	
	$.ajax({
		url:"${ctx}/sys_water_area/list_table",
		data: {id:id},
		type: "post",
		async: false,//非异步
		success: function(msg){
			var table = msg;
			for(var i=0;i<msg.length;i++){
				var currentTag = document.getElementById("table_list");
					var newTrTag = document.createElement("tr");
						var newTdTag1 = document.createElement("td");
							var newInputTag = document.createElement("input");
							newInputTag.setAttribute("type", "checkbox");
							
							newTdTag1.appendChild(newInputTag);
						var newTdTag2 = document.createElement("td");
							newTdTag2.innerHTML=msg[i].waterAreaCode;
						var newTdTag3 = document.createElement("td");
							newTdTag3.innerHTML=msg[i].waterAreaName;
						var newTdTag4 = document.createElement("td");
							newTdTag4.innerHTML=msg[i].waterAreaLevel;
						var newTdTag5 = document.createElement("td");
							newTdTag5.innerHTML=msg[i].parentWaterareaId;
						var newTdTag6 = document.createElement("td");
							newTdTag6.innerHTML=msg[i].swaCreateTime;
						var newTdTag7 = document.createElement("td");
							newTdTag7.innerHTML=msg[i].swaEditTime;
						var newTdTag8 = document.createElement("td");
							newTdTag8.innerHTML=msg[i].swaRemark;
							
							newTrTag.appendChild(newTdTag1);
							newTrTag.appendChild(newTdTag2);
							newTrTag.appendChild(newTdTag3);
							newTrTag.appendChild(newTdTag4);
							newTrTag.appendChild(newTdTag5);
							newTrTag.appendChild(newTdTag6);
							newTrTag.appendChild(newTdTag7);
							newTrTag.appendChild(newTdTag8);
						currentTag.appendChild(newTrTag);
			
			}
			
		}
	});
}


window.onload=function(){ 
	showNodes(); 
	 $.fn.zTree.init($("#treeDemo"), setting, zNodes);
}