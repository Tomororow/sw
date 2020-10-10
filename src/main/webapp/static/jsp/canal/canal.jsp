<%@ page language="java" contentType="text/html; charset=utf-8" pageEncoding="utf-8"%>
<%@ include file="/WEB-INF/views/base.jsp"%>

function canal(){
		 var id = getCookie ("currentNodeId");
		// alert(id);
		 delCookie("currentNodeId");
		 
		 var waterArea =null;
		 $.ajax({
				url:"${ctx}/sys_water_area/level",
				type: "post",
				async: false,//非异步
				success: function(msg){
					waterArea=msg;
					
				}
		});
		 if(id!=null&&id!=""){
			 layer.open({
				 	id: 'insert-form'
			        ,type: 2 //此处以iframe举例
			        ,title: '你添加的渠道父级渠道为'+id
			        ,area: ['700px', '700px']
			        ,shade: 0.8
			        ,maxmin: true
			        ,content: '${ctx}/cal_canal_info/add_canal_page?id='+id
			        ,btn: ['确定', '关闭'] //只是为了演示
			        ,yes: function(){
			        	//子页面提交
			        	insertSubmit();
			        		//弹出添加成功的窗口
				        	layer.confirm('你的渠道已经添加成功', {
				        		  btn: ['确定'] //按钮
				        		}, function(){
				        			
				        			document.forms[0].action="${ctx}/cal_canal_info/frush";
						    		document.forms[0].submit();
				        			
				        		  layer.msg('的确很重要', {icon: 1});
				        		});
			        }
			        ,btn2: function(){
			          layer.closeAll();
			        }
			        
			        ,zIndex: layer.zIndex //重点1
			        ,success: function(layero){
			        	layer.setTop(layero); //重点2
			        }
			    });
		 }else{
			 layer.open({
				 	id: 'insert-form'
			        ,type: 2 //此处以iframe举例
			        ,title: '你添加的渠道为最高一级'
			        ,area: ['700px', '700px']
			        ,shade: 0.8
			        ,maxmin: true
			       
			        ,content: '${ctx}/cal_canal_info/add_canal_page'
			        ,btn: ['确定', '关闭'] //只是为了演示
			        ,yes: function(){
			        	//子页面提交
			        	insertSubmit();
			        		//弹出添加成功的窗口
				        	layer.confirm('你的渠道已经添加成功', {
				        		  btn: ['确定'] //按钮
				        		}, function(){
				        			
				        			document.forms[0].action="${ctx}/cal_canal_info/frush";
						    		document.forms[0].submit();
				        			
				        		  layer.msg('的确很重要', {icon: 1});
				        		});
		
			        }
			        ,btn2: function(){
			          layer.closeAll();
			        }
			        
			        ,zIndex: layer.zIndex //重点1
			        ,success: function(layero){
			          layer.setTop(layero); //重点2
			        }
			    });
			 
		 	}
		  
	  };
	  //获取添加子页面的提交方法
	  function insertSubmit(){
		   var frameId=document.getElementById("insert-form").getElementsByTagName("iframe")[0].id;
		   $('#'+frameId)[0].contentWindow.mySubmit();
	  }
	  
	  
	  
	  
function pWaterArea(){
		 var id = getCookie ("currentNodeId");
		// alert(id);
		 delCookie("currentNodeId");
		 
		 var waterArea =null;
		 $.ajax({
				url:"${ctx}/sys_water_area/level",
				type: "post",
				async: false,//非异步
				success: function(msg){
					waterArea=msg;
					
				}
		});
		 if(id!=null&&id!=""){
			 layer.open({
				 	id: 'insert-pWaterArea-form'
			        ,type: 2 //此处以iframe举例
			        ,title: '你添加的渠道父级渠道为'+id
			        ,area: ['900px', '700px']
			        ,shade: 0.8
			        ,maxmin: true
			        ,content: '${ctx}/cal_canal_info/add_canal_pwaterarea_page?id='+id
			        ,btn: ['确定', '关闭'] //只是为了演示
			        ,yes: function(){
			        	//子页面提交
			        	insertPWaterAreaSubmit();
			        		//弹出添加成功的窗口
				        	layer.confirm('你的渠道已经添加成功', {
				        		  btn: ['确定'] //按钮
				        		}, function(){
				        			
				        			document.forms[0].action="${ctx}/cal_canal_info/frush";
						    		document.forms[0].submit();
				        			
				        		  layer.msg('的确很重要', {icon: 1});
				        		});
			        }
			        ,btn2: function(){
			          layer.closeAll();
			        }
			        
			        ,zIndex: layer.zIndex //重点1
			        ,success: function(layero){
			        	layer.setTop(layero); //重点2
			        }
			    });
		 }else{
			 layer.open({
				 	id: 'insert-pWaterArea-form'
			        ,type: 2 //此处以iframe举例
			        ,title: '你添加的渠道为最高一级'
			        ,area: ['900px', '700px']
			        ,shade: 0.8
			        ,maxmin: true
			       
			        ,content: '${ctx}/cal_canal_info/add_canal_pwaterarea_page'
			        ,btn: ['确定', '关闭'] //只是为了演示
			        ,yes: function(){
			        	//子页面提交
			        	insertPWaterAreaSubmit();
			        		//弹出添加成功的窗口
				        	layer.confirm('你的渠道已经添加成功', {
				        		  btn: ['确定'] //按钮
				        		}, function(){
				        			
				        			document.forms[0].action="${ctx}/cal_canal_info/frush";
						    		document.forms[0].submit();
				        			
				        		  layer.msg('的确很重要', {icon: 1});
				        		});
		
			        }
			        ,btn2: function(){
			          layer.closeAll();
			        }
			        
			        ,zIndex: layer.zIndex //重点1
			        ,success: function(layero){
			          layer.setTop(layero); //重点2
			        }
			    });
			 
		 	}
		  
	  };
	  //获取添加子页面的提交方法
	  function insertPWaterAreaSubmit(){
		   var frameId=document.getElementById("insert-pWaterArea-form").getElementsByTagName("iframe")[0].id;
		   $('#'+frameId)[0].contentWindow.mySubmit();
	  }
	  
	  
	  
	  