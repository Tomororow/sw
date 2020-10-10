<%@ page language="java" contentType="text/html; charset=utf-8" pageEncoding="utf-8"%>
<%@ include file="/WEB-INF/views/base.jsp"%>

<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
	<meta http-equiv="Content-Type" content="text/html; charset=utf-8">
	<meta http-equiv="X-UA-Compatible" content="IE=Edge">
	<meta name="viewport" content="width=device-width, initial-scale=1,maximum-scale=1, user-scalable=no">
	<title>云台控制</title>
	<link type="text/css" rel="Shortcut Icon" href="${ctxstc}/images/jzlogo.ico" type="image/x-icon" />
	<link type="text/css" rel="stylesheet" href="${ctxstc}/adapters/bootstrap/css/Copy of bootstrap.min.css" title="" />
	<link type="text/css" rel="stylesheet" href="${ctxstc}/css/body.css" title="" />
	<link type="text/css" rel="stylesheet" href="${ctxstc}/adapters/bootstrap/css/style.css" title="" />
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

	<link rel="stylesheet" href="${ctxstc}/adapters/ztree/css/zTreeStyle/zTreeStyle.css" type="text/css">
	
	<script type="text/javascript" src="${ctxstc}/adapters/ztree/js/jquery.ztree.core.js"></script>
	
    <link rel="stylesheet" href="${ctxstc}/adapters/ztree/css/metroStyle/metroStyle.css" type="text/css">
    <script type="text/javascript" src="${ctxstc}/adapters/ztree/js/jquery.ztree.excheck.js"></script>
    <script type="text/javascript" src="${ctxstc}/adapters/ztree/js/jquery.ztree.exedit.js"></script>
	
	<script src="${ctxstc}/adapters/layui/layer/layer.js"></script>
	<script src="https://open.ys7.com/sdk/js/1.3/ezuikit.js"></script>
	<script type="text/javascript" src="http://resource.bcevod.com/player/cyberplayer.js"></script>
	<link rel="stylesheet" href="${ctxstc}/css/demo.css" type="text/css">
	<link rel="stylesheet" href="https://unpkg.com/element-ui@1.4/lib/theme-default/index.css">
	<script type="text/javascript" src="${ctxstc}/js/vue.js"></script>
	<script src="https://unpkg.com/element-ui@1.4/lib/index.js"></script> 
	
	<!-- 2018-5-04 关于摄像头视频的插件 -->
	<script src="${ctxstc}/js/ezuikit.js"></script>
	<script type="text/javascript" src="${ctxstc}/js/cyberplayer.js"></script>
	<link rel="stylesheet" href="${ctxstc}/css/demo.css" type="text/css">
	
	
</head>
<body>
<div>
	<div >
		<legend style="color:#1E1E1E;"><h4>云台控制</h4></legend></div>
	<div>
			<input type="button" id="ZuoShang" class="btn" value="左上" onmousedown="mouseDownPTZControl(4,accesstoken,equipmentSequence,deviceChannelNumber);" onmouseup="mouseUpPTZControl(4,accesstoken,equipmentSequence,deviceChannelNumber);" />
			<input type="button" class="btn" value="上" onmousedown="mouseDownPTZControl(0,accesstoken,equipmentSequence,deviceChannelNumber);" onmouseup="mouseUpPTZControl(0,accesstoken,equipmentSequence,deviceChannelNumber);" />
			<input type="button" class="btn" value="右上" onmousedown="mouseDownPTZControl(6,accesstoken,equipmentSequence,deviceChannelNumber);" onmouseup="mouseUpPTZControl(6,accesstoken,equipmentSequence,deviceChannelNumber);" />		
	</div>
	<div>
			<input type="button" class="btn" value="左" onmousedown="mouseDownPTZControl(2,accesstoken,equipmentSequence,deviceChannelNumber);" onmouseup="mouseUpPTZControl(2,accesstoken,equipmentSequence,deviceChannelNumber);" />&nbsp;&nbsp;
			<input type="button" class="btn" value="自动" onclick="mouseDownPTZControl(9,accesstoken,equipmentSequence,deviceChannelNumber);"  onmouseup="mouseUpPTZControl(9,accesstoken,equipmentSequence,deviceChannelNumber);"/>&nbsp;&nbsp;
			<input type="button" class="btn" value="右" onmousedown="mouseDownPTZControl(3,accesstoken,equipmentSequence,deviceChannelNumber);" onmouseup="mouseUpPTZControl(3,accesstoken,equipmentSequence,deviceChannelNumber);" />
		
	</div>
	<div>
			<input type="button" class="btn" value="左下" onmousedown="mouseDownPTZControl(5,accesstoken,equipmentSequence,deviceChannelNumber);" onmouseup="mouseUpPTZControl(5,accesstoken,equipmentSequence,deviceChannelNumber);" />
			<input type="button" class="btn" value="下" onmousedown="mouseDownPTZControl(1,accesstoken,equipmentSequence,deviceChannelNumber);" onmouseup="mouseUpPTZControl(1,accesstoken,equipmentSequence,deviceChannelNumber);" />
			<input type="button" class="btn" value="右下" onmousedown="mouseDownPTZControl(7,accesstoken,equipmentSequence,deviceChannelNumber);" onmouseup="mouseUpPTZControl(7,accesstoken,equipmentSequence,deviceChannelNumber);" />
	</div>
	<div>
			&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<input type="button" class="btn" value="近" onmousedown="mouseDownPTZControl(8,accesstoken,equipmentSequence,deviceChannelNumber);" onmouseup="mouseUpPTZControl(8,accesstoken,equipmentSequence,deviceChannelNumber);" />&nbsp;&nbsp;&nbsp;
			<input type="button" class="btn" value="远" onmousedown="mouseDownPTZControl(9,accesstoken,equipmentSequence,deviceChannelNumber);" onmouseup="mouseUpPTZControl(9,accesstoken,equipmentSequence,deviceChannelNumber);" />
	</div>
