<%@ page language="java" contentType="text/html; charset=utf-8" pageEncoding="utf-8"%>
<%@ include file="/WEB-INF/views/base.jsp"%>

<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
	<meta http-equiv="Content-Type" content="text/html; charset=utf-8">
	<meta http-equiv="X-UA-Compatible" content="IE=Edge">
	<meta name="viewport" content="width=device-width, initial-scale=1,maximum-scale=1, user-scalable=no">
	<title>灌区信息化平台</title>
	<link type="text/css" rel="stylesheet" href="${ctxstc}/adapters/bootstrap/css/bootstrap.min.css" title="" />
	<link type="text/css" rel="stylesheet" href="${ctxstc}/css/body.css" title="" />
	<link type="text/css" rel="stylesheet" href="${ctxstc}/css/style.css" title="" />
	<link type="text/css" rel="stylesheet" href="${ctxstc}/css/dermadefault.css" title="blue" />
	<link type="text/css" rel="stylesheet" href="${ctxstc}/css/templatecss.css" title="" />
	<link type="text/css" rel="stylesheet" href="${ctxstc}/css/ui-layout.css" title="" /><!-- angular ui --->
	<link type="text/css" rel="stylesheet" href="${ctxstc}/css/custom/scroll.css" title="" /><!-- 滚动条样式 --->
	
	<script type="text/javascript" src="${ctxstc}/jquery/jquery-1.11.1.min.js"></script>
	
	<script type="text/javascript" src="${ctxstc}/jquery/jquery.cookie.js"></script>
	<script type="text/javascript" src="${ctxstc}/adapters/bootstrap/js/bootstrap.min.js"></script>
	<script type="text/javascript" src="${ctxstc}/adapters/bootstrap/js/bootstrap-paginator.js"></script>
	<script type="text/javascript" src="${ctxstc}/js/style.js"></script>
	<script type="text/javascript" src="${ctxstc}/js/angular.min.js"></script><!-- angular ui --->
	<script type="text/javascript" src="${ctxstc}/js/ui-layout.js"></script>

	<!--  
	<link rel="stylesheet" href="${ctxstc}/adapters/ztree/css/demo.css" type="text/css">-->
	<link rel="stylesheet" href="${ctxstc}/adapters/ztree/css/zTreeStyle/zTreeStyle.css" type="text/css">
	<link rel="stylesheet" href="${ctxstc}/adapters/layui/css/layui.css" type="text/css">
	
	<script type="text/javascript" src="${ctxstc}/adapters/ztree/js/jquery.ztree.core.js"></script>
	
    <link rel="stylesheet" href="${ctxstc}/adapters/ztree/css/metroStyle/metroStyle.css" type="text/css">
    <script type="text/javascript" src="${ctxstc}/adapters/ztree/js/jquery.ztree.excheck.js"></script>
    <script type="text/javascript" src="${ctxstc}/adapters/ztree/js/jquery.ztree.exedit.js"></script>
	<script type="text/javascript" src="${ctxstc}/datepicker/WdatePicker.js "></script>
	 <script src="${ctxstc}/adapters/layui/layer/layer.js"></script>
	 <script type="text/javascript" src="${ctxstc}/js/custom/water_area_cook.js"></script>
	 

	<style>
		.topbar-nav-item a{color: red;}
		.topbar-nav-item a:hover{color: blue;}
	  </style>
