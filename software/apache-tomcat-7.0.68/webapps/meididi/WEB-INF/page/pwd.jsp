<%@ page language="java" pageEncoding="utf-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<c:set var="ctx" value="${pageContext.request.contextPath}" />

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html lang="en-US"><head>
	<meta http-equiv="Content-Type" content="text/html; charset=UTF-8" />
    <meta charset="UTF-8"/>
    <title>修改密码</title>
    <link href="${ctx}/css/cmstop-error.css" rel="stylesheet" type="text/css" media="all"/>
</head>
<body class="body-bg">
<div class="main">
    <form action="${ctx }/api/setPwd">
    	新密码:<input type="password" name="password" />
    	确认密码:<input type="password" />
    	<input type="hidden" name="token" value="${sessionScope.token }" />
    	<input type="submit" value="提交"  />
    </form>
</div>
</body></html>