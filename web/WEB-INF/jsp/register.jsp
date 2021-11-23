<%--
  Created by IntelliJ IDEA.
  User: YanTao
  Date: 2021/10/14
  Time: 21:43
  To change this template use File | Settings | File Templates.
--%>

<%@ page contentType="text/html;charset=UTF-8" language="java" pageEncoding="UTF-8" %>
<%
    String path = request.getContextPath();
    String basePath = request.getScheme() + "://" + request.getServerName() + ":" + request.getServerPort() + path + "/";
%>
<!DOCTYPE html>
<html lang="zh">
<head>
    <base href="<%=basePath%>">
    <meta charset="utf-8">
    <title>layui</title>
    <meta name="renderer" content="webkit">
    <meta http-equiv="X-UA-Compatible" content="IE=edge,chrome=1">
    <meta name="viewport" content="width=device-width, initial-scale=1, maximum-scale=1">
    <link rel="stylesheet" href="${pageContext.request.contextPath}/static/layui/2.6.8/css/layui.css" media="all">
    <link rel="stylesheet" href="${pageContext.request.contextPath}/static/layuimini/css/public.css" media="all">
    <link rel="stylesheet" href="${pageContext.request.contextPath}/static/layuimini/js/lay-module/step-lay/step.css" media="all">
    <style>
        body {
            background-color: #ffffff;
        }

        /*去除type为number的input标签的上下箭头*/
        input::-webkit-outer-spin-button,
        input::-webkit-inner-spin-button {
            -webkit-appearance: none;
        }
        input[ type= "number" ] {
            -moz-appearance: textfield;
        }

        .input-inline{
            margin-left: 40px;
        }
    </style>
</head>
<body>
<div class="layui-form layuimini-form" style="width: 800px; margin: 100px auto;">
    <fieldset class="layui-elem-field layui-field-title" style="margin-top: 20px;">
        <legend>用户注册</legend>
    </fieldset>
    <div class="layui-form-item">
        <label for="nickname" class="layui-form-label required">昵称</label>
        <div class="layui-input-block">
            <input type="text" id="nickname" name="nickname" lay-verify="required|nickname" placeholder="请输入昵称" autocomplete="off" class="layui-input" maxlength="16">
        </div>
    </div>
    <div class="layui-form-item">
        <label for="username" class="layui-form-label required">用户名</label>
        <div class="layui-input-block">
            <input type="text" id="username" name="username" lay-verify="required|username" placeholder="请输入用户名" autocomplete="off" class="layui-input" maxlength="32">
        </div>
    </div>
    <div class="layui-form-item">
        <label for="password" class="layui-form-label required">密码</label>
        <div class="layui-input-block">
            <input type="password" id="password" name="password" lay-verify="required|pass" lay-reqtext="密码不能为空" placeholder="请输入密码" class="layui-input" minlength="6" maxlength="18">
        </div>
    </div>
    <div class="layui-form-item">
        <label for="repass" class="layui-form-label required">确认密码</label>
        <div class="layui-input-block">
            <input type="password" id="repass" lay-verify="required|repass" lay-reqtext="请确认密码" placeholder="请再次输入密码" class="layui-input" minlength="6" maxlength="18">
        </div>
    </div>
    <div class="layui-form-item">
        <label class="layui-form-label required" for="age">年龄</label>
        <div class="layui-input-block">
            <input type="number" name="age" id="age" lay-verify="required|integer" lay-reqtext="请输入年龄" placeholder="请输入年龄" class="layui-input">
        </div>
    </div>
    <div class="layui-form-item">
        <label class="layui-form-label required">性别</label>
        <div class="layui-input-block">
            <input type="radio" name="sex" value="男" title="男" checked="">
            <input type="radio" name="sex" value="女" title="女">
        </div>
    </div>
    <div class="layui-form-item">
        <label for="birthday" class="layui-form-label required">生日</label>
        <div class="layui-input-inline">
            <input type="text" name="birthday" id="birthday" lay-verify="required|date" lay-reqtext="生日不能为空" placeholder="请选择生日" autocomplete="off" class="layui-input">
        </div>
    </div>
    <div class="layui-form-item">
        <label class="layui-form-label required" for="role">角色</label>
        <div class="layui-input-inline">
            <select name="role" id="role" lay-filter="role">
                <option value="5">学生</option>
                <option value="4">老师</option>
                <option value="1">管理员</option>
            </select>
        </div>
    </div>

    <div class="layui-form-item">
        <div class="layui-input-block">
            <button class="layui-btn layui-btn-normal" lay-submit lay-filter="saveBtn">确认保存</button>
        </div>
    </div>
</div>
<script src="${pageContext.request.contextPath}/static/layui/2.6.8/layui.js" charset="UTF-8"></script>
<script src="${pageContext.request.contextPath}/static/layuimini/js/lay-config.js?v=1.0.4" charset="utf-8"></script>
<script>
    layui.use(['layer', 'form', 'laydate'], function () {
        let $ = layui.$,
            form = layui.form,
            layer = layui.layer,
            laydate = layui.laydate;

        form.verify({
            nickname: [
                /(^$)|^.{1,8}$/
                , '昵称长度不得超过8个字符'
            ]
            ,pass: [
                /^[\S]{6,18}$/
                ,'密码必须6到18位，且不能出现空格'
            ]
            ,repass: function (value) {
                if ($("#password").val() !== value){
                    return "两次密码输入不一致！"
                }
            }
            , integer: [/^\d*$/, "只能填写整数"]
        })

        laydate.render({
            elem: "#birthday",
            max: 0
        })

        //监听提交
        form.on('submit(saveBtn)', function (data) {
            $.post({
                url: '/user/add',
                data: data.field,
                success: function (res) {
                    console.log(res);
                    if(res.code === 0){
                        layer.msg(res.msg, {icon: 1}, function () {
                            window.location = '/login.html';
                        })
                    }else {
                        layer.alert(res.msg, {icon: 2});
                    }
                }
            })
            return false;
        });

    });
</script>
</body>
</html>
