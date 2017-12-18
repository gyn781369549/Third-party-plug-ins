
/**
 * 
 * @param id input的id
 * @param data 传入的json格式数组
 */
function autocompleter(id,data){
	var inputId = $("#"+id);
	var ul = $("#"+id+" ul");
	inputId.keyup(function(){
		var kw = $(this).val();
		if(kw==''){
			ul.css('display','none');
			ul.html("");
		}else{
			ul.html("");
			if(kw.length>1){
				$.ajax({
					url:"hospitalInf_getNames",
					type:"POST",
					data:{'kw':kw,"way":"account"},
					dataType:"JSON",
					success:function(data){
						var val = data;
						$.each(val,function(i,v){
							ul.css('display','block');
							ul.append("<li>"+v+"</li>");
						});
					}
				});
			}
		}
	});
	$("#").next().on('click','li',function(){
		var li = $(this);
		var searchVal = li.text();
		$("#"+id).val(searchVal);
		li.parent().html("");
	});
}