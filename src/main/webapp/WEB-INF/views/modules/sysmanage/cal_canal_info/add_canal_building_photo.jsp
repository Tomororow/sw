<%@ page language="java" contentType="text/html; charset=utf-8" pageEncoding="utf-8"%>
<%@ include file="/WEB-INF/views/base.jsp"%>

<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
	<meta http-equiv="Content-Type" content="text/html; charset=utf-8">
	<meta http-equiv="X-UA-Compatible" content="IE=Edge">
	<meta name="viewport" content="width=device-width, initial-scale=1,maximum-scale=1, user-scalable=no">
	<title>灌区信息化平台</title>
	<link type="text/css" rel="stylesheet" href="${ctxstc}/adapters/bootstrap/css/bootstrap.min.css" title="" />
	<link type="text/css" rel="stylesheet" href="${ctxstc}/css/body.css" title="" />
	<link type="text/css" rel="stylesheet" href="${ctxstc}/css/style.css" title="" />
	<link type="text/css" rel="stylesheet" href="${ctxstc}/css/dermadefault.css" title="blue" />
	<link type="text/css" rel="stylesheet" href="${ctxstc}/css/templatecss.css" title="" />
	<link type="text/css" rel="stylesheet" href="${ctxstc}/css/ui-layout.css" title="" /><!-- angular ui --->
	<link type="text/css" rel="stylesheet" href="${ctxstc}/css/custom/scroll.css" title="" /><!-- 滚动条样式 --->
	
	<script type="text/javascript" src="${ctxstc}/jquery/jquery-1.11.1.min.js"></script>
	
	<script type="text/javascript" src="${ctxstc}/jquery/jquery.cookie.js"></script>
	<script type="text/javascript" src="${ctxstc}/adapters/bootstrap/js/bootstrap.min.js"></script>
	<script type="text/javascript" src="${ctxstc}/adapters/bootstrap/js/bootstrap-paginator.js"></script>
	<script type="text/javascript" src="${ctxstc}/js/style.js"></script>
	<script type="text/javascript" src="${ctxstc}/js/angular.min.js"></script><!-- angular ui --->
	<script type="text/javascript" src="${ctxstc}/js/ui-layout.js"></script>

	<!--  
	<link rel="stylesheet" href="${ctxstc}/adapters/ztree/css/demo.css" type="text/css">-->
	<link rel="stylesheet" href="${ctxstc}/adapters/ztree/css/zTreeStyle/zTreeStyle.css" type="text/css">
	<link rel="stylesheet" href="${ctxstc}/adapters/layui/css/layui.css" type="text/css">
	
	<script type="text/javascript" src="${ctxstc}/adapters/ztree/js/jquery.ztree.core.js"></script>
	
    <link rel="stylesheet" href="${ctxstc}/adapters/ztree/css/metroStyle/metroStyle.css" type="text/css">
    <script type="text/javascript" src="${ctxstc}/adapters/ztree/js/jquery.ztree.excheck.js"></script>
    <script type="text/javascript" src="${ctxstc}/adapters/ztree/js/jquery.ztree.exedit.js"></script>
	<script type="text/javascript" src="${ctxstc}/datepicker/WdatePicker.js "></script>
	 <script src="${ctxstc}/adapters/layui/layer/layer.js"></script>
	 <script type="text/javascript" src="${ctxstc}/js/custom/water_area_cook.js"></script>

	<style>
		.topbar-nav-item a{color: red;}
		.topbar-nav-item a:hover{color: blue;}
	  </style>
