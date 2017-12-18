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



});


//切换用户状态 弹出框
function switchStatus(e) {
	var tr = $(e).parent().parent().parent();
    $('#switchStatusHosId').val($.trim(tr.find(".account_id:first").text()));
    $('#switchStatusK').val($(e).next().val());
    var html1 = '<img alt="" src="../assets/images/close_hint_pic.png"><h3>您是否要修改该医院信息状态为关闭？</h3><p>将该医院信息状态修改为关闭，</p><p>则该医院信息将不会在前端显示用户无法浏览！</p>';
    var html2 = '<img alt="" src="../assets/images/ture_hint_pic.png"><h3>您是否要修改该医院信息状态为开启？</h3><p>将该医院信息状态修改为开启，</p><p>则该医院信息将在前端显示支持用户浏览！</p>';
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
    //var status = ($("#checkbox_d" + k).attr("checked") == "checked") ? 2 : 1;
    $.ajax({
        type: "POST",
        url: "hospitalInf_check",
        data:{"id":h_id},
        success: function (data) {
            if (data == 'success') {
                layer.alert("操作成功", 
                	{title: false, closeBtn: false}, 
                	function () {layer.closeAll();
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