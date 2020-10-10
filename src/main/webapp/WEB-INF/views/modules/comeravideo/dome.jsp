<%@ page language="java" contentType="text/html; charset=utf-8" pageEncoding="utf-8"%>
<%@ include file="/WEB-INF/views/base.jsp"%>
<!DOCTYPE html>
<html lang="zh-CN">
<head>
    <meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge,chrome=1" >
    <meta name="renderer" content="webkit">
    <title>测试页面</title>
</head>

<body>
<script src="https://open.ys7.com/sdk/js/1.3/ezuikit.js"></script>
<script type="text/javascript" src="http://resource.bcevod.com/player/cyberplayer.js"></script>
<script type="text/javascript" src="${ctxstc}/jquery/jquery-1.11.1.min.js"></script>
<script type="text/javascript" src="${ctxstc}/js/codebase/webVideoCtrl.js"></script>
<script type="text/javascript" src="${ctxstc}/js/demo123.js"></script>
<link rel="stylesheet" href="${ctxstc}/css/demo.css" type="text/css">
<!-- <script>
		document.write("<link type='text/css' href='${ctxstc}/css/demo.css?version=" + new Date().getTime() + "' rel='stylesheet' />");
</script> -->


<div style="width: 150px;height: 90px;">
<div id="playercontainer1" style="z-index：0"></div>

<div style="z-index:9999">
	<fieldset class="ptz" style="width: 150px;height: 90px;">
		<legend>云台控制</legend>
		<table cellpadding="0" cellspacing="3" border="0" class="left">
			<tr>
				<td>
					<input type="button" id="ZuoShang" class="btn" value="左上" onmousedown="mouseDownPTZControl(4);" onmouseup="mouseUpPTZControl(4);" />
					<input type="button" class="btn" value="上" onmousedown="mouseDownPTZControl(0);" onmouseup="mouseUpPTZControl(0);" />
					<input type="button" class="btn" value="右上" onmousedown="mouseDownPTZControl(6);" onmouseup="mouseUpPTZControl(6);" />
				</td>
			</tr>
			<tr>
				<td>
					<input type="button" class="btn" value="左" onmousedown="mouseDownPTZControl(2);" onmouseup="mouseUpPTZControl(2);" />
					<input type="button" class="btn" value="自动" onclick="mouseDownPTZControl(9);" />
					<input type="button" class="btn" value="右" onmousedown="mouseDownPTZControl(3);" onmouseup="mouseUpPTZControl(3);" />
				</td>
			</tr>
			<tr>
				<td>
					<input type="button" class="btn" value="左下" onmousedown="mouseDownPTZControl(5);" onmouseup="mouseUpPTZControl(5);" />
					<input type="button" class="btn" value="下" onmousedown="mouseDownPTZControl(1);" onmouseup="mouseUpPTZControl(1);" />
					<input type="button" class="btn" value="右下" onmousedown="mouseDownPTZControl(7);" onmouseup="mouseUpPTZControl(7);" />
				</td>
			</tr>
			<tr>
				<td>
					<input type="button" class="btn" value="+" onmousedown="mouseDownPTZControl(8);" onmouseup="mouseUpPTZControl(8);" />
					<input type="button" class="btn" value="-" onmousedown="mouseDownPTZControl(9);" onmouseup="mouseUpPTZControl(9);" />
				</td>
			</tr>
		</table>
	</fieldset>
</div>
</div>
<script type="text/javascript">
    var player = cyberplayer("playercontainer1").setup({
        width: 680,
        height: 448,
        autostart: true,
        stretching: "uniform",
        volume: 100,
        controls: true,
        playlist: [
            {
                sources: [//http://hls.open.ys7.com/openlive/5751be60123c4ba39b59b80f4bb6c6e7.hd.m3u8
                    {			//http://hls.open.ys7.com/openlive/4438fe77f6b94cf6a3ecd819663e1c42.m3u8
                        file: "http://hls.open.ys7.com/openlive/4438fe77f6b94cf6a3ecd819663e1c42.hd.m3u8", // 资源1 支持mp4, hls, flv等常用视频格式
                        label: "高清" // 标签
                    },
                    {
                        file: "http://hls.open.ys7.com/openlive/4438fe77f6b94cf6a3ecd819663e1c42.m3u8", // 资源2 必须与资源1格式和时长一致！
                        label: "标清"
                    }
                ]
            }
        ],
        ak: "1d075bbb10254a489cc3298cdddda527" // 公有云平台注册即可获得accessKey
    });
    
    
    
    //请求云台控制
    function ajaxConsole(iPTZIndex){
    	$.ajax({
			url:"${ctx}/holder/Console",
			data: {direction:iPTZIndex},
			type: "post",
			async: false,//非异步
			success: function(msg){
				//alert(JSON.stringify(msg));
			}
		}); 
    }
    //操作云台
     function mouseDownPTZControl(iPTZIndex) {
	   	if(iPTZIndex==2){//向左
	   		ajaxConsole(iPTZIndex);	
	   	}else if(iPTZIndex==3){//向右
	   		ajaxConsole(iPTZIndex);	
	   	}else if(iPTZIndex==4){//左上
	   		ajaxConsole(iPTZIndex);	
	   	}else if(iPTZIndex==5){//左下
	   		ajaxConsole(iPTZIndex);	
	   	}else if(iPTZIndex==6){//右上
	   		ajaxConsole(iPTZIndex);	
	   	}else if(iPTZIndex==7){//右下
	   		ajaxConsole(iPTZIndex);	
	   	}else if(iPTZIndex==0){//上
	   		ajaxConsole(iPTZIndex);	
	   	}else if(iPTZIndex==1){//下
	   		ajaxConsole(iPTZIndex);	
	   	}else if(iPTZIndex==8){//
	   		ajaxConsole(iPTZIndex);	
	   	}else if(iPTZIndex==9){//
	   		ajaxConsole(iPTZIndex);	
	   	}
    }
    
 // 方向PTZ停止
  function mouseUpPTZControl(iPTZIndex) {
	$.ajax({
		url:"${ctx}/holder/shutDownOperation",
		data: {direction:iPTZIndex},
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