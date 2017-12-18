var baseUrl="http://101.201.40.170/meididi/api/";  //服务器地址

/*
var baseUrl = "http://101.201.82.9/meididi/api/"
*/
 //测试地址

/*
var uploadUrl = "http://101.201.82.9/meididi/upload/"
*/
var uploadUrl="http://101.201.40.170/meididi/upload"; //服务器地址
document.cookie="uid="+2; 
function GetRequest() {
   var url = location.search; //获取url中"?"符后的字串
   var theRequest = new Object();
   if (url.indexOf("?") != -1) {
      var str = url.substr(1);
      strs = str.split("&");
      for(var i = 0; i < strs.length; i ++) {
         theRequest[strs[i].split("=")[0]]=(strs[i].split("=")[1]);
      }
   }
   return theRequest;
}

function getCookie(cookie_name){ 
			    var results = document.cookie.match('(^|;) ?' + cookie_name + '=([^;]*)(;|$)'); 
			    if (results) 
			        return (unescape(results[2])); 
			    else 
			        return null; 
			}


function loading (){
    var i = 0;
    var oTimer =null;
    clearInterval(oTimer);
    $("body").append('<div style="position: fixed;z-index:11111;left: 0;right: 0;bottom: 0;top: 0;background: #fff;" id="load-img">' +
        '<img src="http://img3.a0bi.com/upload/ttq/20140711/1405066128222.gif" style="width: 20%;margin: 40% 40%;">'+
        '</div>');
    oTimer = setInterval(function(){
        i++;
        if(i == 1){
            // $("#mains").show();
            $("#load-img").remove();
            clearInterval(oTimer);
        }
    },"1000")
}