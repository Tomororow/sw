//�����ĳһ����Ŀ¼����
	function start(id,page,table,tag){
		//alert(page);
		//����ȡ��id�ŵ�cook��
		setCookie("currentNodeId",id,1);
		//ÿ�ν������֮ǰ�Ĳ�ѯ���
		$("#table_list").empty();
		$("#table_photo_list").empty();
		$.ajax({
			url:"${ctx}/cal_canal_info/"+table,
			data: {id:id,page:page},
			type: "post",
			async: false,//���첽
			success: function(msg){
				alert(JSON.stringify(msg) );
				var table = msg;
				if(tag=="canal"){
					//��̬���������б�
						for(var i=0;i<msg.length;i++){
							var currentTag = document.getElementById("table_list");
								var newTrTag = document.createElement("tr");
									var newTdTag1 = document.createElement("td");
										var newInputTag = document.createElement("input");
										newInputTag.setAttribute("type", "checkbox");
										
										newTdTag1.appendChild(newInputTag);
									var newTdTag2 = document.createElement("td");
										newTdTag2.innerHTML=msg[i].sysareaId;
									var newTdTag3 = document.createElement("td");
										newTdTag3.innerHTML=msg[i].syswaterareaId;
									var newTdTag4 = document.createElement("td");
										newTdTag4.innerHTML=msg[i].sysareaCode;
									//var newTdTag5 = document.createElement("td");
									//	newTdTag5.innerHTML=msg[i].parentWaterareaId;
									var newTdTag6 = document.createElement("td");
										newTdTag6.innerHTML=msg[i].syswaterareaCode;
									var newTdTag7 = document.createElement("td");
										newTdTag7.innerHTML=msg[i].canalCode;
									var newTdTag8 = document.createElement("td");
										newTdTag8.innerHTML=msg[i].canalName;
									var newTdTag9 = document.createElement("td");
										newTdTag9.innerHTML=msg[i].canalAddr;	
										
									var newTdTag10 = document.createElement("td");
										newTdTag10.innerHTML=msg[i].cciRemark;	
									var newTdTag11 = document.createElement("td");
											var sonid = JSON.stringify(msg[i].id);
										newTdTag11.innerHTML="<a href='javascript\:doEdit("+sonid+")'>�޸�</a>|<a href='javascript\:doDelete("+sonid+")'>ɾ��</a>"
										newTrTag.appendChild(newTdTag1);
										newTrTag.appendChild(newTdTag2);
										newTrTag.appendChild(newTdTag3);
										newTrTag.appendChild(newTdTag4);
										//newTrTag.appendChild(newTdTag5);
										newTrTag.appendChild(newTdTag6);
										newTrTag.appendChild(newTdTag7);
										newTrTag.appendChild(newTdTag8);
										newTrTag.appendChild(newTdTag9);
										newTrTag.appendChild(newTdTag10);
										newTrTag.appendChild(newTdTag11);
									currentTag.appendChild(newTrTag);
						}
				
				
				}else if(tag=="photo"){
					for(var i=0;i<msg.length;i++){
						var currentTag = document.getElementById("table_photo_list");
							var newTrTag = document.createElement("tr");
								var newTdTag1 = document.createElement("td");
									var newInputTag = document.createElement("input");
									newInputTag.setAttribute("type", "checkbox");
									
									newTdTag1.appendChild(newInputTag);
								var newTdTag2 = document.createElement("td");
									newTdTag2.innerHTML=msg[i].canalId;
								var newTdTag3 = document.createElement("td");
									newTdTag3.innerHTML=msg[i].syswaterareaId;
								var newTdTag4 = document.createElement("td");
									newTdTag4.innerHTML=msg[i].sysareaCode;
								
								var newTdTag5 = document.createElement("td");
										var sonid = JSON.stringify(msg[i].id);
									newTdTag5.innerHTML="<a href='javascript\:doEdit("+sonid+")'>�޸�</a>|<a href='javascript\:doDelete("+sonid+")'>ɾ��</a>"
									newTrTag.appendChild(newTdTag1);
									newTrTag.appendChild(newTdTag2);
									newTrTag.appendChild(newTdTag3);
									newTrTag.appendChild(newTdTag4);
									newTrTag.appendChild(newTdTag5);
							
								currentTag.appendChild(newTrTag);
					
					}
				}
				
			}
		});
		
		 $.post("${ctx}/cal_canal_info/page_nav").success(function (response) {
			// alert(JSON.stringify(response));
			    var pageNum = response.pageNum;
				var pages = response.pages;
				var size = response.size;
			    /* bootstrap��ҳ��ʽ���� */
			    var options = {
			    	size:"small",
			    	alignment:"right",
			    	/* ��ǰҳ�� */
			        currentPage: pageNum,
			        /* ��ҳ��  ����������ÿҳ����  ��������ҳ��Ϊ��  ����������+1ҳ  ��Ϊ��ҳ��ҳ��  */
			        totalPages: pages,
			        /* ÿҳ���� */
			        numberOfPages:size,
			        /* bootstrap�汾ָ�� */
			        bootstrapMajorVersion:3,
			        /* ��ʽ���� ��ҳ������ */
			        itemTexts: function (type, page, current){
			            switch (type) {
			                case "first":
			                    return "��ҳ";
			                case "prev":
			                    return "��һҳ";
			                case "next":
			                    return "��һҳ";
			                case "last":
			                    return "ĩҳ";
			                case "page":
			                    return page;
			            }
			        },
			        onPageClicked: function(event, originalEvent, type, page){
			        	//alert(JSON.stringify(page));
			        	var id = getCookie ("currentNodeId");
			        	start(id,page);
			        	
			        }
			    };
			    $('#pageLimit').bootstrapPaginator(options);
			}).error(function (response) {
			    alert("�б��������");
			});
		
	}