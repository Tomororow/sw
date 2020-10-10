<%@ page language="java" contentType="text/html; charset=utf-8" pageEncoding="utf-8"%>
<%@ include file="/WEB-INF/views/base.jsp"%>
<!doctype html>
<html>
<head>
	<title></title>
	<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
	<meta http-equiv="Pragma" content="no-cache" />
	<meta http-equiv="Cache-Control" content="no-cache, must-revalidate" />
	<meta http-equiv="Expires" content="0" />
	<script>
		document.write("<link type='text/css' href='${ctxstc}/css/demo.css?version=" + new Date().getTime() + "' rel='stylesheet' />");
	</script>
</head>
<body>
<div class="left">
	<div id="divPlugin" class="plugin"></div>
	<fieldset class="ipparse">
		<legend>设备IP解析</legend>
		<table cellpadding="0" cellspacing="3" border="0">
			<tr>
				<td class="tt">模式</td>
				<td colspan="3">
					<select id="devicemode" class="sel" onchange="changeIPMode(this.value);">
						<option value="1">IPServer</option>
						<option value="2">HiDDNS</option>
					</select>
				</td>
			</tr>
			<tr>
				<td class="tt">服务器地址</td>
				<td><input id="serveraddress" type="text" class="txt" value="" /></td>
				<td class="tt">端口号</td>
				<td><input id="serverport" type="text" class="txt" value="7071" /></td>
			</tr>
			<tr>
				<td class="tt">设备标识</td>
				<td><input id="deviceid" type="text" class="txt" value="" /></td>
				<td class="tt">&nbsp;</td>
				<td><input type="button" class="btn" value="获取设备IP" onclick="clickGetDeviceIP();" /></td>
			</tr>
		</table>
	</fieldset>
	<fieldset class="login">
		<legend>登录</legend>
		<table cellpadding="0" cellspacing="3" border="0">
			<tr>
				<td class="tt">IP地址</td>
				<td><input id="loginip" type="text" class="txt" value="172.9.4.222" /></td>
				<td class="tt">端口号</td>
				<td><input id="port" type="text" class="txt" value="80" /></td>
			</tr>
			<tr>
				<td class="tt">用户名</td>
				<td><input id="username" type="text" class="txt" value="admin" /></td>
				<td class="tt">密码</td>
				<td><input id="password" type="password" class="txt" value="12345" /></td>
			</tr>
			<tr>
				<td class="tt">设备端口</td>
				<td colspan="2"><input id="deviceport" type="text" class="txt" value="8000" />（可选参数）</td>
				<td>
					窗口分割数&nbsp;
					<select class="sel2" onchange="changeWndNum(this.value);">
						<option value="1">1x1</option>
						<option value="2" selected>2x2</option>
						<option value="3">3x3</option>
						<option value="4">4x4</option>
					</select>
				</td>
			</tr>
			<tr>
				<td colspan="4">
					<input type="button" class="btn" value="登录" onclick="clickLogin();" />
					<input type="button" class="btn" value="退出" onclick="clickLogout();" />
					<input type="button" class="btn2" value="获取基本信息" onclick="clickGetDeviceInfo();" />
				</td>
			</tr>
			<tr>
				<td class="tt">已登录设备</td>
				<td>
					<select id="ip" class="sel" onchange="getChannelInfo();"></select>
				</td>
				<td class="tt">通道列表</td>
				<td>
					<select id="channels" class="sel"></select>
				</td>
			</tr>
		</table>
	</fieldset>
	<fieldset class="ipchannel">
		<legend>数字通道</legend>
		<table width="100%" cellpadding="0" cellspacing="3" border="0">
			<tr>
				<td><input type="button" class="btn" value="获取数字通道列表" onclick="clickGetDigitalChannelInfo();" /></td>
			</tr>
			<tr>
				<td>
					<div class="digitaltdiv">
						<table id="digitalchannellist" class="digitalchannellist" cellpadding="0" cellspacing="0" border="0"></table>
					</div>
				</td>
			</tr>
		</table>
	</fieldset>
	<fieldset class="localconfig">
		<legend>本地配置</legend>
		<table cellpadding="0" cellspacing="3" border="0">
			<tr>
				<td class="tt">播放性能</td>
				<td>
					<select id="netsPreach" name="netsPreach" class="sel">
						<option value="0">最短延时</option>
						<option value="1">实时性好</option>
						<option value="2">均衡</option>
						<option value="3">流畅性好</option>
					</select>
				</td>
				<td class="tt">图像尺寸</td>
				<td>
					<select id="wndSize" name="wndSize" class="sel">
						<option value="0">充满</option>
						<option value="1">4:3</option>
						<option value="2">16:9</option>
					</select>
				</td>
			</tr>
			<tr>
				<td class="tt">规则信息</td>
				<td>
					<select id="rulesInfo" name="rulesInfo" class="sel">
						<option value="1">启用</option>
						<option value="0">禁用</option>
					</select>
				</td>
				<td class="tt">抓图文件格式</td>
				<td>
					<select id="captureFileFormat" name="captureFileFormat" class="sel">
						<option value="0">JPEG</option>
						<option value="1">BMP</option>
					</select>
				</td>
			</tr>
			<tr>
				<td class="tt">录像文件打包大小</td>
				<td>
					<select id="packSize" name="packSize" class="sel">
						<option value="0">256M</option>
						<option value="1">512M</option>
						<option value="2">1G</option>
					</select>
				</td>
                <td class="tt">协议类型</td>
                <td>
                    <select id="protocolType" name="protocolType" class="sel">
                        <option value="0">TCP</option>
                        <option value="2">UDP</option>
                    </select>
                </td>
			</tr>
			<tr>
				<td class="tt">录像文件保存路径</td>
				<td colspan="3"><input id="recordPath" type="text" class="txt" />&nbsp;<input type="button" class="btn" value="浏览" onclick="clickOpenFileDlg('recordPath', 0);" /></td>
			</tr>
			<tr>
				<td class="tt">回放下载保存路径</td>
				<td colspan="3"><input id="downloadPath" type="text" class="txt" />&nbsp;<input type="button" class="btn" value="浏览" onclick="clickOpenFileDlg('downloadPath', 0);" /></td>
			</tr>
			<tr>
				<td class="tt">预览抓图保存路径</td>
				<td colspan="3"><input id="previewPicPath" type="text" class="txt" />&nbsp;<input type="button" class="btn" value="浏览" onclick="clickOpenFileDlg('previewPicPath', 0);" /></td>
			</tr>
			<tr>
				<td class="tt">回放抓图保存路径</td>
				<td colspan="3"><input id="playbackPicPath" type="text" class="txt" />&nbsp;<input type="button" class="btn" value="浏览" onclick="clickOpenFileDlg('playbackPicPath', 0);" /></td>
			</tr>
			<tr>
				<td class="tt">回放剪辑保存路径</td>
				<td colspan="3"><input id="playbackFilePath" type="text" class="txt" />&nbsp;<input type="button" class="btn" value="浏览" onclick="clickOpenFileDlg('playbackFilePath', 0);" /></td>
			</tr>
			<tr>
				<td colspan="4"><input type="button" class="btn" value="获取" onclick="clickGetLocalCfg();" />&nbsp;<input type="button" class="btn" value="设置" onclick="clickSetLocalCfg();" /></td>
			</tr>
		</table>
	</fieldset>
