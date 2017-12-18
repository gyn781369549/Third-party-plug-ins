<%@ page language="java" import="java.util.*" pageEncoding="utf-8"%>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html><head><title>Cluster App Test</title></head>
<body>
Server Info:
<%
out.println(request.getLocalAddr() + " : " + request.getLocalPort()+"<br>");%>
<%
out.println("<br> ID " + session.getId()+"<br>");
// 如果有新的 Session 属性设置

System.out.println( "=========test==========");

%>

</table>
</form>
</body>
</html>