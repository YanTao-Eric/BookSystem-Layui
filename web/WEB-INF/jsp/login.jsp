<%--
  Created by IntelliJ IDEA.
  User: YanTao
  Date: 2021/8/3
  Time: 18:07
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
    <meta charset="UTF-8">
    <title>LMS-登录</title>
    <meta http-equiv="X-UA-Compatible" content="IE=edge,chrome=1">
    <meta http-equiv="Access-Control-Allow-Origin" content="*">
    <meta name="viewport" content="width=device-width, initial-scale=1, maximum-scale=1">
    <meta name="apple-mobile-web-app-status-bar-style" content="black">
    <meta name="apple-mobile-web-app-capable" content="yes">
    <meta name="format-detection" content="telephone=no">
    <link rel="stylesheet" href="https://cdn.staticfile.org/layui/2.6.8/css/layui.css" media="all">
    <!--[if lt IE 9]>
    <script src="https://cdn.staticfile.org/html5shiv/r29/html5.min.js" charset="UTF-8"></script>
    <script src="https://cdn.staticfile.org/respond.js/1.4.2/respond.min.js" charset="UTF-8"></script>
    <![endif]-->
    <style>
        .main-body {top:50%;left:50%;position:absolute;-webkit-transform:translate(-50%,-50%);-moz-transform:translate(-50%,-50%);-ms-transform:translate(-50%,-50%);-o-transform:translate(-50%,-50%);transform:translate(-50%,-50%);overflow:hidden;}
        .login-main .login-bottom .center .item input {display:inline-block;width:227px;height:22px;padding:0;position:absolute;border:0;outline:0;font-size:14px;letter-spacing:0;}
        .login-main .login-bottom .center .item .icon-1 {background:url(/static/icon-login.png) no-repeat 1px 0;}
        .login-main .login-bottom .center .item .icon-2 {background:url(/static/icon-login.png) no-repeat -54px 0;}
        .login-main .login-bottom .center .item .icon-3 {background:url(/static/icon-login.png) no-repeat -106px 0;}
        .login-main .login-bottom .center .item .icon-4 {background:url(/static/icon-login.png) no-repeat 0 -43px;position:absolute;right:-10px;cursor:pointer;}
        .login-main .login-bottom .center .item .icon-5 {background:url(/static/icon-login.png) no-repeat -55px -43px;}
        .login-main .login-bottom .center .item .icon-6 {background:url(/static/icon-login.png) no-repeat 0 -93px;position:absolute;right:-10px;margin-top:8px;cursor:pointer;}
        .login-main .login-bottom .tip .icon-nocheck {display:inline-block;width:10px;height:10px;border-radius:2px;border:solid 1px #9abcda;position:relative;top:2px;margin:1px 8px 1px 1px;cursor:pointer;}
        .login-main .login-bottom .tip .icon-check {margin:0 7px 0 0;width:14px;height:14px;border:none;background:url(/static/icon-login.png) no-repeat -111px -48px;}
        .login-main .login-bottom .center .item .icon {display:inline-block;width:33px;height:22px;}
        .login-main .login-bottom .center .item {width:288px;height:35px;border-bottom:1px solid #dae1e6;margin-bottom:35px;}
        .login-main {width:428px;position:relative;float:left;}
        .login-main .login-top {height:117px;background-color:#148be4;border-radius:12px 12px 0 0;font-family:SourceHanSansCN-Regular;font-size:30px;font-weight:400;font-stretch:normal;letter-spacing:0;color:#fff;line-height:117px;text-align:center;overflow:hidden;-webkit-transform:rotate(0);-moz-transform:rotate(0);-ms-transform:rotate(0);-o-transform:rotate(0);transform:rotate(0);}
        .login-main .login-top .bg1 {display:inline-block;width:74px;height:74px;background:#fff;opacity:.1;border-radius:0 74px 0 0;position:absolute;left:0;top:43px;}
        .login-main .login-top .bg2 {display:inline-block;width:94px;height:94px;background:#fff;opacity:.1;border-radius:50%;position:absolute;right:-16px;top:-16px;}
        .login-main .login-bottom {width:428px;background:#fff;border-radius:0 0 12px 12px;padding-bottom:53px;}
        .login-main .login-bottom .center {width:288px;margin:0 auto;padding-top:40px;padding-bottom:15px;position:relative;}
        .login-main .login-bottom .tip {clear:both;height:16px;line-height:16px;width:288px;margin:0 auto;}
        body {background:url(/static/loginbg.png) 0% 0% / cover no-repeat;position:static;font-size:12px;}
        input::-webkit-input-placeholder {color:#a6aebf;}
        input::-moz-placeholder {/* Mozilla Firefox 19+ */            color:#a6aebf;}
        input:-moz-placeholder {/* Mozilla Firefox 4 to 18 */            color:#a6aebf;}
        input:-ms-input-placeholder {/* Internet Explorer 10-11 */            color:#a6aebf;}
        input:-webkit-autofill {/* 取消Chrome记住密码的背景颜色 */            -webkit-box-shadow:0 0 0 1000px white inset !important;}
        html {height:100%;}
        .login-main .login-bottom .tip {clear:both;height:16px;line-height:16px;width:288px;margin:0 auto;}
        .login-main .login-bottom .tip .login-tip {font-family:MicrosoftYaHei;font-size:12px;font-weight:400;font-stretch:normal;letter-spacing:0;color:#9abcda;cursor:pointer;}
        .login-main .login-bottom .tip .account {color:#1391ff;position:absolute;right:62px;}
        .login-main .login-bottom .tip a {font-stretch:normal;letter-spacing:0;color:#1391ff;text-decoration:none;}
        .login-main .login-bottom .login-btn {width:288px;height:40px;background-color:#1E9FFF;border-radius:16px;margin:24px auto 0;text-align:center;line-height:40px;color:#fff;font-size:14px;letter-spacing:0;cursor:pointer;border:none;}
        .login-main .login-bottom .center .item .validateImg {position:absolute;right:1px;cursor:pointer;height:36px;border:1px solid #e6e6e6;}
        .footer {left:0;bottom:0;color:#fff;width:100%;position:absolute;text-align:center;line-height:30px;padding-bottom:10px;text-shadow:#000 0.1em 0.1em 0.1em;font-size:14px;}
        .padding-5 {padding:5px !important;}
        .footer a,.footer span {color:#fff;}
        @media screen and (max-width:428px) {.login-main {width:360px !important;}
            .login-main .login-top {width:360px !important;}
            .login-main .login-bottom {width:360px !important;}
        }
    </style>
</head>
<body>
<div class="main-body">
    <div class="login-main">
        <div class="login-top">
            <span>LMS 登录</span>
            <span class="bg1"></span>
            <span class="bg2"></span>
        </div>
        <form class="layui-form login-bottom" action="${pageContext.request.contextPath}/login" method="post">
            <div class="center">
                <div class="item">
                    <span class="icon icon-2"></span>
                    <label>
                        <input type="text" name="username" lay-verify="required" lay-reqtext="账号不能为空" placeholder="请输入登录账号" maxlength="9" value="${cookie.get("uid").value}"/>
                    </label>
                </div>

                <div class="item">
                    <span class="icon icon-3"></span>
                    <label>
                        <input type="password" name="password" lay-verify="required" lay-reqtext="密码不能为空" placeholder="请输入密码" maxlength="18" value="${cookie.get("pwd").value}">
                    </label>
                    <span class="bind-password icon icon-4"></span>
                </div>

<%--                <div id="validatePanel" class="item" style="width: 137px;">--%>
<%--                    <label>--%>
<%--                        <input type="text" name="captcha" lay-verify="required" lay-reqtext="验证码不能为空" placeholder="请输入验证码" autocomplete="off" maxlength="4">--%>
<%--                    </label>--%>
<%--                    <img id="refreshCaptcha" class="validateImg" src="${pageContext.request.contextPath}/code" onclick="$(this).attr('src', '${pageContext.request.contextPath}/code?t=' + new Date().getTime())" alt="">--%>
<%--                </div>--%>

            </div>
            <div class="layui-input-inline" style="margin-left: 70px;">
                <input type="checkbox" name="remember-me" id="rememberMe" value="true" lay-skin="primary" title="一周内免登录">
            </div>
            <div class="tip layui-input-inline" style="margin-left: -70px;">
<%--                <span class="icon-nocheck"></span>--%>
<%--                <span class="login-tip" onclick="$('.icon-nocheck').click()">保持登录</span>--%>

                <span class="account">
                    <a href="javascript:;" class="no-account">没有账号？</a>
                </span>
            </div>
            <div class="layui-form-item" style="text-align:center; width:100%;height:100%;margin:0;">
                <button class="login-btn" lay-submit="" lay-filter="login">立即登录</button>
            </div>
        </form>
    </div>
</div>
<div class="footer">
    ©版权所有 2021-2021 XX网络工作室<span class="padding-5">|</span><a target="_blank" href="https://beian.miit.gov.cn/">蜀ICP备12345678号</a>
</div>
<script src="https://cdn.staticfile.org/jquery/3.6.0/jquery.min.js" charset="UTF-8"></script>
<script src="https://cdn.staticfile.org/layui/2.6.8/layui.js" charset="utf-8"></script>
<script>
    layui.use(['form','jquery'], function () {
        let $ = layui.jquery,
            form = layui.form,
            layer = layui.layer,
            rememberMe = false;

        // 登录过期的时候，跳出ifram框架
        if (top.location !== self.location) top.location = self.location;

        $('.bind-password').on('click', function () {
            if ($(this).hasClass('icon-5')) {
                $(this).removeClass('icon-5');
                $("input[name='password']").attr('type', 'password');
            } else {
                $(this).addClass('icon-5');
                $("input[name='password']").attr('type', 'text');
            }
        });

        $('.icon-nocheck').on('click', function () {
            if ($(this).hasClass('icon-check')) {
                $(this).removeClass('icon-check');
                rememberMe = false;
            } else {
                $(this).addClass('icon-check');
                rememberMe = true;
            }
        });

        $('.forget-password').on('click', function () {
            window.location = '/forget.html';
        });

        $('.no-account').on('click', function () {
            window.location = '/register.html';
        })

        // 进行登录操作
        <%--form.on('submit(login)', function (data) {--%>
        <%--    data = data.field;--%>
        <%--    $.post({--%>
        <%--        url: '/login',--%>
        <%--        data: {--%>
        <%--            username: data.username,--%>
        <%--            password: data.password,--%>
        <%--            captcha: data.captcha,--%>
        <%--            keepLogin: keepLogin--%>
        <%--        },--%>
        <%--        success: function (res) {--%>
        <%--            if (res.code !== 0){--%>
        <%--                layer.msg(res.msg, {icon: 2}, function () {--%>
        <%--                    window.location = "${pageContext.request.contextPath}/login.html";--%>
        <%--                })--%>
        <%--            }else {--%>
        <%--                window.location = "/index.html";--%>
        <%--            }--%>
        <%--        }--%>
        <%--    })--%>
        <%--    return false;--%>
        <%--});--%>
    });
</script>
</body>
</html>
