	//TODO  设置连接监听状态 （ status 标识当前连接状态）
	// 连接状态监听器
	RongIMClient.setConnectionStatusListener({
 	onChanged: function (status) {
      switch (status) {
          //链接成功
          case RongIMLib.ConnectionStatus.CONNECTED:
              console.log('链接成功');
              break;
          //正在链接
          case RongIMLib.ConnectionStatus.CONNECTING:
              console.log('正在链接');
              break;
          //重新链接
          case RongIMLib.ConnectionStatus.DISCONNECTED:
        	  //out(1);
              console.log('断开连接');
              break;
          //其他设备登录
          case RongIMLib.ConnectionStatus.KICKED_OFFLINE_BY_OTHER_CLIENT:
              console.log('其他设备登录');
              break;
            //网络不可用
          case RongIMLib.ConnectionStatus.NETWORK_UNAVAILABLE:
            console.log('网络不可用');
            //out(1);
            break;
          }
  }});
	//初始化声音
	RongIMLib.RongIMVoice.init();
//TODO  消息监听器
RongIMClient.setOnReceiveMessageListener({
  // 接收到的消息
  onReceived: function (message) {
	  
      // 判断消息类型
      switch(message.messageType){
      
          case RongIMClient.MessageType.TextMessage:
			  reciveMessage("text",message);
              break;
          case RongIMClient.MessageType.VoiceMessage:
        	  RongIMLib.RongIMVoice.preLoaded(message.content.content);
        	  reciveMessage("voice",message);
              // 对声音进行预加载                
              // message.content.content 格式为 AMR 格式的 base64 码
        	 
              break;
          case RongIMClient.MessageType.ImageMessage:
        	  //显示图片
        	  reciveMessage("image",message);
              break;
          case RongIMClient.MessageType.DiscussionNotificationMessage:
              // do something...
              break;
          case RongIMClient.MessageType.LocationMessage:
              // do something...
              break;
          case RongIMClient.MessageType.RichContentMessage:
              // do something...
              break;
          case RongIMClient.MessageType.DiscussionNotificationMessage:
              // do something...
              break;
          case RongIMClient.MessageType.InformationNotificationMessage:
              // do something...
              break;
          case RongIMClient.MessageType.ContactNotificationMessage:
              // do something...
              break;
          case RongIMClient.MessageType.ProfileNotificationMessage:
              // do something...
              break;
          case RongIMClient.MessageType.CommandNotificationMessage:
              // do something...
              break;
          case RongIMClient.MessageType.CommandMessage:
              // do something...
              break;
          case RongIMClient.MessageType.UnknownMessage:
              // do something...
              break;
          default:
              // 自定义消息
              // do something...
      }
  }
});

	RongIMClient.connect(token, {
      onSuccess: function(userId) {
        console.log('Login successfully.' + userId);
      },
      onTokenIncorrect: function() {
        console.log('token无效');
      },
      onError:function(errorCode){
            var info = '';
            switch (errorCode) {
              case RongIMLib.ErrorCode.TIMEOUT:
                info = '超时';
                break;
              case RongIMLib.ErrorCode.UNKNOWN_ERROR:
                info = '未知错误';
                break;
              case RongIMLib.ErrorCode.UNACCEPTABLE_PaROTOCOL_VERSION:
                info = '不可接受的协议版本';
                break;
              case RongIMLib.ErrorCode.IDENTIFIER_REJECTED:
                info = 'appkey不正确';
                break;
              case RongIMLib.ErrorCode.SERVER_UNAVAILABLE:
                info = '服务器不可用';
                break;
            }
            console.log(errorCode);
          }
    });
	//TODO 注册自定义项目消息
	/*RongIMClient.RegisterMessage.ProjectMessage = function(message){
       	this.messageName = "ProjectMessage";
       	this.encode = function(){
          return "amount="+Number(message.amount)+
          	";desc="+message.desc+
          	";image="+message.image+
          	";mainTitle="+message.mainTitle+
          	";projectId="+message.projectId+
          	";subTitle="+message.subTitle+
          	";url="+message.url;
       }
       	
       this.decode = function(message){
         if (typeof message != "string") {
            return message;
         }
         var strArrs = message.split(";"),msg = new RongIMClient.RegisterMessage.project();
         for(var p in strArrs){
            msg[strArrs[p].split("=")[0]]=strArrs[p].split("=")[1];
         }
         return msg;
       }
   	}*/
	
	//TODO 注册自定义订单消息
	
	/*RongIMClient.RegisterMessage.OrderMessage = function(message){
       	this.messageName = "OrderMessage";
       	this.encode = function(){
          return "amount="+message.price+
          	";desc="+message.information+
          	";image="+message.photo+
          	";mainTitle="+message.title+
          	";orderNum="+message.projectId+
          	";subTitle="+message.subTitle+
          	";url="+message.url;
       }
       	
       this.decode = function(message){
         if (typeof message != "string") {
            return message;
         }
         var strArrs = message.split(";"),msg = new RongIMClient.RegisterMessage.OrderMessage();
         for(var p in strArrs){
            msg[strArrs[p].split("=")[0]]=strArrs[p].split("=")[1];
         }
         return msg;
       }

   	}*/
	var projectArray = ["amount","desc","image","mainTitle","projectId","subTitle","url"];
	var orderArray = ["amount","desc","image","mainTitle","orderNum","subTitle","url"];
	//修改注册方式为内部消息结构
	//RongIMClient.registerMessageType('ProjectMessage','app:project',new RongIMLib.MessageTag(true,true),new RongIMClient.RegisterMessage.ProjectMessage);
	//RongIMClient.registerMessageType('OrderMessage','app:ordercard',new RongIMLib.MessageTag(true,true),new RongIMClient.RegisterMessage.OrderMessage);
	RongIMClient.registerMessageType('ProjectMessage','app:project',new RongIMLib.MessageTag(true,true),projectArray);
	RongIMClient.registerMessageType('OrderMessage','app:ordercard',new RongIMLib.MessageTag(true,true),orderArray);
	
	
	//TODO  发送消息
	function sendMessage(type,content,targetId) {
		if(targetId==''){
			alert("请选择发送对象");
			return false;
		}
		var msg = null;
		if("text"==type){
			content = RongIMLib.RongIMEmoji.symbolToEmoji(content);
			// 定义消息类型,文字消息使用 RongIMLib.TextMessage
			msg = new RongIMLib.TextMessage({
				content : content,
				//extra : '附加信息'
			});
		}else if("image"==type){
			var json = $.parseJSON(content);
			
			msg = new RongIMLib.ImageMessage({
				"content":json.content,//图片的base64内容
				"imageUri":json.image,//地址
				//"extra":""//附加信息
			});
		}else if("project"==type){
			//var json = JSON.stringify(content);
			//var json = JSON.stringify(content);
			//console.log(json);
			
			//var str = '{"amount":100,"desc":"adasd","image":"asasdads","mainTitle":"asdadasdad","projectId":12,"subTitle":"111","url":"asdadsad"}';
			//console.log($.parseJSON(str));
			msg = new RongIMClient.RegisterMessage.ProjectMessage(content);
			//msg.encode();
			//msg = new RongIMClient.RegisterMessage.project({amount:1000,url:'www.baidu.com'});
			//console.log(msg.encode());
		}else if("order"==type){
			console.log(content);
			//var json = JSON.stringify(content);
			msg = new RongIMClient.RegisterMessage.OrderMessage(content);
		}
		
		
		//或者使用RongIMLib.TextMessage.obtain 方法.具体使用请参见文档
		//var msg = RongIMLib.TextMessage.obtain('hello');
		var conversationtype = RongIMLib.ConversationType.PRIVATE; // 私聊
		//var targetId = targetId; // 目标 Id
		
		RongIMClient.getInstance().sendMessage(conversationtype,targetId,msg,{
				// 发送消息成功
				onSuccess : function(message) {
					console.log("发送成功");
					console.log(message);
					//message 为发送的消息对象并且包含服务器返回的消息唯一Id和发送消息时间戳
					/* console.log('Send successfully'
							+ message); */
					var date = new Date(message.sentTime);
					var time = date.getHours()+":"+date.getMinutes()+":"+date.getSeconds();
					
					//存储消息
					messageData.time = time;
					if("text"==type){
						messageData.content = RongIMLib.RongIMEmoji.symbolToHTML(message.content.content);
						content = RongIMLib.RongIMEmoji.symbolToHTML(message.content.content);
					}else{
						messageData.content = content;
					}
			    	
			    	messageData.type=type;
			    	var data = sessionStorage.getItem($("#targetId").val());
			    	if(data==null){
			    		var array = new Array();
			    		array.push(messageData);
			    		sessionStorage.setItem($("#targetId").val(),JSON.stringify(array));
			    	}else{
			    		var array = $.parseJSON(data);
			    		array.push(messageData);
			        	sessionStorage.setItem($("#targetId").val(),JSON.stringify(array));
			    	}
					addSendMessage(type,time,content);
					$("#js-sendMessage").val("");
				},
				onError : function(errorCode,
						message) {
					var info = '';
					switch (errorCode) {
					case RongIMLib.ErrorCode.TIMEOUT:
						info = '超时';
						break;
					case RongIMLib.ErrorCode.UNKNOWN_ERROR:
						info = '未知错误';
						break;
					case RongIMLib.ErrorCode.REJECTED_BY_BLACKLIST:
						info = '在黑名单中，无法向对方发送消息';
						break;
					case RongIMLib.ErrorCode.NOT_IN_DISCUSSION:
						info = '不在讨论组中';
						break;
					case RongIMLib.ErrorCode.NOT_IN_GROUP:
						info = '不在群组中';
						break;
					case RongIMLib.ErrorCode.NOT_IN_CHATROOM:
						info = '不在聊天室中';
						break;
					default:
						info = "未知错误";
						break;
					}
					alert('发送失败:' + info);
				}
			});
	}
	
	
	
 
	
	
	
	//TODO 接收消息
    function reciveMessage(type,message){
    	var name = $("#targetName").val();
        var image = $("#targetPhoto").val();
        var targetId = message.targetId;
        var date = new Date(message.sentTime);
  	  	var time = date.getHours()+":"+date.getMinutes()+":"+date.getSeconds();
  	  	var content = null;
  	  	if("text"==type){
  	  		content = RongIMLib.RongIMEmoji.symbolToHTML(message.content.content);
  	  	//}else if("voice"==type){
	  	  	/* var base64Str = message.content.content;
	         RongIMLib.RongIMVoice.preLoaded(base64Str);
	         var duration = base64Str.length/1024;
	         content = message.content.content;
	         RongIMLib.RongIMVoice.play(base64Str,duration);
	         RongIMLib.RongIMVoice.stop(base64Str);*/
  	  	}else{
  	  		content = message.content;
  	  	}
  		//存储
  		messageData.id = targetId;
	  	  messageData.time = time;
	  	  messageData.content = content;
	  	  messageData.from="1";
	  	  messageData.type=type;
	  	  var data = sessionStorage.getItem(targetId);
	  	  if(data==null){
	    		var array = new Array();
	    		array.push(messageData);
	    		sessionStorage.setItem(targetId,JSON.stringify(array));
	    	}else{
	    		var array = $.parseJSON(data);
	    		array.push(messageData);
	        	sessionStorage.setItem(targetId,JSON.stringify(array));
	        	
	    	}
	  	  //窗口打开的时候和未打开的时候
	  	  if(targetId==$("#targetId").val()){
	  		  addReciveMessage(type,name,image,time,content);
	      }else{
	    	  if("text"==type){
	    		  $("#"+targetId).find(".chat-detail").text(content);
	    	  }else if("image"==type){
	    		  $("#"+targetId).find(".chat-detail").text("[图片]");
	    	  }else{
	    		  $("#"+targetId).find(".chat-detail").text("新消息");
	    	  }
	    	 
	    	  var number = $("#"+targetId).find(".newIcon");
	    	  number.text(Number(number.text())+1);
	    	  if($(".user-list-item:first").attr("id")!=targetId){
	    		  $("#"+targetId).insertBefore($(".user-list-item:first"));
	    	  }
	    	 
	      }
    }
    
    
    
  //TODO 添加发送消息的html
    function addSendMessage(type,time,content){
    	if("image"== type){
    		//var json = $.parseJSON(content);
    		content = "<a href='"+content.imageUri+"' target='_blank'><image src='data:image/png;base64,"+content.content+"'  class='webchat_img_upload upNowImg uploadedFile'></a>";
    	}else if("project"==type){
    		var meta = content.desc+"";
    		var url = content.url;
    		content = "<a href ='javascript:(0);' onclick='show(this)'>"+
    							
								"<div class='order_list'>"+
									"<input type='hidden' value='"+url+"' class='url'/>"+
									"<div class='media'>"+
									  "<div class='media-left'>"+
										  "<img class='media-object' src='"+content.image+"' alt='图片'  width='100px'>"+
									  "</div>"+
									 " <div class='media-body media-middle'>"+
										"<h4 class='media-heading'>"+content.mainTitle+ "</h4>"+
										"<p style='color: #666;'>"+ meta.substring(0,23)+'...'+"</p>"+
										"<p style='color:#ccb98b'>"+"<span>"+content.amount+"</span></p>"+
									 " </div>"+
									"</div>"+
								"</div>"+
							"</a>";
    	}else if("order"==type){
    		var meta = content.desc+"";
    		var url = content.url.replace("doc_payfor","doc_seeorder");
    		content = "<a href ='javascript:(0);' onclick='show(this)'>"+
							"<div class='order_list'>"+
							"<p>订单</p>"+
							"<input type='hidden' value='"+url+"' class='url'/>"+
								"<div class='media'>"+
								  "<div class='media-left'>"+
									  "<img class='media-object' src='"+content.image+"' alt='图片'  width='100px'>"+
								  "</div>"+
								 " <div class='media-body media-middle'>"+
									"<h4 class='media-heading'>"+content.mainTitle+ "</h4>"+
									"<p style='color: #666;'>"+ meta.substring(0,23)+'...'+"</p>"+
									"<p style='color:#ccb98b'>"+"<span>"+content.amount+"</span></p>"+
								 " </div>"+
								"</div>"+
							"</div>"+
						"</a>";
    	}
    	$('.content:first').append("<div class='msg workOrderCus' style='float:right; width:100%;'>"+
		"<div class='msg_user fr'>"+ 
			"<img src='"+myPhoto+"' class='msg_user_img'> </div>"+ 
		"<div class='msgContBox fr'>"+
			"<span class='msg_time'>我</span>"+
			"<span class='msg_time'>"+time+"</span>"+
			"<div style='clear:both;'></div>"+
			"<div class='msgBg' style='display: inline-flex;float: right;margin: 0px;max-width: 100%;'>"+
				"<i class='angleRight'></i>"+
				"<div class='msg_content'>"+content+"</div>"+
			"</div>"+
			"<div class='zc-c-chat-admin-ready-error' data-token='1467599680906'></div>"+
			"</div>"+ 
	"</div>");
    	
    	$('.content:first').scrollTop($('.content:first')[0].scrollHeight);
    	//sessionStorage.setItem($("#targetId").val(),JSON.stringify(messageData));
    }
    
    
    //TODO 添加接收信息的html
    function addReciveMessage(type,name,image,time,content){
    	if("image"== type){
    		//var json = $.parseJSON(content);
    		content = "<a href='"+content.imageUri+"' target='_blank'><image src='data:image/png;base64,"+content.content+"'  class='webchat_img_upload upNowImg uploadedFile'></a>";
    	}else if("project"==type){
    		var meta = content.desc+"";
    		var url = content.url;
    		content = "<a href ='javascript:();' onclick='show(this)'>"+
								"<div class='order_list'>"+
								"<input type='hidden' value='"+url+"' class='url'/>"+
									"<div class='media'>"+
									  "<div class='media-left'>"+
										  "<img class='media-object' src='"+content.image+"' alt='图片'  width='100px'>"+
									  "</div>"+
									 " <div class='media-body media-middle'>"+
										"<h4 class='media-heading'>"+content.mainTitle+ "</h4>"+
										"<p style='color: #666;'>"+ meta.substring(0,23)+'...'+"</p>"+
										"<p style='color:#ccb98b'>"+"<span>"+content.amount+"</span></p>"+
									 " </div>"+
									"</div>"+
								"</div>"+
							"</a>";
    	}else if("order" ==type){
    		var meta = content.desc+"";
    		var url = content.url.replace("doc_payfor","doc_seeorder");
    		content = "<a href ='javascript:();' onclick='show(this)'>"+
    						"<p>订单</p>"+
							"<div class='order_list'>"+
							"<input type='hidden' value='"+url+"' class='url'/>"+
								"<div class='media'>"+
								  "<div class='media-left'>"+
									  "<img class='media-object' src='"+content.image+"' alt='图片'  width='100px'>"+
								  "</div>"+
								 " <div class='media-body media-middle'>"+
									"<h4 class='media-heading'>"+content.mainTitle+ "</h4>"+
									"<p style='color: #666;'>"+ meta.substring(0,23)+'...'+"</p>"+
									"<p style='color:#ccb98b'>"+"<span>"+content.amount+"</span></p>"+
								 " </div>"+
								"</div>"+
							"</div>"+
						"</a>";
    	}else if("voice"==type){
    		var length = Math.ceil(content.content.length/2048);
    		content = '<input type="button" state="0" style="width:'+length*10+'px; min-width:30px; max-width:260px; margin: 5px 10px 10px 0;background-color: #09aeaf;border: 0;height: 22px;color: #fff;border-radius: 10px;" value="'+length+'  \'" onclick="playVoice(this)"/>'+
    					'<input type="hidden" value="'+content.content+'"  />';
    	}
    	$('.content:first').append("<div class='msg userCus' style='float:left; width:100%;'>"+
			"<div class='msg_user fl' >"+
			"<img src='"+image+"' class='msg_user_img'>"+
			"</div>"+
			"<div class='msgContBox fl'>"+
			"<span class='msg_name ml'>"+name+"</span>"+
			"<span class='msg_time' style='margin-left: 0px;'>"+time+"</span>"+
			"<div style='clear:both;'></div>"+
			"<div class='msgBg fl' style='display: inline-flex;margin: 0px;max-width: 100%;'>"+
			"<i class='angleLeft'></i>"+
			"<div class='msg_content formUser'>"+content+"</div>"+
			"</div>"+
			"</div>"+
			"</div>");
    	$('.content:first').scrollTop($('.content:first')[0].scrollHeight);
    	
    }
    function playVoice(e){
    	var state = $(e).attr("state");
    	var base64Str = $(e).next().val();
    	var duration = base64Str.length/1024;
    	if("0"==state){
    		RongIMLib.RongIMVoice.preLoaded(base64Str);
    		RongIMLib.RongIMVoice.play(base64Str,duration);
    		$(e).attr("state","1");
    	}else{
    		RongIMLib.RongIMVoice.stop(base64Str);
    		$(e).attr("state","0");
    	}
    }
  	