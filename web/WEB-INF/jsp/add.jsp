<%--
  Created by IntelliJ IDEA.
  User: YanTao
  Date: 2021/5/22
  Time: 14:50
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
    <title>添加书籍</title>
    <link href="${pageContext.request.contextPath}/static/bootstrap/4.6.0/css/bootstrap.min.css" rel="stylesheet"/>
</head>
<body>
<div class="container">
    <div class="row clearfix">
        <div class="col-md-12 column">
            <div class="page-header">
                <h1>
                    <small>添加书籍</small>
                </h1>
            </div>
        </div>
    </div>

    <form action="${pageContext.request.contextPath}/book/add" method="post">
        <div class="form-group">
            <label for="bookName">书籍名称</label>
            <input type="text" class="form-control" name="bookName" id="bookName" placeholder="Name" required>
        </div>
        <div class="form-group">
            <label for="bookCount">书籍数量</label>
            <input type="text" class="form-control" name="bookCount" id="bookCount" placeholder="Count" required>
        </div>
        <div class="form-group">
            <label for="bookDetail">书籍描述</label>
            <input type="text" class="form-control" name="detail" id="bookDetail" placeholder="Detail" required>
        </div>
        <button type="submit" class="btn btn-danger col-xs-4">提&nbsp;&nbsp;&nbsp;交</button>
        <button type="reset" class="btn btn-group-lg col-xs-4" style="float: right;">重&nbsp;&nbsp;&nbsp;置</button>
    </form>
</div>
</body>
</html>
