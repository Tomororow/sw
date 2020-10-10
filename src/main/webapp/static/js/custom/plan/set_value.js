		//一月
		function oneSure(){
			var canalCode = "${canalCode}";
			alert(canalCode);
			var frequency = document.getElementById("oneFrequency").value;
			$.ajax({
				url:"${ctx}/ten/get_flow",
				type: "post",
				data: {frequency:frequency,canalCode:canalCode,month:1},
				async: false,//非异步
				success: function(msg){
					setValue(msg,1,"oneEarlyFlow","oneEarlyDay","oneEarly","oneEarlyYear","oneMiddleFlow","oneMiddleDay","oneMiddle","oneMiddleYear","oneLastFlow","oneLastDay","oneLast","oneLastYear","oneFlow");
				}
			});
		}
		
		//二月
		function twoSure(){
			var canalCode = "${canalCode}";
			alert(canalCode);
			var frequency = document.getElementById("twoFrequency").value;
			$.ajax({
				url:"${ctx}/ten/get_flow",
				type: "post",
				data: {frequency:frequency,canalCode:canalCode,month:2},
				async: false,//非异步
				success: function(msg){
					setValue(msg,2,"twoEarlyFlow","twoEarlyDay","twoEarly","twoEarlyYear","twoMiddleFlow","twoMiddleDay","twoMiddle","twoMiddleYear","twoLastFlow","twoLastDay","twoLast","twoLastYear","twoFlow");
				}
			});
		}
		
		//三月
		function threeSure(){
			var canalCode = "${canalCode}";
			alert(canalCode);
			var frequency = document.getElementById("threeFrequency").value;
			$.ajax({
				url:"${ctx}/ten/get_flow",
				type: "post",
				data: {frequency:frequency,canalCode:canalCode,month:3},
				async: false,//非异步
				success: function(msg){
					setValue(msg,3,"threeEarlyFlow","threeEarlyDay","threeEarly","threeEarlyYear","threeMiddleFlow","threeMiddleDay","threeMiddle","threeMiddleYear","threeLastFlow","threeLastDay","threeLast","threeLastYear","threeFlow");
				}
			});
		}
		
		
		//四月
		function fourSure(){
			var canalCode = "${canalCode}";
			alert(canalCode);
			var frequency = document.getElementById("fourFrequency").value;
			$.ajax({
				url:"${ctx}/ten/get_flow",
				type: "post",
				data: {frequency:frequency,canalCode:canalCode,month:4},
				async: false,//非异步
				success: function(msg){
					setValue(msg,4,"fourEarlyFlow","fourEarlyDay","fourEarly","fourEarlyYear","fourMiddleFlow","fourMiddleDay","fourMiddle","fourMiddleYear","fourLastFlow","fourLastDay","fourLast","fourLastYear","fourFlow");
				}
			});
		}
		
		//五月
		function fiveSure(){
			var canalCode = "${canalCode}";
			alert(canalCode);
			var frequency = document.getElementById("fiveFrequency").value;
			$.ajax({
				url:"${ctx}/ten/get_flow",
				type: "post",
				data: {frequency:frequency,canalCode:canalCode,month:5},
				async: false,//非异步
				success: function(msg){
					setValue(msg,5,"fiveEarlyFlow","fiveEarlyDay","fiveEarly","fiveEarlyYear","fiveMiddleFlow","fiveMiddleDay","fiveMiddle","fiveMiddleYear","fiveLastFlow","fiveLastDay","fiveLast","fiveLastYear","fiveFlow");
				}
			});
		}
		
		//六月
		function sixSure(){
			var canalCode = "${canalCode}";
			alert(canalCode);
			var frequency = document.getElementById("sixFrequency").value;
			$.ajax({
				url:"${ctx}/ten/get_flow",
				type: "post",
				data: {frequency:frequency,canalCode:canalCode,month:6},
				async: false,//非异步
				success: function(msg){
					setValue(msg,6,"sixEarlyFlow","sixEarlyDay","sixEarly","sixEarlyYear","sixMiddleFlow","sixMiddleDay","sixMiddle","sixMiddleYear","sixLastFlow","sixLastDay","sixLast","sixLastYear","sixFlow");
				}
			});
		}
		
		
		//七月
		function sevenSure(){
			var canalCode = "${canalCode}";
			alert(canalCode);
			var frequency = document.getElementById("sevenFrequency").value;
			$.ajax({
				url:"${ctx}/ten/get_flow",
				type: "post",
				data: {frequency:frequency,canalCode:canalCode,month:7},
				async: false,//非异步
				success: function(msg){
					setValue(msg,7,"sevenEarlyFlow","sevenEarlyDay","sevenEarly","sevenEarlyYear","sevenMiddleFlow","sevenMiddleDay","sevenMiddle","sevenMiddleYear","sevenLastFlow","sevenLastDay","sevenLast","sevenLastYear","sevenFlow");
				}
			});
		}
		
		
		//八月
		function eightSure(){
			var canalCode = "${canalCode}";
			alert(canalCode);
			var frequency = document.getElementById("eightFrequency").value;
			$.ajax({
				url:"${ctx}/ten/get_flow",
				type: "post",
				data: {frequency:frequency,canalCode:canalCode,month:8},
				async: false,//非异步
				success: function(msg){
					setValue(msg,8,"eightEarlyFlow","eightEarlyDay","eightEarly","eightEarlyYear","eightMiddleFlow","eightMiddleDay","eightMiddle","eightMiddleYear","eightLastFlow","eightLastDay","eightLast","eightLastYear","eightFlow");
				}
			});
		}
		
		//九月
		function nineSure(){
			var canalCode = "${canalCode}";
			alert(canalCode);
			var frequency = document.getElementById("nineFrequency").value;
			$.ajax({
				url:"${ctx}/ten/get_flow",
				type: "post",
				data: {frequency:frequency,canalCode:canalCode,month:9},
				async: false,//非异步
				success: function(msg){
					setValue(msg,9,"nineEarlyFlow","nineEarlyDay","nineEarly","nineEarlyYear","nineMiddleFlow","nineMiddleDay","nineMiddle","nineMiddleYear","nineLastFlow","nineLastDay","nineLast","nineLastYear","nineFlow");
				}
			});
		}
		
		//十月
		function tenSure(){
			var canalCode = "${canalCode}";
			alert(canalCode);
			var frequency = document.getElementById("tenFrequency").value;
			$.ajax({
				url:"${ctx}/ten/get_flow",
				type: "post",
				data: {frequency:frequency,canalCode:canalCode,month:10},
				async: false,//非异步
				success: function(msg){
					setValue(msg,10,"tenEarlyFlow","tenEarlyDay","tenEarly","tenEarlyYear","tenMiddleFlow","tenMiddleDay","tenMiddle","tenMiddleYear","tenLastFlow","tenLastDay","tenLast","tenLastYear","tenFlow");
				}
			});
		}
		
		//十一月
		function elevenSure(){
			var canalCode = "${canalCode}";
			alert(canalCode);
			var frequency = document.getElementById("elevenFrequency").value;
			$.ajax({
				url:"${ctx}/ten/get_flow",
				type: "post",
				data: {frequency:frequency,canalCode:canalCode,month:11},
				async: false,//非异步
				success: function(msg){
					setValue(msg,11,"elevenEarlyFlow","elevenEarlyDay","elevenEarly","elevenEarlyYear","elevenMiddleFlow","elevenMiddleDay","elevenMiddle","elevenMiddleYear","elevenLastFlow","elevenLastDay","elevenLast","elevenLastYear","elevenFlow");
				}
			});
		}
		//十二月
		function twelveSure(){
			var canalCode = "${canalCode}";
			alert(canalCode);
			var frequency = document.getElementById("twelveFrequency").value;
			$.ajax({
				url:"${ctx}/ten/get_flow",
				type: "post",
				data: {frequency:frequency,canalCode:canalCode,month:12},
				async: false,//非异步
				success: function(msg){
					setValue(msg,12,"twelveEarlyFlow","twelveEarlyDay","twelveEarly","twelveEarlyYear","twelveMiddleFlow","twelveMiddleDay","twelveMiddle","twelveMiddleYear","twelveLastFlow","twelveLastDay","twelveLast","twelveLastYear","twelveFlow");
				}
			});
		}
		
		
		
		
		
		
		
		
		
		
		
		
		
		//earlyFlow,earlyDay,early,earlyYear,middleFlow,middleDay,middle,middleYear,lastFlow,lastDay,last,lastYear,flow
		//a1       ,a2      ,a3   ,a4       ,b1        ,b2       ,b3	,b4		   ,c1	    ,c2     ,c3  ,c4      ,m
		function setValue(msg,month,a1,a2,a3,a4,b1,b2,b3,b4,c1,c2,c3,c4,m){
			alert(JSON.stringify(msg));
			//上旬
			var earlyFlow = document.getElementById(a1);
				earlyFlow.value=msg[0].descendingArrangement;
			var earlyDay = document.getElementById(a2);	
				earlyDay.innerHTML=(msg[0].descendingArrangement)*3600*24;
			var early = document.getElementById(a3);	
				early.innerHTML=(msg[0].descendingArrangement)*3600*24*10;	
			var earlyYear = document.getElementById(a4);	
				earlyYear.value=msg[0].contrastYear;		
			//中旬
			var middleFlow = document.getElementById(b1);
				middleFlow.value=msg[1].descendingArrangement;
			var middleDay = document.getElementById(b2);	
				middleDay.innerHTML=(msg[1].descendingArrangement)*3600*24;
			var middle = document.getElementById(b3);	
				middle.innerHTML=(msg[1].descendingArrangement)*3600*24*10;	
			var middleYear = document.getElementById(b4);	
				middleYear.value=msg[1].contrastYear;			
			//下旬
			var lastFlow = document.getElementById(c1);
				lastFlow.value=msg[2].descendingArrangement;
			var lastDay = document.getElementById(c2);	
				lastDay.innerHTML=(msg[2].descendingArrangement)*3600*24;
			var last = document.getElementById(c3);	
				last.innerHTML=(msg[2].descendingArrangement)*3600*24*11;	
			var lastYear = document.getElementById(c4);	
				lastYear.value=msg[2].contrastYear;
				
				
			var oneFlow = document.getElementById(m);	
				oneFlow.innerHTML=(msg[0].descendingArrangement)*3600*24*10+(msg[1].descendingArrangement)*3600*24*10+(msg[2].descendingArrangement)*3600*24*11;
		}
		