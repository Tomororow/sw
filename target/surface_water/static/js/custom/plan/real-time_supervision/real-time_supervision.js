var curWwwPath = window.document.location.href;
var pathName = window.document.location.pathname;
var pos = curWwwPath.indexOf(pathName);
var localhostPaht = curWwwPath.substring(0,pos);
var projectName = pathName.substring(0,pathName.substr(1).indexOf('/')+1);
var ctxPath = localhostPaht + projectName;
var picPath = localhostPaht;
var realTime = new Vue({
	el:'#realTime',
	//初始化数据类型
	data:{
		//暂存标签的name值
		type:'1',
		//水位站数据
		siteWaterList:[],
		//闸门站数据
		siteSliue:[],
		//水位流量对照表集合
		flowList:[],
		//视频站
		siteVideo:[],
		//空高集合
		deList:[],
		//闸门站数据
		suList:[],
		//历史数据
		historicalList:[],
		//水位站分页定义
		currentPage:'1',
		pagesize1:'10',
		//闸门站分页定义
		currentPage2:'1',
		pagesize2:'10',
		//视频站分页定义
		currentPage3:'1',
		pagesize3:'7',
		pler:'',
		id:'',
		code:'',
		startTime:'',
		endTime:'',
		//实时水位暂存
		waterLevelTS:'',
		//分页长度
		sum:'',
		num:'',
		switchTab:false,
		dialogVisible:false,
		isshow:false,
		pictLoading:'',
		tieRow:'',
		siteWaterList:[],
		deviceType:'',
	},
	methods:{
		//标签方法
		ObjectSite:function(row){
			var _this = this;
			debugger
			_this.currentPage = '1';
			_this.currentPage2 = '1';
			_this.type = '';
			_this.siteWaterList = [];
			_this.siteSliue = [];
			_this.type = row.name;
			_this.pler='playercontainer1';
		//	alert(row.name);
			//如果树结构已被点击此时点击标签仍可查询
			if(_this.type=="1"||_this.type=="2"){
				$.post(ctxPath+"/real-time_supervision/selectType",{"code":row.code,"type":row.name},function(data){
					if(data.data.list==""||data.data.list==null){
						realTime.siteWaterList = [];
						realTime.siteSliue = [];
						_this.deList = [];
					}else if(_this.type=="1"){
						_this.siteWaterList= data.data.list;
						_this.flowList = data.data.flowList;
						_this.deList = data.data.deList;
						realTime.sum = data.data.sum;
					}else if(_this.type=="2"){
						realTime.siteSliue = data.data.list;
						_this.suList = data.data.suList;
						realTime.sum = data.data.sum;
					}
				});
			}else if(_this.type=="3"){
				$("#siteVideo").empty();
				$("#inputVideo").empty();	
				$.post(ctxPath+"/real-time_supervision/playModel",{"code":""},function(msg){
					_this.siteVideo = msg;
					if(Wind){//如果Wind对象存在
						Wind.close();//调用关闭方法
				        Wind=null//并把值赋成null
					}
					for(var i=0; i<=3; i++){
						$("#siteVideo").append(
					               "<div id="+msg[i].id+" style=''>" +
					               	"</div>");
						$("#inputVideo").append(
					               			"<div><label>" +
					               				"<input style=' align=right; ' name='radio' type='radio' value="+msg[i].deviceSerial+" id="+msg[i].deviceVideoCode+">"+msg[i].deviceVideoName+"" +
					               			"</label></div>"
					               			);
						var vid =document.getElementById(msg[i].id);
						var player = cyberplayer(vid).setup({
						    width: 380,
						    height: 220,
						    autostart: true,
						    stretching: "uniform",
						    volume: 100,
						    controls: true,
						    playlist: [
						        {
						            sources: [
						                {//http://hls.open.ys7.com/openlive/4438fe77f6b94cf6a3ecd819663e1c42.m3u8
						                    file: msg[i].ezopenHdLive, // 资源1 支持mp4, hls, flv等常用视频格式
						                    label: "高清" // 标签
						                },
						                {
						                    file: msg[i].ezopenLive, // 资源2 必须与资源1格式和时长一致！
						                    label: "标清"
						                }
						            ]
						        }
						    ],
						    ak: "1d075bbb10254a489cc3298cdddda527" // 公有云平台注册即可获得accessKey
						}); 
						
						//开始控制云台
						var TongDao =document.getElementById(msg[i].deviceVideoCode);
						TongDao.onclick=function(){
							var deviceSerial =$('input:radio[name="radio"]:checked').val();//设备编码
							//alert(deviceSerial);
							$.ajax({
								url:ctxPath+"/real-time_supervision/byDeviceSerialInfo",
								data: {deviceSerial:deviceSerial},
								type: "post",
								async: false,//非异步
								success: function(date){
									Wind=window.open(ctxPath+"/page.jsp?accesstoken="+date.accesstoken+"&deviceChannelNumber="+date.deviceChannelNumber+"&equipmentSequence="+date.equipmentSequence, 'newwindow', 'height=220, width=180, top=500, left=1300, toolbar=yes, menubar=no, scrollbars=no, resizable=no,location=no, status=no')
								}
							});
						}
					}
				});
			}
		},
		
		showToggle:function(){
			var _this = this;
			_this.isshow = !_this.isshow
		    },
		
		selecthdata:function(row){
			var _this = this;
			var  pictLoading=_this.pictLoading;
			debugger
			_this.switchTab = true;
			_this.pictLoading = true;
			 var aData = new Date();
			 //获取当前时间
			_this.endTime = moment(aData).format('YYYY-MM-DD HH:mm:ss');
			//获取当前时间前一周的时间
			var oneweekdate = new Date(aData-7*24*3600*1000);
	        var y = oneweekdate.getFullYear();
	        var m = oneweekdate.getMonth()+1;
	        var d = oneweekdate.getDate();
	        var formatwdate = y+'-'+m+'-'+d;
			_this.startTime = moment(formatwdate).format('YYYY-MM-DD HH:mm:ss');
		$.post(ctxPath+"/real-time_supervision/selectDate",{"startTime":_this.startTime,"endTime":_this.endTime,"code":row.deviveId,"type":_this.type,"deviceType":row.swiDevicemodelCode},function(data){
			debugger
			_this.historicalList=data.data.list;
			_this.pictLoading= false;
			realTime.showToggle();
		});
		},
		backwater:function(){
			var _this = this;
			_this.switchTab = false;
			_this.isshow=false;
		},
			//根据时间日期查询
			selectDate:function(num){
				var _this = this;
				var  pictLoading=_this.pictLoading;
				debugger
				var momenft = moment(_this.startTime)<moment(_this.endTime);
			 if(_this.startTime==null||_this.startTime==""&&_this.endTime==null||_this.endTime==""){
					layer.open({
						  title:"警告",
						  content: '请选择正确的时间段',
						  shade: 0,
						  });
				}else if(momenft==false){
					layer.open({
						  title:"警告",
						  content: '请选择正确的时间段',
						  shade: 0,
						  });
				}else{
					//此处跳转form表单和加载图片
						_this.switchTab = true;
						_this.pictLoading = true;
						_this.startTime = moment(_this.startTime).format('YYYY-MM-DD HH:mm:ss');
						_this.endTime = moment(_this.endTime).format('YYYY-MM-DD HH:mm:ss');
						_this.num = num;
					$.post(ctxPath+"/real-time_supervision/selectDate",{"startTime":_this.startTime,"endTime":_this.endTime,"code":code,"type":_this.type,"deviceType":_this.deviceType},function(data){
						_this.historicalList=data.data.list;
						_this.pictLoading= false;
					});
				}
			},
			//格式化页面表格数据(累计流量)
			formatotalFlow:function(row,column){
				var _this = this;
				return row.totalFlow =  Number(Number(row.instantFlow)*600).toFixed(3);
			},
			//闸门站名称格式化方法
			fromSliceName:function(row,column){
				var _this = this;
				for(var i=0;i<_this.suList.length;i++){
					if(_this.suList[i].deviceSluiceCode==row.devicesluiceCode){
						return row.devicesluiceName = _this.suList[i].deviceSluiceName;
					}
				}
			},
			/*分页方法*/
			handleSizeChange:function(size,type){
				var _this = this;
				if(type=="1"){
					_this.pagesize = size;
				}else if(type=="2"){
					_this.pagesize2 = size;
				}else if(type=="3"){
					_this.pagesize3 = size;
				}
			},
			/*分页方法*/
			handleCurrentChange:function(currentPage,type){
				var _this = this;
				debugger
				if(type=="1"){
					_this.currentPage = currentPage;
					if(_this.num!=''){
						$.post(ctxPath+"/real-time_supervision/selectDate",{"startTime":_this.startTime,"endTime":_this.endTime,"code":code,"type":_this.type,"page":_this.currentPage},function(data){
							debugger 
							_this.deList = data.data.deList;
							 _this.siteWaterList = data.data.list
							 realTime.sum = data.data.sum;
							 debugger
						});
					}else{
						$.post(ctxPath+"/real-time_supervision/selectType",{"code":code,"type":_this.type,"page":currentPage},function(data){
							debugger
							realTime.siteWaterList = data.data.list;
							_this.flowList = data.data.flowList;
							_this.deList = data.data.deList;
							realTime.sum = data.data.sum;
						});
					}
				}else if(type=="2"){
					_this.currentPage2 = currentPage;
						if(_this.num!=''){
							$.post(ctxPath+"/real-time_supervision/selectDate",{"startTime":_this.startTime,"endTime":_this.endTime,"code":code,"type":_this.type,"page":_this.currentPage2},function(data){
								 _this.deList = data.data.deList;
								 _this.siteWaterList = data.data.list
								 realTime.sum = data.data.sum;
							});
					}else{
						$.post(ctxPath+"/real-time_supervision/selectType",{"code":code,"type":_this.type,"page":currentPage},function(data){
							realTime.siteSliue = data.data.list;
							_this.suList = data.data.suList;
							realTime.sum = data.data.sum;
						});
					}
				}else if(type=="3"){
					_this.currentPage3 = currentPage;
				}
			},
			handleClickTred:function(row){
				var _this = this;
				debugger
				_this.tieRow = row;
				_this.dialogVisible = true;
			},
			excelPortyu:function(){
				var _this = this;
				debugger
				if(_this.siteWaterList.length>0){
					window.location.href=ctxPath+"/real-time_supervision/byExport"
				}else{
					layer.open({
						  title:"警告",
						  content: '请先查询相关数据',
						  shade: 0,
						  });
				}
			},
		},
	//初始化页面
	created:function(){
		debugger
		var _this = this;
		_this.currentPage = 1;
		_this.currentPage2 = 1;
		//页面加载完成后默认查询水位站的数据
		$.post(ctxPath+"/real-time_supervision/selectType",{"code":"","type":_this.type,"page":_this.currentPage},function(data){
			realTime.siteWaterList = data.data.list;
			_this.flowList = data.data.flowList;
			_this.deList = data.data.deList;
			_this.suList = data.data.suList;
			realTime.sum = data.data.sum;
		});
	},
});
//树结构单击事件
var code = null;
var Wind;