</div>

<script type="text/javascript">
<%
	String accesstoken = request.getParameter("accesstoken");
	String  deviceChannelNumber= request.getParameter("deviceChannelNumber");
	String  equipmentSequence= request.getParameter("equipmentSequence");
	System.out.println("=====================deviceChannelNumber==============="+deviceChannelNumber);
%>
var	accesstoken = "<%=accesstoken %>";
var	deviceChannelNumber = "<%=deviceChannelNumber %>";
var	equipmentSequence = "<%=equipmentSequence %>";

//--------------2018-5-4 liyue   操控云台--------------------
//请求云台控制(云台控制需要传到后台的参数，基本的上、下、左、右--iPTZIndex，设备通道号，设备序列号，accessToken)
   function ajaxConsole(iPTZIndex,accesstoken,equipmentSequence,deviceChannelNumber){
	  // alert(deviceChannelNumber);
   	$.ajax({
			//url:"${ctx}/holder/Console?direction="+iPTZIndex+"&accessToken="+accesstoken,
			url:"${ctx}/holder/Console",
			data: {direction:iPTZIndex,accessToken:accesstoken,deviceSerial:equipmentSequence,channelNo:deviceChannelNumber},
			type: "post",
			async: false,//非异步
			success: function(msg){
				//alert(JSON.stringify(msg));
			}
		}); 
   }
   //操作云台
    function mouseDownPTZControl(iPTZIndex,accesstoken,equipmentSequence,deviceChannelNumber) {
	  // aa=accesstoken;
	   	if(iPTZIndex==2){//向左
	   		ajaxConsole(iPTZIndex,accesstoken,equipmentSequence,deviceChannelNumber);	
	   	}else if(iPTZIndex==3){//向右
	   		ajaxConsole(iPTZIndex,accesstoken,equipmentSequence,deviceChannelNumber);	
	   	}else if(iPTZIndex==4){//左上
	   		ajaxConsole(iPTZIndex,accesstoken,equipmentSequence,deviceChannelNumber);	
	   	}else if(iPTZIndex==5){//左下
	   		ajaxConsole(iPTZIndex,accesstoken,equipmentSequence,deviceChannelNumber);	
	   	}else if(iPTZIndex==6){//右上
	   		ajaxConsole(iPTZIndex,accesstoken,equipmentSequence,deviceChannelNumber);	
	   	}else if(iPTZIndex==7){//右下
	   		ajaxConsole(iPTZIndex,accesstoken,equipmentSequence,deviceChannelNumber);	
	   	}else if(iPTZIndex==0){//上
	   		ajaxConsole(iPTZIndex,accesstoken,equipmentSequence,deviceChannelNumber);	
	   	}else if(iPTZIndex==1){//下
	   		ajaxConsole(iPTZIndex,accesstoken,equipmentSequence,deviceChannelNumber);	
	   	}else if(iPTZIndex==8){//近焦
	   		ajaxConsole(iPTZIndex,accesstoken,equipmentSequence,deviceChannelNumber);	
	   	}else if(iPTZIndex==9){//远焦
	   		ajaxConsole(iPTZIndex,accesstoken,equipmentSequence,deviceChannelNumber);	
	   	}
   }
   
// 方向PTZ停止
function mouseUpPTZControl(iPTZIndex,accesstoken,equipmentSequence,deviceChannelNumber) {
		 $.ajax({
				url:"${ctx}/holder/shutDownOperation",
				data: {direction:iPTZIndex,accessToken:accesstoken,deviceSerial:equipmentSequence,channelNo:deviceChannelNumber},
				type: "post",
				async: false,//非异步
				success: function(msg){
					//alert(JSON.stringify(msg));
				}
			}); 
		 
 }

</script>
</body>
</html>