<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<%@include file="WEB-INF/page/console/common/taglib.jsp" %>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
</head>
<body>
	<form action="api/changeinfo" method="post" enctype="multipart/form-data">
		<input type="text" name="sid" value="6,6DD5E8CB94F1435FB741699B37098330">
		<input type="file" name="portraitUri" />
		<input type="submit" value="提交" />
		<a href="${ctx }/assets/images/1.jpg" data-type="image">计算机上计算机上</a>
	</form>
</body>
</html>