<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%--
  Created by IntelliJ IDEA.
  User: YanTao
  Date: 2021/5/22
  Time: 13:02
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
    <title>查询全部书籍</title>
    <link href="${pageContext.request.contextPath}/static/bootstrap/4.6.0/css/bootstrap.min.css" rel="stylesheet"/>
    <link href="${pageContext.request.contextPath}/static/layui/2.6.8/css/layui.css" rel="stylesheet"/>
</head>
<body>
    <div class="container">
        <div class="row clearfix">
            <div class="col-md-8 column">
                <div class="page-header">
                    <h1>
                        <small>书籍列表——全部书籍</small>
                    </h1>
                </div>
            </div>
            <div class="col-md-2 column form-inline">
                <button class="layui-btn layui-btn-normal" onclick="window.location = '/';">首页</button>
            </div>
            <div class="col-md-2 column form-inline">
                <button class="layui-btn layui-btn-primary layui-border-black" onclick="window.location = '/logout.html';">注销</button>
            </div>
<%--            查询书籍--%>
            <div class="col-md-4 column">

            </div>
            <div class="col-md-4 column form-inline">
                <form class="layui-form" id="search-form" action="${pageContext.request.contextPath}/book/allBooks" method="post">
                    <div class="layui-form-item">
                        <div class="layui-input-inline">
                            <label for="bookName"></label>
                            <input type="text" name="name" id="bookName" placeholder="请输入要查询的书籍名称" autocomplete="off" class="layui-input"/>
                        </div>
                        <button class="layui-btn layui-btn-normal" lay-submit lay-filter="searchBtn">搜&nbsp;&nbsp;&nbsp;&nbsp;索</button>
                    </div>
                </form>
            </div>
        </div>

        <script type="text/html" id="toolbar">
            <div class="layui-btn-container">
                <button class="layui-btn layui-btn-normal layui-btn-sm data-add-btn" lay-event="add"> 添加 </button>
                <button class="layui-btn layui-btn-sm layui-btn-danger data-delete-btn" lay-event="delete"> 删除 </button>
            </div>
        </script>

        <table class="layui-hide" id="bookTable" lay-filter="bookTableFilter"></table>

        <script type="text/html" id="operateBar">
            <a class="layui-btn layui-btn-xs" lay-event="edit">编辑</a>
            <a class="layui-btn layui-btn-danger layui-btn-xs" lay-event="del">删除</a>
        </script>

    </div>

<script src="${pageContext.request.contextPath}/static/layui/2.6.8/layui.js" charset="UTF-8"></script>
<script type="application/javascript">
    layui.use(['table', 'form'], function () {
        let $ = layui.jquery,
            table = layui.table,
            form = layui.form,
            layer = layui.layer;

        table.render({
            elem: '#bookTable'
            ,url:'/book/allBooks'
            ,toolbar: '#toolbar' //开启头部工具栏，并为其绑定左侧模板
            ,defaultToolbar: ['filter', 'exports', 'print', { //自定义头部工具栏右侧图标。如无需自定义，去除该参数即可
                title: '刷新'
                ,layEvent: 'BOOK_FRESH'
                ,icon: 'layui-icon-refresh'
            }]
            ,title: '用户数据表'
            ,cols: [[
                {type: 'checkbox', fixed: 'left'}
                ,{field:'bookId', title:'编号', width:80, fixed: 'left', unresize: true, sort: true}
                ,{field:'bookName', title:'名称', width:200,sort: true}
                ,{field:'bookCount', title:'数量', width:80, sort: true}
                ,{field:'detail', title:'描述', width:540, sort: true}
                ,{fixed: 'right', title:'操作', toolbar: '#operateBar', align: 'center'}
            ]]
            ,limits: [1, 3, 5, 10, 15, 20, 25, 50, 100] //每页可选择的数据记录显示条数
            ,page: true
            ,parseData: function (res) { //将原始数据解析成 table 组件所规定的数据，res为从url中get到的数据
                let result;
                if (this.page.curr) {
                    result = res.data.slice(this.limit * (this.page.curr - 1), this.limit * this.page.curr);
                }else {
                    result = res.data.slice(0, this.limit);
                }
                return {
                    "code": res.code, //解析接口状态
                    "msg": res.msg, //解析提示文本
                    "count": res.count, //解析数据长度
                    "data": result //解析数据列表
                };
            }
        });

        //搜索
        form.on('submit(searchBtn)', function (data) {
            let res = data.field;
            $("#search-form")[0].reset();

            //执行搜索重载
            table.reload('bookTable', {
                page: {
                    curr: 1
                },
                where: {
                    name: res.name
                }
            }, 'data');
            return false;
        });

        //工具条操作
        table.on('toolbar(bookTableFilter)', function (obj) {
            let checkStatus = table.checkStatus(obj.config.id);
            switch (obj.event) {
                case 'add':
                    window.location = '/book/toAdd';
                    break;
                case 'delete':
                    let length = checkStatus.data.length;
                    if (length > 0){
                        console.log(checkStatus)
                        layer.confirm('确定删除这' + length + '条数据？', {title: '提示'}, function () {
                            let ids = [];
                            for (let i = 0; i < data.length; i++) {
                                ids.push(data[i].bookId);
                            }
                            // console.log(ids);
                            $.post({
                                url: '/book/del-multiple',
                                data: {
                                    ids: ids
                                },
                                success: function (res) {
                                    switch (res.code){
                                        case 0:
                                            layer.msg(res.msg, {icon: 1}, function () {
                                                table.reload('bookTable', {
                                                    page: {
                                                        curr: 1
                                                    }
                                                })
                                            });
                                            break;
                                        case 1:
                                            layer.msg(res.msg, {icon: 0}, function () {
                                                table.reload('bookTable', {
                                                    page: {
                                                        curr: 1
                                                    }
                                                })
                                            });
                                            break;
                                        case 2:
                                            layer.msg(res.msg, {icon: 2});
                                            break;
                                        default:
                                            layer.msg("error", {icon: 3});
                                    }
                                }
                            })
                        })
                    }else {
                        layer.msg("请至少选择一条数据！", {icon: 0})
                    }
                    break;
                case 'BOOK_FRESH':
                    table.reload('bookTable', {
                        page: {
                            curr: 1
                        }
                    }, 'data');
                    break;
            }
        });

        table.on('tool(bookTableFilter)', function (obj) {
            let data = obj.data;
            if (obj.event === 'edit') {
                window.location = '/book/toUpdate/' + data.bookId;
                return false;
            } else if (obj.event === 'del') {
                console.log(obj)
                layer.confirm('确定删除该行数据？', {title: '提示'}, function (index) {
                    $.post({
                        url: '${pageContext.request.contextPath}/book/del',
                        data: {
                            id: data.bookId
                        },
                        success: function (res) {
                            if (res.code === 0){
                                layer.msg(res.msg, {icon: 1});
                                obj.del();
                                layer.close(index);
                            }else {
                                layer.msg(res.msg, {icon: 2});
                            }
                        }
                    })
                });
            }
        });
    })
</script>
</body>
</html>
