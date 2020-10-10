/* 相对链接的基准URL */
var curWwwPath = window.document.location.href;
var pathName = window.document.location.pathname;
var pos = curWwwPath.indexOf(pathName);
var localhostPaht = curWwwPath.substring(0,pos);
var projectName = pathName.substring(0,pathName.substr(1).indexOf('/')+1);
var ctxPath = localhostPaht + projectName;
var picPath = localhostPaht;

var url ;
   for(var i=0;i<4;i++){
	  url=window.location.href.indexOf("/",url+1);
   }
   var localPath = window.location.href.substring(0,url);
var waterSurveySite = new Vue({
	el:'#waterSurveySite',
	//初始化数据类型
	
		data:{
			treeMenus: [],
		    defaultProps: {
		       children: 'children',
		       label: 'label',
		        },
		    waterList: [],
		    dialogTableVisible:false,
	        //树形控件回调函数的id
	        treeList:[],
	        //存储到sessionStorage
	        sessionList:[],
	        pagesize:'10',
	        currentPage:'1',
	        //监测站名称
	        monitorName:'',
	        //默认的展开的label
	        nodeKey:'',
	        //修改弹出框标题
	        updateTitle:'',
	        //图片提交路径
	        imageUrl:localPath+"/water_survey_site/waterImage",
	        map:{},
	        imagePath:'',
		},

	//页面方法集锦
	methods:{
		//Element树形控件回调函数
		handleNodeClick:function(trees,node,self){
			debugger
			sessionStorage.obj="";
			var _this = this;
			_this.treeList=[];
			_this.treeList.push(trees.id,trees.label);
			_this.sessionList.push(trees.sysareaCode,trees.canalCode);
			$.post(localPath+"/water_survey_site/waterData",{id:trees.canalCode},function(result){
				_this.waterList = result;
			});
		},
		handleSizeChange:function(size){
			var _this = this;
			_this.pagesize = size;
		},
		formatterGrade:function(row, column, value, index){
			var _this = this;
			return value == 20 ? "Ⅰ类":''||value == 40 ? "Ⅱ类":''|| value == 60 ? "Ⅲ类":''|| value == 80 ? "Ⅳ类":''|| value == 100 ?"Ⅴ类":'请选择';
		},
		handleCurrentChange:function(currentPage){
			var _this = this;
			_this.currentPage = currentPage;
		},
		//取到页面单击按钮的id值(模板)
		sset:function(event){
			/*alert(event.currentTarget.id)*/
		},
		//修改图片
		updateImage:function(row){
			var _this = this;
			debugger
			_this.map.commodity = JSON.stringify(row);
			_this.dialogTableVisible=true;
			
		},
		onSuccess:function(response, file, fileList){
            var _this = this;
            debugger
            _this.$message({
                message: '恭喜你，图片修改成功！',
                type: 'success'
            });
            _this.dialogTableVisible = false;
        },
        onError:function(err, file, fileList){
            var _this = this;
            debugger
            _this.$message({
                message: '恭喜你，图片修改成功！',
                type: 'success'
            });
            _this.dialogTableVisible = false;
           /* window.location.reload();
*/        },
		//验证图片
		handleChange:function(file,fileList){
			var _this = this;
			debugger
			const isJPG = (file.raw.type === 'image/jpeg')||(file.raw.type === 'image/png');
	        const isLt2M = file.size / 1024 / 1024 < 2;
	        if (!isJPG) {
	          this.$message.error('上传头像图片只能是 JPG或PNG格式!');
	        }
	        if (!isLt2M) {
	          this.$message.error('上传头像图片大小不能超过 2MB!');
	        }
	        
	        return isJPG && isLt2M;
		},
		//新增节点内容
		showTreeForm:function(){
			var _this = this;
			$("#layui-layer-iframe5").attr("scrolling","no");
			sessionStorage.obj = JSON.stringify(_this.sessionList);
			if(_this.treeList==""||_this.treeList==null){
				layer.open({
					  title:"警告",
					  content: '请选择相关渠道！',
					  shade: 0,//遮罩层
					});     
			}else{
				layer.open({
					  title: "新增"+"【"+_this.treeList[1]+"】"+"水质监测站",
					  content:[localPath+"/water_survey_site/addForms",'no'],
					  type:2, // 基本层类型
				      area: ["40%","75%"], // 弹窗大小(宽高)
				      maxmin: true,
				      btn: ['确定', '取消'], // 页面按钮
				      closeBtn: 1, // 显示关闭按钮(右上角)
				      shade: 0.5,	// 遮罩阴影程度
				      resize: false, // 禁止拉伸
					});     
			}
		
		},
		//刪除行
		deleteTable:function(index,row,tableList){
			var _this = this;
			_this.monitorName = row.monitorName;
			$.post(localPath+"/water_survey_site/waterDelete",{id:row.id},function(result){
				if(result.state==1){
					layer.open({
						  title:"成功",
						  content: '删除'+_this.monitorName+"成功！",
						  shade: 0,//遮罩层
						});     
				}
			});
			tableList.splice((_this.currentPage-1)*_this.pagesize+index,1);
		},
		//行点击回调函数
		rowClick:function(row,event,column){
			var _this = this;
		},
		/*
		 * <---修改模块--->
		 */
		//修改
		updateTable:function(index,row){
			var _this = this;
			debugger
			layer.open({
				  title: "修改【"+row.monitorName+"】监测站信息",
				  content:[localPath+"/water_survey_site/updateForms?id="+row.id,'no'],
				  type:2, // 基本层类型
			      area: ["40%","60%"], // 弹窗大小(宽高)
			      maxmin: true,
			      btn: ['确定', '取消'], // 页面按钮
			      closeBtn: 1, // 显示关闭按钮(右上角)
			      shade: 0.5,	// 遮罩阴影程度
			      resize: false, // 禁止拉伸
				});     
		},
	},
	//页面初始化
	created:function(){
		var _this = this;
		$.post(localPath+"/water_survey_site/district","",function(result){
			_this.treeMenus = result;
			_this.nodeKey = result['0'].children['0'].label;
		});
		$.post(localPath+"/water_survey_site/waterInit","",function(result){
			_this.waterList =result.data;
		});
		_this.imagePath = picPath+"/pic/";
	}
});


















