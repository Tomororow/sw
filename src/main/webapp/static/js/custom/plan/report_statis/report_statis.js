var curWwwPath = window.document.location.href;
var pathName = window.document.location.pathname;
var pos = curWwwPath.indexOf(pathName);
var localhostPaht = curWwwPath.substring(0,pos);
var projectName = pathName.substring(0,pathName.substr(1).indexOf('/')+1);
var ctxPath = localhostPaht + projectName;
var picPath = localhostPaht;
var reportStatis = new Vue({
	el:'#reportStatis',
	data:{
        loading:true,
		type:'1',//顶部标签type
		deviceType:'0',//左侧标签type
		waterAreaId:'',
		canalCode:'',
		reportDay:'',
		reportMonth:'',
		reportYear:'',
		tableData:[],
		time:'',
		state:true,
		excelData:[],
        currentPage:1,//当前页数
        pageSize:6,//当前页显示最大数
		tabPosition:'left',//设置tabs标签左侧显示
		reportDialogModule:{
        	reportDialogVisible:false,
			rowDataInfo:[],
			queryStartTime:'',
			queryEndTime:'',
			dialogCurrentPage:1, //dialog当前页码数
			dialogPageSize:'10', //dialog当前页显示的最大数量
			dialogTableData:[],
		}
	},
	methods:{
		//上侧tab标签页点击方法
		topTabClick:function(row){
			var _this = this;
			_this.tableData = [];
			_this.time = '';
			_this.reportDay = "";_this.reportMonth = "";_this.reportYear = "";
            _this.currentPage = 1;
			debugger
			_this.reportQuery(_this.time);
		},
		//左侧tab标签页点击方法
		leftTabClick:function(){
            var _this = this;
            debugger
            _this.tableData = [];
            _this.time = '';
            _this.reportDay = "";_this.reportMonth = "";_this.reportYear = "";
            _this.currentPage = 1;
            _this.reportQuery(_this.time);

		},
        handleSizeChange:function(pageSize){
            var _this = this;
            _this.pageSize = pageSize;
        },
        handleCurrentChange:function(currentPage){
            var _this = this;
            _this.currentPage = currentPage;
            // _this.data_Average_Traffic();
        },
		//查询按钮（ type: 1:日报表--reportDay;2:月报表--reportMonth;3:年报表--reportYear）
		selectDate:function(type,cxv){
			var _this = this;
			debugger
			if (cxv == "1") {
				_this.TimeOrDateUnit(type);
				if (_this.state) {
					_this.tableData = [];
					_this.reportQuery(_this.time);
				}
			} else {
				window.location.href = (ctxPath + "/report_statis/report_excel?canalCode=" + _this.canalCode
					+"&deviceType="+ _this.deviceType + "&type=" + _this.type + "&time=" + _this.time);
			}
		},
		dateFormat:function(row, column){
			var _this = this;
			switch(_this.type){
			case "1" :
				return row.createTime = moment(row.createTime).format("YYYY-MM-DD");
				break;
			case "2" :
				return moment(row.createTime).format("YYYY-MM");
                break;
			default:
				return moment(row.createTime).format("YYYY");
				break;
			}
		},
        dateFormat2:function(row, column){
            var _this = this;
            var date = row[column.property];
            return moment(date).format("YYYY-MM-DD HH:mm:ss");
        },
		//时间日期的计算方法
		TimeOrDateUnit:function(type){
			var _this = this;
			debugger
			switch(type){
			case "1" :
				if(_this.reportDay==""){
					_this.$message({
		                message: '请选择报表日期！',
		                type: 'warning'
		            });
					_this.state = false;
				}else{
					_this.time = _this.reportDay.getTime();
					_this.state = true;
				}
				break;
			case "2":
				if(_this.reportMonth==""){
					_this.$message({
		                message: '请选择查询月份！',
		                type: 'warning'
		            });
					_this.state = false;
				}else{
					_this.time = _this.reportMonth.getTime();
					_this.state = true;
				}
				break;
			default:
				if(_this.reportYear==""){
					_this.$message({
		                message: '请选择查询年份！',
		                type: 'warning'
		            });
					_this.state = false;
				}else{
					_this.time = _this.reportYear.getTime();
					_this.state = true;
				}
				break;
			}
		},
		//树菜单点击方法
		zTreeOnClick:function(event, treeId, treeNode){
			debugger
			var _this = this;
			debugger
			_this.canalCode = treeNode.canalCode;
			_this.reportQuery(_this.time);

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
			$.post(ctxPath+'/cal_canal_info/tree_canal',{waterId:id,waterCode:code},function(result){
				debugger
				if(result!=""&&result!=null) {
					var treeData = result;
					treeData[0].open = true;
					if(treeData[0].children[0] != undefined){
						treeData[0].children[0].open = true;
					}
					$.fn.zTree.init($('#treeDemo'), setting, treeData);
					_this.canalCode = treeData[0].canalCode;
					_this.reportQuery(_this.time);
				}
			});
		},
		//报表查询
		reportQuery:function (time) {
			var _this = this;
			debugger
			$.post(ctxPath+"/report_statis/reportList",{"canalCode":_this.canalCode,"deviceType":_this.deviceType,"type":_this.type,"time":time},function(data){
				debugger
                if(data != ""){
                    _this.tableData = JSON.parse(data);
                }else{
                    _this.tableData = '';
					_this.$message({
						message: '当前日期暂无数据，请重新选择日期后查询',
						type: 'warning'
					});
                }
                _this.data_Average_Traffic();
                _this.loading = false;
			})
		},
        data_Average_Traffic:function () {
            var _this = this;
			debugger
            let xAxisData = [];
			let seriesData1 = [];
			let seriesData2 = [];
			let data = _this.tableData.slice((_this.currentPage-1)*_this.pageSize,
                (_this.currentPage-1)*_this.pageSize+6>_this.tableData.length?_this.tableData.length:(_this.currentPage-1)*_this.pageSize+6);
			// let data = _this.tableData;
			for(i in data){
                xAxisData.push(data[i].waterName);
                seriesData1.push('1'==_this.type?data[i].avgDayFlow:'2'==_this.type?data[i].avgMonthFlow:data[i].avgYearFlow);
                seriesData2.push('1'==_this.type?data[i].dayFlow:'2'==_this.type?data[i].monthFlow:data[i].yearFlow);
            }

			let myChart = echarts.init(document.getElementById("data_Average_Traffic"));
            let option = {
                color: ['#3398DB'],
                title: {
                    text: '各渠流量统计',
                    // subtext: '流量统计',
                    left: 'center'
                },
                tooltip: {
                    trigger: 'axis',
                    axisPointer: {            // 坐标轴指示器，坐标轴触发有效
                        type: 'shadow'        // 默认为直线，可选为：'line' | 'shadow'
                    }
                },
                legend: {
                    x:'70%',
                    data: ['平均流量', '总流量']
                },
                grid: {
                    left: '3%',
                    right: '8%',
                    bottom: '15%',
                    containLabel: true
                },
                xAxis: [
                    {
                        type: 'category',
                        data:  xAxisData,
                        axisTick: {
                            alignWithLabel: true
                        }
                    }
                ],
                yAxis: [
                    {
                        type: 'value',
                        name: '流量',
                        axisLabel: {
                            formatter: '{value}m³'
                        }
                    }
                ],
/*				dataZoom: [
					{
						show: true,
						start: 0,
						end: 20,
						bottom:0
					},
				],*/
                series: [
                    {
                        name: '平均流量',
                        type: 'bar',
                        barWidth: '20%',
                        data: seriesData1,
                        color:'#3398DB',
                        markLine: {
                            data: [
                                {type: 'average', name: '平均值'}
                            ]
                        }
                    },
                    {
                        name: '总流量',
                        type: 'bar',
                        barWidth: '20%',
                        data: seriesData2,
                        color:'#c23531',
                        markLine: {
                            data: [
                                {type: 'average', name: '平均值'}
                            ]
                        }
                    }
                ]
            };

            //使用刚指定的配置项和数据显示图表
			myChart.setOption(option,true);
		},

		//详细历史数据查询 dialog----20200929----
		//dialog分页
		handleDialogSizeChange:function(dialogPageSize){
			this.reportDialogModule.dialogPageSize = dialogPageSize;
		},
		//dialog分页
		handleDialogCurrentChange:function(dialogCurrentPage){
			this.reportDialogModule.dialogCurrentPage = dialogCurrentPage;
		},
		//日/月/年报表详细查询
		detailReportQuery(row){
			this.reportDialogModule.reportDialogVisible = true;
			this.reportDialogModule.rowDataInfo = row;
			this.dialogTableDataQuery(this.reportDialogModule.queryStartTime,this.reportDialogModule.queryEndTime);
		},
		//关闭按钮压下后
		doCancel(){
			this.reportDialogModule.reportDialogVisible = false;
			this.reportDialogModule.rowDataInfo = [];
			this.reportDialogModule.queryStartTime = '';
			this.reportDialogModule.queryEndTime = '';
			this.reportDialogModule.dialogCurrentPage = 1;
			this.reportDialogModule.dialogPageSize = '10';
		},
		tableRowClassName:function(row, index) {
			if (index%2 !=0) {
				return 'positive-row';
			}
			return '';
		},
		//dialog数据查询点击
		dialogTableDataClick(){
			let time = this.dateFormat3();
			if(this.dateJudgment(time[0],time[1])){
				this.dialogTableDataQuery(time[0],time[1]);
			}
		},
		//dialog数据查询
		dialogTableDataQuery(startTime,endTime){
            this.reportDialogModule.dialogTableData = [];
			$.post(ctxPath+"/report_statis/history_data_query",{"startTime":startTime,"endTime":endTime,
				"code":this.reportDialogModule.rowDataInfo.waterCode,"type":this.type,"deviceType":this.deviceType},(result)=>{
				if( result != "" && result.length > 0){
					this.reportDialogModule.dialogTableData = JSON.parse(result);
				}
			});
		},
		//日期格式化
		dateFormat3(){
			let time = [];
			let startTime = '';
			let endTime ='';
			//时间格式化
			switch(this.type){
				case '1':
					startTime = moment(this.reportDialogModule.queryStartTime).format("YYYY-MM-DD");
					endTime = moment(this.reportDialogModule.queryEndTime).format("YYYY-MM-DD");
					break;
				case '2':
					startTime = moment(this.reportDialogModule.queryStartTime).format("YYYY-MM");
					endTime = moment(this.reportDialogModule.queryEndTime).format("YYYY-MM");
					break;
				case '3':
					startTime = moment(this.reportDialogModule.queryStartTime).format("YYYY");
					endTime = moment(this.reportDialogModule.queryEndTime).format("YYYY");
					break;
			}
			time.push(startTime);
			time.push(endTime);
			return time;
		},
		//dialog数据报表导出
		dialogTableDataExport(){
            let time =[];
            time = this.dateFormat3();
		    if(this.reportDialogModule.queryStartTime == ''){
                time[0] = this.reportDialogModule.queryStartTime;
            }
		    if(this.reportDialogModule.queryEndTime == ''){
                time[1] = this.reportDialogModule.queryEndTime;
            }
			if(this.reportDialogModule.dialogTableData.length > 3){
				window.location.href = (ctxPath + "/report_statis/history_report_excel?startTime=" + time[0]
					+"&endTime="+ time[1] + "&code=" + this.reportDialogModule.rowDataInfo.waterCode + "&type=" + this.type + "&deviceType=" + this.deviceType);
			}
		},
		//日期判断
		dateJudgment(startTime,endTime){
			debugger
			if(this.reportDialogModule.queryStartTime == ''
				|| this.reportDialogModule.queryStartTime == null){
				this.$message({
					message: '请输入开始日期！',
					type: 'warning'
				});
				return false;
			}
			if(this.reportDialogModule.queryEndTime == ''
				|| this.reportDialogModule.queryEndTime == null){
				this.$message({
					message: '请输入结束日期！',
					type: 'warning'
				});
				return false;
			}
			if(startTime > endTime){
				this.$message({
					message: '当前开始日期大于结束日期，请重新选择！',
					type: 'warning'
				});
				return false;
			}
			if(startTime == endTime){
				this.$message({
					message: '当前选择的日期区间小于1，请重新选择！',
					type: 'warning'
				});
				return false;
			}
			return true;
		},
	},
	created:function(){
		var _this = this;
		debugger
	},
	mounted:function () {
		var _this = this;
		debugger
		_this.handleVityTree();
	},
});