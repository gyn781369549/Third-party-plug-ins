<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
 <header class="enroll_header">
      <a href="javascript:;" style="color: #000;" onclick="lxwmShow();" title="">联系我们</a>
      <a href="#" style="color: #000;"  title=""> 医院后台入口
      </a>
        <a href="${pageContext.request.contextPath}/admin" style="color: #000;"  title=""> 美滴滴管理入口
      </a>
        <a href="${pageContext.request.contextPath}/consult/out" style="color: #000;"  title=""> 咨询师入口
      </a>
      
      <div class="meidd_logo">
          <a href="" title="美滴滴中国专业整形咨询平台">
              <img src="assets/images/index_logo2.png" alt="">
          </a>
      </div>
</header>


<script>
var lxwm = dialog({
    content: '<div class="popup_box">'
	+	'<cite class="popup_t">联系我们</cite>'
	+	'<div class="popup_cont">'
	+		'<div class="contact_us">'
        +                       '<div class="search_box"></div>'
	+			'<div class="sh_plan_inquire">'
	+				'<form class="form-search">'
	+					'<label>注册审核进度查询</label>'
	+					'<input type="text" class="input_plan_search" placeholder="请输入注册时填写提交的手机号" value="" name="" id="resPhone">'
	+					'<input type="button" class="btn_search" value="查询" onclick="tolxwm();">'
	+				'</form>'
	+			'</div>'
	+			'<div class="contact_box">'
	+				'<p>服务电话&nbsp;400-807-5989</p>'
	+				'<p>服务邮箱&nbsp;support@meididi.com.cn</p>'
	+			'</div>'
	+		'</div>'
	+		'<p class="popup_btn">'
	+			'<span class="popup_btn_p">'
	+				'<input type="button" value="返回" class="input_green" onclick="lxwmOff();" />'
	+			'</span></p></div>'
	+'</div>'
		
    });

function lxwmShow(){
    $(".popup_bg").show();
    $("#resPhone").val('');
    $(".search_box").html('');
    lxwm.show();
}
function lxwmOff(){
    $(".popup_bg").hide();
    lxwm.close();
}

function tolxwm(){
    var resPhone=$("#resPhone").val();
    if(resPhone==''){
        alert('请填写手机号');
    }else{
         var reg = /^0?1[0-9]{10}$/;
             if (reg.test(resPhone)) {
                 $.ajax({
                   url:"account_process",
                   type:'POST',
                   timeout:3000,
                   data : {phone:resPhone},
                   success:function(data){
                	   var json = $.parseJSON(data);
                       if(json.msg=="success"){
                            var str_1='<span class="ico_audit">!</span><p class="c_pink">'+json.name+'</p><p class="c_e">正在审核中</p>';
                            var str_2='<span class="ico_audit_pass">√</span><p class="c_pink">'+json.name+'</p>'
					+'<p class="c_e f16">审核已通过<a href="'+''+'" title="" class="mail_alink" target="_blank">去邮箱</a></p>';
                            var str_3='<span class="ico_audit_notpass">×</span><p class="c_pink">'+json.name+'</p><p class="c_e f16">审核未通过<a href="javascript:;" title="" class="mail_alink" onclick="javascript: window.open(\''+''+'\')">去邮箱</a></p>';
                            if(json.state=="-1"){
                            	$(".search_box").html(str_1);
                            }
                            if(json.state=="1"){
                            	$(".search_box").html(str_2);
                            }
                            if(json.state=="0"){
                            	$(".search_box").html(str_3);
                            }
                            
                           
                        }else{
                            alert("请填写正确的手机号");
                        }

                   }
                });
             }else{
                 alert("请填写正确的手机号");
             }
    }
 
    
}
</script>