<%--
  Created by IntelliJ IDEA.
  User: YanTao
  Date: 2021/10/14
  Time: 19:19
  To change this template use File | Settings | File Templates.
--%>

<%@ page contentType="text/html;charset=UTF-8" language="java" pageEncoding="UTF-8" %>
<%
    String path = request.getContextPath();
    String basePath = request.getScheme() + "://" + request.getServerName() + ":" + request.getServerPort() + path + "/";
%>
<!DOCTYPE html>
<html>
<head>
    <base href="<%=basePath%>">
    <title>认证失败</title>
</head>
<body>
    <h2>
        登录失败！<a href="${pageContext.request.contextPath}/login.html">点此重新登录</a>
    </h2>
</body>
</html>
