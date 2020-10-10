var canvas = document.getElementById("canvas1");
	    var context = canvas.getContext("2d");
	    //渠横截面梯形
	    context.beginPath();
	    //设置对象起始点和终点
	    context.moveTo(10,10);
	    context.lineTo(40,60);
	    context.lineTo(120,60);
	    context.lineTo(150,10);
	    //设置样式
	    context.lineWidth = 4;
	    context.strokeStyle = "white";
	   //绘制
	    context.stroke();
	   //标注=======================
	    context.beginPath();
	    context.moveTo(40,60);
	    context.lineTo(40,100);
	    
	    context.moveTo(120,60);
	    context.lineTo(120,100);
	    
	    context.moveTo(40,90);
	    context.lineTo(120,90);
	    //左箭头
	    context.moveTo(40,90);
	    context.lineTo(50,85);
	    
	    context.moveTo(40,90);
	    context.lineTo(50,95);
	    //右箭头
	    context.moveTo(120,90);
	    context.lineTo(110,85);
	    
	    context.moveTo(120,90);
	    context.lineTo(110,95);
	    // 写字

	      context.font = "bold 20px 宋体";  
	      context.fillStyle = "blue";  
	      context.fillText("①",70,85); 
	    
	      context.font = "bold 20px 宋体";  
	      context.fillStyle = "blue";  
	      context.fillText("②",50,40); 
	      
	      
	    context.lineWidth = 2;
	    context.strokeStyle = "red";
	   //绘制
	    context.stroke();
		
	    context.beginPath();
	    //角度箭头
	    context.arc(40,60,20,1.35*Math.PI,2*Math.PI);
	    context.stroke();
		
		
	    
	
	
	
    
    //矩形渠
    var canvas = document.getElementById("canvas2");
    var context = canvas.getContext("2d");
    //渠横截面梯形
    context.beginPath();
    //设置对象起始点和终点
    context.moveTo(40,10);
    context.lineTo(40,60);
    context.lineTo(120,60);
    context.lineTo(120,10);
    context.lineWidth = 4;
    context.strokeStyle = "white";
    context.stroke();
    context.beginPath();
    context.moveTo(40,60);
    context.lineTo(40,130);
    context.moveTo(120,60);
    context.lineTo(120,130);
    
    context.moveTo(40,90);
    context.lineTo(120,90);
    
    //左箭头
    context.moveTo(40,90);
    context.lineTo(50,85);
    
    context.moveTo(40,90);
    context.lineTo(50,95);
    //右箭头
    context.moveTo(120,90);
    context.lineTo(110,85);

    context.moveTo(120,90);
    context.lineTo(110,95);
    
    context.font = "bold 20px 宋体";  
    context.fillStyle = "blue";  
    context.fillText("①",70,85); 
    
    
    context.lineWidth = 2;
    context.strokeStyle = "red";
    //设置样式
    context.stroke();
    
    
    //U形渠
    var canvas = document.getElementById("canvas3");
    var context = canvas.getContext("2d");
    //渠横截面梯形
    context.beginPath();
    //设置对象起始点和终点
    context.moveTo(40,15);
    context.lineTo(40,45);
    context.moveTo(120,45);
    context.lineTo(120,15);
    context.lineWidth = 4;
    context.strokeStyle = "white";
    context.stroke();
    //u底
    context.beginPath();
    context.arc(80,45,40,0,1*Math.PI);
    context.lineWidth = 4;
    context.strokeStyle = "white";
    context.stroke();
    
    context.beginPath();
    context.moveTo(40,45);
    context.lineTo(150,45);
    context.moveTo(80,85);
    context.lineTo(150,85);
    
    context.moveTo(135,45);
    context.lineTo(135,85);
    
    context.moveTo(40,30);
    context.lineTo(120,30);
    //左箭头
    context.moveTo(40,30);
    context.lineTo(50,35);
    
    context.moveTo(40,30);
    context.lineTo(50,25);
    //右箭头
    context.moveTo(120,30);
    context.lineTo(110,35);

    context.moveTo(120,30);
    context.lineTo(110,25);
    
    
    //上箭头
    context.moveTo(135,45);
    context.lineTo(130,55);
    
    context.moveTo(135,45);
    context.lineTo(140,55);
    
    //下箭头
    context.moveTo(135,85);
    context.lineTo(130,75);
    
    context.moveTo(135,85);
    context.lineTo(140,75);
    //半径箭头
    context.moveTo(50,70);
    context.lineTo(30,90);
    context.lineTo(10,90);
    
    context.moveTo(50,70);
    context.lineTo(40,75);
    
    context.moveTo(50,70);
    context.lineTo(45,80);
    
    context.font = "bold 20px 宋体";  
    context.fillStyle = "blue";  
    context.fillText("①",70,25);
    
    context.font = "bold 20px 宋体";  
    context.fillStyle = "blue";  
    context.fillText("②",10,85);
    
    context.font = "bold 20px 宋体";  
    context.fillStyle = "blue";  
    context.fillText("③",143,70);
    
    context.lineWidth = 2;
    context.strokeStyle = "red";
    //设置样式
    context.stroke();
    
    
    
    //TU形渠
    var canvas = document.getElementById("canvas4");
    var context = canvas.getContext("2d");
    //渠横截面梯形
    context.beginPath();
    //设置对象起始点和终点
    context.moveTo(15,15);
    context.lineTo(45,65);
    context.moveTo(115,65);
    context.lineTo(145,15);
    context.lineWidth = 4;
    context.strokeStyle = "white";
    context.stroke();
    //u底
    context.beginPath();
    context.arc(80,45,40,0.16*Math.PI,0.84*Math.PI);
    context.lineWidth = 4;
    context.strokeStyle = "white";
    context.stroke();
    
    context.beginPath();
    context.moveTo(40,55);
    context.lineTo(150,55);
    context.moveTo(80,85);
    context.lineTo(150,85);
    
    context.moveTo(40,55);
    context.lineTo(40,20);
    
    context.moveTo(120,55);
    context.lineTo(120,20);
    
    
    context.moveTo(135,55);
    context.lineTo(135,85);
    
    context.moveTo(40,30);
    context.lineTo(120,30);
    //左箭头
    context.moveTo(40,30);
    context.lineTo(50,35);
    
    context.moveTo(40,30);
    context.lineTo(50,25);
    //右箭头
    context.moveTo(120,30);
    context.lineTo(110,35);

    context.moveTo(120,30);
    context.lineTo(110,25);
    
    
    //上箭头
    context.moveTo(135,55);
    context.lineTo(130,65);
    
    context.moveTo(135,55);
    context.lineTo(140,65);
    
    //下箭头
    context.moveTo(135,85);
    context.lineTo(130,75);
    
    context.moveTo(135,85);
    context.lineTo(140,75);
    //半径箭头
    context.moveTo(50,70);
    context.lineTo(30,90);
    context.lineTo(10,90);
    
    context.moveTo(50,70);
    context.lineTo(40,75);
    
    context.moveTo(50,70);
    context.lineTo(45,80);
    
    
   
    
    
    
    context.font = "bold 20px 宋体";  
    context.fillStyle = "red";  
    context.fillText("①",70,25);
    
    context.font = "bold 20px 宋体";  
    context.fillStyle = "red";  
    context.fillText("②",10,85);
    
    context.font = "bold 20px 宋体";  
    context.fillStyle = "red";  
    context.fillText("③",143,75);
    
    context.font = "bold 20px 宋体";  
    context.fillStyle = "red";  
    context.fillText("④",143,45);
    
    context.lineWidth = 2;
    context.strokeStyle = "red";
    //设置样式
    context.stroke();
    
    context.beginPath();
    context.arc(120,55,20,1.7*Math.PI,2*Math.PI);
    context.lineWidth = 2;
    context.strokeStyle = "red";
    //设置样式
    context.stroke();
    
    /*
    context.beginPath();
    context.moveTo(40,60);
    context.lineTo(40,130);
    context.moveTo(120,60);
    context.lineTo(120,130);
    
    context.moveTo(40,90);
    context.lineTo(120,90);
    
    //左箭头
    context.moveTo(40,90);
    context.lineTo(50,85);
    
    context.moveTo(40,90);
    context.lineTo(50,95);
    //右箭头
    context.moveTo(120,90);
    context.lineTo(110,85);

    context.moveTo(120,90);
    context.lineTo(110,95);
    
    context.font = "bold 20px 宋体";  
    context.fillStyle = "blue";  
    context.fillText("①",70,85); 
    
    
    context.lineWidth = 2;
    context.strokeStyle = "red";
    //设置样式
    context.stroke();*/
    