</head>
<body >
		<div style="padding: 30px; line-height: 22px; background-color: #393D49; color: #fff; font-weight: 300;">
  					
    				<form  id="form" action="${ctx}/cal_canal_info/add_canal_photo" method="post" enctype="multipart/form-data">
    				
    				<table class="table table-bordered table-header">
						<tr>
							<td id="photo" class="w18" rowspan="" colspan="4">
									   
								<div class="layui-upload">
								  <button type="button" class="layui-btn layui-btn-normal" id="testList">选择多文件</button> 
								  <div class="layui-upload-list">
								    <table class="layui-table">
									  <thead>
								        <tr>
									        <th>文件名</th>
									        <th>大小</th>
									        <th>所属渠道</th>
									        <th>照片备注</th>
									        <th>状态</th>
									        <th>操作</th>
									     </tr>
								      </thead>
								      <tbody id="demoList"></tbody>
								    </table>
								  </div>
								  <button type="button" class="layui-btn" id="testListAction">开始上传</button>
								</div> 
							</td>
						</tr>
    				</table>
	        		</form>
       		 </div>
	
	<script type="text/javascript" src="${ctxstc}/js/footer.js"></script>
	<script type="text/javascript" src="${ctxstc}/js/custom/water_area_cook.js"></script>
	<script type="text/javascript" src="${ctxstc}/datepicker/WdatePicker.js "></script>
	<script src="${ctxstc}/adapters/layui/layui.js" charset="utf-8"></script>
	
	
	<script>
	
	//给父页面传值所用信息
	var index = parent.layer.getFrameIndex(window.name);
	
	function mySubmit(){
		
		//关闭子页面
		parent.layer.close(index);
        $('#form').submit();
    }
	
			
			//图片上传
		layui.use('upload', function(){
				
		  	var $ = layui.jquery
		  	,upload = layui.upload;
		  
			//多文件列表示例
		  var demoListView = $('#demoList')
		  	,uploadListIns = upload.render({
		    elem: '#testList'
		    ,url: '${ctx}/cal_canal_info/add_canal_photo?id=${calCanalInfo.id}'
		    ,accept: 'file'
		    ,multiple: true
		    ,auto: false
		    ,bindAction: '#testListAction'
		    ,choose: function(obj){
		    	//alert(JSON.stringify(obj));
		    	//alert("进入button111");
		      var files = this.files = obj.pushFile(); //将每次选择的文件追加到文件队列
		      //读取本地文件
		      obj.preview(function(index, file, result){
		    	  //alert("进入button222");
		        var tr = $(['<tr id="upload-'+ index +'">'
		          ,'<td>'+ file.name +'</td>'
		          ,'<td>'+ (file.size/1014).toFixed(1) +'kb</td>'
		          ,'<td><span> ${calCanalInfo.canalName}</span></td>'
		          ,'<td><textarea id="remark-'+ index +'"  name="calCanalInfo.cciRemark" cols="30" rows="2" style="color:black;"></textarea></td>'
		          ,'<td>等待上传</td>'
		          ,'<td>'
		            ,'<button class="layui-btn layui-btn-mini demo-reload layui-hide">重传</button>'
		            ,'<button class="layui-btn layui-btn-mini layui-btn-danger demo-delete">删除</button>'
		          ,'</td>'
		        ,'</tr>'].join(''));
		        
		        //alert("renwuwuwuwde askdfa;lksjdf ");
		        
		        //单个重传
		        tr.find('.demo-reload').on('click', function(){
		          obj.upload(index, file);
		        });
		        
		        //删除
		        tr.find('.demo-delete').on('click', function(){
		          delete files[index]; //删除对应的文件
		          tr.remove();
		          uploadListIns.config.elem.next()[0].value = ''; //清空 input file 值，以免删除后出现同名文件不可选
		        });
		        demoListView.append(tr);
		      });
		    }
		    ,done: function(res, index, upload){
		    	
		    	
		    	
		    	//alert(JSON.stringify(res));
		    	//alert(index);
		    	//alert(upload);
		      if(res.code == 0){ //上传成功
		    	//alert("上传成功");
		        var tr = demoListView.find('tr#upload-'+ index)
		        ,tds = tr.children();
		        tds.eq(4).html('<span style="color: #5FB878;">上传成功</span>');
		        tds.eq(5).html(''+res.canalPhotoId); //清空操作
		        

		    	 var remark= $('#remark-'+index).val();
			        var canalId=res.canalPhotoId;
			        //alert(res.canalPhotoId);
			        $.ajax({
						url:"${ctx}/cal_canal_info/add_canal_photo_remark",
						data: {canalId:canalId,remark:remark},
						type: "post",
						async: false,//非异步
						success: function(msg){
						}
					});
		        return delete this.files[index]; //删除文件队列已经上传成功的文件
		      }
		      this.error(index, upload);
		    }
		    ,error: function(index, upload){
		      var tr = demoListView.find('tr#upload-'+ index)
		      ,tds = tr.children();
		      tds.eq(2).html('<span style="color: #FF5722;">上传失败</span>');
		      tds.eq(3).find('.demo-reload').removeClass('layui-hide'); //显示重传
		    }
		  });
		});
	</script>
</body>
</html>



