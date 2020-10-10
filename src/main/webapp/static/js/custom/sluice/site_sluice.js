/* 相对链接的基准URL */
var curWwwPath = window.document.location.href;
var pathName = window.document.location.pathname;
var pos = curWwwPath.indexOf(pathName);
var localhostPaht = curWwwPath.substring(0,pos);
var projectName = pathName.substring(0,pathName.substr(1).indexOf('/')+1);
var ctxPath = localhostPaht + projectName;
var picPath = localhostPaht;

var scroll = new Vue({
	el:'#scroll',
	data:{
		canalInfo:[],
		canalCode:'',//渠道编码
		sluiceData:[],//闸门站实时数据
		pageSize:'10',//当前页码数
		currentPage:1,//当前页显示的最大数量
		historySluiceData:[],//闸门站历史数据
		historyDialogVisible:false,
		dialogCurrentPage:1, //dialog当前页码数
		dialogPageSize:'10', //dialog当前页显示的最大数量
		dialogDevicesluiceCode:'',//当前历史数据站点编码
		dialogDevicesluiceName:'',//当前历史数据站点名称
		loading:true, // dialog加载Loading
		sluiceCodeSelect:'',//按闸门站编码检索
		sluiceNameSelect:'',//按闸门站名称检索
		queryStartTime:'',
		queryEndTime:'',
		activeName:'1',//标签属性值,默认为1
		videoData:[],
		videoDataShow:[], //视频站画面展示数据
		videoLoading:false,
		pageSize2:'6',//视频站每页显示数量
		expands: [],//只展开一行放入当前行id
		videoControl:{
			consoleTag:1,
			fullscreen:false,
			consoleTagSelect:['6x6','7x7','8x8','9x9'],
			consoleTagSelectVal:'',
			videoDeviceSerial:'',
			beforeVideoDivId:'',
			deviceVideoName:'全部展示',
		},
		realVideoData:[],
	},
	methods:{
		handleSizeChange:function(pageSize){
			var _this = this;
			_this.pageSize = pageSize;
			_this.pagesize2 = pageSize;
		},
		handleCurrentChange:function(currentPage){
			var _this = this;
			_this.currentPage = currentPage;
		},
		handleDialogSizeChange:function(dialogPageSize){
			var _this = this;
			_this.dialogPageSize = dialogPageSize;
		},
		handleDialogCurrentChange:function(dialogCurrentPage){
			var _this = this;
			_this.dialogCurrentPage = dialogCurrentPage;
		},
		zTreeOnClick:function(event, treeId, treeNode){
			debugger
			var _this = this;
			_this.canalInfo = treeNode;
			_this.canalCode = treeNode.canalCode;
			if(_this.activeName == '1'){
				_this.showSluiceRealTimeData(_this.canalCode);
			}else if(_this.activeName == '2'){
				_this.showVideoData(_this.canalCode);
			}
		},
		//树目录菜单初始化
		handleVityTree:function(id,code){
			var _this = this;
			debugger
			var setting={
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
			$.post(ctxPath+'/cal_canal_info/tree_canal',{waterId:id,waterCode:code},function(treeData){
				debugger
				if(treeData!=""&&treeData!=null) {
					/*treeData[0].open = true;
					if(treeData[0].children[0] != undefined){
						treeData[0].children[0].open = true;
					}*/
					var treeObject = $.fn.zTree.init($('#treeDemo'), setting, treeData);
					treeObject.expandAll(true);
					_this.canalInfo = treeData[0];
					_this.canalCode = treeData[0].canalCode;
					_this.showSluiceRealTimeData(treeData[0].canalCode);
				}
			});
		},
		//按渠道查询闸门站数据
		showSluiceRealTimeData:function (canalCode) {
			var _this = this;
			debugger
			$.post(ctxPath + "/site_sluice_manage/sluice_realTime_list",{canalCode:canalCode},function (data) {
				_this.sluiceData = JSON.parse(data);
				/*if(_this.sluiceData.length > 0){
					if(_this.expands.length>0){
						_this.expands.shift();
					}
					_this.expands.push(_this.sluiceData[0].id);
				}*/
			})
		},
		//按闸门站编码查询
		sluiceCodeQuery:function(){
			var _this = this;
			debugger
			if(_this.sluiceCodeSelect != ''){
				_this.sluiceData = [];
				$.post(ctxPath + '/site_sluice_manage/sluice_condition_query',{canalCode:_this.canalCode,code:_this.sluiceCodeSelect,name:''},function (data) {
					_this.sluiceData = JSON.parse(data);
					if(_this.sluiceData.length > 0){
						if(_this.expands.length>0){
							_this.expands.shift();
						}
						_this.expands.push(_this.sluiceData[0].id);
					}
				})
			}else{
				_this.$message({
					message: '请输入闸门站编码！',
					type: 'warning'
				});
			}

		},
		//按闸门站名称查询
		sluiceNameQuery:function(){
			var _this = this;
			debugger
			if(_this.sluiceNameSelect != ''){
				_this.sluiceData = [];
				$.post(ctxPath + '/site_sluice_manage/sluice_condition_query',{canalCode:_this.canalCode,code:'',name:_this.sluiceNameSelect},function (data) {
					_this.sluiceData = JSON.parse(data);
					if(_this.sluiceData.length > 0){
						if(_this.expands.length>0){
							_this.expands.shift();
						}
						_this.expands.push(_this.sluiceData[0].id);
					}
				})
			}else{
				_this.$message({
					message: '请输入闸门站名称！',
					type: 'warning'
				});
			}
		},
		//历史数据查询
		historyDataSelect:function (row) {
			var _this = this;
			debugger
			_this.dialogDevicesluiceCode = row.ssgiSluiceGateCode;
			_this.dialogDevicesluiceName = row.ssgiSluiceGateName;
			_this.historyDialogVisible = true; //打开历史数据dialog
			$.post(ctxPath + "/site_sluice_manage/sluice_history_list",{ssdiSluiceGateCode:row.ssgiSluiceGateCode},function (data) {
				_this.historySluiceData = JSON.parse(data);
				_this.loading = false;
			})
		},
		//按时间段查询历史数据
		historyDataQueryByTime:function () {
			var _this = this;
			debugger
            //时间格式化
			let startTime = moment(_this.queryStartTime).format("YYYY-MM-DD HH:mm:ss");
			let endTime = moment(_this.queryEndTime).format("YYYY-MM-DD HH:mm:ss");
            //日期校验
            let flag = _this.dateJudgment(startTime,endTime);
            debugger
            if(flag){
                _this.loading = true;
                $.post(ctxPath + "/site_sluice_manage/sluice_query_time",{code:_this.dialogDevicesluiceCode,
                    startTime:startTime,endTime:endTime},function (data) {
                    _this.historySluiceData = JSON.parse(data);
                    _this.loading = false;
                })
            }
		},
		//日期判断
		dateJudgment:function(startTime,endTime){
			var _this = this;
			debugger
			if(_this.queryStartTime == '' || _this.queryStartTime == null){
				_this.$message({
					message: '请输入开始日期！',
					type: 'warning'
				});
				return false;
			}
			if(_this.queryEndTime == '' || _this.queryEndTime == null){
				_this.$message({
					message: '请输入结束日期！',
					type: 'warning'
				});
				return false;
			}
			if(startTime > endTime){
				_this.$message({
					message: '当前开始日期大于结束日期，请重新选择！',
					type: 'warning'
				});
				return false;
			}
			return true;
		},
		//报表导出
		sluiceExcelExport:function(){
			var _this = this;
			debugger
            if(_this.historySluiceData.length>0){
                window.location.href = ctxPath + "/site_sluice_manage/sluice_excel_export?sluiceName="+_this.dialogDevicesluiceName;
            }else{
                _this.$message({
                    message: '当前无历史数据，无法导出，请重新查询！',
                    type: 'warning'
                });
            }
		},
		//详情dialog取消button压下时执行：关闭对话框，当前页码初始化
		doCancel:function(formName){
			var _this = this;
			debugger
			_this.detailDialogVisible = false;
			_this.dialogCurrentPage = 1;
			_this.queryStartTime = '';
			_this.queryEndTime = '';
		},
		//时间格式化（"YYYY-MM-DD HH:mm:ss"）
		dateFormat:function(row, column){
			var _this = this;
			var date = row[column.property];
			return moment(date).format("YYYY-MM-DD HH:mm:ss");
		},
		tableRowClassName:function(row, index) {
			if (index%2 !=0) {
				return 'positive-row';
			}
			return '';
		},
		//单个视频站点查看
		getLabelInfo:function(row){
			var _this = this;
			_this.realVideoData = [];
			$.post(ctxPath + '/remote_control/sluice_video_info',{id:row.ssgiSluiceMovieId},function (result) {
				if(result!=null&&result!=""){
					_this.realVideoData = JSON.parse(result);
						if(_this.realVideoData.length == 1){
							$('.el-popover').css('width','326px');
						}
						if(_this.realVideoData.length == 2){
							$('.el-popover').css('width','666px');
						}
						localStorage.setItem('realVideoData',JSON.stringify(_this.realVideoData));
				}else{
					_this.$message({
						message: '抱歉，当前闸门暂无关联视频信息...',
						type: 'warning'
					});
				}
			});
		},

		//行点击事件
		tableRowClick(row,index,e){
			debugger
			this.$refs.refTable.toggleRowExpansion(row)
		},
		//标签点击方法
		tabsClick:function () {
			debugger
			var _this = this;
			_this.currentPage = 1;
			if(_this.activeName == '1'){
				_this.showSluiceRealTimeData(_this.canalCode);
			}else if(_this.activeName == '2'){
				_this.showVideoData(_this.canalCode);
			}
		},
		//视频站数据查询
		showVideoData:function (canalCode) {
			debugger
			var _this = this;
			$.post(ctxPath + '/site_sluice_manage/select_video_list',{canalCode:canalCode},function (result) {
				_this.videoData = JSON.parse(result);
				_this.videoLoading = true;
				if(_this.videoData.length > 0){
					let sqrtVal = Math.sqrt(_this.videoData.length).toFixed(2);
					_this.videoControl.consoleTag = Math.ceil(sqrtVal);
					if(_this.videoControl.consoleTag > 9){
						_this.videoDataShow = _this.videoData.slice(0,80);
						_this.videoControl.consoleTag = 9;
					}else{
						_this.videoDataShow = _this.videoData;
					}
				}
				_this.handelVideoData();
			})
		},
		//视频站数据编辑：一页6个
		handelVideoData:function(){
			var _this = this;
			debugger
			setTimeout(function(){
				var videoDom = $("#videoAtr table video");
				// var sourceDom = $("#videoAtr table video source");
				let val = _this.videoDataShow[Symbol.iterator]();
				let item = null;
				let tag = _this.videoControl.consoleTag;
				for (let i = 0; i < tag; i++) {
					for (let j = 0; j < tag; j++) {
						let playDom = document.querySelector("#myPlayer"+i+j);
						if(!(item = val.next()).done){
							var videoUrl = "";
							if(item.value.sviDevicemodelCode=='13'){//枪机
								videoUrl =  item.value.ezopenHdLive;
							}else{
								videoUrl = item.value.ezopenLive;
							}
							playDom.src = videoUrl;
							//playDom.firstChild.src = videoUrl;
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
				_this.videoLoading = false;
			},500);

		},
		getRowKeys:function(row){
			return row.id
		},
		handleConnectionSearch:function(row,expandedRows) {
			var _this = this;
			debugger
			if (expandedRows.length) {//说明展开了
				_this.expands = []
				if (row) {
					_this.expands.push(row.id)//只展开当前行id
				}
			} else {//说明收起了
				_this.expands = []
			}
		},
		//视频控制按钮
		consoleClick:function (tag) {
			var _this = this;
			_this.videoDataShow = [];
			_this.videoControl.consoleTag = tag;
			let powVal = Math.pow(tag,2);
			if(_this.videoData.length < powVal){
				_this.videoDataShow = _this.videoData;
			}else{
				// for (let i = 0; i < powVal; i++) {
				// 	_this.siteVideoShow.push(_this.siteVideo[i]);
				// }
				_this.videoDataShow = _this.videoData.slice(0,powVal-1);
			}
			_this.handelVideoData();
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
	created:function () {

	},
	mounted:function () {
		var _this = this;
		debugger
		_this.handleVityTree();
	},
})

/**
 * 监听ESC事件
 */
window.addEventListener('resize', function (data) {
	if(scroll.videoControl.fullscreen){
		scroll.screen();
	}
	scroll.videoControl.fullscreen = !scroll.videoControl.fullscreen;
})