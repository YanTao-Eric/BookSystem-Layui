<%--
  Created by IntelliJ IDEA.
  User: YanTao
  Date: 2021/5/22
  Time: 15:41
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
    <title>修改书籍</title>
    <link href="https://cdn.staticfile.org/twitter-bootstrap/4.6.0/css/bootstrap.min.css" rel="stylesheet"/>
</head>
<body>
<div class="container">
    <div class="row clearfix">
        <div class="col-md-12 column">
            <div class="page-header">
                <h1>
                    <small>修改书籍</small>
                </h1>
            </div>
        </div>
    </div>

    <form action="${pageContext.request.contextPath}/book/update" method="post">
<%--        由于修改数据时需要传入一个参数id，但页面中又不需要显示，所以采用隐藏域传递id值--%>
        <input type="hidden" name="bookId" value="${book.bookId}"/>
        <div class="form-group">
            <label for="bookName">书籍编号</label>
            <input type="text" class="form-control" name="bookName" id="bookName" value="${book.bookName}" placeholder="Name" required>
        </div>
        <div class="form-group">
            <label for="bookCount">书籍数量</label>
            <input type="text" class="form-control" name="bookCount" id="bookCount" value="${book.bookCount}" placeholder="Count" required>
        </div>
        <div class="form-group">
            <label for="bookDetail">书籍描述</label>
<%--            <input type="text" class="form-control" name="detail" id="bookDetail" value="${book.detail}" placeholder="Detail" required>--%>
            <textarea class="form-control" name="detail" id="bookDetail" placeholder="Detail" style="min-height: 54px; resize: none;" required>${book.detail}</textarea>
        </div>
        <button type="submit" class="btn btn-danger col-xs-4">提&nbsp;&nbsp;&nbsp;交</button>
        <button type="reset" class="btn btn-group-lg col-xs-4" style="float: right;">恢&nbsp;&nbsp;&nbsp;复</button>
    </form>
</div>

<script src="${pageContext.request.contextPath}/static/jquery/3.6.0/jquery.min.js" charset="UTF-8"></script>
<script>
    // $("#bookDetail").textareaAutoHeight({ maxHeight:100 });
</script>
</body>
</html>
