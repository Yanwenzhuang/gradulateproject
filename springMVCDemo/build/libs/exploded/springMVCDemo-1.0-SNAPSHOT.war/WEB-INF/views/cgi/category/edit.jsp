<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%--
  Created by IntelliJ IDEA.
  User: Administrator
  Date: 2018/8/19/019
  Time: 19:51
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<html>
<head>
    <title>商城 | 后台管理 | 商品添加或修改页</title>
    <!-- 新 Bootstrap 核心 CSS 文件 -->
    <link href="https://cdn.bootcss.com/bootstrap/3.3.7/css/bootstrap.min.css" rel="stylesheet">
</head>
<body>

<div class="container">
    <div class="row clearfix">
        <div class="col-md-4 column ">
        </div>
        <div class="col-md-4 column ">
            <h3>商品
                <small>分类信息</small>
            </h3>
            <hr>
            <form class="form-horizontal" action="/cgi/category/update" method="post" enctype="multipart/form-data">
                <div class="form-group">
                    <label for="text" class="col-sm-4 control-label">分类信息</label>
                    <div class="col-sm-8">
                        <%--隐藏id--%>
                        <input type="text" name="id" value="${category.id}" hidden>
                        <input type="text" class="form-control" id="text"
                               placeholder="请输入分类名称" name="text" value="${category.text}"
                        >
                    </div>
                </div>


                <div class="form-group">
                    <div class="col-sm-offset-0 col-sm-12 btn-block">
                        <c:choose>
                            <c:when test="${empty category.id}">
                                <input type="submit" value="分类添加" class="btn btn-success btn-block">
                            </c:when>
                            <c:otherwise>
                                <input type="submit" value="分类修改" class="btn btn-success btn-block">
                            </c:otherwise>
                        </c:choose>
                    </div>
                </div>
            </form>
        </div>
        <div class="col-md-4 column ">
        </div>
    </div>
</div>
</body>
</html>