function start(id,typ,pression,Tcode){
	realTime.currentPage = '1';
	realTime.currentPage2 = '1';
	code = Tcode;
	closeWind();
	realTime.siteWaterList = [];
	//realTime.type为标签的类型(1:水位站,2:闸门站,3:视频站)
	if(realTime.type==""||realTime.type==null){
		layer.open({
			  title:"警告",
			  content: '请选择站点类型',
			  shade: 0,
			  });
		//查询水位站的数据
	}else{
		if(realTime.type=="3"){
			$("#siteVideo").empty();
			$("#inputVideo").empty();			
			$.post(ctxPath+"/real-time_supervision/playModel",{"code":code},function(msg){
				debugger
				realTime.siteVideo=msg;
				closeWind();
				for(var i=0; i<msg.length; i++){
					$("#siteVideo").append(
				               "<div id="+msg[i].id+" style=''>" +
				               	"</div>");
					$("#inputVideo").append(
				               			"<div><label>" +
				               				"<input style=' align=right; ' name='radio' type='radio' value="+msg[i].deviceSerial+" id="+msg[i].deviceVideoCode+">"+msg[i].deviceVideoName+"" +
				               			"</label></div>"
				               			);
					var vid =document.getElementById(msg[i].id);
					var player = cyberplayer(vid).setup({
					    width: 380,
					    height: 220,
					    autostart: true,
					    stretching: "uniform",
					    volume: 100,
					    controls: true,
					    playlist: [
					        {
					            sources: [
					                {//http://hls.open.ys7.com/openlive/4438fe77f6b94cf6a3ecd819663e1c42.m3u8
					                    file: msg[i].ezopenHdLive, // 资源1 支持mp4, hls, flv等常用视频格式
					                    label: "高清" // 标签
					                },
					                {
					                    file: msg[i].ezopenLive, // 资源2 必须与资源1格式和时长一致！
					                    label: "标清"
					                }
					            ]
					        }
					    ],
					    ak: "1d075bbb10254a489cc3298cdddda527" // 公有云平台注册即可获得accessKey
					}); 
					
					//开始控制云台
					var TongDao =document.getElementById(msg[i].deviceVideoCode);
					TongDao.onclick=function(){
						var deviceSerial =$('input:radio[name="radio"]:checked').val();//设备编码
						//alert(deviceSerial);
						$.ajax({
							url:ctxPath+"/real-time_supervision/byDeviceSerialInfo",
							data: {deviceSerial:deviceSerial},
							type: "post",
							async: false,//非异步
							success: function(date){
								Wind=window.open(ctxPath+"/page.jsp?accesstoken="+date.accesstoken+"&deviceChannelNumber="+date.deviceChannelNumber+"&equipmentSequence="+date.equipmentSequence, 'newwindow', 'height=220, width=180, top=500, left=1300, toolbar=yes, menubar=no, scrollbars=no, resizable=no,location=no, status=no')
							}
							
						});
					}
				}
				
			});
		}else{
			$.post(ctxPath+"/real-time_supervision/selectType",{"code":code,"type":realTime.type},function(data){
				if(data.data.list==""||data.data.list==null){
					realTime.siteWaterList = [];
					realTime.siteSliue = [];
					realTime.sum = '';
				}else if(realTime.type=="1"){
					debugger
					realTime.siteWaterList = data.data.list;
					realTime.flowList = data.data.flowList;
					realTime.deList = data.data.deList;
					realTime.sum = data.data.sum;
					realTime.switchTab= false;
					realTime.isshow= false;
				}else if(realTime.type=="2"){
					realTime.siteSliue = data.data.list;
					realTime.suList = data.data.suList;
					realTime.sum = data.data.sum;
				}
			});
		}
	}
	
	//关闭打开的新窗口，否则提示
	function closeWind(){
		if(Wind){//如果Wind对象存在
			Wind.close();//调用关闭方法
	        Wind=null//并把值赋成null
		}
	}
}
