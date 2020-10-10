var curWwwPath = window.document.location.href;
var pathName = window.document.location.pathname;
var pos = curWwwPath.indexOf(pathName);
var localhostPaht = curWwwPath.substring(0,pos);
var projectName = pathName.substring(0,pathName.substr(1).indexOf('/')+1);
var ctxPath = localhostPaht + projectName;
var picPath = localhostPaht;
var waterUser = new Vue({
		el:'#waterSer',
		data:{
			//表单数据
			waterUser:{},
			//修改数据
			UpdateUser:{},
			//表单验证
			rules:{
				treeName: [{ required: true, message: '请输入树名称', trigger: 'blur' }],
				treeCode: [{ required: true, message: '请输入编码', trigger: 'blur' },{ min: 8, max:8, message: '长度为8 个字母或数字', trigger: 'blur' }],
			},
			//页面表格数据
			waterList:[],
			//分页函数
			pagesize:'10',
			currentPage:'1',
		},
		methods:{
			//提交表单数据方法
			submiTree:function(formName){
				var _this = this;
				if(parent==""||parent==null){
					_this.$message.error('请选择树结构！');
				}else{
					 this.$refs[formName].validate(function(valid){
						 if(valid){
							 debugger
							 $.post(ctxPath+"/water_tree_user/insertData",{"watesr":JSON.stringify(_this.waterUser),"parentId":parent,"level":level},function(data){
									if(data.state=="1"){
										_this.$message.success('提交成功!');
									}
								});
							 $('#myModal').modal('hide');
						 }else{
							 _this.$message.error('请检查输入是否合理！');
						 }
					 });
					
				}
				 $('#myModal').modal('hide');
			},
			addFrom:function(){
				var _this = this;
				_this.waterUser = {};
			},
			updateTree:function(){
				var _this = this;
				 $.post(ctxPath+"/water_tree_user/updateTree",{"updateData":JSON.stringify(_this.UpdateUser)},function(data){
					 if(data.state=="1"){
							_this.$message.success('修改成功!');
						}
				 });
				 $('#updateModal').modal('hide');
			},
			//分页方法
			handleSizeChange:function(size){
				var _this = this;
				_this.pagesize = size;
				
			},
			handleCurrentChange:function(currentPage){
				var _this = this;
				_this.currentPage = currentPage;
			},
			//修改方法
			updateFrom:function(row){
				var _this = this;
				debugger
				_this.UpdateUser = row;
			},
			//删除方法
			deteleFrom:function(index,row,list){
				var _this = this;
				debugger
				$.post(ctxPath+"/water_tree_user/deleteTree",{"id":row.id},function(data){
					 if(data.state=="1"){
							_this.$message.success('删除成功!');
							list.splice((_this.currentPage-1)*_this.pagesize+index,1);
						}else{
							_this.$message.error('删除失败!');
						}
				});
			}
		},
		created:function(){
			var _this = this;
			$.post(ctxPath+"/water_tree_user/selectTree",{"parentId":""},function(data){
				_this.waterList = data.data;
			});
			$('#myModal').modal('hide');
		},
		
	});
/*===============树结构方法==================*/
var level = null;
var parent = null;
function start(id,state,tree,treeLevel){
	parent = id; level = treeLevel; 
	debugger
	$.post(ctxPath+"/water_tree_user/selectTree",{"parentId":id},function(data){
		waterUser.waterList = data.data;
	});
}