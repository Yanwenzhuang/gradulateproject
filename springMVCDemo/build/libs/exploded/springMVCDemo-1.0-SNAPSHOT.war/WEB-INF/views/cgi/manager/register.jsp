<%--
  Created by IntelliJ IDEA.
  User: admin
  Date: 2018/9/10
  Time: 11:07
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<html>
<head>
    <title>商城 | 后台管理 | 管理员注册</title>
    <!-- 新 Bootstrap 核心 CSS 文件 -->
    <link href="https://cdn.bootcss.com/bootstrap/3.3.7/css/bootstrap.min.css" rel="stylesheet">
    <script src="/js/jquery-3.3.1.min.js"></script>
</head>

<body>
<div class="container">
    <div class="row clearfix">
        <div class="col-md-4 column">
        </div>
        <div class="col-md-4 column">
            <h3>商城
                <small>管理员信息</small>
            </h3>
            <hr>
            <form  class="form-horizontal" role="form"  method="post"
                   action="/cgi/manager/doRegister" enctype="multipart/form-data">
                <div class="form-group">
                    <label for="realname" class="col-sm-4 control-label">管理员</label>
                    <div class="col-sm-8">
                        <input type="hidden" class="form-control" name="id"
                               value="${manager.id}" />
                        <input type="text" class="form-control" id="realname"
                               name="realname" value="${manager.realname}"
                               placeholder="请输入管理员名字">
                    </div>
                </div>

                <div class="form-group">
                    <label for="username" class="col-sm-4 control-label">用户名</label>
                    <div class="col-sm-8">
                        <input type="text" class="form-control" id="username"
                               name="username" value="${manager.username}"
                               placeholder="请输入用户名" required>
                    </div>
                </div>

                <div class="form-group">
                    <label for="password" class="col-sm-4 control-label">密码</label>
                    <div class="col-sm-8">
                        <input type="password" class="form-control" id="password"
                               name="password" value="${manager.password}"
                               placeholder="请输入密码" required>
                    </div>
                </div>

                <div class="form-group">
                    <label for="phone" class="col-sm-4 control-label">手机号码</label>
                    <div class="col-sm-8">
                        <input type="tel" class="form-control" id="phone"
                               name="phone" value="${manager.phone}" maxlength="11" required
                               placeholder="请输入手机号码">
                    </div>
                </div>

                <div class="form-group">
                    <label for="record" class="col-sm-4 control-label">记录</label>
                    <div class="col-sm-8">
                        <input type="text" class="form-control" id="record"
                               name="record" value="${manager.record}"
                               placeholder="请输入记录" >
                    </div>
                </div>

                <div class="form-group">
                    <label for="address" class="col-sm-4 control-label">地址</label>
                    <div class="col-sm-8">
                        <input type="text" class="form-control" id="address"
                               name="address" value="${manager.address}"
                               placeholder="请输入地址" >
                    </div>
                </div>

                <div class="form-group">
                    <div class="col-sm-offset-0 col-sm-12 btn-block">
                          <input type="submit" value="注册" class="btn btn-success btn-block"/>
                    </div>
                </div>

            </form>

        </div>
        <div class="col-md-4 column">
        </div>
    </div>
</div>

</body>
</html>