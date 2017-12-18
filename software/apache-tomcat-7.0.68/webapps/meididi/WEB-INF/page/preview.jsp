<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>
<!DOCTYPE html>
<html lang="zh-ch">
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
        <meta name="description" content="美滴滴后台管理"/>
        <meta name="keywords" content=""/>
        <meta name="robots" content="index,follow"/>
        <meta name="renderer" content="webkit">
        <meta http-equiv="X-UA-Compatible" content="IE=Edge,chrome=1">
        <base href="<%=basePath%>">
        <title>推送预览</title>
        <link href="assets/css/hospital/base.css" rel="stylesheet" type="text/css" />
        <link href="assets/css/hospital/popup.css" rel="stylesheet" type="text/css" />
        <link href="assets/css/hospital/bootstrap.min.css" rel="stylesheet" type="text/css" />
    </head>
    <body role="document">
        <cite class="popup_t">预览</cite>
        <div class="popup_cont" style="background: #fff">
            <div class="push_preview">
                <div class="push_tel_box">
                    <div class="push_tel">
                        <iframe src="${way}?id=${id }" style="width:218px;height:377px;border:0"></iframe>
                    </div>
                </div>
            </div>
        </div>
    </body>
</html>