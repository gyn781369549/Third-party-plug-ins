var validator;
$(document).ready(function () {
	
	
	//调用联动
	$(window).selectCity({
	province : '.province',
	city : '.city',
	value :'',
	callback : function(indexArr){
		$("#cityVal").val(provinceArr[indexArr[0]]+","+cityArr[indexArr[0]][indexArr[1]]);
	}
	
	});
	
	
    $("#datepicker").datepicker({
    	changeMonth: true,
    	changeYear: true, dateFormat: 'yy-mm-dd'
    });//日期修改年份

    
    //医院信息修改规则验证
    $.validator.addMethod("isPhone",function(value,element){
    	var phone =  /^1[3|4|5|7|8]\d{9}$/;
    	return this.optional(element) || (phone.test(value));
    },"<span>请输入正确的手机号</span>");
    var accountValidater = $("#hospitalAccountForm").validate({
    	rules:{
    		'hospitalAccount.name':{
    			required:true,
    			remote: {
    				
    			    url: "hospitalAccount_checkInf",     
    			    type: "post",
    			    async:false,
    			    data: {
    			    	id:function(){
    			    		return $("#accountId").val();
    			    	},
    			    	checkKey:"name",
    			    	checkVal:function(){
    			    		return $("input[name='hospitalAccount.name']:first").val();
    			    	}
    			        
    			    }
    			}
    		},
    		'hospitalAccount.accounts':{
    			required:true,
    			remote: {
    			    url: "hospitalAccount_checkInf",     
    			    type: "post",
    			    async:false,
    			    data: {
    			    	id:function(){
    			    		return $("#accountId").val();
    			    	},
    			    	checkKey:"accounts",
    			    	checkVal:function(){
    			    		return $("input[name='hospitalAccount.accounts']:first").val();
    			    	}
    			        
    			    }
    			}
    		},
    		'hospitalAccount.contacts':{
    			required:true
    		},
    		'hospitalAccount.phone':{
    			required:true,
    			isPhone:true,
    			remote: {
    			    url: "hospitalAccount_checkInf",     
    			    type: "post",
    			    async:false,
    			    data: {
    			    	id:function(){
    			    		return $("#accountId").val();
    			    	},
    			    	checkKey:"phone",
    			    	checkVal:function(){
    			    		return $("input[name='hospitalAccount.phone']:first").val();
    			    	}
    			        
    			    }
    			}
    		},
    		'hospitalAccount.address':{
    			required:true
    		},
    		'hospitalAccount.email':{
    			required:true
    		},
    		'hospitalAccount.serviceCharge':{
    			required:true,
    			range:[0,100],
    			digits:true
    		}
    		
    	},
    	messages:{
    		'hospitalAccount.name':{
    			required:"<span>医院名称不能为空</span>",
    			remote:"<span>医院名称重复</span>"
    		},
    		'hospitalAccount.accounts':{
    			required:"<span>医院帐号不能为空</span>",
    			remote:"<span>医院帐号重复</span>"
    		},
    		'hospitalAccount.contacts':{
    			required:"<span>医院联系人不能为空</span>"
    		},
    		'hospitalAccount.phone':{
    			required:"<span>医院电话不能为空</span>",
    			remote:"<span>医院电话重复</span>"
    		},
    		
    		'hospitalAccount.email':{
    			required:"<span>医院邮箱不能为空</span>",
    		},
    		
    		'hospitalAccount.serviceCharge':{
    			required:"<span>不能为空</span>",
    			range:"<span>请输入0-100的数</span>",
    			digits:"<span>必需输入整数</span>"
    		}
    	}
    });
    $("#accountSub").click(function(){
    	if(accountValidater.valid()){
    		$("#hospitalAccountForm").submit();
    	}
    });
   
    
     // 添加验证方法
     jQuery.validator.addMethod(
             "geshi",
             function (value, element) {
                 var pass = /^([0-9a-zA-Z]{6,18})$/;
                 return (pass.test(value) || this.optional(element));
             },
             " <span>密码格式不正确，请输入6-18位数字及字母，不支持特殊字符及空格</span>"
     );
     
     validator = $("#resetPsdForm").validate({
         rules: {
             password: {
                 required: true,
                 geshi: function () {
                     return true;
                 }
             },
             password2: {
                 required: true,
                 equalTo: "#password1"
             },
         },
         messages: {
             password: {
                 required: "<span>密码不能为空</span>",
             },
             password2: {
                 required: "<span>确认密码不能为空</span>",
                 equalTo: "<span>两次密码输入不一致，请重新输入</span>"
             },
         }
     });


 });


 //重置密码
 function resetPsd(e) {
 	var tr = $(e).parent().parent().parent().parent();
     $('#hosName').text(tr.find(".account_name:first").text());
     $('#h_id').val($.trim($(e).next().val().toString()));
     $('#hosAcount').text(tr.find(".account_name:first input").val());
     //validator.resetForm();
     /*//取当前医院的信息
     $.ajax({
         type: "GET",
         url: "/admin.php?r=admin/admin/resetPsd",
         data: {h_id: item[k]['h_id']},
         dataType: 'text',
         success: function (data) {
             $('#hosAcount').text(data);
         }
     });*/
     $('form')[1].reset();
     layer.open({
         type: 1,
         title: false,
         shadeClose: true,
         closeBtn: false,
         maxmin: true,
         content: $('#resetPsdDiv')
     });
 }
 
 function submitResPass(){
 	//console.info(validator.form());
 	if(validator.form()){
 		$.ajax({
 			url:'hospitalAccount_newPass',
 			type:"POST",
 			data:$("#resetPsdForm").serialize(),
 			success:function(data){
 				if(data=="success"){
 					window.parent.layer.alert("修改成功",
 							{title:false,closeBtn:false},
 							function(){
 								window.parent.layer.closeAll();
 								window.location.href=window.location.href;
 							});
 				}else{
 					window.parent.layer.alert("修改失败",
 							{title:false,closeBtn:false},
 							function(){
 								window.parent.location.href=window.parent.location.href;
 							});
 				}
 			}
 		});
 	}
 }

 //切换用户状态 弹出框
 function switchStatus(e) {
 	var tr = $(e).parent().parent().parent();
     $('#switchStatusHosId').val($.trim($(e).next().val()));
     $('#switchStatusK').val($(e).next().val());
     var html1 = '<img alt="" src="../assets/images/close_hint_pic.png"><h3>您是否要修改该医院状态为关闭？</h3><p>将该医院账号状态修改为关闭，</p><p>则该医院所有咨询师将不能登录及使用美滴滴系统！</p>';
     var html2 = '<img alt="" src="../assets/images/ture_hint_pic.png"><h3>您是否要修改该医院状态为开启？</h3><p>将该医院账号状态修改为开启，</p><p>则该医院所有咨询师将能正常登录及使用美滴滴系统！</p>';
     ($(e).next().next().find("input:first").attr("checked") == "checked") ? $('#switchStatusTips').html(html1) : $('#switchStatusTips').html(html2);
     resetPsdIndex = layer.open({
         type: 1,
         title: false,
         shadeClose: true,
         closeBtn: false,
         maxmin: true,
         content: $('#switchStatusDiv')
     });
 }

 //执行切换用户状态
 function doSwitchStatus(e) {
     var h_id = $('#switchStatusHosId').val();
     var k = $('#switchStatusK').val();
     console.log("dsfdsfsdfd");
     //var status = ($("#checkbox_d" + k).attr("checked") == "checked") ? 2 : 1;
     $.ajax({
         type: "POST",
         url: "hospitalAccount_check",
         data:{"id":h_id},
         success: function (data) {
             if (data == 'success') {
                 layer.alert("操作成功", 
                 		{title: false, closeBtn: false}, 
                 		function () {
                 			window.location.href = "hospitalAccount_list";
                 });
                 $("#checkbox_d" + k).click();
             } else {
                 layer.alert("操作失败，请重试", {title: false, closeBtn: false}, function () {
                     layer.closeAll();
                 });
             }
         }
     });
 }
 
