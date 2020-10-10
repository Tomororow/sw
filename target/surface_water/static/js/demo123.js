
var g_iWndIndex = 0; //可以不用设置这个变量，有窗口参数的接口中，不用传值，开发包会默认使用当前选择窗口
// PTZ控制 9为自动，1,2,3,4,5,6,7,8为方向PTZ
var g_bPTZAuto = false;
/*function mouseDownPTZControl(iPTZIndex) {
	var oWndInfo = WebVideoCtrl.I_GetWindowStatus(g_iWndIndex),
		bZeroChannel = $("#channels option").eq($("#channels").get(0).selectedIndex).attr("bZero") == "true" ? true : false,
		iPTZSpeed = $("#ptzspeed").val(),
		bStop = false;

	if (bZeroChannel) {// 零通道不支持云台
		return;
	}
	
	if (oWndInfo != null) {
		if (9 == iPTZIndex && g_bPTZAuto) {
			iPTZSpeed = 0;// 自动开启后，速度置为0可以关闭自动
			bStop = true;
		} else {
			g_bPTZAuto = false;// 点击其他方向，自动肯定会被关闭
			bStop = false;
		}

		WebVideoCtrl.I_PTZControl(iPTZIndex, bStop, {
			iPTZSpeed: iPTZSpeed,
			success: function (xmlDoc) {
				if (9 == iPTZIndex) {
					g_bPTZAuto = !g_bPTZAuto;
				}
				showOPInfo(oWndInfo.szIP + " 开启云台成功！");
			},
			error: function () {
				showOPInfo(oWndInfo.szIP + " 开启云台失败！");
			}
		});
	}
}*/
