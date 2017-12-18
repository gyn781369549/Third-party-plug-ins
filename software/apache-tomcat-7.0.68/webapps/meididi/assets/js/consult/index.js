var messageData = {
			id:"",
			time:"",
			content:"",
			from:"",
			type:""
	}
	var baseUrl = "http://101.201.40.170/meididi/doc/";
    $().ready(function(){
    	
    	$('#btnSend').click(function(){
    		
    		var targetId = $("#targetId").val();
    		var content = $('#js-sendMessage').val();
    		if(content!=''&&targetId!=''){
    			
    			sendMessage("text",content,targetId);
    		}
    	});
    	
    	getUserList($("#users"),"");
    	
    	getUserList($(".user1").eq(1),"1");
    	
    	run(); 
    	var interval; 
    	function run(){ 
    	interval = setInterval(chat,"10000"); 
    	}
    	function clearTime(){
    		clearTimeout(interval);
    	}
    	//TODO 获取咨询
    	function chat(){
    		$.ajax({
        		url:"../api/consult/MyOrders",
        		data:{'sid':sid},
        		dataType:"json",
        		type:"POST",
        		success:function(data){
    			if(data.code==0&&data.result.length>0){
    				$("#rob").css("display","block");
    				$(".rob_button_area").css("display","block");
    				
    				//clearTime();
    				var json = data.result;
        			$.each(json,function(i,v){
        				var sex = "";
        				if(v.sex=="0"||v.sex=="2"){
        					sex = "女";
        				}else{
        					sex = "男";
        				}
        				$("#rob").append(
        						"<div class='liss' style='float: left;display: none;' order_num='"+v.orderNum+"' >"+
        			            "<div style='float:left;'>"+
        			               " <img src='"+v.photo+"' style='width: 60px;height: 60px;border-radius:100px;margin: 2px 5px; '>"+
        			           " </div>"+
        			            "<div style='float: left;'>"+
        			               " <div class='rob_name'><span class='name' style='display: inline-block;width: 100px;height: 26px;overflow: hidden;'>"+v.name+"</span></div>"+
        			               "<div class='sex' sex='"+v.sex+"'>"+sex+"</div>"+
        			                "<div class='rob_params'><span class='age'>"+v.age+"</span></div>"+
        			            "</div>"+
        			          " <input type='hidden' class='userId' value='"+v.userId+"'>"+
        			       " </div>"
       						/* "<li><img alt='' src='"+v.photo+"'>"+
       						"<div class='rob_content'>"+
       						"	<ul>"+
       						"		<li>性别:<span>"+sex+"</span></li>"+
       						"		<li>年龄:<span>"+v.age+"</span></li>"+
       						"		<li><span class='next'>换一个</span></li>"+
       						"	</ul>"+
       						"</div>"+
       						
       						"<div class='rob_button' targetId='u"+v.userId+"' order_num='"+v.orderNum+"' >抢单</div>"+
       						"<input type='hidden' value='"+v.name+"' />"+
       						"</li>" */
       						);
        			});
        			$("#rob .liss").eq(0).show();
        		}
        			
        		}
        	});
    	} 
    	//TODO 轮询抢单
    	$(".rob_button").click(function(){
    		var orderNum = $("#rob .liss").eq(iIndex).attr("order_num");
    		//TODO  获取用户信息
    		/* var name = $(this).prev("div").find("");
    		var photo = $(this).prev("div").find("img:first").attr("src");
    		var targetId = $(this). */
    		var thisDiv = $("#rob .liss").eq(iIndex);
    		var name = thisDiv.find(".name").text();
    		var photo = thisDiv.find("img").attr("src");
    		var targetId = thisDiv.find(".userId").val();
    		rob(orderNum,name,photo,targetId);
    	});
    	
    });
	var iIndex = 0;
	//TODO 换一个
    function changeNext (){
        iIndex++;
        if(iIndex ==$("#rob .liss").length){
            iIndex=0;
        }
        $("#rob .liss").hide();
        $("#rob .liss").eq(iIndex).show();
        
    }
  	//TODO 抢单
	function rob(orderNum,name,photo,targetId){
		if(""!=orderNum){
			$.ajax({
				url:"../api/consult/roborder",
	    		data:{'sid':sid,'orderNum':orderNum},
	    		dataType:"json",
	    		
	    		type:"POST",
	    		success:function(data){
	    			if(data.code==0){
	    				layer.alert("抢单成功，点击跳转聊天界面",function(){
	    					
	    					layer.closeAll();
	    					$("#rob").css("display","none");
	    					$("#rob").html("");
	        				$(".rob_button_area").css("display","none");
	        				if($("#"+targetId).length>0){
	        					$("#"+targetId).trigger("click");
	        				}else{
	        					$("#users").prepend("<li id='"+targetId+"'  class='user-list-item online active'>"+
		        						"<i class='icon laptop js-icon '>"+
		        						"<img src='"+photo+"' class='js-image-face'>"+
		        						"</i>"+
		        						"<div class='item-detail'>"+
		        						"<div class=''><span class='uname js-user-name'>"+name+"</span>"+ 
		        						"</div>"+
		        						"<span class='chat-detail js-last-message  orange'></span>"+
		        						"<i class='user-del js-remove'>"+
		        						"<span class='newIcon'></span>"+
		        						"</i>"+
		        						"</div>"+
		        						"<input type='hidden'  class='userId' value='"+targetId+"'/>"+
		        						"</li>");
	        				}
	    						var user = $("#users").find(".user-list-item:first");
	    	    				//切换聊天页面
	    	    				$("#targetId").val(user.find(".userId:first").val());
	    	    				$("#targetName").val(user.find(".uname:first").text());
	    	    				$("#targetPhoto").val(user.find(".js-image-face:first").attr('src'));
	    	    				$(".nick_name").children("p").text($("#targetName").val());
	    	    				$(".content").html("");
	    	    				
	    	    				sendMessage("text","您好，我是咨询师"+''+",请问有什么可以帮助您的吗？",$("#targetId").val());
	    	    				
	    				});
	    				
	    			}
	    			else{
	    				layer.alert("很可惜，已被其他咨询师抢走",function(){
	    					layer.closeAll();
	    					$("#rob").css("display","none");
	    					$("#rob").html("");
	    					$(".rob_button_area").css("display","none");
	    				});
	    			}
	    		}
			});	
		}else{
			layer.alert("很可惜，已被其他咨询师抢走",function(){
				layer.closeAll();
				$("#rob").css("display","none");
				$("#rob").html("");
				$(".rob_button_area").css("display","none");
			});
		}
	}
	//TODO 获取用户
    function getUserList(e,type){
    	$(e).html("");
    	$.ajax({
    		url:"consult_list",
    		type:"POST",
    		dataType:"JSON",
    		data:{type:type},
    		success:function(data){
    			if(data.code==200){
    				$.each(data.userlist,function(i,v){
    					
    					if(v.id!=null){
    						$(e).append("<li id='"+v.id+"'  class='user-list-item online active'>"+
    								"<i class='icon laptop js-icon '>"+
    								"<img src='"+v.portraitUri+"' class='js-image-face'>"+
    								"</i>"+
    								"<div class='item-detail'>"+
    								"<div class=''><span class='uname js-user-name'>"+v.name+"</span>"+ 
    								"</div>"+
    								"<span class='chat-detail js-last-message  orange'></span>"+
    								"<i class='user-del js-remove'>"+
    								"<span class='newIcon'></span>"+
    								"</i>"+
    								"</div>"+
    								"<input type='hidden'  class='userId' value='"+v.id+"'/>"+
    								"</li>");
    					}
    					
    				});
    			}/*else{
    				out(1);
    			}*/
    		}
    	});
    }
  	//TODO 选择聊天对象
    $(".click_user-list").on('click','.user-list-item',function(){
		var user = $(this);
		user.find(".newIcon").text("");
		user.find(".chat-detail").text("");
		$("#targetId").val(user.find(".userId:first").val());
		$("#targetName").val(user.find(".uname:first").text());
		$("#targetPhoto").val(user.find(".js-image-face:first").attr('src'));
		$(".nick_name").children("p").text($("#targetName").val());
		$(".content").html("");
		//第一个的时候
		if(user.prev().length>0){
			user.insertBefore($(".user-list-item:first"));
		}
		user.find(".newIcon").text("");
		//拉取聊天记录
		getMessageList($("#targetId").val());
    });
    
 	 //TODO 拉取聊天记录
    function getMessageList(targetId){
    	var targetId = $("#targetId").val();
    	var data = sessionStorage.getItem(targetId);
    	var json = $.parseJSON(data);
    	if(json!=null&&json!=""&&json.length>0){
    		//循环放数据
        	$.each(json,function(i,v){
        		/*var type = "";
        		if(v.type=='image'){
	        		type="image";
        		}else if(v.type=="project"){
        			type="project";
        		}else if(v.type=="order"){
        			type="order";
        		}else{
        			type="text";
        		}*/
        		if(v.from==''){
        			addSendMessage(v.type,v.time, v.content)
        		}else{
        			var user = $("#"+targetId);
        			var name = user.find(".uname:first").text();
        			var photo = user.find("img").attr("src");
        			addReciveMessage(v.type,name, photo, v.time, v.content);
        		}
        	});
    	}
    	$('.content:first').scrollTop($('.content:first')[0].scrollHeight);
    }
  //TODO 打开表情区
    $(".faceButton").click(function(){
    	
    	var state = $("#faceGroupTarea").css('display');
    	if('none'==state){
    		$("#faceGroupTarea").css('display','block');
    	}else{
    		$("#faceGroupTarea").css('display','none');
    	}
    });

    
  //TODO 点击表情转换成标识
    $("#faceGroup").on('click','span',function(){
		var name = $(this).attr('name');
		var message = $("#js-sendMessage").val();
		$("#js-sendMessage").val(message+name);
    });
  //TODO 打开功能区
    $(".addButton").click(function(e){
    	
    	var state = $("#addArea").css('display');
    	console.log(state);
    	if('none'==state){
    		$("#addArea").css('display','block');
    	}else{
    		$("#addArea").css('display','none');
    	}
    });
    
   
    //TODO 开启功能内容区
    function openFunction(type){
    	$("#addArea").css('display','none');
    	layer.open({
    		type:1,
    		content:$("#project_list")
    	});
    	getProjectList();
    	//sendFunction(type);
    	var sendButton = $(".send_project_button a");
    	if("project"==type){
    		
    		sendButton.attr("onclick","sendFunction('project')");
    		sendButton.text("确认并推送");
    	}else if("order"==type){
    		//$(".send_project_button").eq(0).find("input").val("");
    		sendButton.attr("onclick","sendFunction('order')");
    		sendButton.text("确定");
    	}
    	
    }
   
    
  	//TODO 发送项目消息
    function sendFunction(type){
    	var array = new Array();
    	
    	var targetId = $("#targetId").val();
    	var list = $(".order_list");
    	var j = 0;
    	
    	
    	$.each(list,function(i,v){
    		var project={
    				amount:"",
    				desc:"",
    				image:"",
    				mainTitle:"",
    	    		projectId:"",
    	    		subTitle:"",
    	    		url:""
    	    	}
    		var obj = $(v);
    		if(obj.find(".selectProject").is(":checked")){
    			
    			project.amount = obj.find(".media-body span").eq(0).text();
    			project.desc = obj.find(".media-body p").eq(0).text();
    			project.image = obj.find("img").attr("src");
    			project.mainTitle = obj.find(".tags").eq(0).val();
    			project.projectId = obj.find(".selectProject").eq(0).val();
    			project.subTitle= obj.find("h4").text();
    			project.url=baseUrl+"project_detail.html?pid="+obj.find(".selectProject").eq(0).val();
    			array.push(project);
    		}
    		
    	});
    	var projectIds = "";
    	$.each(array,function(i,v){
    		if('project'==type){
    			sendMessage(type, array[i], targetId);
    			list.find("input").removeAttr("checked");
    			layer.closeAll();
        	}else if('order'==type){
        		projectIds = projectIds+v.projectId+",";
        		var desc = v.desc+"";
        		
        		$(".project_list").append("<a href ='../doc/project_detail.html?pid="+v.projectId+"' target='_blank'>"+
						"<div class='order_list'>"+
							"<div class='media'>"+
							  "<div class='media-left'>"+
								"<a href='project_detail.html?pid="+v.projectId+"' >"+
								  "<img class='media-object' src='"+v.image+"' alt='图片'  width='100px'>"+
								"</a>"+
							  "</div>"+
							 " <div class='media-body media-middle'>"+
								"<h4 class='media-heading'>"+v.mainTitle+ "</h4>"+
								"<p style='color: #666;'>"+ desc.substring(0,23) +'...'+"</p>"+
								"<p style='color:#ccb98b'>"+"￥<span>"+v.amount +"</span></p>"+
							 " </div>"+
							"</div>"+
						"</div>"+
					"</a>");
        		if(i==array.length-1){
        			$(".projectIds").eq(0).val(projectIds);
        			layer.closeAll();
            		layer.open({
                		type:1,
                		content:$("#order_create")
                	});
        			
        		}
        		list.find("input").removeAttr("checked");
        		
        	}
			
		});
		
    }
    //发送订单信息
    function sendOrder(){
    	var order = {
    			amount:"",
    			desc:"",
    			image:"",
    			mainTitle:"",
    			orderNum:"",
           		subTitle:"",
           		url:""
        	}
    	var orderNum = $(".order_list:first").find("orderNum").eq(0).val();
    	var project = $(".order_list:first").find("h4").text();
    	var image = $(".order_list:first").find("img").attr("src");
    	var desc = $(".order_desc").find("textarea").eq(0).val();
    	var all_price = $(".all_price").find("span").eq(0).text();
    	var consult_price = $(".consult_price").find("input").eq(0).val();
    	var pay_price = $(".pay_price").find("input").eq(0).val();
    	var order_time = $(".order_time").find("input").eq(0).val();
    	var projectIds = $(".projectIds").eq(0).val();
    	var time = '';
    	if(order_time!=''){
    		order_time = order_time.replace(new RegExp("-","gm"),"/");
        	time = new Date(order_time).getTime();
    	}
    	if(consult_price==''&&!isNaN(consult_price)&&Number(consult_price)<1){
    		layer.alert("请填写优惠价格,只能填数字,不能小于1");
    		return false;
    	}
    	if(pay_price==''&&!isNaN(pay_price)&&Number(pay_price)<1){
    		layer.alert("请填写预付款价格，只能填数字,不能小于1");
    		return false;
    	}
    	if(Number(pay_price)>Number(consult_price)){
    		layer.alert("预付款不得大于优惠款");
    		return false;
    	}
    	
    	var targetId = $("#targetId").val();
    	$.ajax({
    		url:"../api/ProjectOrder/CreateProjectOrder",
    		data:{sid:sid,ryId:targetId,consultPrice:consult_price,payPrice:pay_price,
    			allPrice:all_price,projectIds:projectIds,yuyuetime:time,
    			remark:desc,orderNum:orderNum},
    		success:function(data){
    			var data = $.parseJSON(data);
    			if(data.code==0){
    				
    				order.image = image;
    
    				order.mainTitle = project;
    		    	order.desc = desc;
    		    	order.amount = all_price;
    		    	order.orderNum = data.result.orderNum;
    		    	order.subTitle = project;
    		    	order.url = baseUrl+"doc_payfor.html?sid="+sid+"&orderNum="+order.orderNum;
    		    	sendMessage("order", order, targetId);
    			}else{
    				layer.alert("创建订单失败");
    			}
    		}
    	});
    	
		layer.closeAll();
    }
    
  
  //TODO 退出登录
    function out(type){
    	if(type==1){
    		layer.alert("与服务器断开连接，请重新登陆!",function(){
    			window.location.href="out";
        	});
    	}else{
    		window.location.href="out";
    	}
    }
  	
    
  	//TODO 初始化表情
    RongIMLib.RongIMEmoji.init();
    var emojis = RongIMLib.RongIMEmoji.emojis;
    if(emojis!=null){
    	$.each(emojis,function(i,v){
    		$("#faceGroup").append($(v).find("span:first"));
    	});
    }

    
	
	
	$('#uploadImg').uploadify({
		'auto' : true, // 关闭自动上传
		'removeTimeout' : 0, // 文件队列上传完成1秒后删除
		'swf' : '../assets/js/uploadify/uploadify.swf',
		'uploader' : '../up_messageImg',
		'method' : 'post', // 方法，服务端可以用$_POST数组获取数据
		'buttonText' : '', // 设置按钮文本
		'multi' : false, // 允许同时上传多张图片
		'fileTypeDesc' : '请选择图片文件', // 只允许上传图像
		'fileTypeExts' : '*.jpg;*.png;*.jpeg', // 限制允许上传的图片后缀
		'queueSizeLimit' : 1,
		'fileSizeLimit' : 2048,
		'progressData' : 'speed',
		'formData' : {},
		'onSelect' : function(event, queueId, fileObj) {
			imgSelect = layer.load(1, {
				shade : [ 0.1, '#fff' ]
			});
		},
		'onUploadError' : function(file, errorCode, errorMsg,
				errorString) {
		},
		'onSelectError' : function(file, errorCode, errorMsg) {
			if (errorCode == '-110') {
				layer.alert("文件太大，请上传小于2M的图片", {
					title : false,
					closeBtn : false
				});
			} else {
				layer.alert("上传失败，请重试", {
					title : false,
					closeBtn : false
				});
			}
		},
		'onUploadSuccess' : function(file, data, response) {
			var json = $.parseJSON(data);
			if (json.code == 200) {
				$('.popup_bg').hide();
	            layer.close(imgSelect);
	            
	            sendMessage("image",data,$("#targetId").val() );
			}
		}
	});
	
	//改变滚动条
	$("#chatonline").css("height",$(window).height()-$('.head').height()-71+"px");
	$(".content").css("height",$(window).height()-$('.nick_name').height()-$('.botTextBox').height() +"px");
	
	//切换内容
	
	function changeTab(e){
		var name = $(e).attr("select");
		var selectTab = $(".tab-content").find("."+name).eq(0);
		$(e).parent().addClass("active");
		$(e).parent().siblings().removeClass("active");
		selectTab.show();
		selectTab.siblings().hide();
	}
	
	function changeExclusive(e){
		var name = $(e).attr("class");
		$(e).addClass("green_bg");
		$(e).siblings().removeClass("green_bg");
		//selectTab.siblings().hide();
		//专属用户
		if("user1"==name){
			var selectTab = $(e).parent().next();
			selectTab.show();
			selectTab.next().hide();
			getUserList(selectTab,"1");
		}else{
			var selectTab = $(e).parent().next().next();
			selectTab.show();
			selectTab.prev().hide();
			getUserList(selectTab,"2");
		}
		
	}
	
	//获取项目列表
	function getProjectList(){
		
		$.ajax({
			url:"../api/consult/GetProject",
			type:"post",
			dataType:"json",
			data:{
				sid:sid,
					//sid:"27,4EBBCDB6F69C0F008D3B477CEC65BD3A",
			},
			success:function (data) {
				if(data.code==0){
					
					$.each(data.result, function (i, value) {
						$("#project_list_content").append(
								"<div class='order_list'>"+
									"<input type='hidden' class='tags' value='"+value.projectTags+"' />"+
									"<input class='selectProject' value='"+value.projectId+"' style='float: left;margin-top: 40px;' value='' type='checkbox'>"+
									"<div class='media'>"+
									  "<div class='media-left'>"+
										"<a href='javascript:;' onclick='show(this)' >"+
										"<input class='url' type='hidden' value='"+baseUrl+"project_detail.html?pid="+value.projectId+"' />"+
										  "<img class='media-object' src='"+value.projectLogo+"' alt='图片'  width='100px'>"+
										"</a>"+
									  "</div>"+
									 " <div class='media-body media-middle'>"+
										"<h4 class='media-heading'>"+value.projectTitle+ "</h4>"+
										"<p style='color: #666;'>"+ value.projectMeta.substring(0,23) +'...'+"</p>"+
										"<p style='color:#ccb98b'>"+"￥<span>"+value.projectPrice+"</span></p>"+
									 " </div>"+
									"</div>"+
								"</div>"
							);
					});
				}else if(data.code==101){
					out(1);
				}
				}
		});
	}
	
	
	function show(e){
		var url = $(e).find(".url").eq(0).val();
		console.log("this url = "+url);
		layer.open({
			content:url,
			type:2,
			area: ['400px','600px']
		});
	}