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
		type:'1',
		waterAreaId:'',
		canclCode:'',
		reportDay:'',
		reportMonth:'',
		reportYear:'',
		tableData:[{
			avgFlow:'',
			sumFlow:'',
			deviceState:'',
			canclName:'',
			canclCode:'',
			createTime:'',
		}],
		time:'',
		state:true,
		excelData:[],
	},
	methods:{
		//标签页的点击方法
		ObjectSite:function(row){
			var _this = this;
			_this.tableData = [];
			_this.reportDay = "";_this.reportMonth = "";_this.reportYear = "";
			debugger
			$.post(ctxPath+"/report_statis/report_query",{"waterId":_this.waterAreaId,"canclCode":_this.canclCode,"type":row.name,"time":"ready"},function(data){
				_this.tableData = data.data;
			})
		},
		//查询按钮（ type: 1:日报表--reportDay;2:月报表--reportMonth;3:年报表--reportYear）
		selectDate:function(type,cxv){
			var _this = this;
			debugger
			if(cxv=="1"){
				_this.TimeOrDateUnit(type);
				if(_this.state){
					_this.tableData = [];
					$.post(ctxPath+"/report_statis/report_query",{"waterId":_this.waterAreaId,"canclCode":_this.canclCode,"type":_this.type,"time":_this.time},function(data){
						_this.tableData = data.data;
					})
				}
			}else{
				_this.excelData = [];
				if(_this.tableData.length==0){
					_this.$message({
		                message: '查询结果为空，不可导出报表！',
		                type: 'warning'
		            });
				}else{
					var datey = "";
					for(var i=0;i<_this.tableData.length;i++){
						if(_this.type=="1"){
							datey=moment(_this.tableData[i].createTime).format("YYYY-MM-DD");
						}else if(_this.type=="2"){
							datey=moment(_this.tableData[i].createTime).format("YYYY-MM");
						}else{
							datey=moment(_this.tableData[i].createTime).format("YYYY");
						}
						_this.excelData.push(
								{"avgFlow":_this.tableData[i].avgFlow,"sumFlow":_this.tableData[i].sumFlow,"deviceState":_this.tableData[i].deviceState,
								"canclName":_this.tableData[i].canclName,"canclCode":_this.tableData[i].canclCode,"createTime":datey}
						);
					}
					var tabStr = JSON.stringify(_this.excelData);
					window.location.href=(ctxPath+"/report_statis/report_excel?tableData="+encodeURIComponent(tabStr)+"&type="+_this.type);
				}
			}
		},
		dateFormat:function(row, column){
			var _this = this;
			debugger
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
	},
	created:function(){
		var _this = this;
		debugger
		$.post(ctxPath+"/report_statis/report_query",{"waterId":_this.waterAreaId,"canclCode":_this.canclCode,"type":_this.type,"time":"ready"},function(data){
			debugger
			
			_this.tableData = data.data;
		})
	}
});
/*树菜单的点击方法*/
function start(waterId,code,Permiss){
	debugger
	reportStatis.tableData = [];
	if(waterId!=""||code!=""){
		reportStatis.waterAreaId = waterId;
		reportStatis.canclCode = code;
			$.post(ctxPath+"/report_statis/report_query",{"waterId":waterId,"canclCode":code,"type":reportStatis.type,"time":"ready"},function(data){
				reportStatis.tableData = data.data;
			})
	}else{
		alert("水管区Id或水管区级别为空");
	}
	
}