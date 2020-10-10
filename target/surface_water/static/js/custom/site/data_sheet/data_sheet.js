/* 相对链接的基准URL */
	var curWwwPath = window.document.location.href;
	var pathName = window.document.location.pathname;
	var pos = curWwwPath.indexOf(pathName);
	var localhostPaht = curWwwPath.substring(0,pos);
	var projectName = pathName.substring(0,pathName.substr(1).indexOf('/')+1);
	var ctxPath = localhostPaht + projectName;
	var picPath = localhostPaht;
		var scroller = new Vue({
			el:'#scroller',
			data:{
				swiList:[],
				currentPage:'1',
				pagesize:'10',
				reportYear:'',
				rowList:[],
			},
			methods:{
				formatData:function(row,column){
					debugger
					var _this = this;
					var totle =  Number(row.january) + Number(row.february) +Number(row.march) +Number(row.april) +Number(row.may) +
					Number(row.june) +Number(row.july) +Number(row.august) +Number(row.september) +Number(row.october) +
					Number(row.november) +Number(row.december);
					return row.sum = totle.toFixed(3);
					
					
				},
				selectDate:function(){
					var _this = this;
					debugger
					if(_this.reportYear!=""){
						var date = moment(_this.reportYear).format("YYYY");
						$.post(ctxPath+"/data_sheet/selectAll",{"year":date},function(data){
							_this.swiList = data.data.swiList;
						});
					}else{
						_this.$message({
			                message: '警告哦，请输入查询年份！',
			                type: 'warning'
			            });
					}
				},
				handleSizeChange:function(size){
					var _this = this;
					_this.pagesize = size;
				},
				handleCurrentChange:function(currentPage){
					var _this = this;
					_this.currentPage = currentPage;
				},

					//导出Excel方法
				exportExcel:function(){
					var _this = this;
					debugger
					var len = _this.rowList.length;
					var date = "0";
					if(_this.reportYear!=""){
						date = moment(_this.reportYear).format("YYYY");
					}
					if(_this.swiList!=null){
						window.location.href=ctxPath+"/data_sheet/excel_export?year="+date;
					}else{
						_this.$message({
			                message: '警告哦，请先查询相关数据！',
			                type: 'warning'
			            });
					}
					
				},
			},
			created:function(){
				var _this = this;
				$.post(ctxPath+"/data_sheet/selectAll","",function(data){
					_this.swiList = data.data.swiList;
				});
				
			}
		});
	