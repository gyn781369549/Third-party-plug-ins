<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<%
	String path = request.getContextPath();
	String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>
<!DOCTYPE html>
<html lang="zh-CN">
	<head>
	<title>选点获取经纬度</title>
	<base href="<%=basePath%>">
	<script type="text/javascript" src="assets/js/jquery-1.8.0.min.js"></script>
	<script type="text/javascript" src="http://api.map.baidu.com/api?v=2.0&ak=75ebafc2c09392aec0f48d89ec119fb6"></script>
	<style type="text/css">
		body, html,#allmap {width: 100%;height: 100%;overflow: hidden;margin:0;}
		#l-map{height:100%;width:78%;float:left;border-right:2px solid #bcbcbc;}
		#r-result{height:100%;width:20%;float:left;}
	</style>
	<script type="text/javascript">
		function choose()
		{
			var ZUOBIAO_X = document.getElementById("ZUOBIAO_X").value;
			var ZUOBIAO_Y = document.getElementById("ZUOBIAO_Y").value;
			if(ZUOBIAO_X!=''&&ZUOBIAO_Y!=''){
				parent.$('#coords_x').val(ZUOBIAO_X);
				parent.$('#coords_y').val(ZUOBIAO_Y);
				parent.$('#coords_button').css("background","rgba(121,210,190,.7)");
			    parent.layer.closeAll();
			}
		}
	</script>
</head>
<body>
<div>
<table bgcolor="#E3E4D8" width="100%">
	<tr>
		<td style="width: 50px">经度：</td>
		<td style="width: 100px"><input id="ZUOBIAO_X" value="${coords_x}" type="text" style="width: 100px" /></td>
		<td style="width: 50px">纬度：</td>
		<td style="width: 100px"><input id="ZUOBIAO_Y" value="${coords_y}" type="text"  style="width: 100px"/></td>
		<td style="width: 50px"><input type="button" value="确定" onclick="choose();"/></td>
		<td style="width: 50px">搜索：</td>
		<td width="100">
		<input type="text" id="suggestId" size="20" value="" style="width:150px;" />
		<div id="searchResultPanel" style="border:1px solid #C0C0C0;width:150px;height:auto;"></div>
		</td>
	</tr>
</table>
</div>
<div id="allmap"></div>
</body>
</html>
<script type="text/javascript">
	// 百度地图API功能
	var initValue_x="${coords_x}";
	var initValue_y="${coords_y}";
	var address="${address}";
	var map = new BMap.Map("allmap");
	var point=null;
    // 初始化地图,设置城市和地图级别。
	if(initValue_x!=""&&initValue_y!=''){
		point = new BMap.Point(Number(initValue_x),Number(initValue_y));
	}else if(address!=''){
		//console.info(address);
		point=address;
	}else{
		point='北京';
	}
	map.centerAndZoom(point,12);                   // 初始化地图,设置城市和地图级别。
	var marker = new BMap.Marker(point);  // 创建标注
	map.addOverlay(marker);              // 将标注添加到地图中
	var ac = new BMap.Autocomplete(    //建立一个自动完成的对象
	    {"input" : "suggestId"
	    ,"location" : map
	});
	
	ac.addEventListener("onhighlight", function(e) {  //鼠标放在下拉列表上的事件
	var str = "";
	    var _value = e.fromitem.value;
	    var value = "";
	    if (e.fromitem.index > -1) {
	        value = _value.province +  _value.city +  _value.district +  _value.street +  _value.business;
	    }    
	    str = "FromItem<br />index = " + e.fromitem.index + "<br />value = " + value;
	    
	    value = "";
	    if (e.toitem.index > -1) {
	        _value = e.toitem.value;
	        value = _value.province +  _value.city +  _value.district +  _value.street +  _value.business;
	    }    
	    str += "<br />ToItem<br />index = " + e.toitem.index + "<br />value = " + value;
	});
	
	var myValue;
	ac.addEventListener("onconfirm", function(e) {    //鼠标点击下拉列表后的事件
	var _value = e.item.value;
	    myValue = _value.province +  _value.city +  _value.district +  _value.street +  _value.business;
	    setPlace();
	});
	
	function setPlace(){
	    map.clearOverlays();    //清除地图上所有覆盖物
	    function myFun(){
	        var pp = local.getResults().getPoi(0).point;    //获取第一个智能搜索的结果
	        map.centerAndZoom(pp, 18);
	        map.addOverlay(new BMap.Marker(pp));    //添加标注
	    }
	    var local = new BMap.LocalSearch(map, { //智能搜索
	      onSearchComplete: myFun
	    });
	    local.search(myValue);
	}
	
	map.addControl(new BMap.ScaleControl());                    // 添加默认比例尺控件
	map.addControl(new BMap.ScaleControl({anchor: BMAP_ANCHOR_TOP_LEFT}));                    // 左上
	map.addControl(new BMap.ScaleControl({anchor: BMAP_ANCHOR_TOP_RIGHT}));                    // 右上
	map.addControl(new BMap.ScaleControl({anchor: BMAP_ANCHOR_BOTTOM_LEFT}));                    // 左下
	map.addControl(new BMap.ScaleControl({anchor: BMAP_ANCHOR_BOTTOM_RIGHT}));                    // 右下
	
	map.addControl(new BMap.NavigationControl());  //添加默认缩放平移控件
	map.addControl(new BMap.NavigationControl({anchor: BMAP_ANCHOR_TOP_RIGHT, type: BMAP_NAVIGATION_CONTROL_SMALL}));  //右上角，仅包含平移和缩放按钮
	map.addControl(new BMap.NavigationControl({anchor: BMAP_ANCHOR_BOTTOM_LEFT, type: BMAP_NAVIGATION_CONTROL_PAN}));  //左下角，仅包含平移按钮
	map.addControl(new BMap.NavigationControl({anchor: BMAP_ANCHOR_BOTTOM_RIGHT, type: BMAP_NAVIGATION_CONTROL_ZOOM}));  //右下角，仅包含缩放按钮
	
	map.enableScrollWheelZoom();    //启用滚轮放大缩小，默认禁用
	map.enableContinuousZoom();    //启用地图惯性拖拽，默认禁用
	
	function showInfo(e){
		map.clearOverlays();    //清除地图上所有覆盖物
		var marker2 = new BMap.Marker(new BMap.Point(e.point.lng,e.point.lat));  // 创建标注
		//console.info(marker2);
		map.addOverlay(marker2);              // 将标注添加到地图中
	 	document.getElementById("ZUOBIAO_X").value = e.point.lng;
	    document.getElementById("ZUOBIAO_Y").value = e.point.lat;
	}
	map.addEventListener("click", showInfo);//添加点击显示红点
</script>
	
	
	
	
	
	
	
	
	