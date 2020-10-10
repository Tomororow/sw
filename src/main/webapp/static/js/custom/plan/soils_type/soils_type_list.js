/* 相对链接的基准URL */
var curWwwPath = window.document.location.href;
var pathName = window.document.location.pathname;
var pos = curWwwPath.indexOf(pathName);
var localhostPaht = curWwwPath.substring(0,pos);
var projectName = pathName.substring(0,pathName.substr(1).indexOf('/')+1);
var ctxPath = localhostPaht + projectName;
var picPath = localhostPaht;
//修改数据方法
function doEdit(id){
		debugger
		alert(id);
		layer.open({
			type: 1,
			title: false, //不显示标题栏
	        closeBtn: false,
	        area: '300px;',
	        shade: 0.8,
	        id: 'LAY_layuipro', //设定一个id，防止重复弹出
	        btn: ['提交数据', '取消'],
	        btnAlign: 'c',
	        moveType: 1,//拖拽模式，0或者1
	        content:'' ,
	        btn2: function(){
 	       			/*document.forms[0].action=ctxPath+"/sys_water_area/add";
 	       			document.forms[0].submit();*/
 		        }
		});
	}