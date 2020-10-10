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
        tableData:[],//站点实时数据
		//视频站
		siteVideo:[],
		//视频站画面展示数据
		siteVideoShow:[],
		//历史数据（水位站/流量站）
		historicalList:[],
		//水位站分页定义
		currentPage:1,
		pagesize:'10',
		pagesize1:'6',
		historycurrentPage:1,//水位站/流量站历史数据当前页
		historyPageSize:'10',//水位站/流量站历史数据每页显示数
		id:'',
		code:'',
		startTime:'',
		endTime:'',
		//站点编码
		deviveIdCode:'',
		deviceWaterName:'',//站点名称
		//分页长度
		sum:0,
		switchTab:false,
		switchTabm:false,
		dialogVisible:false,
		isshow:false,
		pictLoading:'',
		tieRow:'',
		canalCode:'',//最高级渠道区域code
		fullscreenLoading: false,
		exporting:false,
		videoControl:{
			consoleTag:1,
			fullscreen:false,
			consoleTagSelect:['6x6','7x7','8x8','9x9'],
			consoleTagSelectVal:'',
			videoDeviceSerial:'',
			beforeVideoDivId:'',
			deviceVideoName:'全部展示',
		}
	},
	methods:{
		//前端分页的方法
		tableRowClassName:function(row, index) {
			if (index%2 !=0) {
				return 'positive-row';
			}
			return '';
		},
		handleSizeChangeother:function(pagesize){
			var _this = this;
			_this.pagesize = pagesize;
		},
		handleCurrentChangeother:function(currentPage){
			var _this = this;
			_this.currentPage = currentPage;
			if(_this.type=="3"){
				_this.pictLoading = true;
				_this.videoDataShow(currentPage);
			}
		},
		//标签方法
		ObjectSite:function(row){
			var _this = this;
			if(_this.isshow == true){ //报表导出栏显示时
				if(_this.switchTab == true && _this.type!="1"){//水位站历史记录tab显示&&当前点击的不是自身
					_this.switchTab = false;
					_this.isshow = false;
				}
				if(_this.switchTabm == true && _this.type!="2"){//流量站历史记录tab显示&&当前点击的不是自身
					_this.switchTabm = false;
					_this.isshow = false;
				}
				if(_this.type=="3"){//视频站tab栏点击
					_this.switchTabm = false;
					_this.switchTab = false;
					_this.isshow = false;
				}
			}
			//初始化当前页
			_this.currentPage = 1;
			_this.historycurrentPage = 1;
			_this.type = row.name;
			//如果树结构已被点击此时点击标签仍可查询
			if(_this.type=="1"||_this.type=="2"){
				_this.tableData =[];
				_this.handleSelectType(_this.type,_this.canalCode);
			}else if(_this.type=="3"){
				$("#siteVideo").empty();
				$("#inputVideo").empty();
				_this.handleSelectVideo(_this.canalCode);
/*				$.post(ctxPath+"/real-time_supervision/playModel",{"code":""},function(msg){
					_this.siteVideo = msg;
					_this.pictLoading = true;
					_this.videoDataShow(_this.currentPage);
				});*/
			}
		},
        //行点击事件
        tableRowClick(row,index,e){
            this.$refs.refTable.toggleRowExpansion(row)
        },
		//单个视频站点查看
		getLabelInfo:function(row){
			var _this = this;
			debugger
			if(row.ezopenLive!=""&&row.ezopenLive!=null){
				var drty = row.swiDevicemodelCode==12?'vidqt':'vidqw';
				/*video的id为deviveId*/
				let playDom = document.querySelector("#"+drty+row.deviveId);
				playDom.src = row.ezopenLive;
				var player = new EZUIPlayer(drty+row.deviveId);
				player.play();
			}else{
				_this.$message({
					message: '该站点视频地址为空...',
					type: 'warning'
				})
			}
		},
		//视频站数据编辑：一页6个
		videoDataShow:function(){
			var _this = this;
			debugger
			setTimeout(function(){
				var videoDom = $("#videoAtr table video");
				// var sourceDom = $("#videoAtr table video source");
				let val = _this.siteVideoShow[Symbol.iterator]();
				let item = null;
				let tag = _this.videoControl.consoleTag;
				for (let i = 0; i < tag; i++) {
					for (let j = 0; j < tag; j++) {
						let playDom = document.querySelector("#myPlayer"+i+j);
						debugger
						if(!(item = val.next()).done){
							var videoUrl = "";
							if(item.value.sviDevicemodelCode=='13'){//枪机
								videoUrl =  item.value.ezopenHdLive;
							}else{
								videoUrl = item.value.ezopenLive;
							}
							playDom.src = videoUrl;
							playDom.firstChild.src = videoUrl;
							$('#videoInput'+i+j).val(JSON.stringify(item.value));
							// playDom.play();
							var player = new EZUIPlayer('myPlayer'+i+j);
						}else{
							playDom.src = "";
							playDom.firstChild.src ="";
							$('#videoInput'+i+j).val("");
						}
					}
				}
				_this.pictLoading = false;
			},500);
		},

		showToggle:function(){
			var _this = this;
			_this.isshow = !_this.isshow
		    },
		//历史记录查询
		selecthdata:function(row){
			var _this = this;
			debugger
			_this.historicalList = [];
			_this.sum = 0;
			if(row.swiDevicemodelCode == 12){ //雷达水位站
				_this.switchTab = true;
				_this.switchTabm = false;
			}else{
				_this.switchTab = false;
				_this.switchTabm = true;
			}
			_this.deviveIdCode=row.deviveId;
			_this.deviceWaterName = row.terminalName;
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
			_this.handelSelectDate(_this.startTime,_this.endTime,_this.deviveIdCode,_this.historycurrentPage,true);
		},

		backwater:function(){
			var _this = this;
			_this.switchTab = false;
			_this.isshow=false;
			_this.switchTabm = false;
		},

		//根据时间日期查询
		selectDate:function(){
			var _this = this;
			debugger
			_this.historicalList = [];
			_this.sum = 0;
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
				 _this.handelSelectDate(_this.startTime,_this.endTime,_this.deviveIdCode,_this.historycurrentPage,true);
			}
		},

		//格式化页面表格数据(累计流量)
		formatotalFlow:function(row,column){
			var _this = this;
			return row.totalFlow =  Number(Number(row.instantFlow)*600).toFixed(3);
		},

		/*分页方法*/
		handleSizeChange:function(size){
			var _this = this;
			_this.historyPageSize = size;
		},

		/*分页方法*/
		handleCurrentChange:function(currentPage){
			var _this = this;
			debugger
			_this.pictLoading = true;
			_this.historycurrentPage = currentPage;
			_this.handelSelectDate(_this.startTime,_this.endTime,_this.deviveIdCode,_this.historycurrentPage,true);
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
			_this.exporting = true;
			_this.pictLoading = true;
			if(_this.historicalList.length>0){
                $.ajaxSettings.async = false;
                _this.handelSelectDate(_this.startTime,_this.endTime,_this.deviveIdCode,_this.historycurrentPage,false);

                this.$confirm('数据准备成功，是否导出',{
                    type: 'warning'
                }).then(() => {
                    window.location.href=ctxPath+"/real-time_supervision/byExport";
                }).catch(_ => {});
                $.ajaxSettings.async = true;
			}else{
				layer.open({
					  title:"警告",
					  content: '请先查询相关数据',
					  shade: 0,
					  });
			}
			_this.exporting = false;
			_this.pictLoading = false;
		},

		//树目录结构加载
		handleVityTree:function(id,code){
			var _this = this;
			debugger
			setting = {
				view: {
					selectedMulti: false
				},
				check: {
					enable: true
				},
				callback: {
					onClick: _this.zTreeOnClick
				},
				data:{
					simpleData: {
						enable: true
					},
					key:{
						name:'canalName'
				}
				},

			};
			$.post(ctxPath+"/cal_canal_info/tree_canal",{waterId:id,waterCode:code},function(result){
				debugger
				if(result!=""&&result!=null) {
					var treeData = result;
					/*treeData[0].open = true;
					if(treeData[0].children[0] != undefined){
						treeData[0].children[0].open = true;
					}*/
					var treeObject = $.fn.zTree.init($('#treeDemo'), setting, treeData);
					treeObject.expandAll(true);
					_this.canalCode = _this.code = treeData[0].canalCode;
					//页面加载完成后默认查询水位站的数据
					_this.handleSelectType(_this.type,_this.canalCode);
				}
			});
		},

		//树菜单点击事件
		zTreeOnClick:function(event, treeId, treeNode){
			debugger
			var _this = this;
			_this.currentPage = 1;
            if(_this.type=="1"||_this.type=="2"){
                _this.code = treeNode.canalCode;
                _this.tableData =[];
                _this.handleSelectType(_this.type,treeNode.canalCode);
            }else{
				_this.handleSelectVideo(treeNode.canalCode);
            }
		},

		//站点记录查询
        handleSelectType:function(type,code){
			 var _this = this;
			 debugger
            $.post(ctxPath+"/real-time_supervision/selectType",{"code":code,"type":type},function(data){
            	debugger
				if(data != null && data != ""){
					_this.tableData = JSON.parse(data);
				}
            });
        },

		//历史记录查询
		handelSelectDate:function (startTime,endTime,code,currentPage,flag) {
			var _this = this;
			debugger
			$.post(ctxPath+"/real-time_supervision/selectDate",{"startTime":startTime,"endTime":endTime,"code":code,"page":currentPage,"flag":flag},function(data){
				debugger
				if(data != null && data != ""){
					let result = JSON.parse(data);
					if(flag){
                        _this.historicalList=result.swdList;
                        _this.sum = result.sum;
                    }
				}
				_this.pictLoading= false;
				_this.isshow = true;
			});
		},

		//视频站查询
		handleSelectVideo:function(code){
			var _this = this;
			debugger
			_this.siteVideoShow = [];
			$.post(ctxPath+"/real-time_supervision/playModel",{"code":code},function(msg){
				_this.siteVideo = msg;
				_this.pictLoading = true;
				if(_this.siteVideo.length > 0){
					let sqrtVal = Math.sqrt(_this.siteVideo.length).toFixed(2);
					_this.videoControl.consoleTag = Math.ceil(sqrtVal);
					if(_this.videoControl.consoleTag > 9){
						// for (let i = 0; i < 81; i++) {
						// 	_this.siteVideoShow.push(_this.siteVideo[i]);
						// }
						_this.siteVideoShow = _this.siteVideo.slice(0,80);
						_this.videoControl.consoleTag = 9;
					}else{
						_this.siteVideoShow = _this.siteVideo;
					}
				}
				_this.videoDataShow();
			});
		},

		//时间格式化（"YYYY-MM-DD HH:mm:ss"）
		dateFormat:function(row, column){
			var _this = this;
			var date = row[column.property];
			return moment(date).format("YYYY-MM-DD HH:mm:ss");
		},
		//视频控制按钮
		consoleClick:function (tag) {
			var _this = this;
			_this.siteVideoShow = [];
			_this.videoControl.consoleTag = tag;
			let powVal = Math.pow(tag,2);
			if(_this.siteVideo.length < powVal){
				_this.siteVideoShow = _this.siteVideo;
			}else{
				// for (let i = 0; i < powVal; i++) {
				// 	_this.siteVideoShow.push(_this.siteVideo[i]);
				// }
				_this.siteVideoShow = _this.siteVideo.slice(0,powVal-1);
			}
			_this.videoDataShow();
		},
		consoleSelectChange:function(event){
			this.videoControl.consoleTagSelectVal = event;
			this.consoleClick(this.videoControl.consoleTagSelect.indexOf(event)+6);
		},
		//全屏或退出全屏
		screen:function () {
			var _this=this;
			let fullarea = document.getElementById('videoAtr')
				if (_this.videoControl.fullscreen) {    // 退出全屏
					if (document.exitFullscreen) {
						document.exitFullscreen();
					} else if (document.webkitCancelFullScreen) {
						document.webkitCancelFullScreen();
					} else if (document.mozCancelFullScreen) {
						document.mozCancelFullScreen();
					} else if (document.msExitFullscreen) {
						document.msExitFullscreen();
					}
				} else {    // 进入全屏
					if (fullarea.requestFullscreen) {
						fullarea.requestFullscreen();
					} else if (fullarea.webkitRequestFullScreen) {
						fullarea.webkitRequestFullScreen();
					} else if (fullarea.mozRequestFullScreen) {
						fullarea.mozRequestFullScreen();
					} else if (fullarea.msRequestFullscreen) {
						// IE11
						fullarea.msRequestFullscreen();
					}
				}
		},
		//视频框点击事件
		videoDivClick:function(idx,idt){
			$(this.videoControl.beforeVideoDivId).css('border','');
			var video1=document.getElementById("myPlayer"+idx+idt);
			video1.onclick=function(){
				if(video1.paused){
					video1.play();
				}else{
					video1.pause();
				}
			}
			let videoInputVal = JSON.parse($('#videoInput'+idx+idt).val());
			this.videoControl.videoDeviceSerial = videoInputVal.deviceSerial;
			this.videoControl.deviceVideoName = videoInputVal.deviceVideoName;
			$('#videoDivId'+idx+idt).css('border','solid 2px #00B83F');
			this.videoControl.beforeVideoDivId = '#videoDivId'+idx+idt;
		},
		//云台控制事件
		yuntaiControlBefore:function (type, deviceSerial) {
			if(deviceSerial == undefined || deviceSerial == null || deviceSerial == ""){
				this.$message({
					message: '请选择需要控制的视频',
					type: 'warning'
				})
			}else{
				yuntaiControl(type, deviceSerial);
			}
		}
	},
	//初始化页面
	created:function(){
		debugger
		var _this = this;
	},
	mounted:function () {
		debugger
		var _this = this;
		_this.handleVityTree();
	}
});

/**
 * 监听ESC事件
 */
window.addEventListener('resize', function (data) {
	if(realTime.videoControl.fullscreen){
		realTime.screen();
	}
	realTime.videoControl.fullscreen = !realTime.videoControl.fullscreen;
})