</div>
<div class="left">
	<fieldset class="preview">
		<legend>预览</legend>
		<table cellpadding="0" cellspacing="3" border="0">
			<tr>
				<td class="tt">码流类型</td>
				<td>
					<select id="streamtype" class="sel">
						<option value="1">主码流</option>
						<option value="2">子码流</option>
						<option value="3">第三码流</option>
						<option value="4">转码码流</option>
					</select>
				</td>
				<td>
					<input type="button" class="btn" value="开始预览" onclick="clickStartRealPlay();" />
					<input type="button" class="btn" value="停止预览" onclick="clickStopRealPlay();" />
				</td>
			</tr>
			<tr>
				<td class="tt">音量</td>
				<td>
					<input type="text" id="volume" class="txt" value="50" maxlength="3" />&nbsp;<input type="button" class="btn" value="设置" onclick="clickSetVolume();" />（范围：0~100）
				</td>
				<td>
					<input type="button" class="btn" value="打开声音" onclick="clickOpenSound();" />
					<input type="button" class="btn" value="关闭声音" onclick="clickCloseSound();" />
				</td>
			</tr>
			<tr>
				<td class="tt">对讲通道</td>
				<td>
					<select id="audiochannels" class="sel">
						
					</select>
					<input type="button" class="btn" value="获取通道" onclick="clickGetAudioInfo();" />
				</td>
				<td>
					<input type="button" class="btn" value="开始对讲" onclick="clickStartVoiceTalk();" />
					<input type="button" class="btn" value="停止对讲" onclick="clickStopVoiceTalk();" />
				</td>
			</tr>
			<tr>
				<td colspan="3">
					<input type="button" class="btn" value="抓图" onclick="clickCapturePic();" />
					<input type="button" class="btn" value="开始录像" onclick="clickStartRecord();" />
					<input type="button" class="btn" value="停止录像" onclick="clickStopRecord();" />
				</td>
			</tr>
			<tr>
				<td colspan="3">
					<input type="button" class="btn2" value="启用电子放大" onclick="clickEnableEZoom();" />
					<input type="button" class="btn2" value="禁用电子放大" onclick="clickDisableEZoom();" />
					<input type="button" class="btn2" value="启用3D放大" onclick="clickEnable3DZoom();" />
					<input type="button" class="btn2" value="禁用3D放大" onclick="clickDisable3DZoom();" />
					<input type="button" class="btn" value="全屏" onclick="clickFullScreen();" />
				</td>
			</tr>
		</table>
	</fieldset>
	<fieldset class="ptz">
		<legend>云台控制</legend>
		<table cellpadding="0" cellspacing="3" border="0" class="left">
			<tr>
				<td>
					<input type="button" class="btn" value="左上" onmousedown="mouseDownPTZControl(5);" onmouseup="mouseUpPTZControl();" />
					<input type="button" class="btn" value="上" onmousedown="mouseDownPTZControl(1);" onmouseup="mouseUpPTZControl();" />
					<input type="button" class="btn" value="右上" onmousedown="mouseDownPTZControl(7);" onmouseup="mouseUpPTZControl();" />
				</td>
			</tr>
			<tr>
				<td>
					<input type="button" class="btn" value="左" onmousedown="mouseDownPTZControl(3);" onmouseup="mouseUpPTZControl();" />
					<input type="button" class="btn" value="自动" onclick="mouseDownPTZControl(9);" />
					<input type="button" class="btn" value="右" onmousedown="mouseDownPTZControl(4);" onmouseup="mouseUpPTZControl();" />
				</td>
			</tr>
			<tr>
				<td>
					<input type="button" class="btn" value="左下" onmousedown="mouseDownPTZControl(6);" onmouseup="mouseUpPTZControl();" />
					<input type="button" class="btn" value="下" onmousedown="mouseDownPTZControl(2);" onmouseup="mouseUpPTZControl();" />
					<input type="button" class="btn" value="右下" onmousedown="mouseDownPTZControl(8);" onmouseup="mouseUpPTZControl();" />
				</td>
			</tr>
		</table>
		<table cellpadding="0" cellspacing="3" border="0" class="left">
			<tr>
				<td class="tt">云台速度</td>
				<td>
					<select id="ptzspeed" class="sel">
						<option>1</option>
						<option>2</option>
						<option>3</option>
						<option selected>4</option>
						<option>5</option>
						<option>6</option>
						<option>7</option>
					</select>
				</td>
			</tr>
			<tr>
				<td class="tt">预置点号</td>
				<td><input id="preset" type="text" class="txt" value="1" /></td>
			</tr>
			<tr>
				<td colspan="2">
					<input type="button" class="btn" value="设置" onclick="clickSetPreset();" />
					<input type="button" class="btn" value="调用" onclick="clickGoPreset();" />
				</td>
			</tr>
		</table>
        <table cellpadding="0" cellspacing="3" border="0" class="left">
            <tr>
                <td class="tt"><input type="button" class="btn2" value="变倍+" onmousedown="PTZZoomIn()" onmouseup="PTZZoomStop()"></td>
                <td><input type="button" class="btn2" value="变倍-" onmousedown="PTZZoomout()" onmouseup="PTZZoomStop()"></td>
            </tr>
            <tr>
                <td class="tt"><input type="button" class="btn2" value="变焦+" onmousedown="PTZFocusIn()" onmouseup="PTZFoucusStop()"></td>
                <td><input type="button" class="btn2" value="变焦-" onmousedown="PTZFoucusOut()" onmouseup="PTZFoucusStop()"></td>
            </tr>
            <tr>
                <td class="tt"><input type="button" class="btn2" value="光圈+" onmousedown="PTZIrisIn()" onmouseup="PTZIrisStop()"></td>
                <td><input type="button" class="btn2" value="光圈-" onmousedown="PTZIrisOut()" onmouseup="PTZIrisStop()"></td>
            </tr>
        </table>
	</fieldset>
	<fieldset class="playback">
		<legend>回放</legend>
		<table width="100%" cellpadding="0" cellspacing="3" border="0">
			<tr>
				<td class="tt">开始时间</td>
				<td>
					<input id="starttime" type="text" class="txt" value="2013-12-10 00:00:00" />（时间格式：2013-11-11 12:34:56）
				</td>
			</tr>
			<tr>
				<td class="tt">结束时间</td>
				<td>
					<input id="endtime" type="text" class="txt" value="2013-12-11 23:59:59" />
					<input type="button" class="btn" value="搜索" onclick="clickRecordSearch(0);" />
				</td>
			</tr>
			<tr>
				<td colspan="2">
					<div class="searchdiv">
						<table id="searchlist" class="searchlist" cellpadding="0" cellspacing="0" border="0"></table>
					</div>
				</td>
			</tr>
			<tr>
				<td colspan="2">
					<input type="button" class="btn2" value="开始回放" onclick="clickStartPlayback();" />
					<input type="button" class="btn2" value="停止回放" onclick="clickStopPlayback();" />
					<input type="button" class="btn" value="倒放" onclick="clickReversePlayback();" />
					<input type="button" class="btn" value="单帧" onclick="clickFrame();" />
					<input id="transstream" type="checkbox" class="vtop" />&nbsp;启用转码码流
				</td>
			</tr>
			<tr>
				<td colspan="2">
					<input type="button" class="btn" value="暂停" onclick="clickPause();" />
					<input type="button" class="btn" value="恢复" onclick="clickResume();" />
					<input type="button" class="btn" value="慢放" onclick="clickPlaySlow();" />
					<input type="button" class="btn" value="快放" onclick="clickPlayFast();" />
				</td>
			</tr>
			<tr>
				<td colspan="2">
					<input type="button" class="btn" value="抓图" onclick="clickCapturePic();" />
					<input type="button" class="btn2" value="开始剪辑" onclick="clickStartRecord();" />
					<input type="button" class="btn2" value="停止剪辑" onclick="clickStopRecord();" />
					<input type="button" class="btn2" value="OSD时间" onclick="clickGetOSDTime();" />&nbsp;<input id="osdtime" type="text" class="txt" readonly />
				</td>
			</tr>
		</table>
	</fieldset>
	<fieldset class="maintain">
		<legend>系统维护</legend>
		<table width="100%" cellpadding="0" cellspacing="3" border="0">
			<tr>
				<td>
					<input type="button" class="btn2" value="导出配置文件" onclick="clickExportDeviceConfig();" />
					<input type="button" class="btn2" value="检查插件版本" onclick="clickCheckPluginVersion();" />
					<input type="button" class="btn2" value="远程配置库" onclick="clickRemoteConfig();" />
                    <input type="button" class="btn2" value="恢复默认参数" onclick="clickRestoreDefault();" />
				</td>
			</tr>
			<tr>
				<td>
					<input id="configFile" type="text" class="txt" />&nbsp;<input type="button" class="btn" value="浏览" onclick="clickOpenFileDlg('configFile', 1);" />&nbsp;<input type="button" class="btn2" value="导入配置文件" onclick="clickImportDeviceConfig();" />
				</td>
			</tr>
			<tr>
				<td>
					<input id="upgradeFile" type="text" class="txt" />&nbsp;<input type="button" class="btn" value="浏览" onclick="clickOpenFileDlg('upgradeFile', 1);" />&nbsp;<input type="button" class="btn2" value="升级" onclick="clickStartUpgrade();" />
				</td>
			</tr>
		</table>
	</fieldset>
	<fieldset class="operate">
		<legend>操作信息</legend>
		<div id="opinfo" class="opinfo"></div>
	</fieldset>
	<fieldset class="callback">
		<legend>事件回调信息</legend>
		<div id="cbinfo" class="cbinfo"></div>
	</fieldset>
</div>
</body>
<script type="text/javascript" src="${ctxstc}/jquery/jquery-1.11.1.min.js"></script>
<script type="text/javascript" src="${ctxstc}/js/codebase/webVideoCtrl.js"></script>
<script type="text/javascript" src="${ctxstc}/js/demo.js"></script>
</html>