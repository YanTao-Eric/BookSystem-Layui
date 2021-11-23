<%@ taglib prefix="sec" uri="http://www.springframework.org/security/tags" %>
<%--
  Created by IntelliJ IDEA.
  User: YanTao
  Date: 2021/5/21
  Time: 19:51
  To change this template use File | Settings | File Templates.
--%>

<%@ page contentType="text/html;charset=UTF-8" pageEncoding="UTF-8" %>
<%
    String path = request.getContextPath();
    String basePath = request.getScheme() + "://" + request.getServerName() + ":" + request.getServerPort() + path + "/";
%>
<!DOCTYPE html>
<html>
    <head>
        <base href="<%=basePath%>">
        <title>首页</title>
        <link href="https://cdn.staticfile.org/layui/2.6.8/css/layui.css" rel="stylesheet"/>
        <style>
            /*body{*/
            /*    background: url("/static/bg.jpg") no-repeat 100% 100% fixed;*/
            /*}*/
            /*h3{*/
            /*    width: 180px;*/
            /*    height: 38px;*/
            /*    line-height: 38px;*/
            /*    border-radius: 5px;*/
            /*    background-color: white;*/
            /*    text-align: center;*/
            /*    margin: 50px auto;*/
            /*}*/
            /*a{*/
            /*    color: deepskyblue;*/
            /*    font-size: 16px;*/
            /*    text-decoration: none;*/
            /*    font-weight: bolder;*/
            /*}*/
        </style>
    </head>
    <body style="background: url('/static/1.jpg');">
    <div>
        <sec:authorize access="!isAuthenticated()">
            <button class="layui-btn layui-btn-normal" onclick="window.location = '${pageContext.request.contextPath}/login.html'">登录</button>
        </sec:authorize>
        <sec:authorize access="isAuthenticated()">
            <div class="layui-row" style="margin-top: 20px; color: white; ">
                <div class="layui-col-xs4 layui-col-sm7 layui-col-md11">
                    欢迎[<sec:authentication property="name"/><sec:authentication property="principal.authorities"/>]登录！
                </div>
                <div class="layui-col-xs4 layui-col-sm5 layui-col-md1">
                    <button class="layui-btn" onclick="window.location='${pageContext.request.contextPath}/logout.html'">注销</button>
                </div>
            </div>
            <div align="center" style="margin-top: 200px;">
                <button class="layui-btn layui-btn-lg layui-btn-normal" onclick="window.location = '${pageContext.request.contextPath}/book/all';">书 籍 列 表</button>
                <button class="layui-btn layui-btn-lg layui-btn-normal" onclick="window.location = '${pageContext.request.contextPath}/book/toAdd';">添 加 书 籍</button>
            </div>
        </sec:authorize>
    </div>
    </body>
</html>