</head>
<body >
		<div style="padding: 30px; line-height: 22px; background-color: #393D49; color: #fff; font-weight: 300;">
  					
    				<form  id="form" action="${ctx}/cal_canal_info/add_canal_photo" method="post" enctype="multipart/form-data">
    				
    				<table class="table table-bordered table-header">
						<tr>
							<td id="photo" class="w18" rowspan="" colspan="4">
									 <!--   <div class="layui-upload">
									  <button type="button" class="layui-btn" id="test2">多图片上传</button> 
									  <blockquote class="layui-elem-quote layui-quote-nm" style="margin-top: 10px;">
									    预览图：
									    <div class="layui-upload-list" id="demo2"></div>
									 </blockquote>
							</div>-->
									
								<div class="layui-upload">
								  <button type="button" class="layui-btn layui-btn-normal" id="testList">选择多文件</button> 
								  <div class="layui-upload-list">
								    <table class="layui-table">
									  <thead>
								        <tr>
									        <th>文件名</th>
									        <th>大小</th>
									        <th>所属渠道</th>
									        <th>照片备注</th>
									        <th>状态</th>
									        <th>操作</th>
									     </tr>
								      </thead>
								      <tbody id="demoList"></tbody>
								    </table>
								  </div>
								  <button type="button" class="layui-btn" id="testListAction">开始上传</button>
								</div> 
							</td>
						</tr>
    				</table>
	        		</form>
       		 </div>
	
	<script type="text/javascript" src="${ctxstc}/js/footer.js"></script>
	<script type="text/javascript" src="${ctxstc}/js/custom/water_area_cook.js"></script>
	<script type="text/javascript" src="${ctxstc}/datepicker/WdatePicker.js "></script>
	<script src="${ctxstc}/adapters/layui/layui.js" charset="utf-8"></script>
	
	
	<script>
	var fileNumber = 0;
	function addPhoto(){
		fileNumber++;
		var currenTag = document.getElementById("photo");
		var newInputTag = document.createElement("input");
			newInputTag.setAttribute("type","file");
			newInputTag.setAttribute("name","files");
			newInputTag.setAttribute("style","color:black;width:180px;");
			newInputTag.setAttribute("onchange","addPhoto()");
		var newInputTag2 = document.createElement("input");
			newInputTag2.setAttribute("type","text");
			newInputTag2.setAttribute("name","calCanalPhotoList["+fileNumber+"].ccpRemark");
			newInputTag2.setAttribute("style","color:black;width:180px;");
			currenTag.appendChild(newInputTag);
			currenTag.appendChild(newInputTag2);
	}
	
	//给父页面传值所用信息
	var index = parent.layer.getFrameIndex(window.name);
	
	function mySubmit(){
		/*
		//获取渠道材料
		var canalmaterialCodeSelect = document.getElementById("canalmaterialCodeSelect");
		var canalmaterialCodeSelectValue = canalmaterialCodeSelect.options[canalmaterialCodeSelect.selectedIndex].value;
		var canalmaterialCodeInput =  document.getElementById("canalmaterialCode");
		canalmaterialCodeInput.value=canalmaterialCodeSelectValue;
		//获取渠道类型
		var canalTypeCodeSelect = document.getElementById("canalTypeCodeSelect");
		var canalTypeCodeSelectValue = canalTypeCodeSelect.options[canalTypeCodeSelect.selectedIndex].value;
		alert(canalTypeCodeSelectValue);
		var canalTypeCodeInput =  document.getElementById("canalTypeCode");
		canalTypeCodeInput.value=canalTypeCodeSelectValue;
		//获取渠道用途
		var canalUsetypeCodeSelect = document.getElementById("canalUsetypeCodeSelect");
		var canalUsetypeCodeSelectValue = canalUsetypeCodeSelect.options[canalUsetypeCodeSelect.selectedIndex].value;
		var canalUsetypeCodeInput =  document.getElementById("canalUsetypeCode");
		canalUsetypeCodeInput.value=canalUsetypeCodeSelectValue;
		*/
		//关闭子页面
		parent.layer.close(index);
		//parent.layer.msg('您将标记 成功传送给了父窗口');
        $('#form').submit();
    }
	function waterAreaChange(a){
		
		delCookie("id");
		//alert(a);
		var paramArray = a.split(",");  
	    	var id = paramArray[0];  
	    	var level =parseInt(paramArray[1]);
	    	var name =paramArray[2];
	    	//alert(name+"rww");
	    	//选择已经显示的区域名称
	    	var content = "";
	    	if(name!=0){
	    		//alert(name+"rww22");
	    		for(var i=0;i<=level;i++){
	    			//alert(name+i);
	    			var selectTag=document.getElementById("select2"+i);
	    			
	    			var optionValue = selectTag.options[selectTag.selectedIndex].value;
		    			var optionParamArray = optionValue.split(",");  
		    			var optionLevel = optionParamArray[1]; 
		    	    	var optionName = optionParamArray[2]; 
		    	    	content=content+("{=="+optionLevel+":"+optionName+"==}-->");
	    		}
	    		
	    		
	    		var waterAreaSpan = document.getElementById("waterAreaSpan");
	    		waterAreaSpan.innerHTML=content;
	    	}else{
	    		if(level==0){
	    			content="无";
	    		}
	    		for(var i=0;i<level;i++){
	    			//alert(name+i);
	    			var selectTag=document.getElementById("select2"+i);
	    			
	    			var optionValue = selectTag.options[selectTag.selectedIndex].value;
		    			var optionParamArray = optionValue.split(",");  
		    			
		    			var optionLevel = optionParamArray[1]; 
		    	    	var optionName = optionParamArray[2]; 
		    	    	content=content+("{=="+optionLevel+":"+optionName+"==}-->");
	    		}
	    		
	    		
	    		var waterAreaSpan = document.getElementById("waterAreaSpan");
	    		waterAreaSpan.innerHTML=content;
	    	}
	    	
	    	
	    	if(id!="waterArea"){
	    		setCookie("id",id);
	    	}else if(id=="waterArea"){
	    		
	    		if(level<=0){
	    			setCookie("id","");
	    		}else{
	    			var selectTag = document.getElementById("select2"+(level-1));
	    			
	    			var optionValue = selectTag.options[selectTag.selectedIndex].value;
		    			var optionParamArray = optionValue.split(",");  
		    	    	var optionId = optionParamArray[0]; 
		    	    	setCookie("id",optionId);
	    		}
	    	}
	    	//alert(level);
	    	var parentNode = document.getElementById("waterArea");
	    		parentNode.removeChild(document.getElementById("waterAreaSure"));
	    	//如果水管区父级重选删除子水管区
	    	var number1=level+1;
	    	while(document.getElementById("select2"+number1)){
	    		//alert(number);
	    		parentNode.removeChild(document.getElementById("select2"+number1));
	    		number1++;
	    	}
	    	
	    	var number2=level+1;
	    	while(document.getElementById("span2"+number2)){
	    		parentNode.removeChild(document.getElementById("span2"+number2));
	    		number2++;
	    	}
		$.ajax({
			url:"${ctx}/cal_canal_info/find_son_water_Area",
			data: {id:id},
			type: "post",
			async: false,//非异步
			success: function(msg){
				//alert(JSON.stringify(msg));
				var currentTag = document.getElementById("waterArea");
				if(msg.length>0){
				    var newSelectTag = document.createElement("select");
				    	newSelectTag.setAttribute("id", "select2"+(level+1));
				    	newSelectTag.setAttribute("style", "color:black;width:100px;height:30px;");
				    	newSelectTag.setAttribute("onchange","waterAreaChange(this[selectedIndex].value);");
				    	
				    	for(var i=0;i<msg.length;i++){
				    		
				    		if(i==0){
				    			var newOptionTag = document.createElement("option");
					    			newOptionTag.setAttribute("value","waterArea,"+msg[i].waterAreaLevel+","+"0");
					    			newOptionTag.innerHTML="请选择";
					    			newSelectTag.appendChild(newOptionTag);
				    			var newOptionTag = document.createElement("option");
					    			newOptionTag.setAttribute("value",msg[i].id+","+msg[i].waterAreaLevel+","+msg[i].waterAreaName);
					    			newOptionTag.innerHTML=msg[i].waterAreaName;
					    			newSelectTag.appendChild(newOptionTag);
				    		}else{
				    			var newOptionTag = document.createElement("option");
					    			newOptionTag.setAttribute("value",msg[i].id+","+msg[i].waterAreaLevel+","+msg[i].waterAreaName);
					    			newOptionTag.innerHTML=msg[i].waterAreaName;
					    			newSelectTag.appendChild(newOptionTag);
				    		}
				    	}
				    var newSpanTag = document.createElement("span");
				    	newSpanTag.setAttribute("id","span2"+(level+1));
						newSpanTag.innerHTML="--";
				    var newInputTag = document.createElement("input");
				    	newInputTag.setAttribute("id","waterAreaSure");
				    	newInputTag.setAttribute("class","layui-btn layui-btn-normal layui-btn-sm");
				    	newInputTag.setAttribute("type","button");
				    	newInputTag.setAttribute("value","确定");
				    	newInputTag.setAttribute("onclick","getWaterAreaIdAndLevel()");
				    	currentTag.appendChild(newSelectTag);
				    	currentTag.appendChild(newSpanTag);
				    	currentTag.appendChild(newInputTag);
				}else{
				
					var newInputTag = document.createElement("input");
						newInputTag.setAttribute("class","layui-btn layui-btn-normal layui-btn-sm");
				    	newInputTag.setAttribute("id","waterAreaSure");
				    	newInputTag.setAttribute("type","button");
				    	newInputTag.setAttribute("value","确定");
				    	newInputTag.setAttribute("onclick","getWaterAreaIdAndLevel()");
			    	currentTag.appendChild(newInputTag);
				}
			}
		});
	}
	//
	function areaChange(a){
		//alert(a);
		var paramArray = a.split(",");  
	    	var id = paramArray[0];  
	    	
	    	var level =parseInt(paramArray[1]);
	    	//alert(level);
	    	var parentNode = document.getElementById("area");
	    		parentNode.removeChild(document.getElementById("areaSure"));
	    	//如果水管区父级重选删除子水管区
	    	var number1=level+1;
	    	while(document.getElementById("select1"+number1)){
	    		//alert(number);
	    		parentNode.removeChild(document.getElementById("select1"+number1));
	    		number1++;
	    	}
	    	var number2=level+1;
	    	while(document.getElementById("span1"+number2)){
	    		parentNode.removeChild(document.getElementById("span1"+number2));
	    		number2++;
	    	}
				$.ajax({
					url:"${ctx}/cal_canal_info/find_son_water_Area",
					data: {id:id},
					type: "post",
					async: false,//非异步
					success: function(msg){
						//alert(JSON.stringify(msg));
						var currentTag = document.getElementById("waterArea");
						if(msg.length>0){
						    var newSelectTag = document.createElement("select");
						    	newSelectTag.setAttribute("id", "select1"+(level+1));
						    	newSelectTag.setAttribute("style", "color:black;width:100px;height:30px;");
						    	newSelectTag.setAttribute("onchange","areaChange(this[selectedIndex].value);");
						    	
						    	for(var i=0;i<msg.length;i++){
						    		var newOptionTag = document.createElement("option");
						    			newOptionTag.setAttribute("value",msg[i].id+","+msg[i].waterAreaLevel);
						    			newOptionTag.innerHTML=msg[i].waterAreaName;
						    			newSelectTag.appendChild(newOptionTag);
						    	}
						    var newSpanTag = document.createElement("span");
						    	newSpanTag.setAttribute("id","span2"+(level+1));
								newSpanTag.innerHTML="--";
						    var newInputTag = document.createElement("input");
						    	newInputTag.setAttribute("id","areaSure");
						    	newInputTag.setAttribute("class","layui-btn layui-btn-normal layui-btn-sm");
						    	newInputTag.setAttribute("type","button");
						    	newInputTag.setAttribute("value","确定");
						    	currentTag.appendChild(newSelectTag);
						    	currentTag.appendChild(newSpanTag);
						    	currentTag.appendChild(newInputTag);
						}else{
						
							var newInputTag = document.createElement("input");
								newInputTag.setAttribute("class","layui-btn layui-btn-normal layui-btn-sm");
						    	newInputTag.setAttribute("id","areaSure");
						    	newInputTag.setAttribute("type","button");
						    	newInputTag.setAttribute("value","确定");
					    	currentTag.appendChild(newInputTag);
						}
					}
				});
			}
			function getWaterAreaIdAndLevel(){
				//选中水管区的id
				var id = getCookie("id");
				if(id==""){
					var syswaterareaCodeInput =  document.getElementById("syswaterareaCode");
					syswaterareaCodeInput.value="";
					return;
				}
				$.ajax({
					url:"${ctx}/sys_water_area/ajax_findWaterArea",
					data: {id:id},
					type: "post",
					async: false,//非异步
					success: function(msg){
						alert(JSON.stringify(msg));
						var syswaterareaCodeInput =  document.getElementById("syswaterareaCode");
						syswaterareaCodeInput.value=msg.waterAreaCode;
					}
				});
			}
			
			
			//图片上传
		layui.use('upload', function(){
				
				//alert("你好");
				
		  	var $ = layui.jquery
		  	,upload = layui.upload;
		  
			//多文件列表示例
		  var demoListView = $('#demoList')
		  	,uploadListIns = upload.render({
		    elem: '#testList'
		    ,url: '${ctx}/cal_canal_info/add_canal_photo?id=${calCanalInfo.id}'
		    ,accept: 'file'
		    ,multiple: true
		    ,auto: false
		    ,bindAction: '#testListAction'
		    ,choose: function(obj){
		    	//alert(JSON.stringify(obj));
		    	//alert("进入button111");
		      var files = this.files = obj.pushFile(); //将每次选择的文件追加到文件队列
		      //读取本地文件
		      obj.preview(function(index, file, result){
		    	  //alert("进入button222");
		        var tr = $(['<tr id="upload-'+ index +'">'
		          ,'<td>'+ file.name +'</td>'
		          ,'<td>'+ (file.size/1014).toFixed(1) +'kb</td>'
		          ,'<td><span> ${calCanalInfo.canalName}</span></td>'
		          ,'<td><textarea id="remark-'+ index +'"  name="calCanalInfo.cciRemark" cols="30" rows="2" style="color:black;"></textarea></td>'
		          ,'<td>等待上传</td>'
		          ,'<td>'
		            ,'<button class="layui-btn layui-btn-mini demo-reload layui-hide">重传</button>'
		            ,'<button class="layui-btn layui-btn-mini layui-btn-danger demo-delete">删除</button>'
		          ,'</td>'
		        ,'</tr>'].join(''));
		        
		        //alert("renwuwuwuwde askdfa;lksjdf ");
		        
		        //单个重传
		        tr.find('.demo-reload').on('click', function(){
		          obj.upload(index, file);
		        });
		        
		        //删除
		        tr.find('.demo-delete').on('click', function(){
		          delete files[index]; //删除对应的文件
		          tr.remove();
		          uploadListIns.config.elem.next()[0].value = ''; //清空 input file 值，以免删除后出现同名文件不可选
		        });
		        demoListView.append(tr);
		      });
		    }
		    ,done: function(res, index, upload){
		    	
		    	
		    	
		    	//alert(JSON.stringify(res));
		    	//alert(index);
		    	//alert(upload);
		      if(res.code == 0){ //上传成功
		    	//alert("上传成功");
		        var tr = demoListView.find('tr#upload-'+ index)
		        ,tds = tr.children();
		        tds.eq(4).html('<span style="color: #5FB878;">上传成功</span>');
		        tds.eq(5).html(''+res.canalPhotoId); //清空操作
		        

		    	 var remark= $('#remark-'+index).val();
			        var canalId=res.canalPhotoId;
			        //alert(res.canalPhotoId);
			        $.ajax({
						url:"${ctx}/cal_canal_info/add_canal_photo_remark",
						data: {canalId:canalId,remark:remark},
						type: "post",
						async: false,//非异步
						success: function(msg){
						}
					});
		        return delete this.files[index]; //删除文件队列已经上传成功的文件
		      }
		      this.error(index, upload);
		    }
		    ,error: function(index, upload){
		      var tr = demoListView.find('tr#upload-'+ index)
		      ,tds = tr.children();
		      tds.eq(2).html('<span style="color: #FF5722;">上传失败</span>');
		      tds.eq(3).find('.demo-reload').removeClass('layui-hide'); //显示重传
		    }
		  });
		});
	</script>
</body>
</html>



